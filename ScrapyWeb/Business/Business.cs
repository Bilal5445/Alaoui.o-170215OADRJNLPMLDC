using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using ScrapyWeb.Models;
using System.Text.RegularExpressions;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Net;
using System.Xml;

namespace ScrapyWeb.Business
{
    public class clBusiness
    {
        
        /// <summary>
        /// Get Twitter Applications from DB for Listing
        /// </summary>
        /// <param name="_appList"></param>
        public static void getTwitterApplications(ref List<TwitterApplication> _appList)
        {

            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {
             
                _appList  = context.TwitterApplications
                                      .ToList();
                             

            }
        }
        /// <summary>
        /// It Will Search for Tweets
        /// </summary>
        public static void searchInTwitter()
        {
            try
            {
                string URL = Util.getKeyValueFromAppSetting("resource_url");
                Search searchTwitter = new Search()
                {
                    Latitude = Convert.ToDouble(Util.getKeyValueFromAppSetting("Latitude")),
                    Longitude = Convert.ToDouble(Util.getKeyValueFromAppSetting("Longitude")),
                    Radius = Convert.ToInt32(Util.getKeyValueFromAppSetting("Radius")),
                    IsRadiusInMiles = Convert.ToBoolean(Util.getKeyValueFromAppSetting("IsRadiusInMile")),
                    URL = URL
                };
                

                HttpWebRequest request = (HttpWebRequest)CreateOauthAndRequest(getApplicationDetails(), searchTwitter);
                var response = (HttpWebResponse)request.GetResponse();
                var reader = new StreamReader(response.GetResponseStream());
                var objText = reader.ReadToEnd();
                try
                {
                    JObject jObjects = JObject.Parse(objText);
                    foreach (var v in jObjects)
                    {
                        JObject Objects = new JObject(jObjects);
                        foreach (var status in Objects["statuses"])
                        {
                            ScrapyWeb.Models.TweetSet tweet = new ScrapyWeb.Models.TweetSet();

                            getTweetFromJObj(status, ref tweet);
                            AddTweetTODb(tweet);


                        }
                    }



                }
                catch (Exception twit_error)
                {
                    Console.WriteLine(twit_error.ToString());
                }

            }
            catch (Exception err)
            {
                Console.WriteLine(err.ToString());
            }
        }
        public static void AddTweetTODb(TweetSet tweet)
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {
                context.TweetSets.Add(tweet);
                context.SaveChanges();
            }
        }
        /// <summary>
        /// This method is used to extract the tweet attributes from JObject.
        /// </summary>
        /// <param name="jobj"></param>
        /// <param name="tweet"></param>
        static void getTweetFromJObj(dynamic jobj, ref ScrapyWeb.Models.TweetSet tweet)
        {

            var HashTags = "";
            var Mentions = "";
                
                    JObject jj = new JObject(jobj["entities"]);
                    var hashTags = jj["hashtags"];
                    foreach (var hashTag in hashTags )
                    {
                        HashTags += hashTag["text"] + ",";
                    }
                   
                    var userMentions = jj["user_mentions"];
                    foreach(var mention in userMentions)
                    {
                        Mentions += "@"+mention["screen_name"] + ",";
                    }
               
                var geo = jobj["geo"];
                var place = jobj["place"];
                var user = jobj["user"];
                var createdOn = Convert.ToString(jobj["created_at"]);
                string Const_TwitterDateTemplate = "ddd MMM dd HH:mm:ss +ffff yyyy";
                DateTime createdAt = DateTime.ParseExact(createdOn, Const_TwitterDateTemplate, new System.Globalization.CultureInfo("en-US"));
                tweet. Tweet_Id=Convert.ToString(jobj["id"]);
                tweet.TweetText = Convert.ToString(jobj["text"]);
                tweet. DateDownload = DateTime.Now;
                tweet.DateCreated = createdAt;
                tweet.HashTags = HashTags;
                tweet.Mentions = Mentions;
                tweet.ScreenName = Convert.ToString(user["screen_name"]);
                tweet.UserId = Convert.ToString(user["id"]);
                if (geo.HasValues == null)
                    tweet.LatLong = Convert.ToString(Convert.ToString(geo["coordinates"])).Replace("]", "").Replace("[", "").Replace("\r\n", "");
                tweet.PlaceId = Convert.ToString(place["id"]);
                tweet.PlaceName = Convert.ToString(place["name"]);
                tweet.Language = Convert.ToString(jobj["lang"]);
                tweet.FollowersCount = Convert.ToInt32(user["followers_count"]);
                tweet.FriendsCouunt = Convert.ToInt32(user["friends_count"]);
          


 
        }

