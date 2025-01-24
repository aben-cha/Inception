up:
	docker compose -f ./srcs/docker-compose.yml up --build
down:
	docker compose -f ./srcs/docker-compose.yml down -v
clean: down
	sudo rm -R /home/aben-cha/data/db/*
	sudo rm -R /home/aben-cha/data/wordpress/*
	docker image prune -af
