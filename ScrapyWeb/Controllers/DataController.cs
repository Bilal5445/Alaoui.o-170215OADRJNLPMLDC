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
            clBusiness.getFBApplications(ref _fbAppList);
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
            //
            bool status = false;
            string message = string.Empty;

            // Get FB application
            var fbApp = clBusiness.GetFbApplication(appId);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            //
            if (!string.IsNullOrEmpty(CallFrom))
                influencer.url_name = CallFrom;

            // get page posts from FB & Save posts to DB
            var posts = clBusiness.getFBInfluencerPostsFromFB(influencer.url_name, fbApp.FbAppId, fbAccessToken);
            clBusiness.AddFBPostsToDB(posts);

            //
            if (!string.IsNullOrEmpty(CallFrom))
            {
                // MC220118 comments should be retrieved from FB for posts in DB instead of for posts from FB, because paging in FB
                // may not be chronological and thus comments for a recent post may be not be refreshed
                clBusiness.getFBPostsFromDB(ref posts);
                if (posts != null && posts.Count > 0)
                {
                    string errmsg = string.Empty;
                    Search search = new Search();
                    search.FbAccessToken = fbAccessToken;

                    // retrieve from FB the comments associated with retrieved posts
                    var IsCommentSave = clBusiness.getFacebookFeedManually(search, fbApp, posts, ref errmsg);
                    message = errmsg;
                    status = IsCommentSave;
                }

                return Json(new { status = status, message = message });
            }
            else
                return RedirectToAction("Index", "Home");   // we are done with the fb posts and return to main screen of scrappyweb
        }
    }
}