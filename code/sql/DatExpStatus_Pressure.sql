SELECT DISTINCT TOP 90000 p.Timestamp,
                    p.Value,
                    p.[Order],
                    p.Component,
                    CAST(p.Timestamp AS DATETIME2(3)) AS FormattedTimeStamp,
                    c.Comment,
                    CASE
                        WHEN o.ID IS NOT NULL THEN SUBSTRING(o.Number, 4, LEN(o.Number) - 3)
                        ELSE p.[Order]
                    END AS OrderNumber,
                    m.Name AS MaterialName, -- Added this line to get the material's name
 e.CodeName AS EquipmentName -- New line to get the equipment name
 
FROM DatExpStatus_Pressure p 
LEFT JOIN DatExpComponent c ON p.Component = c.ID 
LEFT JOIN DatExpOrder o ON p.[Order] = o.ID 
LEFT JOIN DatExpMaterial m ON o.Material = m.ID -- New join for DatExpMaterial
 
LEFT JOIN DatExpEquipment e ON c.Equipment = e.ID -- New join for DatExpEquipment
 
WHERE p.Timestamp >= DATEADD(DAY, -7, GETUTCDATE()) 
    AND p.[Order] <> '00000000-0000-0000-0000-000000000000'
ORDER BY p.Timestamp DESC