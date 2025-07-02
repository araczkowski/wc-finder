
-- Delete tags first (references wcs)
DELETE FROM wc_tags;

-- Delete photos (references wcs)
DELETE FROM wc_photos;

-- Delete ratings (references wcs)
DELETE FROM wc_rating;

-- Delete main WC records last
DELETE FROM wcs;


DELETE FROM storage.objects
WHERE bucket_id = 'wc-images';

DELETE FROM storage.objects
WHERE bucket_id = 'wc-photos';

commit;
