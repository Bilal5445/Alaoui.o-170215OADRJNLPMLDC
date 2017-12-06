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
        public ActionResult FetchFBInfluencerPosts(T_FB_INFLUENCER influencer, int appId = 1,string CallFrom="")
        {
            // Get FB application
            var fbApp = clBusiness.GetFbApplication(appId);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            // get data from FB
            if(!string.IsNullOrEmpty(CallFrom))
            {
                influencer.url_name = CallFrom;
            }
            var posts = clBusiness.getFBInfluencerPostsFromFB(influencer.url_name, fbApp.FbAppId, fbAccessToken);

            // Save to DB
            clBusiness.AddFBPostsToDB(posts);
            if(!string.IsNullOrEmpty(CallFrom))
            {
                //List<T_FB_POST> postFetch = posts;
                if(posts != null && posts.Count>0)
                {
                    string errmsg = string.Empty;
                    Search search = new Search();
                    search.FbAccessToken = fbAccessToken;
                    try
                    {
                        clBusiness.getFacebookFeedManually(search, fbApp, posts, ref errmsg);
                    }
                    catch(Exception e)
                    {

                    }
                   
                }
                return Json(new { status=true});
            }
            else
            {
                // return to main screen
                return RedirectToAction("Index", "Home");
            }
           
        }
    }
}