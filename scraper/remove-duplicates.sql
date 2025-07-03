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

SELECT MIN(ctid) as ctid, name, address
FROM wcs
GROUP BY (name, address) HAVING COUNT(*) > 1;


SELECT MIN(ctid) as ctid, user_id, photo
FROM wc_photos
GROUP BY (user_id, photo) HAVING COUNT(*) > 1;

DELETE FROM wc_photos a USING (
    SELECT MIN(ctid) as ctid, user_id, photo
    FROM wc_photos
    GROUP BY (user_id, photo) HAVING COUNT(*) > 1
) b
WHERE a.user_id = b.user_id
AND a.photo = b.photo
AND a.ctid <> b.ctid;
