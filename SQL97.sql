SELECT
    machine_id,
    ROUND(AVG(process_duration), 3) AS processing_time
FROM (
    SELECT
        machine_id,
        process_id,
        MAX(timestamp) - MIN(timestamp) AS process_duration
    FROM
        Activity
    GROUP BY
        machine_id, process_id
) AS process_times
GROUP BY
    machine_id;