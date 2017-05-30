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
            string Error = string.Empty;

            // Twitter
            var TweetSets = new List<TweetSet>();
            clBusiness.getDownloadedTweetSets(ref TweetSets, ref Error);
            ViewBag.TweetSets = TweetSets;

            // FB groups
            var groupSets = new List<FBGroup>();
            clBusiness.getDownloadedFBGroups(ref groupSets, ref Error);
            ViewBag.GroupSets = groupSets;

            // FB feeds
            var FeedSets = new List<FacebookGroupFeed>();
            clBusiness.getDownloadedGroupFeeds(ref FeedSets, ref Error);
            ViewBag.FeedSets = FeedSets;//.Take(5).ToList();

            // FB comments
            var CommentSets = new List<FBFeedComment>();
            clBusiness.getDownloadedFeedComments(ref CommentSets, ref Error);
            ViewBag.CommentSets = CommentSets;//.Take(5).ToList();

            //
            if (string.IsNullOrEmpty(Error) == false)
                @ViewBag.Message = Error;

            return View();
        }
    }
}
