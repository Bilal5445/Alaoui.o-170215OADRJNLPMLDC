using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrapyWeb.Business;
using ScrapyWeb.Models;

namespace ScrapyWeb.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "";

            // get existing tweets in DB
            var TweetSets = new List<TweetSet>();
            clBusiness.getDownloadedTweetSets(ref TweetSets);

            //
            ViewBag.TweetSets = TweetSets;

            return View();
        }

        public ActionResult FetchData()
        {
            String message = "";
            clBusiness.searchInTwitter(null, clBusiness.getSearchCriteria(), ref message);
            // clBusiness.getFacebookGroupFeed();

            return RedirectToAction("Index");
        }

        //public ActionResult Contact()
        //{
        //    ViewBag.Message = "Your contact page.";

        //    return View();
        //}
    }
}