        /// <summary>
        /// get Application from Config
        /// </summary>
        /// <returns></returns>
        public static ScrapyWeb.Models.TwitterApplication getApplicationDetails()
        {
           
            // oauth application keys
            return new TwitterApplication{
            AccessToken = Util.getKeyValueFromAppSetting("oauth_token"),
            AccessTokenSecret = Util.getKeyValueFromAppSetting("oauth_token_secret"),
            ConsumerKey = Util.getKeyValueFromAppSetting("oauth_consumer_key"),
            ConsumerSecret = Util.getKeyValueFromAppSetting("oauth_consumer_secret")
            
            };
          
 
        }
        /// <summary>
        /// Create Request Object and Oath Header for Twitter API Search
        /// </summary>
        /// <param name="app"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        static WebRequest CreateOauthAndRequest(TwitterApplication app, Search search)
        {
            //oauth application keys
            var oauth_token = app.AccessToken;//Util.getKeyValueFromAppSetting("oauth_token");
            var oauth_token_secret = app.AccessTokenSecret;// Util.getKeyValueFromAppSetting("oauth_token_secret");
            var oauth_consumer_key = app.ConsumerKey;// Util.getKeyValueFromAppSetting("oauth_consumer_key");
            var oauth_consumer_secret = app.ConsumerSecret;// Util.getKeyValueFromAppSetting("oauth_consumer_secret");

            //oauth implementation details
            var oauth_version = "1.0";
            var oauth_signature_method = "HMAC-SHA1";

            // unique request details
            var oauth_nonce = Convert.ToBase64String(
                new ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()));
            var timeSpan = DateTime.UtcNow
                - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            var oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString();
           // var geocode = "33.6436653,-6.8618025,15mi";
            var geocode = new StringBuilder().Append(search.Latitude).Append(",").Append(search.Longitude).Append(",").Append(search.Radius).Append(search.IsRadiusInMiles ? "mi" : "km").ToString();


            // create oauth signature
            var baseFormat = "";
            if (!string.IsNullOrEmpty(search.Since_Id))
            {
                baseFormat = "geocode={6}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                            "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&result_type=mixed&since_id="+search.Since_Id;//&rpp=" + tweetCount + "&include_entities=true" + "&page=" + page +"&until=
            }
            else baseFormat="geocode={6}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                            "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&result_type=mixed";//&rpp=" + tweetCount + "&include_entities=true" + "&page=" + page +"&until=


            var baseString = string.Format(baseFormat,
                                        oauth_consumer_key,
                                        oauth_nonce,
                                        oauth_signature_method,
                                        oauth_timestamp,
                                        oauth_token,
                                        oauth_version,
                                        Uri.EscapeDataString(geocode)
                                        );

            baseString = string.Concat("GET&", Uri.EscapeDataString(search.URL), "&", Uri.EscapeDataString(baseString));

            var compositeKey = string.Concat(Uri.EscapeDataString(oauth_consumer_secret),
                                    "&", Uri.EscapeDataString(oauth_token_secret));

            string oauth_signature;
            using (HMACSHA1 hasher = new HMACSHA1(ASCIIEncoding.ASCII.GetBytes(compositeKey)))
            {
                oauth_signature = Convert.ToBase64String(
                    hasher.ComputeHash(ASCIIEncoding.ASCII.GetBytes(baseString)));
            }

            // create the request header
            var headerFormat = "OAuth oauth_nonce=\"{0}\", oauth_signature_method=\"{1}\", " +
                               "oauth_timestamp=\"{2}\", oauth_consumer_key=\"{3}\", " +
                               "oauth_token=\"{4}\", oauth_signature=\"{5}\", " +
                               "oauth_version=\"{6}\"";

            var authHeader = string.Format(headerFormat,
                                    Uri.EscapeDataString(oauth_nonce),
                                    Uri.EscapeDataString(oauth_signature_method),
                                    Uri.EscapeDataString(oauth_timestamp),
                                    Uri.EscapeDataString(oauth_consumer_key),
                                    Uri.EscapeDataString(oauth_token),
                                    Uri.EscapeDataString(oauth_signature),
                                    Uri.EscapeDataString(oauth_version)
                            );


            ServicePointManager.Expect100Continue = false;
             var URL="";
             if (!string.IsNullOrEmpty(search.Since_Id))
             {
                 URL = search.URL + "?geocode=" + geocode + "&result_type=mixed&since_id=" + search.Since_Id;
             }
             else URL = search.URL + "?geocode=" + geocode + "&result_type=mixed";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            request.Headers.Add("Authorization", authHeader);
            request.Method = "GET";
            request.ContentType = "application/x-www-form-urlencoded";
            return request;

        }

        /// <summary>
        /// Add Twitter Application to Database
        /// </summary>
        /// <param name="app"></param>
        /// <param name="error"></param>
        public static void AddAplication(TwitterApplication app,ref string error)
        {
            try
            {
                using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
                {

                    context.TwitterApplications.Add(app);
                    context.SaveChanges();
                    error = "";

                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
 
            }
        }

        /// <summary>
        /// Get Downloaded Tweets from Database
        /// </summary>
        /// <param name="_tweetList"></param>
        public static void getDownloadedTweetSets(ref List<TweetSet> _tweetList)
        {

            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {
               
                _tweetList = context.TweetSets
                                      .ToList();

            }
        }

        /// <summary>
        /// Get Twitter Id from DB for Since_Id param
        /// </summary>
        /// <returns></returns>
        public static string getSinceIdFromTweetSets()
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {
                var topTweet = (from tweet in context.TweetSets
                            orderby tweet.Tweet_Id descending
                            select tweet).Take(1);
                return topTweet.FirstOrDefault<TweetSet>().Tweet_Id;

            }
 
        }


        
    }
}