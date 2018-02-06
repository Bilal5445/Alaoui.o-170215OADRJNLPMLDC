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
            // Get FB application
            var fbApp = clBusiness.GetFBApplicationFromDB(appId);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);
            bool status = false;
            string message = string.Empty;

            //
            if (!string.IsNullOrEmpty(CallFrom))
                influencer.url_name = CallFrom;

            // get page posts from FB
            var posts = clBusiness.RetrieveFBPagePosts(influencer.url_name, fbApp.FbAppId, fbAccessToken);

            // Save posts to DB
            clBusiness.AddFBPostsToDB(posts);

            //
            if (string.IsNullOrEmpty(CallFrom))
                return RedirectToAction("Index", "Home");   // we are done with the fb posts and return to main screen

            // retrieve  from FB comments associated with retrieved posts
            if (posts != null && posts.Count > 0)
            {
                string errmsg = string.Empty;
                Search search = new Search();
                search.FbAccessToken = fbAccessToken;

                try
                {
                    var IsCommentSave = clBusiness.getFacebookFeedManually(search, fbApp, posts, ref errmsg);
                    if (IsCommentSave == true)
                    {
                        status = true;
                        message = errmsg;
                    }
                    else
                    {
                        status = false;
                        message = errmsg;
                    }
                }
                catch (Exception e)
                {
                    status = false;
                    message = e.Message;
                }
            }

            return Json(new { status = status, message = message });
        }
    }
}