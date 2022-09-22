function nexus-token
	read -P "Username: " username
	read -s -P "Password: " password
	mkdir -p /tmp/
	rm -f /tmp/nexus-token.sh &>/dev/null
	curl --silent -X POST https://aeu1-nexus01-token.publicdns.zone/auth --data "{\"username\": \"$username\", \"password\": \"$password\"}" -H "Content-Type: application/json" > /tmp/nexus-token.sh
	chmod +x /tmp/nexus-token.sh
	bash /tmp/nexus-token.sh
end
