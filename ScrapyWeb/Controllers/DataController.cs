using ScrapyWeb.Business;
using ScrapyWeb.Models;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace ScrapyWeb.Controllers
{
    public class DataController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "";

            // passing fb app id : we take the first FB app available
            List<FBApplication> _fbAppList = new List<FBApplication>();
            clBusiness.getFBApplicationsFromDB(ref _fbAppList);
            ViewBag.FbApplications = _fbAppList;
            ViewBag.AppId = _fbAppList[0].ApplicationId;

            // FB influencers
            var influencers = new List<T_FB_INFLUENCER>();
            clBusiness.getFBInfluencersFromDB(ref influencers);
            ViewBag.Influencers = influencers;

            // FB feeds
            var posts = new List<T_FB_POST>();
            clBusiness.getFBPostsFromDB(ref posts);
            ViewBag.FeedSets = posts;

            //
            return View();
        }

        [HttpPost]
        public ActionResult FetchFBInfluencerPosts(T_FB_INFLUENCER influencer, int appId = 1, string CallFrom = "")
        {
            // MC240118 this fct is used by the ScrappyWeb app directely and undirectly by the ArabicTextAnalyzer app.
            // In second case, influencer is not filled

            // Get FB application
            var fbApp = clBusiness.GetFBApplicationFromDB(appId);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            //
            if (!string.IsNullOrEmpty(CallFrom))
                influencer.url_name = CallFrom;

            // get FB page posts from FB & save them to DB
            bool status = false;
            // MC260118 this will retrieve only the most recents 25 posts from the FB page and will mark any existing post with changed 
            // comments count or non-existing post for comments retrieving
            // var posts = clBusiness.getFBInfluencerPostsFromFB(influencer.url_name, fbApp.FbAppId, fbAccessToken);
            var posts = clBusiness.RetrieveFBPageLatestPosts(influencer.url_name, fbApp.FbAppId, fbAccessToken);
            clBusiness.AddFBPostsToDB(posts);
            status = true;

            //
            if (!string.IsNullOrEmpty(CallFrom))
            {
                //
                string message = string.Empty;

                // retrieved Posts Count
                var retrievedPostsCount = posts.Count;

                try
                {
                    // MC220118 comments should be retrieved from FB for posts in DB instead of for posts from FB, because paging in FB
                    // may not be chronological and thus comments for a recent post may be not be refreshed
                    // MC240118 but first we need influencer id to filter on the posts of the page only. We have the name so we get the id from the db (1to1)
                    // MC260118 we are going to retrieve the comments for the marked posts (newCommentsWaiting true) only 
                    influencer = clBusiness.load_FB_INFLUENCER_EFSQL(influencer.url_name);
                    // posts = clBusiness.load_FB_POSTs_EFSQL(influencerId: influencer.id);
                    posts = clBusiness.load_FB_POSTs_EFSQL(influencerId: influencer.id, postsWithNewCommentsWaitingOnly: true);
                    if (posts != null && posts.Count > 0)
                    {
                        Search search = new Search();
                        search.FbAccessToken = fbAccessToken;

                        // retrieve from FB the comments associated with retrieved posts
                        status = clBusiness.getFacebookFeedManually(search, fbApp, posts, ref message);
                    }
                }
                catch (Exception ex)
                {
                    message = ex.Message;
                }

                return Json(new { status = status, message = message, retrievedPostsCount = retrievedPostsCount });
            }
            else
                return RedirectToAction("Index", "Home");   // we are done with the fb posts and return to main screen of scrappyweb
        }
    }
}