DROP TABLE house.events_mv;

CREATE MATERIALIZED VIEW house.events_mv TO house.events
AS
    SELECT
        artist,
        song,
        toFloat32(duration) AS duration,
        toUInt128(ts) AS ts,
        toUInt32(sessionId) AS sessionId,
        auth,
        level,
        toUInt32(itemInSession) AS itemInSession,
        city,
        zip,
        state,
        userAgent,
        toFloat32(lon) AS lon,
        toFloat32(lat) AS lat,
        toUInt32(userId) AS userId,
        lastName,
        firstName,
        CAST(gender, 'Enum8(\'\'=0, \'M\'=1, \'F\'=2)') AS gender,
        toUInt128(registration) AS registration
    FROM house.queue

