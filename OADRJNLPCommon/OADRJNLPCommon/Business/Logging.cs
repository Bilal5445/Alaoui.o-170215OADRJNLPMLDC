using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace OADRJNLPCommon.Business
{
    public class Logging
    {
        public static void Write(HttpServerUtilityBase Server, String message)
        {
            //
            String pathdata = Server.MapPath("~/App_Data") + @"\log.txt";

            // 04/04/14 17:51:48
            message = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + " : " + message + "\r\n";

            //
            File.AppendAllText(pathdata, message);
        }
    }
}
