CREATE TABLE IF NOT EXISTS house.queue
(
    artist String,
    song String,
    duration String,
    ts String,
    sessionId String,
    auth String,
    level String,
    itemInSession String,
    city String,
    zip String,
    state String,
    userAgent String,
    lon String,
    lat String,
    userId String,
    lastName String,
    firstName String,
    gender String,
    registration String
)
ENGINE=Kafka()
SETTINGS
    kafka_broker_list = 'kafka:29092',
    kafka_topic_list = 'listen_events',
    kafka_group_name = 'click-group',
    kafka_format = 'JSONEachRow';

CREATE TABLE IF NOT EXISTS house.events
(
    artist String,
    song String,
    duration Float32,
    ts UInt32,
    sessionId UInt32,
    auth String,
    level String,
    itemInSession UInt32,
    city String,
    zip String,
    state String,
    userAgent String,
    lon Float32,
    lat Float32,
    userId UInt32,
    lastName String,
    firstName String,
    gender Enum('M'=1, 'F'=2),
    registration UInt128
)
ENGINE = ReplacingMergeTree()
ORDER BY (ts)
PARTITION BY (city, state, zip);


