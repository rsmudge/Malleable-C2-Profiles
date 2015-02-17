#
# Adode Real-Time-Messaging-Protcol (RTMP) profile
# 
# Author: @harmj0y
#

set sleeptime "5000";
set jitter    "0";
set maxdns    "255";
set useragent "Shockwave Flash";

http-get {

    set uri "/idle/1376547834/1";

    client {

        header "Accept" "*/*";
        header "Connection" "Keep-Alive";
        header "Cache-Control" "no-cache";
        header "Content-Type" "application/x-fcs";

        metadata {
            base64;
            header "Cookie";
        }
    }

    server {

        header "Content-Type" "application/x-fcs";
        header "Connection" "Keep-Alive";
        header "Server" "FlashCom/3.5.7";
        header "Cache-Control" "no-cache";

        output {
            print;
        }
    }
}

http-post {
    
    set uri "/send/1376547834/";

    client {

        header "Accept" "*/*";
        header "Connection" "Keep-Alive";
        header "Cache-Control" "no-cache";
        header "Content-Type" "application/x-fcs";

        id {
            uri-append;
        }

        output {
            print;
        }
    }

    server {

        header "Content-Type" "application/x-fcs";
        header "Connection" "Keep-Alive";
        header "Server" "FlashCom/3.5.7";
        header "Cache-Control" "no-cache";

        output {
            print;
        }
    }
}
