using System;
using System.Collections.Generic;
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
            clBusiness.getFBApplicationsFromDB(ref _fbAppList);
            ViewBag.FbApplications = _fbAppList;
            return View(_appList);
        }

        [HttpGet]
        public ActionResult AddApplication(int id = 0)
        {
            if (id > 0)
            {
                var app = clBusiness.GetTwitterApplication(id);
                return View(app);
            }

            return View();
        }

        [HttpPost]
        public ActionResult AddApplication(TwitterApplication app)
        {
            string error = "";
            clBusiness.AddTwitterApplication(app, ref error);
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
                var app = clBusiness.GetFBApplicationFromDB(id);
                return View(app);
            }

            return View();
        }

        [HttpPost]
        public ActionResult AddFBApplication(FBApplication app)
        {
            string error = "";
            clBusiness.AddFBApplication(app, ref error);
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
                clBusiness.ReadUserTimelineInTwitter(search, clBusiness.getTwitterApplicationDetails(id));
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
            var fbApp = clBusiness.GetFBApplicationFromDB(id);

            //
            search.FbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            //
            clBusiness.getFacebookGroupFeedFromFB(search, fbApp, ref Error);

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
        public ActionResult AddFBInfluencer(T_FB_INFLUENCER influencer, int id, String themeid = "", String CallFrom = "")
        {
            // Get from FB
            var fbApp = clBusiness.GetFBApplicationFromDB(id);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            bool status = false;
            string message = string.Empty;

            try
            {
                // get data from FB
                influencer = clBusiness.getFBInfluencerInfoFromFB(influencer.url_name, influencer.pro_or_anti, fbApp, fbAccessToken, themeid);

                // Save FB influencer (ie : the public FB page) to DB
                clBusiness.AddFBInfluencerToDB(influencer);
                status = true;
                message = "Influencer created successfully.";
            }
            catch (Exception e)
            {
                status = false;
                if (e.InnerException != null && e.InnerException.InnerException != null)
                    message = e.InnerException.InnerException.Message;
                else if (e.InnerException != null && e.InnerException.InnerException == null)
                    message = e.InnerException.Message;
                else
                    message = e.Message;
            }

            // return to main screen
            if (!string.IsNullOrEmpty(CallFrom))
            {
                return Json(new { status = status, message = message });
            }
            else
            {
                // return to main screen
                return RedirectToAction("Index", "Home");
            }
        }
    }
}
