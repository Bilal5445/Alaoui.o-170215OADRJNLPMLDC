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
using System.Globalization;

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

                _appList = context.TwitterApplications
                                      .ToList();


            }
        }

        /// <summary>
        /// It Will Search for Tweets
        /// </summary>
        public static void searchInTwitter(int? appid, Search searchTwitter, ref string Message)
        {
            try
            {
                //Search searchTwitter = getSearchCriteria();

                HttpWebRequest request = (HttpWebRequest)CreateOauthAndRequest(getApplicationDetails(appid), searchTwitter);
                var response = (HttpWebResponse)request.GetResponse();
                var reader = new StreamReader(response.GetResponseStream());
                var objText = reader.ReadToEnd();

                try
                {
                    JObject jObjects = JObject.Parse(objText);
                    foreach (var v in jObjects)
                    {
                        JObject Objects = new JObject(jObjects);
                        JArray items = (JArray)Objects["statuses"];
                        var length = items.Count;
                        if (length == 0)
                        {
                            Message = "No tweet(s) found against the provided location, try to change the location/latitude, longitude by drag /move and left clicking on the map";
                            break;
                        }
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

        public static void searchInTwitterPlaces(ref string Message)
        {
            try
            {

                ScrapyWeb.Models.TwitterApplication app = getApplicationDetails(null);
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
                var query = new StringBuilder().Append("Morocco").ToString();


                // create oauth signature
                var baseFormat = "";
                baseFormat = "geocode={6}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}";//&count=" + search.Count_toSearch;//&rpp=" + tweetCount + "&include_entities=true" + "&page=" + page +"&until=


                var baseString = string.Format(baseFormat,
                                            oauth_consumer_key,
                                            oauth_nonce,
                                            oauth_signature_method,
                                            oauth_timestamp,
                                            oauth_token,
                                            oauth_version,
                                            Uri.EscapeDataString(query)
                                            );

                baseString = string.Concat("GET&", Uri.EscapeDataString("https://api.twitter.com/1.1/geo/search.json"), "&", Uri.EscapeDataString(baseString));

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
                var URL = "https://api.twitter.com/1.1/geo/search.json";

                URL = URL + "?query=" + query;

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
                request.Headers.Add("Authorization", authHeader);
                request.Method = "GET";
                request.ContentType = "application/x-www-form-urlencoded";


                var response = (HttpWebResponse)request.GetResponse();
                var reader = new StreamReader(response.GetResponseStream());
                var objText = reader.ReadToEnd();
                try
                {
                    JObject jObjects = JObject.Parse(objText);
                    foreach (var v in jObjects)
                    {
                        JObject Objects = new JObject(jObjects);
                        JArray items = (JArray)Objects["statuses"];
                        var length = items.Count;
                        if (length == 0)
                        {
                            Message = "No tweet(s) found against the provided location, try to change the location/latitude,longitude by dragg /move and left clicking on the map";
                            break;
                        }
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

        public static Search getSearchCriteria()
        {
            return new Search()
            {
                Latitude = Convert.ToDouble(Util.getKeyValueFromAppSetting("Latitude"), CultureInfo.InvariantCulture.NumberFormat),
                Longitude = Convert.ToDouble(Util.getKeyValueFromAppSetting("Longitude"), CultureInfo.InvariantCulture.NumberFormat),
                Radius = Convert.ToInt32(Util.getKeyValueFromAppSetting("Radius")),
                IsRadiusInMiles = Convert.ToBoolean(Util.getKeyValueFromAppSetting("IsRadiusInMile")),
                URL = Util.getKeyValueFromAppSetting("resource_url"),
                Count_toSearch = Convert.ToString(Util.getKeyValueFromAppSetting("Count_toSearch"))
            };
        }

        public static void AddTweetTODb(TweetSet tweet)
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {
                var result = context.TweetSets.SingleOrDefault(t => t.Tweet_Id == tweet.Tweet_Id);
                if (result == null)
                {

                    context.TweetSets.Add(tweet);
                    context.SaveChanges();
                }
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
            foreach (var hashTag in hashTags)
            {
                HashTags += hashTag["text"] + ",";
            }

            var userMentions = jj["user_mentions"];
            foreach (var mention in userMentions)
            {
                Mentions += "@" + mention["screen_name"] + ",";
            }

            var geo = jobj["geo"];
            var place = jobj["place"];
            var user = jobj["user"];
            var createdOn = Convert.ToString(jobj["created_at"]);
            string Const_TwitterDateTemplate = "ddd MMM dd HH:mm:ss +ffff yyyy";
            DateTime createdAt = DateTime.ParseExact(createdOn, Const_TwitterDateTemplate, new System.Globalization.CultureInfo("en-US"));
            tweet.Tweet_Id = Convert.ToString(jobj["id"]);
            tweet.TweetText = Convert.ToString(jobj["text"]);
            tweet.DateDownload = DateTime.Now;
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
        public static TwitterApplication getApplicationDetails(int? id)
        {
            if (id == null)
            {
                // oauth application keys
                return new TwitterApplication
                {
                    AccessToken = Util.getKeyValueFromAppSetting("oauth_token"),
                    AccessTokenSecret = Util.getKeyValueFromAppSetting("oauth_token_secret"),
                    ConsumerKey = Util.getKeyValueFromAppSetting("oauth_consumer_key"),
                    ConsumerSecret = Util.getKeyValueFromAppSetting("oauth_consumer_secret")
                };
            }
            else
            {
                return GetApplication(Convert.ToInt32(id));
            }
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
            var oauth_nonce = Convert.ToBase64String(new ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()));
            var timeSpan = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            var oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString();
            // var geocode = "33.6436653,-6.8618025,15mi";
            var geocode = new StringBuilder()
                .Append(Convert.ToString(search.Latitude, CultureInfo.InvariantCulture.NumberFormat))
                .Append(",")
                .Append(Convert.ToString(search.Longitude, CultureInfo.InvariantCulture.NumberFormat))
                .Append(",")
                .Append(search.Radius).Append(search.IsRadiusInMiles ? "mi" : "km").ToString();

            // create oauth signature
            var baseFormat = "";
            if (!string.IsNullOrEmpty(search.Since_Id))
            {
                baseFormat = "geocode={6}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                            "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&result_type=mixed&since_id=" + search.Since_Id;// +"&count=" + search.Count_toSearch;//&rpp=" + tweetCount + "&include_entities=true" + "&page=" + page +"&until=
            }
            else baseFormat = "geocode={6}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                            "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&result_type=mixed";//&count=" + search.Count_toSearch;//&rpp=" + tweetCount + "&include_entities=true" + "&page=" + page +"&until=

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
            var URL = "";
            if (!string.IsNullOrEmpty(search.Since_Id))
            {
                URL = search.URL + "?geocode=" + geocode + "&result_type=mixed&since_id=" + search.Since_Id;// +"&count=" + search.Count_toSearch;
            }
            else URL = search.URL + "?geocode=" + geocode + "&result_type=mixed";//&count=" + search.Count_toSearch;
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
        public static void AddAplication(TwitterApplication app, ref string error)
        {
            try
            {
                using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
                {
                    var result = context.TwitterApplications.SingleOrDefault(a => a.ApplicationId == app.ApplicationId);
                    if (result != null)
                    {
                        result.ApplicationName = app.ApplicationName;
                        result.ConsumerKey = app.ConsumerSecret;
                        result.ConsumerKey = app.ConsumerKey;
                        result.AccessTokenSecret = app.AccessTokenSecret;
                        result.AccessToken = app.AccessToken;
                        //context.TwitterApplications.Attach(app);
                        context.Entry(result).State = System.Data.EntityState.Modified;

                    }
                    else
                    {

                        context.TwitterApplications.Add(app);
                    }
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
                _tweetList = context.TweetSets.ToList();
            }
        }

        /// <summary>
        /// Get Twitter Id from DB for Since_Id param
        /// </summary>
        /// <returns></returns>
        public static string getSinceIdFromTweetSets()
        {
            using (var context = new ScrapyWebEntities())
            {
                var topTweet = (from tweet in context.TweetSets
                                orderby tweet.Tweet_Id descending
                                select tweet).Take(1);
                return topTweet.FirstOrDefault<TweetSet>().Tweet_Id;
            }
        }

        /*
                public static void downloadStreem()
                {
                    var app = getApplicationDetails();
                    string URL = Util.getKeyValueFromAppSetting("resource_url");
                    Search searchTwitter = new Search()
                    {
                        Latitude = Convert.ToDouble(Util.getKeyValueFromAppSetting("Latitude")),
                        Longitude = Convert.ToDouble(Util.getKeyValueFromAppSetting("Longitude")),
                        Radius = Convert.ToInt32(Util.getKeyValueFromAppSetting("Radius")),
                        IsRadiusInMiles = Convert.ToBoolean(Util.getKeyValueFromAppSetting("IsRadiusInMile")),
                        URL = URL,
                        Count_toSearch = Convert.ToString(Util.getKeyValueFromAppSetting("Count_toSearch"))
                    };
                    // oauth implementation details
                    String oauth_version = "1.0";
                    String oauth_signature_method = "HMAC-SHA1";
                    // unique request details
                    var oauth_nonce = Convert.ToBase64String(
                        new ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()));
                    var timeSpan = DateTime.UtcNow
                        - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
                    var oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString();

                    var resource_url = searchTwitter.URL;

                    // create oauth signature
                    var baseFormat = "oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                                    "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&locations={6}";
                    var valueToTrack = "-13.100,3.360,9.542,36.610";
                    //    var array = valueToTrack.Split(' ');
                    //    var valueFor = "";
                    //    if (array.Length == 1) { valueFor = array[0]; }
                    //    else {
                    //        for (int a=0; a<array.Length; a++)
                    //            {
                    //        if (a == array.Length - 1)
                    //            valueFor = array[a].ToString ();
                    //        else valueFor = array[a].ToString() + "+";
                    //    }
                    //}
                    var baseString = string.Format(baseFormat,
                                                app.ConsumerKey,
                                               oauth_nonce,
                                                oauth_signature_method,
                                                oauth_timestamp,
                                                app.AccessToken,
                                                oauth_version,
                                                valueToTrack
                                                );

                    baseString = string.Concat("POST&", Uri.EscapeDataString(resource_url), "&", Uri.EscapeDataString(baseString));

                    var compositeKey = string.Concat(Uri.EscapeDataString(app.ConsumerSecret),
                                            "&", Uri.EscapeDataString(app.AccessTokenSecret));

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
                                            Uri.EscapeDataString(app.ConsumerKey),
                                            Uri.EscapeDataString(app.ConsumerSecret),
                                            Uri.EscapeDataString(oauth_signature),
                                            Uri.EscapeDataString(oauth_version)
                                    );


                    ServicePointManager.Expect100Continue = false;

                    var request = (HttpWebRequest)WebRequest.Create(resource_url);
                    request.Headers.Add("Authorization", authHeader);
                    request.Method = "POST";
                    request.ContentType = "application/x-www-form-urlencoded";
                    //request.
                    request.PreAuthenticate = true;
                    request.AllowWriteStreamBuffering = true;

                    //passing request post data
                    var postBody = "locations=" + Uri.EscapeDataString(valueToTrack);
                    //var testPostbody = "track=" + valueFor;


                    try
                    {
                        using (Stream stream = request.GetRequestStream())
                        {
                            byte[] content = ASCIIEncoding.ASCII.GetBytes(postBody);
                            stream.Write(content, 0, content.Length);
                        }
                        ////////////get the request response////
                        var response = request.GetResponse();
                        Stream STR_m = response.GetResponseStream();
                        var result = "";
                        var responseStream = new StreamReader(STR_m);
                        int count = 0;
                        Hashtable htemp = new Hashtable();
                        while (count < 50) //while((result=responseStream.ReadLine())!="-1")
                        {
                            result = responseStream.ReadLine();
                            if (result != "" && result != null)
                            {
                            }
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }



                }
         */

        public static Models.TwitterApplication GetApplication(int ApplicationId)
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {

                var query = (from app in context.TwitterApplications
                             where app.ApplicationId == ApplicationId

                             select app).Take(1);
                return query.FirstOrDefault<TwitterApplication>();

            }
        }

        /*public static Models.FBGroup GetFbGroup(int GroupId)
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {

                var query = (from app in context.FBGroups
                             where app.GroupId == GroupId

                             select app).Take(1);
                return query.FirstOrDefault<FBGroup>();

            }
        }

        public static Models.FBApplication GetFbApplication(int ApplicationId)
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {

                var query = (from app in context.FBApplications
                             where app.ApplicationId == ApplicationId

                             select app).Take(1);
                return query.FirstOrDefault<FBApplication>();

            }
        }

        public static void getFBApplications(ref List<FBApplication> _appList)
        {

            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {

                _appList = context.FBApplications
                                      .ToList();


            }
        }*/

        public String FacebookGetAccessToken()
        {

            string vals = "";
            string url = "https://graph.facebook.com/oauth/access_token?client_id=360921534307030&client_secret=e7622d158d04babc3bdc5e5687174040&grant_type=client_credentials";

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;

            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());

                vals = reader.ReadToEnd();


            }

            return vals;

        }

        public static void getFacebookGroupFeed()
        {
            string vals = "";
            string url = "https://graph.facebook.com/v2.8/968091193320896/feed?key=360921534307030&access_token=360921534307030|ykMyj0iA9WcteYKnC_fNdYe-PEk";

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;

            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());

                vals = reader.ReadToEnd();


            }



        }
    }
}