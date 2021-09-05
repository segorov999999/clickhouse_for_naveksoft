#!/bin/bash
set -e
# ������� ���� analytics
clickhouse client -n <<-EOSQL
    CREATE DATABASE IF NOT EXISTS analytics;
EOSQL
# ������� ������� events � ���� analytics
clickhouse client -n <<-EOSQL
    CREATE TABLE IF NOT EXISTS analytics.events
    (
        id String,
        event_time DateTime,
        event_message String
    )
    ENGINE = MergeTree
    PARTITION BY toYYYYMM(event_time)
    ORDER BY (event_time)
    SETTINGS index_granularity = 8192;
EOSQL


