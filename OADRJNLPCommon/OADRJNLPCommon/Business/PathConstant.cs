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
        // for UT only
        public PathConstant(String pathToArabiziEnv)
        {
            this.pathToArabiziEnv = pathToArabiziEnv;
        }

        public PathConstant()
        {
            var setting = ConfigurationManager.AppSettings["pathToPerlScript"];

            pathToArabiziEnv = setting != null ? setting.ToString() : String.Empty;
        }

        public String pathToArabiziEnv;
    }
}
