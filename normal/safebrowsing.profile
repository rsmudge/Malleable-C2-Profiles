#
# Safebrowsing Comms profile
#   https://code.google.com/p/google-safe-browsing/wiki/SafeBrowsingDesign
#
# Author: @harmj0y
#

set sleeptime "30000"; # Use a 30s interval
set jitter    "20"; # 20% jitter
set maxdns    "255";
set useragent "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko";

http-get {

    # change/randomize this as you wish
    set uri "/safebrowsing/rd/CltOb12nLW1IbHehcmUtd2hUdmFzEBAY7-0KIOkUDC7h2";

    client {
        header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
        header "Accept-Language" "en-US,en;q=0.5";
        header "Accept-Encoding" "gzip, deflate";

        metadata {
            netbios;
            prepend "PREF=ID=";
            header "Cookie";
        }
    }

    server {
        header "Content-Type" "application/vnd.google.safebrowsing-chunk";
        header "X-Content-Type-Options" "nosniff";
        header "Content-Encoding" "gzip";
        header "X-XSS-Protection" "1; mode=block";
        header "X-Frame-Options" "SAMEORIGIN";
        header "Cache-Control" "public,max-age=172800";
        header "Age" "1222";
        header "Alternate-Protocol" "80:quic";

        output {
            print;
        }
    }
}

http-post {
    
    set uri "/safebrowsing/rd/CINnu27nLO8hbHdfgmUtc2ihdmFyEAcY4";

    client {
        header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
        header "Accept-Language" "en-US,en;q=0.5";
        header "Accept-Encoding" "gzip, deflate";
        
        id {
            netbios;
            prepend "U=779b64e1a7ed737a";
            prepend "PREF=ID=";
            header "Cookie";
        }
        
        output {
            print;
        }
    }

    server {
        header "Content-Type" "application/vnd.google.safebrowsing-chunk";
        header "X-Content-Type-Options" "nosniff";
        header "Content-Encoding" "gzip";
        header "X-XSS-Protection" "1; mode=block";
        header "X-Frame-Options" "SAMEORIGIN";
        header "Cache-Control" "public,max-age=172800";
        header "Age" "1222";
        header "Alternate-Protocol" "80:quic";
        output {
            print;
        }
    }
}

