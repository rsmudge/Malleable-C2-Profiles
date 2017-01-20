#
# Bing Web Search
# 
# Author: @bluscreenofjeff
#

https-certificate {
    set CN       "www.bing.com";
    set O        "Microsoft Corporation";
    set C        "US";
    set L        "Redmond";
    set OU       "Microsoft IT";
    set ST       "WA";
    set validity "365";
}

set sleeptime "60000";
set jitter    "20";
set useragent "Mozilla/5.0 (compatible, MSIE 11, Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko";
set dns_idle "8.8.4.4";
set maxdns    "235";

http-get {

    set uri "/search/";

    client {

        header "Host" "www.bing.com";
        header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
        header "Cookie" "DUP=Q=GpO1nJpMnam4UllEfmeMdg2&T=283767088&A=1&IG"; 
        
        metadata {
            base64url;
            parameter "q";
        }

        parameter "go" "Search";
        parameter "qs" "bs";
        parameter "form" "QBRE";


    }

    server {

        header "Cache-Control" "private, max-age=0";
        header "Content-Type" "text/html; charset=utf-8";
        header "Vary" "Accept-Encoding";
        header "Server" "Microsoft-IIS/8.5";
        header "Connection" "close";
        

        output {
            netbios;
            prepend "<!DOCTYPE html><html lang=\"en\" xml:lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:Web=\"http://schemas.live.com/Web/\"><script type=\"text/javascript\">//<![CDATA[si_ST=new Date;//]]></script><head><!--pc--><title>Bing</title><meta content=\"text/html; charset=utf-8\" http-equiv=\"content-type\" /><link href=\"/search?format=rss&amp;q=canary&amp;go=Search&amp;qs=bs&amp;form=QBRE\" rel=\"alternate\" title=\"XML\" type=\"text/xml\" /><link href=\"/search?format=rss&amp;q=canary&amp;go=Search&amp;qs=bs&amp;form=QBRE\" rel=\"alternate\" title=\"RSS\" type=\"application/rss+xml\" /><link href=\"/sa/simg/bing_p_rr_teal_min.ico\" rel=\"shortcut icon\" /><script type=\"text/javascript\">//<![CDATA[";
            append "G={ST:(si_ST?si_ST:new Date),Mkt:\"en-US\",RTL:false,Ver:\"53\",IG:\"4C1158CCBAFC4896AD78ED0FF0F4A1B2\",EventID:\"E37FA2E804B54C71B3E275E9589590F8\",MN:\"SERP\",V:\"web\",P:\"SERP\",DA:\"CO4\",SUIH:\"OBJhNcrOC72Z3mr21coFQw\",gpUrl:\"/fd/ls/GLinkPing.aspx?\" }; _G.lsUrl=\"/fd/ls/l?IG=\"+_G.IG ;curUrl=\"http://www.bing.com/search\";function si_T(a){ if(document.images){_G.GPImg=new Image;_G.GPImg.src=_G.gpUrl+\"IG=\"+_G.IG+\"&\"+a;}return true;};//]]></script><style type=\"text/css\">.sw_ddbk:after,.sw_ddw:after,.sw_ddgn:after,.sw_poi:after,.sw_poia:after,.sw_play:after,.sw_playa:after,.sw_playd:after,.sw_playp:after,.sw_st:after,.sw_sth:after,.sw_ste:after,.sw_st2:after,.sw_plus:after,.sw_tpcg:after,.sw_tpcw:after,.sw_tpcbk:after,.sw_arwh:after,.sb_pagN:after,.sb_pagP:after,.sw_up:after,.sw_down:after,.b_expandToggle:after,.sw_calc:after,.sw_fbi:after,";
            print;
        }
    }
}

http-post {
    
    set uri "/Search/";
    set verb "GET";

    client {

        header "Host" "www.bing.com";
        header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
        header "Cookie" "DUP=Q=GpO1nJpMnam4UllEfmeMdg2&T=283767088&A=1&IG"; 
        
        output {
            base64url;
            parameter "q";
        }
        
        parameter "go" "Search";
        parameter "qs" "bs";
        
        id {
            base64url;
            parameter "form";
        }
    }

    server {

        header "Cache-Control" "private, max-age=0";
        header "Content-Type" "text/html; charset=utf-8";
        header "Vary" "Accept-Encoding";
        header "Server" "Microsoft-IIS/8.5";
        header "Connection" "close";
        

        output {
            netbios;
            prepend "<!DOCTYPE html><html lang=\"en\" xml:lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:Web=\"http://schemas.live.com/Web/\"><script type=\"text/javascript\">//<![CDATA[si_ST=new Date;//]]></script><head><!--pc--><title>Bing</title><meta content=\"text/html; charset=utf-8\" http-equiv=\"content-type\" /><link href=\"/search?format=rss&amp;q=canary&amp;go=Search&amp;qs=bs&amp;form=QBRE\" rel=\"alternate\" title=\"XML\" type=\"text/xml\" /><link href=\"/search?format=rss&amp;q=canary&amp;go=Search&amp;qs=bs&amp;form=QBRE\" rel=\"alternate\" title=\"RSS\" type=\"application/rss+xml\" /><link href=\"/sa/simg/bing_p_rr_teal_min.ico\" rel=\"shortcut icon\" /><script type=\"text/javascript\">//<![CDATA[";
            append "G={ST:(si_ST?si_ST:new Date),Mkt:\"en-US\",RTL:false,Ver:\"53\",IG:\"4C1158CCBAFC4896AD78ED0FF0F4A1B2\",EventID:\"E37FA2E804B54C71B3E275E9589590F8\",MN:\"SERP\",V:\"web\",P:\"SERP\",DA:\"CO4\",SUIH:\"OBJhNcrOC72Z3mr21coFQw\",gpUrl:\"/fd/ls/GLinkPing.aspx?\" }; _G.lsUrl=\"/fd/ls/l?IG=\"+_G.IG ;curUrl=\"http://www.bing.com/search\";function si_T(a){ if(document.images){_G.GPImg=new Image;_G.GPImg.src=_G.gpUrl+\"IG=\"+_G.IG+\"&\"+a;}return true;};//]]></script><style type=\"text/css\">.sw_ddbk:after,.sw_ddw:after,.sw_ddgn:after,.sw_poi:after,.sw_poia:after,.sw_play:after,.sw_playa:after,.sw_playd:after,.sw_playp:after,.sw_st:after,.sw_sth:after,.sw_ste:after,.sw_st2:after,.sw_plus:after,.sw_tpcg:after,.sw_tpcw:after,.sw_tpcbk:after,.sw_arwh:after,.sb_pagN:after,.sb_pagP:after,.sw_up:after,.sw_down:after,.b_expandToggle:after,.sw_calc:after,.sw_fbi:after,";
            print;
        }
    }
}

http-stager {
    server {
        header "Cache-Control" "private, max-age=0";
        header "Content-Type" "text/html; charset=utf-8";
        header "Vary" "Accept-Encoding";
        header "Server" "Microsoft-IIS/8.5";
        header "Connection" "close";
    }
}

