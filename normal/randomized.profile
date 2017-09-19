#
# This profile demonstrates the use of the mask transform to randomize aspects of a profile
#

set useragent "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko";

# define indicators for an HTTP GET
http-get {
	# we require a stub URI to attach the rest of our data to.
	set uri "/zC";

	client {
		# mask our metadata, base64 encode it, store it in the URI
		metadata {
			mask;
			base64url;
			uri-append;
		}
	}

	server {
		header "Content-Type" "text/plain";

		# prepend some text in case the GET is empty.
		output {
			prepend "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			mask;
			base64;
			print;
		}
	}
}

# define indicators for an HTTP POST
http-post {
	set uri "/dE";
	set verb "POST";

	client {
		# make it look like we're posting something cool.
		header "Content-Type" "application/x-www-form-urlencoded";

		# ugh, our data has to go somewhere!
		output {
			mask;
			base64url;
			uri-append;
		}

		# randomize and post our session ID
		id {
			mask;
			base64url;
			prepend "v=";
			append "&button=submit";
			print;
		}
	}

	# The server's response to our HTTP POST
	server {
		header "Content-Type" "text/plain";

		# post usually sends nothing, so let's prepend a string, mask it, and
		# base64 encode it. We'll get something different back each time.
		output {
			prepend "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			mask;
			base64;
			print;
		}
	}
}

