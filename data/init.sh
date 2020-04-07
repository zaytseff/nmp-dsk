#!/bin/bash

echo "============================================================="
echo "= CREATE DATABASE                                            "

echo "CREATE DATABASE IF NOT EXISTS database nmp_dsk;" | "${mysql[@]}"

echo "= IMPORT DATA FROM DUMPFILE"
"${mysql[@]}" nmp_dsk < /db-dump/database.sql;

echo "============================================================="
