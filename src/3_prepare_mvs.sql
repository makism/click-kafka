CREATE MATERIALIZED VIEW house.events_mv TO house.events
AS
    SELECT *
    FROM house.queue;
