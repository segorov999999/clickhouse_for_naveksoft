#!/bin/bash
set -e
# ������ ��������� � ������� ����� � ��������.
d=$(date +"%Y-%m-%d %T")
# ������ ������ ������.
echo -ne "1, '$d', 'start clickhouse-server'" | clickhouse-client --database=analytics --query="INSERT INTO events FORMAT CSV";
# ������ ������ ������.
echo -ne "2, '2021-09-02 14:00:00', 'start learn'" | clickhouse-client --database=analytics --query="INSERT INTO events FORMAT CSV";
# ������ ������� �� ����� � ������� csv
cat ./datas.txt | clickhouse-client --database=analytics --query="INSERT INTO events FORMAT CSV";