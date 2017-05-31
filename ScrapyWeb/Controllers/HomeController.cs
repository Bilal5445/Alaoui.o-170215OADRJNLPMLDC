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

            // Twitter
            var TweetSets=new List<TweetSet>();
            clBusiness.getDownloadedTweetSets(ref TweetSets);
            ViewBag.TweetSets = TweetSets;

            // FB groups
            var groupSets = new List<FBGroup>();
            clBusiness.getDownloadedFBGroups(ref groupSets);
            ViewBag.GroupSets = groupSets;

            // FB feeds
            var FeedSets = new List<FacebookGroupFeed>();
            clBusiness.getDownloadedGroupFeeds(ref FeedSets);
            ViewBag.FeedSets = FeedSets;//.Take(5).ToList();

            // FB comments
            var CommentSets = new List<FBFeedComment>();
            clBusiness.getDownloadedFeedComments(ref CommentSets);
            ViewBag.CommentSets = CommentSets;//.Take(5).ToList();

            return View();
        }
    }
}
