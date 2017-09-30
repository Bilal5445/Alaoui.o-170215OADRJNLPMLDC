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
        public static String waMaChRule = @"\b(w|wa|oua|ou|o|i)ma *(" + LatinWords + @"+?)(ch|sh|x)\b";    // ? => not-greedy + warning . can be also space
        public static String liMaChRule = @"\b(li)ma *(" + LatinWords + @"+?)(ch|sh|x)\b";    // ? => not-greedy + warning . can be also space
        public static String maChRule = @"\bma *(" + LatinWords + @"+?)(ch|sh|x)\b";    // ? => not-greedy + warning . can be also space
        public static String alWaRule = @"\b(al|l|el) *(" + LatinWords + @"+\b) ((wou|wal|wel|wl|ou|o|wa) *(al|l|el|)) *(" + LatinWords + @"+\b)";
        // public static String alRule = @"\b(al|l|el)(?: |\.)*(" + LatinWords + @"+\b)";
        public static String alRule = @"\b(al|el)(?: |\.)*(" + LatinWords + @"+\b)";
        public static String dlRule = @"\b(dl|del)(?: |\.)*(" + LatinWords + @"+\b)";
        // public static String leRule = @"\b(le|la)\b";
        public static String leRule = @"\b(le|les)\b";

        // public static String notPreceededByMark = @"\w*(?<!mark>)";  // find the match only if not preceeded by mark> : (?<!xxxx) means "only if it doesn't have "x" before this point".
        // public static String notPreceededByMark = @"\w*(?<!>)";  // find the match only if not preceeded by > : (?<!xxxx) means "only if -it doesn't have "x" before this point".
        public static String notPreceededByMark = @"\w*(?<!(>|=))";  // find the match only if not preceeded neither by > nor by = : (?<!xxxx) means "only if -it doesn't have "x" before this point".
    }
}
