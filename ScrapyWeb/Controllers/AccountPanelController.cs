using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrapyWeb.Business;
using ScrapyWeb.Models;
namespace ScrapyWeb.Controllers
{
    public class AccountPanelController : Controller
    {
        //
        // GET: /AccountPanel/

        public ActionResult Index()
        {
            List<TwitterApplication> _appList = new List<TwitterApplication>();
            List<FBApplication> _fbAppList = new List<FBApplication>();
            clBusiness.getTwitterApplications(ref _appList);
            clBusiness.getFBApplications(ref _fbAppList);
            ViewBag.FbApplications = _fbAppList;
            return View(_appList);
        }

        [HttpGet]
        public ActionResult AddApplication(int id = 0)
        {
            if (id > 0)
            {
                var app = clBusiness.GetApplication(id);
                return View(app);
            }

            return View();
        }

        [HttpPost]
        public ActionResult AddApplication(TwitterApplication app)
        {
            string error = "";
            clBusiness.AddAplication(app, ref error);
            if (string.IsNullOrEmpty(error))
            {
                return RedirectToAction("Index");
            }
            return View(app);
        }

        [HttpGet]
        public ActionResult AddFBApplication(int id = 0)
        {
            if (id > 0)
            {
                var app = clBusiness.GetFBApplication(id);
                return View(app);
            }

            return View();
        }

        [HttpPost]
        public ActionResult AddFBApplication(FBApplication app)
        {
            string error = "";
            clBusiness.AddFBAplication(app, ref error);
            if (string.IsNullOrEmpty(error))
            {
                return RedirectToAction("Index");
            }
            return View(app);
        }

        [HttpGet]
        public ActionResult FetchTwitterData(int? id)
        {
            ViewBag.AppId = id;

            return View(clBusiness.getSearchCriteria());
        }

        [HttpPost]
        public ActionResult FetchTwitterData(Search search, int id)
        {
            @ViewBag.Message = "";
            string Error = string.Empty;
            if (search.SearchUserTimeLine)
                clBusiness.ReadUserTimelineInTwitter(search, clBusiness.getApplicationDetails(id));
            else
            {
                clBusiness.searchInTwitter(id, search, ref Error);
            }
            // clBusiness.searchInTwitterPlaces(ref Error);
            if (string.IsNullOrEmpty(Error))
                return RedirectToAction("Index", "Home");
            else
            {
                @ViewBag.Message = Error;
                return View(search);
            }
        }

        [HttpGet]
        public ActionResult FetchFBData(int? id)
        {
            ViewBag.AppId = id;

            var view = View(clBusiness.getSearchCriteria());

            return view;
        }

        [HttpPost]
        public ActionResult FetchFBData(Search search, int id)
        {
            @ViewBag.Message = "";
            string Error = string.Empty;

            //
            var fbApp = clBusiness.GetFbApplication(id);

            //
            search.FbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            //
            clBusiness.getFacebookGroupFeed(search, fbApp, ref Error);

            //
            if (string.IsNullOrEmpty(Error))
                return RedirectToAction("Index", "Home");
            else
            {
                @ViewBag.Message = Error;
                return View(search);
            }
        }

        [HttpGet]
        public ActionResult AddFBInfluencer(int? id)
        {
            // passing fb app id
            ViewBag.AppId = id;

            //
            return View();
        }

        [HttpPost]
        public ActionResult AddFBInfluencer(T_FB_INFLUENCER influencer, int id,string themeid="",string CallFrom="")
        {
            // Get from FB
            var fbApp = clBusiness.GetFbApplication(id);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            // get data from FB
            influencer = clBusiness.getFBInfluencerInfoFromFB(influencer.url_name, influencer.pro_or_anti, fbApp, fbAccessToken, themeid);

            // Save to DB
            clBusiness.AddFBInfluencerToDB(influencer);

            // return to main screen
            if (!string.IsNullOrEmpty(CallFrom))
            {
                return Json(new { status = true });
            }
            else
            {
                // return to main screen
                return RedirectToAction("Index", "Home");
            }
            
        }
    }
}
