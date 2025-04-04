SELECT DISTINCT TOP 90000 t.Timestamp,
                    t.Value,
                    t.[Order],
                    t.Component,
                    CAST(t.Timestamp AS DATETIME2(3)) AS FormattedTimeStamp,
                    c.Comment,
                    CASE
                        WHEN o.ID IS NOT NULL THEN SUBSTRING(o.Number, 4, LEN(o.Number) - 3)
                        ELSE t.[Order]
                    END AS OrderNumber,
                    DATEPART(HOUR, t.Timestamp) AS HourPart -- This extracts the hour part from the timestamp

FROM DatExpStatus_Temperature t
LEFT JOIN DatExpComponent c ON t.Component = c.ID
LEFT JOIN DatExpOrder o ON t.[Order] = o.ID
WHERE t.Timestamp >= DATEADD(DAY, -7, GETUTCDATE())
    AND t.[Order] <> '00000000-0000-0000-0000-000000000000'
ORDER BY t.Timestamp DESC