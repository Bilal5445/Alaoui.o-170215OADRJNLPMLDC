using Newtonsoft.Json.Linq;
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
        #region FRONT YARD FB
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
        #endregion

        #region BACK YARD BO
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
                // + "&scope=posting"
                // + "&scope=comment"      // to increase our chances to find a match
                + "&scope=all"
                // + "&post_type=status"   // we filter on status only (not comments because usually more formal than comments)
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
            //
            FB_KEYWORD mostPopular = null;
            foreach (String variant in variants)
            {
                FB_KEYWORD fbKeyword = OADRJNLPCommon.Business.Business.getFBKeywordInfoFromFBViaTwinglyMaOnly(variant, twinglyApiKey, twinglyApi15Url);
                if (mostPopular == null)
                    mostPopular = fbKeyword;
                else
                if (mostPopular.matched_total_count_ma < fbKeyword.matched_total_count_ma)
                    mostPopular = fbKeyword;
            }

            // if no occurences at all, return empty string
            if (mostPopular.matched_comments_count_ma == 0)
                return String.Empty;

            //
            return mostPopular.keyword;
        }
        #endregion
    }
}
