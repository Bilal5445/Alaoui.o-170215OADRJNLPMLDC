﻿using System;
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
            var TweetSets=new List<TweetSet>();
            clBusiness.getDownloadedTweetSets(ref TweetSets);
            ViewBag.TweetSets = TweetSets;
            return View();
        }

        public ActionResult FetchData()
        {
            clBusiness.searchInTwitter();

            return RedirectToAction("Index");
        }

        //public ActionResult Contact()
        //{
        //    ViewBag.Message = "Your contact page.";

        //    return View();
        //}
    }
}
