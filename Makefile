up:
	mkdir -p /home/aben-cha/data /home/aben-cha/data/db
	chmod -R 775 /home/aben-cha/data
	docker compose -f ./srcs/docker-compose.yml up --build
down:
	docker compose -f ./srcs/docker-compose.yml down -v
clean: down
	sudo rm -R /home/aben-cha/data/
	docker image prune -af
