SELECT DISTINCT TOP 90000 m.Timestamp,
                    m.TargetSpeed,
                    m.ActualSpeed,
                    m.MeasUnitSpeed,
                    m.[Order],
                    m.Component,
                    CAST(m.Timestamp AS DATETIME2(3)) AS FormattedTimeStamp,
                    c.Comment,
                    CASE
                        WHEN o.ID IS NOT NULL THEN SUBSTRING(o.Number, 4, LEN(o.Number) - 3)
                        ELSE m.[Order]
                    END AS OrderNumber, -- Extracting everything before the first whitespace in the Comment as EquipmentName
 CASE
     WHEN CHARINDEX(' ', c.Comment) > 0 THEN SUBSTRING(c.Comment, 1, CHARINDEX(' ', c.Comment) - 1)
     ELSE c.Comment
 END AS EquipmentName
FROM DatExpStatus_Motor m
LEFT JOIN DatExpComponent c ON m.Component = c.ID
LEFT JOIN DatExpOrder o ON m.[Order] = o.ID
WHERE m.Timestamp >= DATEADD(DAY, -7, GETUTCDATE())
    AND m.[Order] <> '00000000-0000-0000-0000-000000000000'
    AND m.TargetState = 1
ORDER BY m.Timestamp DESC