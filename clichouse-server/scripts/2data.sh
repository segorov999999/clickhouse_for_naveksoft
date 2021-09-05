#!/bin/bash
set -e
# Задаем переменую с текущей датой и временим.
d=$(date +"%Y-%m-%d %T")
# Вносим первые данные.
echo -ne "1, '$d', 'start clickhouse-server'" | clickhouse-client --database=analytics --query="INSERT INTO events FORMAT CSV";
# Вносим вторые данные.
echo -ne "2, '2021-09-02 14:00:00', 'start learn'" | clickhouse-client --database=analytics --query="INSERT INTO events FORMAT CSV";
# Вносим даннные из файла в формате csv
cat ./datas.txt | clickhouse-client --database=analytics --query="INSERT INTO events FORMAT CSV";