using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ScrapyWeb.Business
{
    public class Search
    {

        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public bool IsRadiusInMiles { get;set; }
        public int Radius { get; set; }
        public string URL { get; set; }
        public string Since_Id { get; set; }
        public string Count_toSearch { get; set; }
        public Search()
        {
            getSinceId();
        }
        public Search(double Latitude,double Longitude,int Radius,bool IsRadiusInMiles)
        {
            this.Latitude = Latitude;
            this.Longitude = Longitude;
            this.Radius = Radius;
            this.IsRadiusInMiles = IsRadiusInMiles;
            getSinceId();
        }
        
        void getSinceId()
        {
            var since_id=Business.clBusiness.getSinceIdFromTweetSets();
            if (!string.IsNullOrEmpty(since_id))
            {
                this.Since_Id = since_id;
            }
            
        }


    }
}