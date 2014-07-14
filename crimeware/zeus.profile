#
# ZeuS Sample Profile
#   client - https://malwr.com/analysis/NjIwNTU2ODA2OTUxNDcwNmJiMTMzYzk4YzU4NWQyZDQ/
#   server - http://malware-traffic-analysis.net/2014/04/05/index.html
#

set sleeptime "30000";
set jitter    "5";
set maxdns    "255";
set useragent "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.2)";

http-get {

    set uri "/metro91/admin/1/ppptp.jpg";

    client {

        header "Accept" "*/*";
        header "Connection" "Close";

        # throw in a known/old Zeus C2 domain
        header "Host" "mahamaya1ifesciences.com";
        header "Cache-Control" "no-cache";
        
        metadata {
            base64;
            header "Cookie";
        }
    }

    server {
        header "Server" "nginx/1.0.4";
        header "Content-Type" "text/html";
        header "Connection" "close";
        header "X-Powered-By" "PHP/5.3.8-1~dotdeb.2";

        output {
            print;
        }
    }
}

http-post {

    set uri "/metro91/admin/1/secure.php";

    client {

        header "Accept" "*/*";
        header "Connection" "Keep-Alive";

        # throw in a known/old Zeus C2 domain
        header "Host" "mahamaya1ifesciences.com";
        header "Cache-Control" "no-cache";

        id {
            netbios;
            parameter "id";
        }

        output {
            print;
        }
    }

    server {
        header "Server" "nginx/1.0.4";
        header "Content-Type" "text/html";
        header "Connection" "close";
        header "X-Powered-By" "PHP/5.3.8-1~dotdeb.2";

        output {
            print;
        }
    }
}

