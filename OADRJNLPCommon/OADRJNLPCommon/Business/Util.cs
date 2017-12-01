using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OADRJNLPCommon.Business
{
    public class Util
    {
        public static string getKeyValueFromAppSetting(string key)
        {
            string keyVal = "";
            System.Configuration.AppSettingsReader configRead = new System.Configuration.AppSettingsReader();
            keyVal = configRead.GetValue(key, typeof(string)).ToString();
            return keyVal;
        }
    }
}
