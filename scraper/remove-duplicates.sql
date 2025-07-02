SELECT MIN(ctid) as ctid, name, address
FROM wcs
GROUP BY (name, address) HAVING COUNT(*) > 1;


DELETE FROM wcs a USING (
    SELECT MIN(ctid) as ctid, name, address
    FROM wcs
    GROUP BY (name, address) HAVING COUNT(*) > 1
) b
WHERE a.name = b.name
AND a.address = b.address
AND a.ctid <> b.ctid;

commit;

SELECT MIN(ctid) as ctid, name, address
FROM wcs
GROUP BY (name, address) HAVING COUNT(*) > 1;
