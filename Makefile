up:
	sudo mkdir -p /home/aben-cha/data/db /home/aben-cha/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build
down:
	docker compose -f ./srcs/docker-compose.yml down -v
clean: down
	sudo rm -R /home/aben-cha/data/
	docker image prune -af
