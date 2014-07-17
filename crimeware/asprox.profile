#
# Asprox botnet traffic profile
#   http://www.trendmicro.com/cloud-content/us/pdfs/security-intelligence/white-papers/wp-asprox-reborn.pdf
#
# Author: @harmj0y
#


set sleeptime "30000"; # use a ~30s delay between callbacks
set jitter    "20"; # throw in a 10% jitter
set maxdns    "255";
set useragent "Mozilla/4.0 (compatible; MSIE 6.0b; Windows NT 5.0; .NET CLR 1.0.2914)";

http-get {

    set uri "/";

    client {

        header "Accept" "*/*";
        header "Content-Type" "application/x-www-form-urlencoded";
        header "Content-Transfer-Encoding" "base64";
        header "Connection" "Keep-Alive";

        metadata {
            netbiosu;
            uri-append;
        }
    }

    server {

        header "Server" "nginx/1.2.5";
        header "Content-Type" "text/html";
        header "X-Powered-By" "PHP/5.4.4-7";
        header "Vary" "Accept-Encoding";

        output {
            base64;
            print;
        }
    }
}

http-post {

    # random hash to try to simulate the post uri in the report
    set uri "/78dc91f1A716DBBAA9E4E12C884C1CB1C27FFF2BEEED7DF1";

    client {
    
        header "Accept" "*/*";
        header "Content-Type" "application/x-www-form-urlencoded";
        header "Content-Transfer-Encoding" "base64";
        header "Connection" "Keep-Alive";

        id {
            parameter "id";
        }

        output {
            base64;
            print;
        }
    }

    server {

        header "Server" "nginx/1.2.5";
        header "Content-Type" "text/html";
        header "X-Powered-By" "PHP/5.4.4-7";
        header "Vary" "Accept-Encoding";

        output {
            base64;
            print;
        }
    }
}

