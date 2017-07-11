using ScrapyWeb.Business;
using ScrapyWeb.Models;
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
        public ActionResult FetchFBInfluencerPosts(T_FB_INFLUENCER influencer, int appId = 1)
        {
            // Get FB application
            var fbApp = clBusiness.GetFbApplication(appId);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            // get data from FB
            var posts = clBusiness.getFBInfluencerPostsFromFB(influencer.url_name, fbApp.FbAppId, fbAccessToken);

            // Save to DB
            clBusiness.AddFBPostsToDB(posts);

            // return to main screen
            return RedirectToAction("Index", "Home");
        }
    }
}