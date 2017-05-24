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
                Count_toSearch = Convert.ToString(Util.getKeyValueFromAppSetting("Count_toSearch")),
                TimeLineURL = Util.getKeyValueFromAppSetting("TimeLineURL")
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
            if (place.HasValues == null)
            {
                tweet.PlaceId = Convert.ToString(place["id"]);
                tweet.PlaceName = Convert.ToString(place["name"]);
            }
            tweet.Language = Convert.ToString(jobj["lang"]);
            tweet.FollowersCount = Convert.ToInt32(user["followers_count"]);
            tweet.FriendsCouunt = Convert.ToInt32(user["friends_count"]);




        }
        
        /// <summary>
        /// get Application from Config
        /// </summary>
        /// <returns></returns>
        public static ScrapyWeb.Models.TwitterApplication getApplicationDetails(int? id)
        {
            if (id == null)
            {// oauth application keys
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

        public static void ReadUserTimelineInTwitter(Search search, TwitterApplication app)
        {
            search.Max_Id = getMaxIdFromTweetSets(search.ScreenName);
            search.Count_toSearch = "100";
            // oauth application keys
            var oauth_token = app.AccessToken;
            var oauth_token_secret = app.AccessTokenSecret;
            var oauth_consumer_key = app.ConsumerKey;
            var oauth_consumer_secret = app.ConsumerSecret;

            // oauth implementation details
            var oauth_version = "1.0";
            var oauth_signature_method = "HMAC-SHA1";

            // unique request details
            var oauth_nonce = Convert.ToBase64String(new ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()));
            var timeSpan = DateTime.UtcNow
                - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            var oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString();


            // create oauth signature
            var baseFormat = "count={8}&max_id={7}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                            "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&screen_name={6}";//&count = {7}";

            var baseString = string.Format(baseFormat,
                                        oauth_consumer_key,
                                        oauth_nonce,
                                        oauth_signature_method,
                                        oauth_timestamp,
                                        oauth_token,
                                        oauth_version,
                                        //Uri.EscapeDataString(search.Count_toSearch),
                                        Uri.EscapeDataString(search.ScreenName),
                                          Uri.EscapeDataString(search.Max_Id), Uri.EscapeDataString(search.Count_toSearch)
                                        );


            baseString = string.Concat("GET&", Uri.EscapeDataString(search.TimeLineURL), "&", Uri.EscapeDataString(baseString));

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

            // make the request
            var postBody = "screen_name=" + Uri.EscapeDataString(search.ScreenName) + "&max_id=" + Uri.EscapeDataString(search.Max_Id) + "&count=" + Uri.EscapeDataString(search.Count_toSearch);
            search.TimeLineURL += "?" + postBody;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(search.TimeLineURL);
            request.Headers.Add("Authorization", authHeader);
            request.Method = "GET";
            request.ContentType = "application/x-www-form-urlencoded";
            var response = (HttpWebResponse)request.GetResponse();
            var reader = new StreamReader(response.GetResponseStream());
            var objText = reader.ReadToEnd();


            try
            {
                JArray jsonDat = JArray.Parse(objText);
                foreach (var status in jsonDat)
                {
                    ScrapyWeb.Models.TweetSet tweet = new ScrapyWeb.Models.TweetSet();

                    getTweetFromJObj(status, ref tweet);
                    AddTweetTODb(tweet);


                }
                //myDiv.InnerHtml = html;
            }
            catch (Exception twit_error)
            {
                //myDiv.InnerHtml = html + twit_error.ToString();
            }
        }

        /// <summary>
        /// Create Request Object and Oath Header for Twitter API Search
        /// </summary>
        /// <param name="app"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        /// 
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
            if (search.SearchUserTimeLine)
            {
                baseFormat = "screen_name={6}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                            "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}";//&since_id=" + search.Since_Id;// +"&count=" + search.Count_toSearch;//&rpp=" + tweetCount + "&include_entities=true" + "&page=" + page +"&until=
                geocode = search.ScreenName;
            }
            else
            {
                if (!string.IsNullOrEmpty(search.Since_Id))
                {
                    baseFormat = "geocode={6}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                                "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&result_type=mixed&since_id=" + search.Since_Id;// +"&count=" + search.Count_toSearch;//&rpp=" + tweetCount + "&include_entities=true" + "&page=" + page +"&until=
                }
                else baseFormat = "geocode={6}&oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                                "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&result_type=mixed";//&count=" + search.Count_toSearch;//&rpp=" + tweetCount + "&include_entities=true" + "&page=" + page +"&until=
            }

            var baseString = string.Format(baseFormat,
                                        oauth_consumer_key,
                                        oauth_nonce,
                                        oauth_signature_method,
                                        oauth_timestamp,
                                        oauth_token,
                                        oauth_version,
                                        Uri.EscapeDataString(geocode)
                                        );

            baseString = string.Concat("GET&", Uri.EscapeDataString(search.SearchUserTimeLine ? search.TimeLineURL : search.URL), "&", Uri.EscapeDataString(baseString));

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
            if (search.SearchUserTimeLine)
            {
                URL = search.TimeLineURL + "?screen_name=" + search.ScreenName;
            }
            else
            {
                if (!string.IsNullOrEmpty(search.Since_Id))
                {
                    URL = search.URL + "?geocode=" + geocode + "&result_type=mixed&since_id=" + search.Since_Id;// +"&count=" + search.Count_toSearch;
                }
                else URL = search.URL + "?geocode=" + geocode + "&result_type=mixed";//&count=" + search.Count_toSearch;
            }
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
        /// Add Facebook Application to Database
        /// </summary>
        /// <param name="app"></param>
        /// <param name="error"></param>
        public static void AddFBAplication(FBApplication app, ref string error)
        {
            try
            {
                using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
                {
                    var result = context.FBApplications.SingleOrDefault(a => a.ApplicationId == app.ApplicationId);
                    if (result != null)
                    {
                        result.ApplicationName = app.ApplicationName;
                        result.FbAppId = app.FbAppId;
                        result.FbAppSecret = app.FbAppSecret;

                        context.Entry(result).State = System.Data.EntityState.Modified;

                    }
                    else
                    {

                        context.FBApplications.Add(app);
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
            using (var context = new ScrapyWebEntities())
            {
                _tweetList = context.TweetSets.ToList();
            }
        }

        public static void getDownloadedGroupFeeds(ref List<FacebookGroupFeed> _fbFeedList)
        {

            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {

                _fbFeedList = context.FacebookGroupFeeds
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

        public static string getMaxIdFromTweetSets(string Screen_name)
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {
                var topTweet = (from tweet in context.TweetSets
                                orderby tweet.Tweet_Id ascending
                                where tweet.ScreenName == Screen_name
                                select tweet).Take(1);
                return topTweet.FirstOrDefault<TweetSet>().Tweet_Id;

            }

        }

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

        public static Models.FBApplication GetFBApplication(int ApplicationId)
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {

                var query = (from app in context.FBApplications
                             where app.ApplicationId == ApplicationId

                             select app).Take(1);
                return query.FirstOrDefault<FBApplication>();

            }
        }

        public static Models.FBGroup GetFbGroup(int GroupId)
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
        }

        public static String FacebookGetAccessToken(FBApplication app)
        {
            string vals = "";
            string url = string.Format(Util.getKeyValueFromAppSetting("FbTokenURL") + "?client_id={0}&client_secret={1}&grant_type=client_credentials", app.FbAppId, app.FbAppSecret);

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;

            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());

                vals = reader.ReadToEnd();
            }

            return vals;
        }

        public static void getFacebookGroupFeed(Search search, FBApplication app, ref string Error)
        {
            try
            {
                // parse json token : eg : {"access_token":"360921534307030|ykMyj0iA9WcteYKnC_fNdYe-PEk","token_type":"bearer"}
                JObject jObject = JObject.Parse(search.FbAccessToken);
                String access_token = (String)jObject["access_token"];
                String token_type = (String)jObject["token_type"];

                //
                string objText = "";
                // string url = search.FbAccessGroupFeedURL + search.GroupId + "/feed?key=" + app.FbAppId + "&" + search.FbAccessToken;
                string url = search.FbAccessGroupFeedURL + search.GroupId + "/feed?key=" + app.FbAppId
                    // + "&" + search.FbAccessToken;
                    + "&access_token=" + access_token
                    + "&token_type=" + token_type;

                HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;

                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    StreamReader reader = new StreamReader(response.GetResponseStream());

                    objText = reader.ReadToEnd();

                    JObject jObjects = JObject.Parse(objText);
                    JObject Objects = new JObject(jObjects);
                    JArray items = (JArray)Objects["data"];
                    //JArray jsonDat = JArray.Parse(objText);
                    foreach (var status in items)
                    {
                        if (status["message"] != null)
                        {
                            var feed = new FacebookGroupFeed();

                            var message = status["message"] != null ? Convert.ToString(status["message"]) : null;

                            var updated_time = Convert.ToString(status["updated_time"]);

                            var date = DateTime.Parse(updated_time);
                            feed.GroupPostId = Convert.ToString(status["id"]);
                            feed.PostText = message;
                            feed.UpdatedTime = date;
                            AddGroupFeedTODb(feed);
                        }
                    }
                    //myDiv.InnerHtml = html;
                }
            }
            catch (WebException wex)
            {
                if (wex.Response != null)
                {
                    using (var errorResponse = (HttpWebResponse)wex.Response)
                    {
                        using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                        {
                            Error = reader.ReadToEnd();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        static void getgroupFeedFromJObj(dynamic jobj, ref ScrapyWeb.Models.FacebookGroupFeed feed)
        {



            var message = jobj["message"] != null ? Convert.ToString(jobj["message"]) : null;

            var updated_time = Convert.ToString(jobj["updated_time"]);

            var date = DateTime.Parse(updated_time);
            feed.GroupPostId = Convert.ToString(jobj["id"]);
            feed.PostText = message;



        }

        public static void AddGroupFeedTODb(FacebookGroupFeed feed)
        {
            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {
                var result = context.FacebookGroupFeeds.SingleOrDefault(f => f.GroupPostId == feed.GroupPostId);
                if (result == null)
                {

                    context.FacebookGroupFeeds.Add(feed);
                    context.SaveChanges();
                }
            }
        }
    }
}