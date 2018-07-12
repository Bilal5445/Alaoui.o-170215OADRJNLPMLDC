using ScrapyWeb.Business;
using ScrapyWeb.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
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
            // MC240118 this fct is used by the ScrappyWeb app directely and undirectly by the ArabicTextAnalyzer app.
            // In second case, influencer is not filled

            // Get FB application
            var fbApp = clBusiness.GetFBApplicationFromDB(appId);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            //
            if (!string.IsNullOrEmpty(CallFrom))
                influencer.url_name = CallFrom;

            // get FB page posts from FB & save them to DB
            List<T_FB_POST> posts = null;
            bool status = false;
            string message = string.Empty;
            try
            {
                // MC260118 this will retrieve using graph fb api the maximum number of posts (using 10-fold recursivity) from the FB page, with their number of likes and of comments
                // then this will mark any existing post with changed comments count for comments retrieving
                // this will also mark any new never-retrived-before post for comments retrieving 
                posts = clBusiness.RetrieveFBPagePosts(influencer.url_name, fbApp.FbAppId, fbAccessToken);
                clBusiness.AddFBPostsToDB(posts);
                status = true;
            }
            catch (WebException wex)
            {
                // trying to reproduce 902 (https://namatedev.visualstudio.com/170105OADRJNLP/_workitems/edit/902)
                if (!string.IsNullOrEmpty(CallFrom))
                {
                    if (wex.Response != null)
                    {
                        using (var errorResponse = (HttpWebResponse)wex.Response)
                        {
                            using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                            {
                                var jsonerror = reader.ReadToEnd();
                                /*if (_server != null)
                                {
                                    Logging.Write(_server, jsonerror);
                                    Logging.Write(_server, wex.GetType().Name);
                                    Logging.Write(_server, wex.Message);
                                    Logging.Write(_server, wex.StackTrace);
                                }*/
                                message = jsonerror;
                                return Json(new { status = status, message = message, retrievedPostsCount = -1, retrievedCommentsCount = -1 });
                            }
                        }
                    }
                    else
                        throw;
                }
                else
                    throw;
            }

            //
            if (!string.IsNullOrEmpty(CallFrom))
            {
                //
                int retrievedPostsCount = 0;
                int retrievedCommentsCount = 0;

                try
                {
                    // MC240118 first we need influencer id to filter on the posts of the page only. We have the name so we get the id from the db (1to1)
                    influencer = clBusiness.load_FB_INFLUENCER_EFSQL(influencer.url_name);

                    // MC220118 comments should be retrieved from FB for posts in DB instead of for posts from FB, because paging in FB
                    // may not be chronological and thus comments for a recent post may be not be refreshed
                    // MC260118 we are going to retrieve the comments for the marked posts (newCommentsWaiting true) only : can be existing or new
                    posts = clBusiness.load_FB_POSTs_EFSQL(influencerId: influencer.id, postsWithNewCommentsWaitingOnly: true);
                    if (posts.Count > 0)
                    {
                        Search search = new Search();
                        search.FbAccessToken = fbAccessToken;

                        // retrieve from FB the comments associated with retrieved posts
                        retrievedCommentsCount = clBusiness.getFacebookFeedManually(search, fbApp, posts, ref message);
                        if (message != String.Empty)
                            status = false;
                    }

                    // retrieved Posts Count (limited to only new posts or old posts with changed comments count)
                    retrievedPostsCount = posts.FindAll(m => String.IsNullOrEmpty(m.translated_text)).Count;
                }
                catch (Exception ex)
                {
                    message = ex.Message;
                }

                return Json(new { status = status, message = message, retrievedPostsCount = retrievedPostsCount, retrievedCommentsCount = retrievedCommentsCount });
            }
            else
                return RedirectToAction("Index", "Home");   // we are done with the fb posts and return to main screen of scrappyweb
        }

        [HttpPost]
        public ActionResult FetchPost(string postsId, int appId = 1)
        {
            // Get FB application
            var fbApp = clBusiness.GetFBApplicationFromDB(appId);
            var fbAccessToken = clBusiness.FacebookGetAccessToken(fbApp);

            // get post
            T_FB_USER fbUser;
            var refreshedPost = clBusiness.RetrieveFBPost(fbApp.FbAppId, postsId, fbAccessToken, out fbUser);

            // update post
            clBusiness.AddFBPostToDB(refreshedPost);
            /*using (var context = new ScrapyWebEntities())
            {
                // if the post already there, update its likes count
                // and if comments count changed, mark for retrieve new comments from FB
                var existingPost = context.T_FB_POST.SingleOrDefault(f => f.id == refreshedPost.id);
                if (existingPost != null)
                {
                    // update likes count as well
                    existingPost.likes_count = refreshedPost.likes_count;

                    // and if comments count changed, mark for retrieve new comments from FB
                    // TMP if (existingPost.comments_count != refreshedPost.comments_count)
                    // TMP existingPost.newCommentsWaiting = true;
                    existingPost.comments_count = refreshedPost.comments_count;

                    //
                    existingPost.sharedposts_count = refreshedPost.sharedposts_count;
                    existingPost.fk_influencer = refreshedPost.fk_influencer;
                    existingPost.from_id = refreshedPost.from_id;
                }
                else
                {
                    // otherwise if not here, insert it
                    // while marking as well for comments retrving
                    // TMP refreshedPost.newCommentsWaiting = true;
                    context.T_FB_POST.Add(refreshedPost);
                }

                // commit once done with all posts
                context.SaveChanges();
            }*/

            // save user
            using (var context = new ScrapyWebEntities())
            {
                context.T_FB_USER.Add(fbUser);
                context.SaveChanges();
            }

            //
            return Json(new { status = true });
        }
    }
}