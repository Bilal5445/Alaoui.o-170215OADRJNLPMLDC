using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OADRJNLPCommon.Business
{
    public class PathConstant
    {
        public PathConstant()
        {
            pathToArabiziEnv = ConfigurationManager.AppSettings["pathToPerlScript"].ToString();
        }

        public String pathToArabiziEnv;
        // public const String pathToArabiziEnv = @"C:\Users\Yahia Alaoui\Desktop\DEV\17028OADRJNLPARBZ\";
        // public const String pathToArabiziEnv = @"C:\script\namatedev-17028oadrjnlparbz-991d3268755f\namatedev-17028oadrjnlparbz-991d3268755f\";
    }
}
