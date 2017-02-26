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
        public Search()
        {
 
        }
        public Search(double Latitude,double Longitude,int Radius,bool IsRadiusInMiles)
        {
            this.Latitude = Latitude;
            this.Longitude = Longitude;
            this.Radius = Radius;
            this.IsRadiusInMiles = IsRadiusInMiles;
        }
        void SearchTweets()
        {
 
        }


    }
}