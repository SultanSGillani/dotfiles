
# Compile and execute a C source on the fly
csource() {
	[[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
	[[ -r $1 ]] || { printf "File %s does not exist or is not readable\n" "$1" >&2; return 1; }
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	gcc "$1" -o "$output_path" && "$output_path";
	rm "$output_path";
	return 0;
}