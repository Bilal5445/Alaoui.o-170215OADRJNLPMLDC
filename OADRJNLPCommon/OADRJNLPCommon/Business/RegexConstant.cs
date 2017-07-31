using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OADRJNLPCommon.Business
{
    public class RegexConstant
    {
        public static String LatinWordsOnlyNoDigit = "[A-Za-zéèàâêîïëä]";
        public static String LatinWords = "[A-Za-z0-9éèàâêîïëä]";
        public static String LatinWordsExclDigit = @"[a-zA-Zéèàâêîïëä\d]";
        public static String ExtractLatinWordsAndExcludeNumOnlyRule = @"\b\d*" + LatinWordsOnlyNoDigit + LatinWordsExclDigit + @"*\b"; // exclude digits only
        public static String maChRule = @"\bma *(" + LatinWords + @"+?)(ch|sh|x)\b";    // ? => not-greedy + warning . can be also space
        public static String alWaRule = @"\b(al|l|el) *(" + LatinWords + @"+\b) ((wou|wal|wel|wl|ou|o|wa) *(al|l|el|)) *(" + LatinWords + @"+\b)";
        public static String alRule = @"\b(al|l|el) *(" + LatinWords + @"+\b)";
    }
}
