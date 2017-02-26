using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrapyWeb.Models;
namespace ScrapyWeb.Business
{
    public class clBusiness
    {
        public static void getTwitterApplications(ref List<TwitterApplication> _appList)
        {

            using (var context = new ScrapyWeb.Models.ScrapyWebEntities())
            {
                // Load all blogs and related posts 
                _appList  = context.TwitterApplications
                                      .ToList();

               

            }
 
        }
    }
}