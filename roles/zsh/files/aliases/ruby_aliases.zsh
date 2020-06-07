alias urlencode='ruby -r cgi -e "puts CGI.escape(ARGV[0])"'
alias urldecode='ruby -r cgi -e "puts CGI.unescape(ARGV[0])"'
alias urlencode_json='ruby -e "require \"uri\"; puts URI.escape(STDIN.read)"'
alias urldecode_json='ruby -e "require \"uri\"; puts URI.unescape(STDIN.read)"'
alias pp_json='ruby -e "require \"json\"; require \"yaml\"; puts JSON.parse(STDIN.read).to_yaml"'
alias is_json='ruby -e "require \"json\"; begin; JSON.parse(STDIN.read);
puts true; rescue Exception => e; puts false; end"'