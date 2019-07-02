
#list servicesd
listd() {
	echo -e ${BLD}${RED}" --> SYSTEM LEVEL <--"${NRM}
	find /etc/systemd/system -mindepth 1 -type d | sed '/getty.target/d' | xargs ls -gG --color
	[[ $(find $HOME/.config/systemd/user -mindepth 1 -type d | wc -l) -eq 0 ]] ||
		(echo -e ${BLD}${RED}" --> USER LEVEL <--"${NRM} ; \
		find $HOME/.config/systemd/user -mindepth 1 -type d | xargs ls -gG --color)
}