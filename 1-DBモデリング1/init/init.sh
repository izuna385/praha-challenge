#!/bin/bash

# create database
mysql -u root -proot -e "DROP DATABASE IF EXISTS company; CREATE DATABASE commerce;"

# create tables
mysql -u root -proot company < "/docker-entrypoint-initdb.d/sql/create-tables.sql"

# inport data
# mysql -u root -proot company < "/docker-entrypoint-initdb.d/sql/data/prefecture.sql"

