
	podman build -t primary:0.1 .

	podman build -t standby:0.1 .


	podman run --add-host 'primary:192.168.122.1' --name primary -p 192.168.122.1:5432:5432 -e POSTGRES_DB=postgres -e POSTGRES_PASSWORD=password -d primary:0.1

	podman run --add-host 'primary:192.168.122.1' --name standby -p 192.168.122.1:5433:5432 -e POSTGRES_DB=postgres -e POSTGRES_PASSWORD=password -d standby:0.1

	psql -U postgres -w postgres -p 5432 -h 192.168.122.1
