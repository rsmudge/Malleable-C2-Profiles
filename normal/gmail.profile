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
	set uri "/_/scs/mail-static/_/js/";
	client {

		metadata {
			base64;
			prepend "OSID=";
			header "Cookie";
		}

		parameter "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
		parameter "Accept-Language" "en-US,en;q=0.5";
		parameter "Accept-Encoding" "gzip, deflate";
		parameter "DNT" "1";

	}

	server {
		header "X-Content-Type-Options" "nosniff";
		header "X-Frame-Options" "SAMEORIGIN";
		header "Cache-Control" "public, max-age=31536000";
		header "X-XSS-Protection" "1; mode=block";
		header "Server" "GSE";
		header "Alternate-Protocol" "443:quic,p=1";
		
		output{
			prepend "try{";
			prepend "O(L.Oa(),"sy580")";
			prepend "N(L.Oa(),"sy580");P(L.Oa(),"sy580");";
			prepend "}catch(e){_DumpException(e)}";
			prepend "try{";
			prepend "O(L.Oa(),"sy558");";
			prepend "N(L.Oa(),"sy558");P(L.Oa(),"sy558");";
			prepend "}catch(e){_DumpException(e)}";
			prepend "try{";

			base64;
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
		header "Cookie" "GMAIL_AT=aq6fC0PF8o4j54nzDfTVMI65mfmyL1eaGZ;";
		header "Content-Type" "application/x-www-form-urlencoded;charset=utf-8";

		id {
			base64;
            parameter "rid";
        }

        output{
        	base64;
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

			prepend "[[["apm","ADvV1IcvJ9BBLLU17m4tk0EvwRCdv0zIMjoxNDQ1NTQzNzQwOTcx"]";
			prepend ",["ci",[]";
			prepend "]";

			base64;
			print;
		}

	}
}
