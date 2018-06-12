﻿using Newtonsoft.Json.Linq;
using OADRJNLPCommon.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace OADRJNLPCommon.Business
{
    public class Business
    {
        #region FRONT YARD FB TWINGLY
        public static FB_KEYWORD getFBKeywordInfoFromFBViaTwingly(String fbKeywordKeyword)
        {
            //
            String access_token = Util.getKeyValueFromAppSetting("TwinglyApiKey");
            var twinglyApi15Url = Util.getKeyValueFromAppSetting("TwinglyApi15Url");

            //
            return getFBKeywordInfoFromFBViaTwingly(fbKeywordKeyword, access_token, twinglyApi15Url);
        }

        public static FB_KEYWORD getFBKeywordInfoFromFBViaTwingly(String fbKeywordKeyword, String access_token, String twinglyApi15Url)
        {
            // create object and set values whatever available
            var fbKeyword = new FB_KEYWORD();
            fbKeyword.keyword = fbKeywordKeyword;
            fbKeyword.date_oldest_retrieve = DateTime.Today;
            fbKeyword.date_latest_retrieve = DateTime.Today;
            fbKeyword.matched_posts_count = 0;
            fbKeyword.matched_comments_count = 0;
            fbKeyword.matched_total_count = 0;
            fbKeyword.social_stats_likes = 0;
            fbKeyword.social_stats_comments = 0;
            fbKeyword.social_stats_shares = 0;
            fbKeyword.matched_posts_count_ma = 0;
            fbKeyword.matched_comments_count_ma = 0;
            fbKeyword.matched_total_count_ma = 0;
            fbKeyword.social_stats_likes_ma = 0;
            fbKeyword.social_stats_comments_ma = 0;
            fbKeyword.social_stats_shares_ma = 0;

            // assign object rest of value from FB via twingly
            getKeywordInfoFromFBViaTwingly(fbKeyword, twinglyApi15Url, access_token);
            getKeywordInfoFromFBViaTwingly(fbKeyword, twinglyApi15Url, access_token, limitToMorocco: true);

            //
            return fbKeyword;
        }

        public static FB_KEYWORD getFBKeywordInfoFromFBViaTwinglyMaOnly(String fbKeywordKeyword, String access_token, String twinglyApi15Url)
        {
            // create object and set values whatever available
            var fbKeyword = new FB_KEYWORD();
            fbKeyword.keyword = fbKeywordKeyword;
            fbKeyword.date_oldest_retrieve = DateTime.Today;
            fbKeyword.date_latest_retrieve = DateTime.Today;
            fbKeyword.matched_posts_count = 0;
            fbKeyword.matched_comments_count = 0;
            fbKeyword.matched_total_count = 0;
            fbKeyword.social_stats_likes = 0;
            fbKeyword.social_stats_comments = 0;
            fbKeyword.social_stats_shares = 0;
            fbKeyword.matched_posts_count_ma = 0;
            fbKeyword.matched_comments_count_ma = 0;
            fbKeyword.matched_total_count_ma = 0;
            fbKeyword.social_stats_likes_ma = 0;
            fbKeyword.social_stats_comments_ma = 0;
            fbKeyword.social_stats_shares_ma = 0;

            // assign object rest of value from FB via twingly
            // getKeywordInfoFromFBViaTwingly(fbKeyword, twinglyApi15Url, access_token);
            getKeywordInfoFromFBViaTwingly(fbKeyword, twinglyApi15Url, access_token, limitToMorocco: true);

            //
            return fbKeyword;
        }

        public static FB_KEYWORD getFBKeywordInfoFromFBViaTwinglyMaExcluded(String fbKeywordKeyword, String access_token, String twinglyApi15Url)
        {
            // create object and set values whatever available
            var fbKeyword = new FB_KEYWORD();
            fbKeyword.keyword = fbKeywordKeyword;
            fbKeyword.date_oldest_retrieve = DateTime.Today;
            fbKeyword.date_latest_retrieve = DateTime.Today;
            fbKeyword.matched_posts_count = 0;
            fbKeyword.matched_comments_count = 0;
            fbKeyword.matched_total_count = 0;
            fbKeyword.social_stats_likes = 0;
            fbKeyword.social_stats_comments = 0;
            fbKeyword.social_stats_shares = 0;
            fbKeyword.matched_posts_count_ma = 0;
            fbKeyword.matched_comments_count_ma = 0;
            fbKeyword.matched_total_count_ma = 0;
            fbKeyword.social_stats_likes_ma = 0;
            fbKeyword.social_stats_comments_ma = 0;
            fbKeyword.social_stats_shares_ma = 0;

            // assign object rest of value from FB via twingly
            // getKeywordInfoFromFBViaTwingly(fbKeyword, twinglyApi15Url, access_token);
            getKeywordInfoFromFBViaTwingly(fbKeyword, twinglyApi15Url, access_token, limitToMorocco: false);

            //
            return fbKeyword;
        }
        #endregion

        #region BACK YARD BO TWINGLY
        private static void getKeywordInfoFromFBViaTwingly(FB_KEYWORD fbKeyword, String twinglyApi15Url, String access_token, bool limitToMorocco = false)
        {
            String url = twinglyApi15Url + "chart" + "?apikey=" + access_token + "&one=\"" + fbKeyword.keyword + "\"";

            // limit to Morocco
            if (limitToMorocco)
                url += "&country=ma";

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());

                String objText = reader.ReadToEnd();
                JObject jObjects = JObject.Parse(objText);
                JObject Objects = new JObject(jObjects);
                JArray items = (JArray)Objects["data"];

                //
                foreach (var item in items)
                {
                    // update date of latest and oldest
                    DateTime time_iso8610 = Convert.ToDateTime(item["time_iso8610"]);
                    if (time_iso8610 < fbKeyword.date_oldest_retrieve) fbKeyword.date_oldest_retrieve = time_iso8610;
                    if (time_iso8610 > fbKeyword.date_latest_retrieve) fbKeyword.date_latest_retrieve = time_iso8610;

                    // cumulate
                    if (!limitToMorocco)
                    {
                        fbKeyword.matched_posts_count += Convert.ToInt32(item["matched_posts_count"]);
                        fbKeyword.matched_comments_count += Convert.ToInt32(item["matched_comments_count"]);
                        fbKeyword.matched_total_count += Convert.ToInt32(item["matched_total_count"]);
                        fbKeyword.social_stats_likes += Convert.ToInt32(item["social_stats"]["likes"]);
                        fbKeyword.social_stats_comments += Convert.ToInt32(item["social_stats"]["comments"]);
                        fbKeyword.social_stats_shares += Convert.ToInt32(item["social_stats"]["shares"]);
                    }
                    else
                    {
                        fbKeyword.matched_posts_count_ma += Convert.ToInt32(item["matched_posts_count"]);
                        fbKeyword.matched_comments_count_ma += Convert.ToInt32(item["matched_comments_count"]);
                        fbKeyword.matched_total_count_ma += Convert.ToInt32(item["matched_total_count"]);
                        fbKeyword.social_stats_likes_ma += Convert.ToInt32(item["social_stats"]["likes"]);
                        fbKeyword.social_stats_comments_ma += Convert.ToInt32(item["social_stats"]["comments"]);
                        fbKeyword.social_stats_shares_ma += Convert.ToInt32(item["social_stats"]["shares"]);
                    }
                }
            }
        }

        public static String getPostBasedOnKeywordFromFBViaTwingly(String keyword, String twinglyApi15Url, String access_token, bool limitToMorocco = false)
        {
            String url = twinglyApi15Url + "search" + "?apikey=" + access_token + "&one=\"" + keyword + "\""
                + "&scope=all"
                + "&post_type=all"
                + "&size=1";            // take first one

            // limit to Morocco
            if (limitToMorocco)
                url += "&country=ma";

            //
            var posts = new List<FB_POST>();

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());

                String objText = reader.ReadToEnd();
                JObject jObjects = JObject.Parse(objText);
                JObject Objects = new JObject(jObjects);
                JArray dataitems = (JArray)Objects["data"];
                if (dataitems.Count == 0)
                    return String.Empty;
                JObject post = null;
                foreach (var item in dataitems)
                {
                    post = (JObject)item["post"];
                    break;
                }

                // find in posts
                String postText = Convert.ToString(post["message"]);
                if (postText.Contains(keyword))
                {
                    return postText.Replace("\r\n", " "); // make it one line
                }

                // find in comments
                JArray commentitems = null;
                // if (dataitems.Count > 0)
                commentitems = (JArray)dataitems[0]["post"]["comments"];
                /*else
                    return String.Empty;*/
                foreach (var item in commentitems)
                {
                    // String postText = Convert.ToString(item["post"]["message"]);
                    postText = Convert.ToString(item["comment"]["message"]);
                    /*posts.Add(new FB_POST
                    {
                        post_text = postText
                    });
                    break;*/
                    if (postText.Contains(keyword))
                        return postText.Replace("\r\n", " "); // make it one line
                }
            }

            //
            if (posts.Count > 0)
                return posts[0].post_text.Replace("\r\n", " "); // make it one line
            else
                return String.Empty;
        }

        public static String getMostPopularVariantFromFBViaTwingly(List<String> variants, String twinglyApi15Url, String twinglyApiKey)
        {
            var watch = System.Diagnostics.Stopwatch.StartNew();

            //
            FB_KEYWORD mostPopular = null;
            foreach (String variant in variants)
            {
                FB_KEYWORD fbKeyword = getFBKeywordInfoFromFBViaTwinglyMaOnly(variant, twinglyApiKey, twinglyApi15Url);
                if (mostPopular == null)
                    mostPopular = fbKeyword;
                else if (mostPopular.matched_total_count_ma < fbKeyword.matched_total_count_ma)
                    mostPopular = fbKeyword;

                // small timer to workaout the twingly limit of 60 sec
                // the code that you want to measure comes here
                var elapsedMs = watch.ElapsedMilliseconds;
                if (elapsedMs > 55000)
                {
                    System.Threading.Thread.Sleep(80000);
                    watch.Reset();
                }
            }

            // if no occurences at all, then serach not morococco only
            if (mostPopular.matched_total_count_ma == 0)
            {
                foreach (String variant in variants)
                {
                    FB_KEYWORD fbKeyword = getFBKeywordInfoFromFBViaTwinglyMaExcluded(variant, twinglyApiKey, twinglyApi15Url);
                    if (mostPopular == null)
                        mostPopular = fbKeyword;
                    else if (mostPopular.matched_total_count < fbKeyword.matched_total_count)
                        mostPopular = fbKeyword;

                    // small timer to workaout the twingly limit of 60 sec
                    // the code that you want to measure comes here
                    var elapsedMs = watch.ElapsedMilliseconds;
                    if (elapsedMs > 55000)
                    {
                        System.Threading.Thread.Sleep(80000);
                        watch.Reset();
                    }
                }
                watch.Stop();
            }
            else
            {
                watch.Stop();

                //
                return mostPopular.keyword;
            }
            

            // worst case return empty string
            if (mostPopular.matched_total_count == 0)
                return String.Empty;

            //
            return mostPopular.keyword;
        }

        public static int getTwinglyAccountInfo_calls_free(String twinglyApi15Url, String twinglyApiKey)
        {
            String url = twinglyApi15Url + "usage" + "?apikey=" + twinglyApiKey;

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());

                String objText = reader.ReadToEnd();
                JObject jObjects = JObject.Parse(objText);
                JObject Objects = new JObject(jObjects);
                int calls_free = Convert.ToInt32(Objects["usage"]["calls_free"]);

                //
                return calls_free;
            }
        }
        #endregion

        /*public void refreshcomments(String postId, String accessToken, String fbAppId, String fbAccessPageUrl)
        {
            //
            string url = fbAccessPageUrl + postId + "/comments"
                + "?limit=100"
                + "&fields="
                    + "comment_count,"
                    + "like_count,"
                    + "message,"
                    + "created_time,"
                    + "parent"
                + "&filter=stream"
                + "&key=" + fbAppId
                + "&access_token=" + accessToken;
            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());

                String objText = reader.ReadToEnd();
                JObject jObjects = JObject.Parse(objText);
                JObject Objects = new JObject(jObjects);
                JArray jComments = (JArray)Objects["data"];

                // if next retrieve and add to items
                JValue paginationNext = null;
                if (Objects["paging"] != null)
                    if (Objects["paging"]["next"] != null)
                        paginationNext = (JValue)Objects["paging"]["next"];
                // ex : "next": "https://graph.facebook.com/v2.11/191616720877982_1725409007498738/comments?access_token=EAACEdEose0cBAJG8GcB1zBZA1MwBwFIP4hBi4JZBqSuR9JiotXr9ZCZBDglqr0ZBbZAVOzw8HkwEYDgbHqY1ZCfuVyq1cUJx8ibY6aJxxqxw5CeyoA9yiuG0RQZCSOfFyOXAVAIKzgs6thxyfjk9Ac9DfJTt2yoxtI5q9rWX5bITqk7pb61dE9DjdfhB6VpXb0gZD&pretty=0&limit=25&after=ODQZD"
                if (paginationNext != null)
                {
                    var urlNext = Convert.ToString(paginationNext).Replace("limit=25", "limit=100");
                    HttpWebRequest requestNext = WebRequest.Create(urlNext) as HttpWebRequest;
                    using (HttpWebResponse responseNext = requestNext.GetResponse() as HttpWebResponse)
                    {
                        StreamReader readerNext = new StreamReader(responseNext.GetResponseStream());
                        String objTextNext = readerNext.ReadToEnd();
                        JObject jObjectsNext = JObject.Parse(objTextNext);
                        JObject ObjectsNext = new JObject(jObjectsNext);
                        JArray itemsNext = (JArray)ObjectsNext["data"];

                        // add to items
                        for (int i = 0; i < itemsNext.Count; i++)
                            jComments.Add(itemsNext[i]);
                    }
                }

                // create the comments in memory
                var fbComments = new List<FBFeedComment>();
                foreach (var jComment in jComments)
                {
                    if (jComment["message"] != null)
                    {
                        var fbComment = new FBFeedComment();

                        var message = Convert.ToString(jComment["message"]);
                        var date = DateTime.Parse(Convert.ToString(jComment["created_time"]));

                        // save FB feed comment to DB
                        // MC260118 plus we save as well the correspounding post id to easy join in sql for consolidation later
                        fbComment.Id = Convert.ToString(jComment["id"]);
                        fbComment.message = message;
                        fbComment.created_time = date;
                        fbComment.feedId = postId;
                        fbComment.EntryDate = DateTime.Now; // Add entry date on comment
                        fbComment.likes_count = Convert.ToInt32(jComment["like_count"]);
                        fbComment.comments_count = Convert.ToInt32(jComment["comment_count"]);
                        if (jComment["parent"] != null)
                        {
                            fbComment.parentId = Convert.ToString(jComment["parent"]["id"]);
                        }
                        fbComments.Add(fbComment);
                    }
                }

                // add into DB
                var retrievedCommentsCount = AddFbCommentsToDb(fbComments);
                return retrievedCommentsCount;
            }
        }*/
    }
}
