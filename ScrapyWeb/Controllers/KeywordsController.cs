using ScrapyWeb.Business;
using ScrapyWeb.Models;
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Xml.Serialization;

namespace ScrapyWeb.Controllers
{
    public class KeywordsController : Controller
    {
        // GET: Keywords
        public ActionResult Index()
        {
            //
            List<FB_KEYWORD> fbKeywords = new List<FB_KEYWORD>();
            String path = Server.MapPath("~/App_Data/data.txt");
            XmlSerializer serializer = new XmlSerializer(fbKeywords.GetType());

            // deserialize / serialize FB keywords : read / add / write back
            using (var reader = new System.IO.StreamReader(path))
            {
                fbKeywords = (List<FB_KEYWORD>)serializer.Deserialize(reader);
            }
            /*fbKeywords.Add(new FB_KEYWORD() { keyword = "كريدي" });
            using (var writer = new System.IO.StreamWriter(path))
            {
                serializer.Serialize(writer, fbKeywords);
                writer.Flush();
            }*/

            // pass FB keywords
            ViewBag.fbKeywords = fbKeywords;

            //
            return View();
        }

        [HttpPost]
        public ActionResult FetchFBPostsByKeyword(String keyword)
        {
            // get fb keyword info data from FB via Twingly
            var fbKeyword = clBusiness.getFBKeywordInfoFromFBViaTwingly(keyword.Trim());

            // Save to Serialization
            String path = Server.MapPath("~/App_Data/data.txt");
            clBusiness.addFBKeywordToSerialization(fbKeyword, path);

            //
            // return View();
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult KeywordsPartialView(int moroccoOnly)
        {
            //
            List<FB_KEYWORD> fbKeywords = new List<FB_KEYWORD>();
            String path = Server.MapPath("~/App_Data/data.txt");
            XmlSerializer serializer = new XmlSerializer(fbKeywords.GetType());

            // deserialize / serialize FB keywords : read / add / write back
            using (var reader = new System.IO.StreamReader(path))
            {
                fbKeywords = (List<FB_KEYWORD>)serializer.Deserialize(reader);
            }

            //
            fbKeywords.Reverse();

            // pass FB keywords to partial view via the model (instead of the bag for a view)
            if (moroccoOnly == 1)
                return PartialView("_IndexPartial_keywords_morocco", fbKeywords);
            else
                return PartialView("_IndexPartial_keywords", fbKeywords);
        }
    }
}