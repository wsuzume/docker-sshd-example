DEV_USER ?= $(shell id -un)
DEV_UID ?= $(shell id -u)
DEV_GROUP ?= $(shell id -gn)
DEV_GID ?= $(shell id -g)

create_env:
	echo "DEV_USER=${DEV_USER}" > .env
	echo "DEV_UID=${DEV_UID}" >> .env
	echo "DEV_GROUP=${DEV_GROUP}" >> .env
	echo "DEV_GID=${DEV_GID}" >> .env