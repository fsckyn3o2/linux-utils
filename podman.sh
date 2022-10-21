#!/bin/bash
export scriptsRegister+=("podman")

podman-mongo() {
  podman run --name local-mongo -p 127.0.0.1:27017:27017 --net=host -d mongo
  podman ps
}

podman-mariadb() {
  podman run --name local-mariadb -p 127.0.0.1:3306:3306 -e MYSQL_ROOT_PASSWORD=admin -d mariadb
  podman ps
}

podman_postgres() {
  podman run --name local-postgres -p 127.0.0.1:5432:5432 -e POSTGRES_PASSWORD=admin -e POSTGRES_USER=admin -d postgres 
  podman ps
}


