declare @IsMonth SmallInt;
declare @Red_t SmallInt;
declare @Date_From DATETIME;
declare @Date_To DATETIME;
declare @rrr SmallInt;
SET @Date_From = convert(datetime, floor(convert(float, GETDATE() )));

SET @Date_To = DATEADD(ss, -1, DATEADD(d, 1, @Date_From));
SET @IsMonth = 1;
SET @Red_t = (SELECT TOP 1 value FROM suo_settings WHERE name = 'red'); 
SET @rrr = {red_tackt};
IF @IsMonth = 1 BEGIN
SET @Date_From = DATEADD(d, DAY (@Date_From) * (-1) + 1, @Date_From);
SET @Date_To = DATEADD(ss, -1, DATEADD(mm, 1, @Date_From));
END;
declare @ATal Int;
declare @GTal Int;
declare @RTal Int;
SET @ATal = (SELECT COUNT(*) FROM Events WHERE Happened BETWEEN @Date_From AND @Date_To AND et IN (3, 4, 5, 7) AND IsCorrected = 1);
SET @GTal = (SELECT COUNT(*)
FROM Events e
WHERE e.Happened BETWEEN @Date_From AND @Date_To AND e.et IN (3, 4, 5, 7) AND IsCorrected = 1
AND (DATEDIFF(ss, (SELECT TOP 1 Happened FROM Events
WHERE ((et IN (1, 4, 5) and cc!=11 ) OR (cc=11 and et=4)) AND tn= e.tn AND id < e.id AND IsCorrected = 1
AND Happened BETWEEN @Date_From AND @Date_To
AND convert(datetime, floor(convert(float, Happened ))) = convert(datetime, floor(convert(float, e.Happened ))) ORDER BY id desc),
(SELECT TOP 1 Happened FROM Events
WHERE et = 2 AND tn= e.tn AND id > (SELECT TOP 1 id FROM Events
WHERE et IN (1, 4, 5) AND tn= e.tn AND id < e.id AND IsCorrected = 1
AND Happened BETWEEN @Date_From AND @Date_To
AND convert(datetime, floor(convert(float, Happened ))) = convert(datetime, floor(convert(float, e.Happened ))) ORDER BY id desc)
AND IsCorrected = 1 AND Happened BETWEEN @Date_From AND @Date_To
AND convert(datetime, floor(convert(float, Happened ))) = convert(datetime, floor(convert(float, e.Happened ))) ORDER BY id)
) <= @Red_t
OR (SELECT TOP 1 et FROM Events
WHERE tn = e.tn AND id < e.id AND et IN (1, 4, 5, 7)
AND convert(datetime, floor(convert(float, Happened ))) = convert(datetime, floor(convert(float, e.Happened ))) ORDER BY id desc) = 7)
);
SET @RTal = (SELECT COUNT(*)
FROM Events e
WHERE e.Happened BETWEEN @Date_From AND @Date_To AND e.et IN (3, 4, 5, 7) AND IsCorrected = 1
AND (DATEDIFF(ss, (SELECT TOP 1 Happened FROM Events
WHERE ((et IN (1, 4, 5) and cc!=11 ) OR (cc=11 and et=4)) AND tn= e.tn AND id < e.id AND IsCorrected = 1
AND Happened BETWEEN @Date_From AND @Date_To
AND convert(datetime, floor(convert(float, Happened ))) = convert(datetime, floor(convert(float, e.Happened ))) ORDER BY id desc),
(SELECT TOP 1 Happened FROM Events
WHERE et = 2 AND tn= e.tn AND id > (SELECT TOP 1 id FROM Events
WHERE et IN (1, 4, 5) AND tn= e.tn AND id < e.id AND IsCorrected = 1
AND Happened BETWEEN @Date_From AND @Date_To
AND convert(datetime, floor(convert(float, Happened ))) = convert(datetime, floor(convert(float, e.Happened ))) ORDER BY id desc)
AND IsCorrected = 1 AND Happened BETWEEN @Date_From AND @Date_To
AND convert(datetime, floor(convert(float, Happened ))) = convert(datetime, floor(convert(float, e.Happened ))) ORDER BY id)
) > @Red_t
AND (SELECT TOP 1 et FROM Events
WHERE tn = e.tn AND id < e.id AND et IN (1, 4, 5, 7)
AND convert(datetime, floor(convert(float, Happened ))) = convert(datetime, floor(convert(float, e.Happened ))) ORDER BY id desc) <> 7)
);
SELECT @ATal AS ATal, @GTal AS GTal, @RTal AS RTal


