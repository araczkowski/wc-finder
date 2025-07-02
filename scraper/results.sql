-- Import WC data from CSV
-- Generated on: 2025-07-02T07:16:17.347Z
-- Source file: ./scraper/results.csv
-- User ID: cac878bb-3f77-42a7-9221-919238bfae76
-- Created by: public@sviete.pl
DO $$
DECLARE
l_context text;
BEGIN

-- WC #1: Toaleta w Warsaw Hub
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta w Warsaw Hub', 'ul, rondo Ignacego Daszyńskiego 2, 00-843 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqo4QtdJy8T39KE0PJU8yL6_kz_yzHmCeCYxxpPM37EgsOHlqT2hpvpf5HFeo-5K0Ki6rQAjESUK9JRLOSYFGmkKm4MzdpeUeupb0-GhVgGiz5BvOnECwKFv-36PO_vsKnnR_U=w426-h240-k-no', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 9, ST_Point(20.984421, 52.229383)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #2: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '00-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noHpKGa5g6xtq4VlmntdbuJbNTAihMJvjLChuAc_gNcO7BMB_B1iDX2PXipdladEzIpcaehBlv24BBzdFafdCB8VTuQVLlypAYx6DueyUAzcgEikTj8Wh84ILjhhw-lph7e8d3r6g=w425-h240-k-no', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 4, ST_Point(20.998444, 52.209513)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #3: Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety', 'Muranów, 00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ecHiHs4N-_zFf5IoZ-x0bw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=263.12213&pitch=0&thumbfov=100', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 9, ST_Point(20.985477, 52.256652)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #4: Toaleta Bezpłatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Bezpłatna', '00-017 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RU21a3pUvSJs09b3cXTp_w&cb_client=search.gws-prod.gps&w=408&h=240&yaw=68.982796&pitch=0&thumbfov=100', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 6, ST_Point(21.007486, 52.235887)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #5: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nLPE5IYQQkfXaCEfdLNxMw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=62.80075&pitch=0&thumbfov=100', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 7, ST_Point(21.014409, 52.253014)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #6: Toaleta w Metrze
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta w Metrze', 'Stacja Metra Świętokrzyska 00-001', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrS0dEYsR88p7mGgjDcZ5JRGgzV1CtjX_5ucMc9rYNKyTCe82kCVW-gNpArzW1KQxylhkHwJmIbb0KD4EpZeDRqZGFl-OQ_jnv7zC1UjrdmSZRvmwgJZuQDNUTzhhQowgQm_nhT=w408-h544-k-no', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 8, ST_Point(21.007447, 52.2363)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #7: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Kościelna, 00-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrg-ZCSWuxoClsA7j2M8pMFLT72H0UdCjarHcSxEpKq2W8TQ-PfTIG5d30dzSldD44ua-KyV6AKZ62yTlPK8iCMJt35hPuyuShAPiyJUiaWSiSm5TZu0RsqTjR_LjXNAMsYzw7vBg=w408-h306-k-no', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 4, ST_Point(21.010029, 52.254102)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #8: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Pałac Lubomirskich w, 00-001 Warszawa', 'https://lh3.googleusercontent.com/p/AF1QipOgVFKl-h2vEQ7T57hTrmlUOOxn3CwKPS3JZraT=w408-h306-k-no', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 8, ST_Point(21.001589, 52.239154)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #9: WC metro station Nowy Świat
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC metro station Nowy Świat', 'Stacja metra Nowy Świat, Świętokrzyska, 00-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noX08T3c0sOkhqhZcXJpzl5SE2umWib9Ps48gltozep-ZowbeyKkUbXvjGCzB7uGYtjOUw7xJ7g-8WA7SlsxDq3ZXZFoNOl0J7lLl60N4gojnQJ5v6SHOjScmAGqVAX87l7vrNsQw=w408-h306-k-no', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 9, ST_Point(21.016672, 52.236872)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #10: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Wybrzeże Gdańskie, 00-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noInasOg-ZPZAo33oxfLKmHSjeG9lw6XhjJ_huR7EfRNrM43jhhnABCC1Mte43mbEp4s0_I7MIuBLxHtMv2Zs53Q_OcnY9nqn_6fQzigdRiO8uktD07mt1GaG8b650VobLHHH04=w408-h725-k-no', 'a2e0ce3b-f129-4656-a3e4-77abdfa0ec64', 6, ST_Point(21.012174, 52.25553)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #11: Toaleta „Lapsiu”
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta „Lapsiu”', 'Rynek 48, 05-079 Okuniew', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=316.32266&pitch=0&thumbfov=100', '41bbc8c4-5491-483d-bfa2-860852216094', 1, ST_Point(21.306498, 52.272988)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #12: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', 'Stanisława Żółkiewskiego 17, 05-075 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cFmPFYFDcdiNjel20D6ZmQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=101.0444&pitch=0&thumbfov=100', '41bbc8c4-5491-483d-bfa2-860852216094', 1, ST_Point(21.244245, 52.248482)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #13: Toaleta „Lapsiu”
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta „Lapsiu”', 'Rynek 48, 05-079 Okuniew', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=316.32266&pitch=0&thumbfov=100', '93e61dab-03c2-4342-81fc-b93dc8430586', 1, ST_Point(21.306498, 52.272988)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #14: Toaleta „Lapsiu”
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta „Lapsiu”', 'Rynek 48, 05-079 Okuniew', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=316.32266&pitch=0&thumbfov=100', '71027812-c523-48fb-bb79-990ea06a5c4c', 1, ST_Point(21.306498, 52.272988)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #15: Toalety Darmowe
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety Darmowe', '01-999, Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqU8Xeir5qe96HxzFRDnqrB1bKFTr2ffmdpi20ISs6vgiQcTaRagx_YLkNOqxUISip0EkJUZbe0gR4RzWhMwYszbWK6_WrldCksS58ZiihchwCR7zVh_QOdR25wg7HkEo3kM51U6bN-HpkK=w408-h306-k-no', '1c048624-1d1a-4e06-9fc0-e75c9fb0333c', 8, ST_Point(21.038071, 52.213086)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #16: toaleta w parku
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'toaleta w parku', 'Biedronki 6, 02-946 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGms_x_d2LtR9TaTGn2HHg1ckM06bSX8eR1G3E4X5wfVhAIu_Leo4NdwiSkWVkUpjmMP40xAtKB4ERKPhRHKFDHkiPNlds91dnil8diafMtsBE1mMXcESFnh7V8XBt0teZiZgocg=w408-h306-k-no', '1c048624-1d1a-4e06-9fc0-e75c9fb0333c', 8, ST_Point(21.09011, 52.166838)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #17: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Łukiska 29, 04-123 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rMeJDPo0W8NFN5QacQRHgA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=279.5524&pitch=0&thumbfov=100', '1c048624-1d1a-4e06-9fc0-e75c9fb0333c', 1, ST_Point(21.096869, 52.23758)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #18: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Książęca, 00-418 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrbGfQAmgOjMdIntBeEj_W9Y-WVOuWKdsGg4BSCxeW9eJSv6GP2rjUlRbBHWmDs0XY-4OwMHuVBvG5RtTPMBH_9uRqJSrT_bmdp8nS3R3kobSXs0EjIGnbDEW43P6wM0dH9tKpOPA=w408-h306-k-no', '1c048624-1d1a-4e06-9fc0-e75c9fb0333c', 5, ST_Point(21.029911, 52.230324)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #19: Stable
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stable', 'Majdan 63, 05-462 Majdan', NULL, '1c048624-1d1a-4e06-9fc0-e75c9fb0333c', 2, ST_Point(21.263022, 52.203889)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #20: Toaleta WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta WC', 'Chyleniecka 4, 99-416 Nieborów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npLNi3zNMQiuHfpuFAKxvppmRkm0ejh3WpGMm0Bsf14ucH-QUllHGS2oaahOLSUaY9hfl5mmwEr4sJ0x_K_jtoMnGYrPCPx8U3GjQ1MoqUxVDq8rwG8ZRpZVBiUiFsElILtOIzA=w426-h240-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 9, ST_Point(20.071135, 52.067625)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #21: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'WC', NULL, '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 1, ST_Point(19.145136, 51.919438)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #22: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '89Q4+96 Toaleta, Niedrzew Drugi', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqxrgpgJWIwadCwwvvRsDJLl4JDTJLe7roZ8QjO7CHvTKxyt5npy10tjt5h_KYCCv3COYopXPNN3R1GWzNfKt1UFSzzQAfccQ3eysSM5tgTG3uTCalRlK989Qo5gG1dLeAVKYhV=w408-h306-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 10, ST_Point(19.355503, 52.338433)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #23: Toaleta (płatna)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta (płatna)', 'Parkowa 15, 05-850 Ożarów Mazowiecki', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrAsfnE1pne2w7gtppLN07dBjmSZj5GFLPDGbSoLV0BraBdt2lzQr5EuryiQLNt1kfuxRCbHuy0Ee1IShe1NGqoR77KRKcUNZhOeRBJYAg0jQj-0rwu-NH3UcL5GNR4S3kwgj8nrQ=w408-h725-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 6, ST_Point(20.776667, 52.214933)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #24: toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'toaleta', 'RMR6+QH toaleta, 95-060 Nowe Skoszewy', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np8JDcRuSz878VvxxTNCZVElQCaX2Bm4mt8HsAr4mqZHavI6sfq8oBxTcfCxPlENtyVeTonprHHUbRXafuxZFV1l298epJRIIL1QS1kOXlmXjlndUJgRjRcxpbYx-NZ_iUB1WtcbA=w408-h306-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 6, ST_Point(19.661257, 51.841809)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #25: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Nowe Skoszewy 13, 92-701', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noIswkjxL8F38_kj8MDXhxLZxYRH8m98MUKbXG-g5LiNqJhOBNDEaSQayQf0mCprCyOXPf-CfG-hk2P--9PtPA4UWJjQ9oo8gR1k3IvCeh-i1S1WCVNrYADf5DeRA0E8tIjO6Y=w408-h306-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 7, ST_Point(19.656722, 51.841817)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #26: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Mąkolice 9, 95-015 Mąkolice', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nooommvWKk41-8vjeQXDqTDxHBo7I5Ox1PpJ0SbOygnQCOH1sTVZV5nRNQ91vb4vfkO03GeicWXR92tAW5myrsbwmzycj06G79VXrGjZulooT8cK7ERqU8Kp0vZkvkAVuCnDNOC6g=w408-h306-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 7, ST_Point(19.544953, 52.007567)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #27: Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety', '95-100 Zgierz', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wj8wshofFOrvpMgl73v8zA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=16.459145&pitch=0&thumbfov=100', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 1, ST_Point(19.409571, 51.919959)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #28: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Zielona, 99-200 Poddębice', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=R4104rNBklQlFT6RLybPNg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=120.69012&pitch=0&thumbfov=100', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 10, ST_Point(18.959453, 51.885494)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #29: WC (toaleta damska/męska)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC (toaleta damska/męska)', 'Przygraniczna 96, 95-100 Zgierz', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6MgQQxIVpTF_JnUgkp6sOg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=337.29236&pitch=0&thumbfov=100', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 1, ST_Point(19.425109, 51.882082)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #30: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '99-314 Krzyżanów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nphqiSKb-LOx6OShd8pnA6MyzXy2XP0LepFl-D4yIc51PZARynLZ9QreDFz0aNnfvJURvryBfERNR7cbH41nTRPpHQmpxhb3D6o9sObqOVfsC9uY9AomARc7YFilhz9fbdPEM6Eww=w408-h306-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 7, ST_Point(19.489123, 52.184304)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #31: Toilette
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toilette', 'Północna, Nowomiejska, 90-001 Łódź', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no-VnAo8UheaMoKgnNvIodhqGkvBNSCNFVPBcOPcZ266K_wFMo-dFXisNKMwLy2NrEI-bXwtzoIblm2KjdtNvHyMpXDltN9HD_OhkbgPXV_7BDN0SajoebRIw5v3idAe_Mhmb8FSg=w408-h544-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 4, ST_Point(19.455138, 51.779511)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #32: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Stary Rynek 5, 99-400 Łowicz', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nouqcoFMn_CGpKeIA_X6XSkLH2OUf0hpcBeL0sSKMpMngB8Rg-ak9EAMEoZYy-s-6clo9xvgdybXWcKt-mDrG8OgkRtBzgpbCVWcmIZR8BoTa4rMFm61C-2EgFvANO-iMl-VOQF=w408-h544-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 3, ST_Point(19.946492, 52.108348)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #33: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Konopnickiej, 99-200 Poddębice', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr0QN52jOzQjZf-aUarpnEWu41_ki1L_8Uzfdjw-_cH7Uijl24vVsYlEBGKDPwj1TFjce5hYl-fjt-6Y33eQdWCSuoKsnI3FqPLHWiORirZNT4Nd2rKqBd70jCyo4ijQk1QCuYW=w408-h306-k-no', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 10, ST_Point(18.95174, 51.890572)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #34: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Al. Jerozolimskie 142, 02-305 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YTJ1mkj_rVqHDRMEGo0mkA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=295.71527&pitch=0&thumbfov=100', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 2, ST_Point(20.966045, 52.219019)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #35: bio toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'bio toaleta', 'Park Helenów w, Północna, 90-001 Łódź', NULL, '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 8, ST_Point(19.467852, 51.781954)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #36: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '99-101 Łęczyca', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=3p2bCtbrhjA9feUgi7H2Ig&cb_client=search.gws-prod.gps&w=408&h=240&yaw=306.70218&pitch=0&thumbfov=100', '7200a66b-bd18-4dc6-8230-8065eb6b4cd1', 2, ST_Point(19.203526, 52.058344)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #37: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Chomiczówka, 00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ykpKuRD_aj37ueUtonKwzg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=161.77911&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 1, ST_Point(20.930415, 52.277888)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #38: Toaleta w Metrze
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta w Metrze', 'Stacja Metra Słodowiec 01-001, 01-001, 01-001', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npfQJY-rxpSsOMKsXL1aGWkwyHzeOWJe7x_LX8BMEl446BS1XsX14Ajx9GJtYsv9ciKH8OY0cQdi1JCfqm3JzUpMxdTfZ7M3ws4rMQZkQDnwjO1m7EtxiJXVsyj1H9LjiViQLU=w408-h544-k-no', '31203134-4265-4dce-be20-ce07d744b640', 8, ST_Point(20.961118, 52.276396)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #39: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Jana Kasprowicza 145, 01-823 Warszawa', NULL, '31203134-4265-4dce-be20-ce07d744b640', 8, ST_Point(20.927439, 52.290679)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #40: Toaleta WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta WC', 'Kazimierza Wóycickiego 14, 01-938 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npE193bNEglf6rOLt_vcRVshReCFvKjqf31aOeajnDlYlfAQnGTxYqdFFTsxYtEYzdH3HxRs7hoM1U7eTg_xyxn-5nfllkOX8bQcdN9bmg_hyhhsFkcYUjnUwqYjuixo1KH78IVRA=w408-h306-k-no', '31203134-4265-4dce-be20-ce07d744b640', 1, ST_Point(20.900258, 52.29809)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #41: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '05-082 Janów', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cderbi-YyRSmRBYIAK1VMg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=322.65872&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 10, ST_Point(20.845591, 52.247185)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #42: Toi toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi toi', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zRPAMiIKtF5aNtCxPQtATg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=60.55868&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 10, ST_Point(20.956361, 52.288051)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #43: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Marii Konopnickiej 8, 58-100 Świdnica', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8P4QQyHBTpAALiIL8zPfpg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=217.40114&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 9, ST_Point(16.487314, 50.844725)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #44: Warsztatura Hubiego
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Warsztatura Hubiego', 'Dobra 28, 05-082 Zielonki-Wieś', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bnXFEHjJIRdxjIR80iS0Fw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=195.68204&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 10, ST_Point(20.817654, 52.256404)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #45: Toaleta (WC) Płatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta (WC) Płatna', 'Kazimierza Wóycickiego 14, 01-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npkwq2ahTqdqX4bTwkLi4zDNPI2tb6sJ2PXVgPKNKqB4p5isYZDroa2Zj1_grOOaQr-O_U17O819mU_Xy6ceI-fKwI0g4Zug2uxMdx5cWzsVW-Br955A6AD0D4i6gVBTMw3eu-cWQ=w408-h306-k-no', '31203134-4265-4dce-be20-ce07d744b640', 4, ST_Point(20.90185, 52.299423)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #46: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=7F0-P6TFaEaKd6PTVdnqDQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=339.37192&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 1, ST_Point(20.922488, 52.254823)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #47: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Jana Kasprowicza 203, 01-949 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrfe8vHJyC4YILJO5Zq4hI_2VFvSVDt3rFHjrJyGLg4DtaopFbZEqlftGybKqEsoaqqBsxzTl6noVdiJnhlbVWB5p0k4O2X-ptDPDUAvkF7wnkxGI58i0Pka2hDqdgRqvzwMPxp=w408-h544-k-no', '31203134-4265-4dce-be20-ce07d744b640', 10, ST_Point(20.9272, 52.290808)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #48: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Wrzeciono 10C, 01-829 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cENPVCzxHtbqtbx_nxDAHA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=311.51883&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 6, ST_Point(20.939433, 52.290906)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #49: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', '01-995 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RqmOfrPPQZGzZrID2M-_Rw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=164.46982&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 10, ST_Point(20.942224, 52.286741)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #50: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', '01-493 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ZtvC4x8AeJ0gil9QJ9ewdQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=123.02154&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 1, ST_Point(20.918903, 52.256173)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #51: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', '05-088 Brochów', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gYcOfw2UMxIzYAkvz1nQOw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=93.14624&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 2, ST_Point(20.263092, 52.316811)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #52: Toaleta w Metrze
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta w Metrze', 'Stacja Metra, 01-859 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RI_iXA4RsoLiExjH_XZXyg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=229.49039&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 6, ST_Point(20.940452, 52.285951)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #53: Szalet miejski
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Szalet miejski', 'plac Świętej Małgorzaty, 58-100 Świdnica', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8P4QQyHBTpAALiIL8zPfpg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=20.161983&pitch=0&thumbfov=100', '31203134-4265-4dce-be20-ce07d744b640', 7, ST_Point(16.487469, 50.844915)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #54: Toalety (TOI TOI)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety (TOI TOI)', 'Wawrzyszew 00/001, 01-912 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noXoY_y3T3QZPcpRd2_GiaDOWIA4hhF8KCXUaA4XnhJcS3VwaPi9YF4yZZSib7BE9VFVSVs0sxOfpgj17jAd7PQo_-nMZpL9JuLWuxJBNhj15LYSbxnQbQb0slo8h8sf1RzC5vUpg=w408-h544-k-no', '31203134-4265-4dce-be20-ce07d744b640', 2, ST_Point(20.93585, 52.282303)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #55: Sub Sole
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Sub Sole', 'Powstańców Śląskich 61, 01-355 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=99J45oOPKxAn_Cl0l6F1tg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=267.03516&pitch=0&thumbfov=100', 'bd27260d-67a0-42a7-83dd-37b94450b607', 1, ST_Point(20.914361, 52.23224)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #56: Toaleta Publiczna w Parku Górczewska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna w Parku Górczewska', 'Kryształowa 45, 01-356 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noOLj_5BOqaJUnr_8o_2pz-Sdaq4hgT3L7rnU8RZ0o-duRwurXwbXnaB8mZwvYWFiuMJGPKav3s3jhDcONFPujEJ9IV74bMLSkmcPtygOpUcW_Ti4qxRfCnc4Z6zLiMlyWDe2lR=w408-h306-k-no', 'bd27260d-67a0-42a7-83dd-37b94450b607', 6, ST_Point(20.906321, 52.233099)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #57: O'BLOCK Wojcieszyn
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'O''BLOCK Wojcieszyn', 'Trakt Królewski 74, 05-850 Wojcieszyn', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=QeSRgNd7kGX-CHKXRNqkvg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=341.46893&pitch=0&thumbfov=100', 'bd27260d-67a0-42a7-83dd-37b94450b607', 10, ST_Point(20.768335, 52.259429)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #58: Toaleta publiczna - bezpłatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna - bezpłatna', 'Krakowskie Przedmieście 87/89, 01-195 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqfYjvtiMfTZS9RvMXyHjE42OpHq0uNA1QWpOcoy92bvuNiQTZ2yACnhpeGYK5SE03p71dQrf7aD4eYUAaYU_jDdJvI8TdWGVZkK8ZNNcT62XUByRwFD-W-fPoGVfIf-8DIPIvnfRbG8UQ=w408-h307-k-no', 'bd27260d-67a0-42a7-83dd-37b94450b607', 9, ST_Point(21.012974, 52.246975)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #59: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', 'Regulska, 00-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np5pbfhSw5dUgMbP9omrsCMKULBdL637wOXDjt9JtV8UhXfJKo-dAn9HosUFVXg3GjPyzUOqx1e8xhAzDo_Q_1JjQrTnWgEGHlWOvUfpmOBUYNj0oZXerU13VWs8CV13vt7Ovd9=w426-h240-k-no', 'bd27260d-67a0-42a7-83dd-37b94450b607', 10, ST_Point(20.883374, 52.195598)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #60: Wc
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Wc', 'Unnamed Road, 05-850', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nooStI2NtXEagdesxq0y0eEfcQTrKnLyVXDvXFdeOCIBIHCP9plxjNGyIPq14U40gBhEhq2-lNvwq3nPlcxB02kdB2FFPYaSBv68qiFL67n3-7pfq7f4CxV3VIl6ObHAjna3efzmg=w408-h581-k-no', 'bd27260d-67a0-42a7-83dd-37b94450b607', 6, ST_Point(20.799987, 52.210429)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #61: Toalety Westfield Arkadia
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety Westfield Arkadia', 'al. Jana Pawła II 82, 00-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrzUoDUSqDfUFL34TJP48M8Vj2MiaZ_pduSUhxnA3thgZTI5Y2bCyVL-2Jc5ZTVxCDjFLT9BuxNcONCvXPEmtg2ZuWQ53qhJdXvFEM1Neir-4dwRmxq38V-HATdBexMzE-nPfYelQ=w408-h306-k-no', 'bd27260d-67a0-42a7-83dd-37b94450b607', 8, ST_Point(20.986286, 52.258459)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #62: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', '02-495 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq3z4lvLAxUEBCYc6qsWjDvg0Q9agjIS8I9Nt3b--N4W7bq9ooEumG_1PzJryyuIXfXHN4U77moVBLwDmb_c4kX5vGvzgnBBfETNpQp2sA8y_qBagvqBrYLtz35CAzL_XpVvS-h=w408-h306-k-no', 'bd27260d-67a0-42a7-83dd-37b94450b607', 6, ST_Point(20.885959, 52.19099)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #63: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Rynek 1, 64-100 Leszno', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npfiCeeyWKIffp8RNVkphJyXF7P9M4H6kBJNGomePkotdkQt1hhyh_Bn1z2CedKbIT-3-l8Yt2mRsP1pdNBH1bTZyeF3CSfTxDRDEQrb53G899tq_-8K1_rk0NA3HR4GJU6Ry_n=w408-h646-k-no', '006bf8e7-a38d-437a-a1c8-10534b448a3b', 6, ST_Point(16.574511, 51.843425)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #64: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Nowy Rynek 33, 64-100 Leszno', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Y0KWKNY0Wm2rMSqdNjFVOw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=32.117928&pitch=0&thumbfov=100', '006bf8e7-a38d-437a-a1c8-10534b448a3b', 6, ST_Point(16.570054, 51.841043)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #65: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '99-314 Krzyżanów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr6D-xplO1dVaS_Exwhte-VeJpCo0zz7JRAuHeHN4YOLkwJT70QcASt7JYYKIcMtfqRSH3ZZka8v7J0n_fx9_F9HtJRsv6TdMTAAdM53rEQptjlEkRJ39pMVCqFqOP0aNL_84pJkmSgQiiA=w448-h240-k-no', '37e61c9d-1ad5-4dd2-aa0d-7fbe6d7b09f6', 10, ST_Point(19.485349, 52.184612)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #66: Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety', 'Spacerowa 13, 96-515 Paprotnia', NULL, '37e61c9d-1ad5-4dd2-aa0d-7fbe6d7b09f6', 10, ST_Point(20.418447, 52.20356)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #67: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Romualda Traugutta 2, 96-500 Sochaczew', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=f3MUEnjR3nUq3nVTmvDemw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=278.72598&pitch=0&thumbfov=100', '37e61c9d-1ad5-4dd2-aa0d-7fbe6d7b09f6', 2, ST_Point(20.237881, 52.228591)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #68: Toaleta Bezpłatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Bezpłatna', '05-800 Pruszków', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2W9DXl-4C_ys6aOrQQJJTA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=125.53367&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 8, ST_Point(20.824035, 52.169809)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #69: Toaleta WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta WC', '05-800 Pruszków', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pEt3sFVdGSA2lfYB87b7CQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=180.9193&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 10, ST_Point(20.798508, 52.16789)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #70: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Łopuszańska 22, 02-220 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1kVDUGe-EDVUz5OV09VrMA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=103.33082&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 1, ST_Point(20.951037, 52.193389)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #71: Toalety WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety WC', 'Henryka Sienkiewicza 19, 05-800 Pruszków', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqAzquWuW8ldjjfPjl_eV1MR92midwGjHVkDo-5iIM_k5SinWBBR7F-rZgT7TqMCRwci1Z69UxyXdxmcUsGV-hbXqhpemBYqFG2R7fFmqXNQxQuYpc7HXdnahD2Gnter_4h-siT=w408-h544-k-no', '123026fe-2251-4770-944d-6fade8201bd6', 8, ST_Point(20.793258, 52.165253)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #72: Toaleta Publiczna bezpłatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna bezpłatna', 'plac Czerwca 1976 Roku 1, 02-495 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YESu1cgthRccV3VidwChfg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=339.53284&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 10, ST_Point(20.893482, 52.200936)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #73: Toi toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi toi', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-7pD_GQUHzLrcGrsjyX7jw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=74.12026&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 8, ST_Point(20.967882, 52.195612)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #74: Toaleta publiczna w Parku Kombatantów
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna w Parku Kombatantów', 'Obrońców Pokoju, 02-435 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjH9ZMDli2uQWffpc2kNkFmrlskPS2LG6W_Vmqw2RqxDlZppcGYpXyLu440x4MWt9K2LlNIAv1oM7n9khbqLyofttUrhBz-Xa3fakawVk00NDSaUHSixG49x23XekQGa4BkE_G=w426-h240-k-no', '123026fe-2251-4770-944d-6fade8201bd6', 8, ST_Point(20.912109, 52.208046)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #75: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Daleka 16, 05-802 Pruszków', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nozsh6MUBmEVVNCYrO48Ji456VilDa_nqPZoVowxKpyxWhDTp9kJUvbc6jPgrutUAKBTm4PLAO85wJxI7e7mJvDUnxXtdWQ7M8Ji66_F_I_Rpdm-Sxx4k6zTFxauX7U7W-WjPcmqA=w408-h544-k-no', '123026fe-2251-4770-944d-6fade8201bd6', 9, ST_Point(20.834735, 52.164354)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #76: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '05-800 Pruszków', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zuEBqVkXgzJxkTd13Pjjig&cb_client=search.gws-prod.gps&w=408&h=240&yaw=279.1869&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 8, ST_Point(20.810067, 52.161969)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #77: Toaleta mejska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta mejska', 'Fryderyka Chopina 30, 05-800 Pruszków', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=w2i4yWTNT7uwjy3Nr0JByA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=332.22412&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 1, ST_Point(20.799561, 52.164112)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #78: Miejska toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Miejska toaleta publiczna', 'Unnamed Road, 05-800 Pruszków', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrl9-zcPxPtP1DM33bdNkRvyozN4g8w-PRKcfIDbQCyQbRqIo9-pbSRu8K4BeDM2_FXhGmGOhhH-36SyjHwukr9Zat2PFoxG_pNBDptii4zwJySgLLMfN7l1feq6-PrykBrrygnnQ=w408-h569-k-no', '123026fe-2251-4770-944d-6fade8201bd6', 3, ST_Point(20.801885, 52.166906)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #79: Toaleta publiczna (bezpłatna)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna (bezpłatna)', 'Gładka 18, 02-172 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bnO_hBA1A8WoAWqVPXEHfw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=122.393166&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 1, ST_Point(20.96068, 52.187989)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #80: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Stefana Jaronia Kowalskiego 31, 05-800 Pruszków', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq71hhPAFoEVbJf_gKYw-HvfG1F5_96rxQ_VVJ0uSGcbq_rUxW-3EZ4fW1U1tbVamdbedouxrhdx5wXBM1MGctP7sKQaXhEMESBl4STOmb92QPfzXg6qrOImZoHblQh1JV2c06v=w408-h544-k-no', '123026fe-2251-4770-944d-6fade8201bd6', 8, ST_Point(20.80148, 52.183473)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #81: Toi toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi toi', '02-479 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=v6_WngtQCLGuBlz8j5TkuQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=77.25193&pitch=0&thumbfov=100', '123026fe-2251-4770-944d-6fade8201bd6', 10, ST_Point(20.915267, 52.205833)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #82: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Aleja Antoniego Nowakowskiego, 01-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqSKTKeeAqKhkQWhpPSU8dtnPhWFJN70Xdx55j7WkICgieTxnUbb76zL0XxHoYpiG2ActIwm-DP8HypVWgygyyr376TTaoXFtIaiXu9To1iCyeyIGUkP0zyok1rBFUld01mGuZOuQ=w426-h240-k-no', '123026fe-2251-4770-944d-6fade8201bd6', 5, ST_Point(20.923644, 52.199501)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #83: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Sierakowskiego, 05-509 Piaseczno', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nplvMUt9Jyo4fWgh46A8KgrGNws0-XoI34D-x-Hz-olLHJtNL_qfBNqPIVVYKTcMLQUgbgPzjIzr0jEKQTaB8kSBb1fWQyLMGo-zzGi9C2euFIOOKve6W1rH8lCe63lFA696-ying=w408-h306-k-no', '123026fe-2251-4770-944d-6fade8201bd6', 7, ST_Point(21.02855, 52.07417)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #84: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Piaseczyńska, Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nohyYgLpN9hXZZAlZ5I33ICilq8UAa1SOfLTxcSNKWkO11OV5RgH7E648WjyjIQ9uM1TjLZpQIs23poz1S6hfYE21T_cyWPqgGYcJCBRcvafhuSzGhAte97tcRCmz24VI1eKqXTJA=w426-h240-k-no', '123026fe-2251-4770-944d-6fade8201bd6', 5, ST_Point(21.030667, 52.189435)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #85: Ośrodek Leczenia Uzależnień pod wezwaniem Kamila Chujowskiego
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Ośrodek Leczenia Uzależnień pod wezwaniem Kamila Chujowskiego', 'Księdza Ignacego Skorupki 81A, 05-091 Ząbki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=IJszLWib-jyC6ocj7UpOAw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=339.49667&pitch=0&thumbfov=100', '4353dc8a-904e-41ba-b16d-9a4dff4555a0', 1, ST_Point(21.127861, 52.291591)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #86: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '05-091 Ząbki', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqbmQCk4qwI-bizzMshygLgiDSRRdXwS-AyglTct8H3AW4PEvmNG4DMebnFfrEUzlMDaYAxI2iNj3WMJwc1KtWgLo9Uqki5Y2C0XH84mncpLTicTao98mBVWhFQFR2RSs4-OBI-HQ=w408-h306-k-no', '4353dc8a-904e-41ba-b16d-9a4dff4555a0', 6, ST_Point(21.113716, 52.293054)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #87: Samoobsługowa myjnia dla psów
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Samoobsługowa myjnia dla psów', 'Powstańców 66, 05-091 Ząbki', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqJZq1Z0kC-EGOwgcAtuYTFvcq_ZK5Qa_k_NuAz2g67FefWEzKMiKrONNj171xQs2zSyl_MAq3h24ZVRRaSUU-vvqj48uRxynCAP0hDz7SngH38Ti8leq71CIHga4byuUx6_FKk=w408-h306-k-no', '4353dc8a-904e-41ba-b16d-9a4dff4555a0', 10, ST_Point(21.135245, 52.280175)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #88: WC toilet
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC toilet', 'Malborska 39, 03-286 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=I3slB5xRrpk6ZbY8A_fbcg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=344.9086&pitch=0&thumbfov=100', '4353dc8a-904e-41ba-b16d-9a4dff4555a0', 1, ST_Point(21.078816, 52.302544)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #89: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=GEpX8MntFtait16cwt2Ecw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=155.76859&pitch=0&thumbfov=100', '4353dc8a-904e-41ba-b16d-9a4dff4555a0', 7, ST_Point(21.078993, 52.304039)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #90: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Pułkowa 60, 01-969 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npHm3OnOv0htu2yPyfwfuXnFqkeXNjBxdoKU8OKCmXQsR95kEcz3fYDpILKjutEq2G8iREYdC9EZak2nPMiODfIPyHVpfjR8ohnXa13IppcZQNkG_UHhXL9wp1ZnpRtbAm8HI6T=w408-h306-k-no', '1a450424-d964-450b-9c38-1db5614c6e62', 8, ST_Point(20.932784, 52.311121)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #91: Toaleta na placu zabaw
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta na placu zabaw', 'Józefa Przyłuskiego 2, 05-092 Łomianki', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrvI1kU1kFTZRDaEaR8DxL786wpkVN6VsENuUGbBs2GreVI3kkrBKnJ-VJfEzfGWhvoo9MN1Em4o4E4q5N2M6ypRPUJfUPhJ0-Nc_-KjvfqmU9BK6qkRydCFA8Y8eQp1dPlH6XiCA=w408-h306-k-no', '1a450424-d964-450b-9c38-1db5614c6e62', 10, ST_Point(20.921744, 52.323962)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #92: Toaleta publiczna (bezpłatna)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna (bezpłatna)', 'Modlińska 197, 00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Op_8obpruMrwHk0Y7DRXKg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=295.13474&pitch=0&thumbfov=100', '1a450424-d964-450b-9c38-1db5614c6e62', 10, ST_Point(20.970843, 52.321054)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #93: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Wyszogrodzka 4, 05-170 Zakroczym', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=l3lMJ4n53iDNu2g0KCtPWw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=164.85834&pitch=0&thumbfov=100', 'b19f9b75-ef2b-4c34-8496-720843fac7e3', 10, ST_Point(20.608373, 52.432245)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #94: WC (Szalet Miejski)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC (Szalet Miejski)', '100, Zakroczymska 36, 05-100 Nowy Dwór Mazowiecki', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqB5Rs_RtlAM45nrNs3xXdfgM8YawTXONqrenB4ClMIygdZ5fAlt_gzhSQiaLJITNVPerWMRMe2mr33atDh8_TgKpdQs1mnljAsHk-Gy8gd1_yUN9SUoPPAkxunOg-3LnyF2YyQ=w408-h306-k-no', 'b19f9b75-ef2b-4c34-8496-720843fac7e3', 9, ST_Point(20.709138, 52.431153)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #95: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Ojca Honorata Koźmińskiego 67, 05-170 Zakroczym', NULL, 'b19f9b75-ef2b-4c34-8496-720843fac7e3', 10, ST_Point(20.613949, 52.436784)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #96: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Ks. Kazimierza Konowrockiego, 05-230 Kobyłka', NULL, 'a469fd14-942b-4b58-8c75-7c95ef92ea9c', 1, ST_Point(21.197284, 52.338682)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #97: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '05-230 Kobyłka', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=30E6jcSha82wXjNofc2yAQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=236.9096&pitch=0&thumbfov=100', 'a469fd14-942b-4b58-8c75-7c95ef92ea9c', 1, ST_Point(21.196519, 52.338625)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #98: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Tadeusza Kościuszki 8a, 05-120 Legionowo', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=0IPPPgHvUqnWbFFJPP0CJw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=40.189465&pitch=0&thumbfov=100', 'c714cd00-7614-44f0-9de0-6b939bcbd537', 10, ST_Point(20.940885, 52.401314)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #99: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Zegrzyńska 115, 05-119 Legionowo', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WIyQtwleIFvUo2BaAd20Xw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=77.889656&pitch=0&thumbfov=100', 'c714cd00-7614-44f0-9de0-6b939bcbd537', 1, ST_Point(20.954925, 52.408959)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #100: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', '05-120 Legionowo', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqwHEZEaBWb3N4nyJbD8gqSs8z4RNjf1iukqq7gtAuUacvGVhjZdop34gB8V6XYj-I0XEe3WKtWsLj4l6YDCqmrScrYWQUqj226-__kJ6UwNyquySb7Qol3MUWQywhamOkOEmQuLw=w408-h306-k-no', 'c714cd00-7614-44f0-9de0-6b939bcbd537', 7, ST_Point(20.943425, 52.412776)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #101: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', 'Gdańska 05-120, 05-120 Legionowo', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=i5tIcTpVucuCcOsmmtJA8A&cb_client=search.gws-prod.gps&w=408&h=240&yaw=4.963238&pitch=0&thumbfov=100', 'c714cd00-7614-44f0-9de0-6b939bcbd537', 8, ST_Point(20.915091, 52.410842)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #102: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', 'Generała Józefa Sowińskiego 9, 05-120 Legionowo', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cb3obnjHA35BRSF7i1oCMA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=146.80948&pitch=0&thumbfov=100', '849d4c1d-7e45-4c89-822d-b83162963a8d', 8, ST_Point(20.931057, 52.394333)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #103: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', 'Długa 5-3, 05-126, 05-126 Michałów-Reginów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npuCUO984DRAJZwauD0aKERgHxTUFp-RnbITzcxyObn52G54lDz3J_0tHpgNFxTlw0q_ckjumil21teDKALdQp1yau5M60HgM1A3-8U6FEzZYlQQIVI7gdvsavr-CuKjuS9XItabA=w408-h306-k-no', '849d4c1d-7e45-4c89-822d-b83162963a8d', 9, ST_Point(20.976194, 52.429018)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #104: WC KING
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC KING', 'Kościelna 1, 05-126 Kąty Węgierskie', 'https://lh3.googleusercontent.com/p/AF1QipN8BPo1HLt9Fp_YgDiVbkpPR9rZQKXeUkBER4Sl=w666-h240-k-no', '849d4c1d-7e45-4c89-822d-b83162963a8d', 9, ST_Point(21.013032, 52.389302)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #105: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '05-126 Nieporęt', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqucYeaicbOA4A3TH-dTqrh03G0ZRIH8dxHxEyANpAVLWZJxEa7XRhiZEoJIpHvQq0hDHikeA-qhvAZAOdXwaGNEpcz0MY8iR9cPx6H5F_7uHkxbTkvJNfhwdgEYPrl8vgyV-R-=w426-h240-k-no', '849d4c1d-7e45-4c89-822d-b83162963a8d', 8, ST_Point(21.040441, 52.435496)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #106: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '05-126 Białobrzegi', NULL, '0a85ab12-2ab6-4b24-84b7-22e6a16d54e2', 10, ST_Point(21.043863, 52.437446)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #107: Bezpłatna pompa asenizacyjna Przepompownia do odbierania ścieków z jachtów
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Bezpłatna pompa asenizacyjna Przepompownia do odbierania ścieków z jachtów', 'Aleja Wojska Polskiego 3, 05-126 Białobrzegi', NULL, '0a85ab12-2ab6-4b24-84b7-22e6a16d54e2', 1, ST_Point(21.041092, 52.435277)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #108: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '05-126 Nieporęt', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqucYeaicbOA4A3TH-dTqrh03G0ZRIH8dxHxEyANpAVLWZJxEa7XRhiZEoJIpHvQq0hDHikeA-qhvAZAOdXwaGNEpcz0MY8iR9cPx6H5F_7uHkxbTkvJNfhwdgEYPrl8vgyV-R-=w426-h240-k-no', 'e2009973-332b-431d-a782-1469ecaa8e7c', 8, ST_Point(21.040441, 52.435496)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #109: Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety', 'Retmańska 2, 05-140 Serock', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=uvNlwz9zuQzqpq0xAp-QCA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=94.28142&pitch=0&thumbfov=100', 'ef2991bc-1640-439e-be89-d9a54c5e0d48', 1, ST_Point(21.076089, 52.515491)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #110: Szalet Miejski w Serocku
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Szalet Miejski w Serocku', 'Pułtuska 33, 05-140 Serock', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqUFwT2mn2MTd4Or0poDNU0loWgFvA6Js4salMwUNF2Ji3nauPE72iVLc9jMEvd_eJo97WdjpO-asCaeLHD2lIzIkCRw1uoQvwiSYNJhCpkBKHezooRxFAF4jiYyaf-PMmJAYfM6Q=w426-h240-k-no', 'ef2991bc-1640-439e-be89-d9a54c5e0d48', 6, ST_Point(21.068904, 52.514098)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #111: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Mochty-Smok 6, 05-170 Mochty-Smok', NULL, '530ec531-dfff-477b-9c25-8e5370eab2e5', 1, ST_Point(20.548791, 52.432708)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #112: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', '05-170 Smoszewo', NULL, '530ec531-dfff-477b-9c25-8e5370eab2e5', 10, ST_Point(20.504167, 52.428426)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #113: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Smoszewo 6, 05-170 Smoszewo', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=McfNjYDP6n3zCHRqAE5JBg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=121.12774&pitch=0&thumbfov=100', '530ec531-dfff-477b-9c25-8e5370eab2e5', 1, ST_Point(20.500909, 52.428538)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #114: Automatyczna toaleta publiczna (płatna)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Automatyczna toaleta publiczna (płatna)', 'Józefa Lewartowskiego 10, 00-169 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrE6EEWBN9JzU87jukZlO-1S7ceO9gJV80KV5PvCa9lDeXaOWNlvSmonM0ACqKPbWDmmokK88_AiACiY7Q4jikQa_pa5t6cSVrHg3CbI9-323GQodAMlTOEAclG1_a6w5gX37I-3g=w408-h544-k-no', 'ebb3213f-14d1-46de-8497-02b25af1c4ca', 10, ST_Point(20.993527, 52.25031)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #115: WC, toaleta, pisuar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC, toaleta, pisuar', 'Bolesława Prusa 61, Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjG-QUaIob59cePbgBjG64ajaLTrSiqrZhMF0WCKr50zUbGDI037YwTOJFPadXPJuC5KuNoavsnr1iIcc3aLXlYQYQkUw0OU3FBvhVLu44-D9F0RfHothOeiA7fyeL_jNW1hL-=w408-h544-k-no', '62fdda36-ac98-4863-9ac5-267d623f6449', 8, ST_Point(17.056272, 51.119634)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #116: Toalety Podziemne
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety Podziemne', 'Plac Solny, 50-079 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr54dELQ2g8AXhto7kO5Ih9TSMo1QllPUFFykgKofSXFazIMXzT_FF7Et9OcjANYevvcyaE7tHWgUOj0c9zVMR3bE3Xn0S8hZJPyLRGGy5r1XlGFU2WuIrABoM2Yt-l2fSB9OFa8Q=w408-h544-k-no', '62fdda36-ac98-4863-9ac5-267d623f6449', 6, ST_Point(17.029135, 51.109689)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #117: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', '05-180 Janowo', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=0B7baM7NO1bmF1hw-AgprQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=155.2083&pitch=0&thumbfov=100', 'ea97f692-83c9-4d70-b1b7-5fc56fab6593', 10, ST_Point(20.625682, 52.489863)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #118: Publiczna toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Publiczna toaleta', 'Zygmunta Modzelewskiego 83, 02-679 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=oKLaLGf5V91m7RPA7q3RDA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=109.040825&pitch=0&thumbfov=100', 'd9e122fe-6b76-4fe9-bf49-0c851113e32a', 10, ST_Point(21.013744, 52.193543)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #119: Wc
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Wc', 'Legionów 21, 05-200 Wołomin', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WaZrQIWnpOXqS7GxPzyqWg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=93.217705&pitch=0&thumbfov=100', 'e9d13949-bfc1-45c7-b3fb-5d51c88a02e5', 1, ST_Point(21.24253, 52.344091)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #120: Toaleta publiczna Tłuszcz-Dworzec kolejowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna Tłuszcz-Dworzec kolejowy', 'Warszawska 4, 05-240 Tłuszcz', NULL, '90387d54-df73-438d-ab42-be6c35984930', 2, ST_Point(21.435731, 52.430621)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #121: Toaleta płatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta płatna', 'Stanisława Augusta Poniatowskiego 14, 05-280 Jadów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqv2ADulAWVSPcA6IFH6Xi8Ew7EKM0jfWjHYJVg_b1KaBvtTXjDGy8uvtu5h_DnIWD53cdg3q_jYmd_jezcVi9jlcL6uB2oz_dc4xCqklkNWOkOJvDitJhDRMhXoZUjcS-EB5wu=w408-h306-k-no', '9c65f017-cee8-435d-a396-29a68003d22e', 6, ST_Point(21.634318, 52.478259)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #122: Toaleta WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta WC', 'Międzynarodowa, 03-922 Warszawa', NULL, '9c65f017-cee8-435d-a396-29a68003d22e', 1, ST_Point(21.063375, 52.238023)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #123: Toi toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi toi', 'Międzynarodowa 2, 03-922 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npd2NjsWLJN44aTtneRmzP83nnwkibwqCvpYAE45hUGhuvsT608FFguopHCaI-PxIYNSL3q2lwJYZIiReLPaESch2Vuq-iSm7GY5D43yoqwXDhziLLlJyXBoCHP8UTEFTgYZWVwqrUHJDDY=w408-h541-k-no', '9c65f017-cee8-435d-a396-29a68003d22e', 1, ST_Point(21.057599, 52.244003)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #124: WC (Castorama)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC (Castorama)', 'Głębocka 15a, 03-287 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npjrmEbolvM7KhahyImeXSnU9z41MIEph0BzMsANb27IFnwD-_rrAbIFcq1B1r6-lQYkBTHP0Cc34tjZdgQY8KgRd7Et1I4EeXHzVtg5WrHjwtq3fsnZY0FD1o_P4toWuCQykARAQ=w408-h544-k-no', '9c65f017-cee8-435d-a396-29a68003d22e', 10, ST_Point(21.054724, 52.30319)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #125: Female Bathroom
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Female Bathroom', 'Głębocka 15, 03-287 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wegxKHR2dee2y7SlQtF6Cg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=16.52794&pitch=0&thumbfov=100', '9c65f017-cee8-435d-a396-29a68003d22e', 1, ST_Point(21.057295, 52.302371)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #126: Female Bathroom
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Female Bathroom', 'Głębocka 15, 03-287 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2n6-alJBoLPLNsNIXrCZQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=14.438052&pitch=0&thumbfov=100', '9c65f017-cee8-435d-a396-29a68003d22e', 1, ST_Point(21.058025, 52.302257)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #127: Toaleta publiczna Płatna (2 zł)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna Płatna (2 zł)', 'Praga, 01-001 Warszawa', NULL, '9c65f017-cee8-435d-a396-29a68003d22e', 4, ST_Point(21.033895, 52.289995)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #128: Bezpłatna toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Bezpłatna toaleta publiczna', 'plac Piotra Szembeka 2, 04-142 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrsKbz4GIkFkKh_BYUdU7t-YZ0fNea2odQEVYiHcYiL79IUUfncx8YMcGoDNGahnT7vEFT5geLm25hi9ZHzkOXHgXgKWm_1KO4RU3j7qcFPivGqQhV27kJkUfILblZ-7wG8YTE=w408-h881-k-no', '9c65f017-cee8-435d-a396-29a68003d22e', 10, ST_Point(21.102645, 52.242816)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #129: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Grzegorza Przemyka 5, 03-982 Warszawa', NULL, '9c65f017-cee8-435d-a396-29a68003d22e', 1, ST_Point(21.081243, 52.22945)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #130: Hurtownia skarpetek
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Hurtownia skarpetek', 'Stanisława Moniuszki 5, 05-220 Zielonka', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrHCfzpe4fgKpZrpKxRxCO_PHxNHf8wcy9Rwz40-ngfnwj6uR5Dyv-ieiBoY6HvQ39kLOdIiMwZqBd6wiZesZm6ZgDmgAYw0giooaygIPPoehG6uYtmoIF_1BwguKgb48krJ4Vnlw=w408-h541-k-no', '9c65f017-cee8-435d-a396-29a68003d22e', 9, ST_Point(21.15199, 52.306659)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #131: TOI TOI
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'TOI TOI', 'aleja Zieleniecka 2, Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noczyfMWnWRAySB55wSxgEPY3cbVCm-B1FuMTYeLCbNCRibXiOLvmUczm8ILi0HferXSuFJ5U96yf-M2yZ_V7_1Inb-nP-MPmj3yIkGFmNw6af7Bbf69Ufdn61lyvdSyV7kSC6T2ho0yZH3=w408-h885-k-no', '9c65f017-cee8-435d-a396-29a68003d22e', 10, ST_Point(21.057171, 52.240465)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #132: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Park Nad Balatonem, Jana Nowaka-Jeziorańskiego, 03-982 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wIif6R8bhRY6GCoup0ywNw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=187.5721&pitch=0&thumbfov=100', '9c65f017-cee8-435d-a396-29a68003d22e', 10, ST_Point(21.088327, 52.229797)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #133: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Rembielińska 20, 03-352 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=a8MUXDmzfSVa5tZVYC7GJA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=146.90485&pitch=0&thumbfov=100', '9c65f017-cee8-435d-a396-29a68003d22e', 1, ST_Point(21.030168, 52.290069)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #134: Male Bathroom
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Male Bathroom', 'Głębocka 15, 03-287 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nDXop3qVIqj4bBubmBijkw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=10.774489&pitch=0&thumbfov=100', '9c65f017-cee8-435d-a396-29a68003d22e', 1, ST_Point(21.056983, 52.302408)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #135: Toaleta kompostownika 3
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta kompostownika 3', 'Gimnazjum nr 2 Miejskie, Budowlana 26, 05-300 Mińsk Mazowiecki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-t6OkB0Lp9jfUSF-nyfZWg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=50.149895&pitch=0&thumbfov=100', '57740b0d-7989-4fb2-bfed-c773d749ee9f', 10, ST_Point(21.572856, 52.184594)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #136: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Nadrzeczna 4, 05-300, 05-300 Mińsk Mazowiecki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=q86s5r3pT5if-rnGFO3MIA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=320.27994&pitch=0&thumbfov=100', '57740b0d-7989-4fb2-bfed-c773d749ee9f', 1, ST_Point(21.570046, 52.178933)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #137: Toaleta publiczna Tłuszcz-Dworzec kolejowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna Tłuszcz-Dworzec kolejowy', 'Warszawska 4, 05-240 Tłuszcz', NULL, 'baa7cce2-e4aa-46f6-b73e-af197e45f1df', 2, ST_Point(21.435731, 52.430621)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #138: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Park Eleonory Czartoryskiej, 11 Listopada, 05-250 Radzymin', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqBSLDkh7MwDwKRi-5WgRPM4O0WWb2zTkM8YnXIlcigoeWrD3sTVljfrjSsnXqiJwl0xOcejoCSExGsaG7ONt9IUU-GKWuMyHmBJNwVuOh6m5wCrxsQj7YOb8znB4WHtXxHPHmH=w533-h240-k-no', '4c55e78f-f3df-4cd4-9bd9-cdfe5fd46dd5', 5, ST_Point(21.181677, 52.413613)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #139: 05-252 Stanisławów
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', '05-252 Stanisławów', '05-252 Stanisławów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noLc5lcX9O8stNe6j24sAYBpOaSvLf24NNS7pvpM1ukp8SuO4ROtDIK0eMduypXg4jCebmUnwo2SdzW0t9pPSSYjsxThoMr-rPk1fKQNbBwETEhz72yeMA4GJmORAe-YNFRIrk=w426-h240-k-no', 'eb0d6392-e8ea-46c3-9328-c316a2f3e708', 1, ST_Point(21.299169, 52.484534)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #140: 05-254 Kuligów
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', '05-254 Kuligów', '05-254 Kuligów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npOGgbq-T7rDM5xhPeZlhjLgWLEXyCEU8jOvjt9lxgH-izpJLVo35L0mlyl35ymujGJo5iWnDQWzubwl7Tb50t7I5RMXiBXMQ-vWxG-xFtXfqh10xBFe6bkJiL97T3q15WqaztfkA=w408-h306-k-no', 'e3e3cc4a-20e5-4133-a482-373e905b0d62', 1, ST_Point(21.20714, 52.501822)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #141: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Park Eleonory Czartoryskiej, 11 Listopada, 05-250 Radzymin', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqBSLDkh7MwDwKRi-5WgRPM4O0WWb2zTkM8YnXIlcigoeWrD3sTVljfrjSsnXqiJwl0xOcejoCSExGsaG7ONt9IUU-GKWuMyHmBJNwVuOh6m5wCrxsQj7YOb8znB4WHtXxHPHmH=w533-h240-k-no', '6a1ea824-848a-487b-9bb3-4478a680d6c9', 5, ST_Point(21.181677, 52.413613)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #142: Toaleta publiczna (bezpłatna)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna (bezpłatna)', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Nlt_bjVKlZfAzu-wesd5gA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=304.6072&pitch=0&thumbfov=100', '0d93fca9-ae3b-4cc7-a6d4-f8ae9aefc06c', 2, ST_Point(21.049472, 52.291471)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #143: Male Bathroom
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Male Bathroom', 'Głębocka 15, 03-287 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2n6-alJBoLPLNsNIXrCZQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=34.433987&pitch=0&thumbfov=100', '0d93fca9-ae3b-4cc7-a6d4-f8ae9aefc06c', 1, ST_Point(21.058252, 52.302231)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #144: Automatyczna Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Automatyczna Toaleta Publiczna', 'Solec, 03-901 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Pr8PgegTncx2ULZ8uM6P2A&cb_client=search.gws-prod.gps&w=408&h=240&yaw=112.37773&pitch=0&thumbfov=100', '0d93fca9-ae3b-4cc7-a6d4-f8ae9aefc06c', 6, ST_Point(21.040519, 52.232542)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #145: Toaleta publiczna płatny (2zl)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna płatny (2zl)', 'Samarytanka, 01-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npDOggblt6OzZ_9ZUgAhYX0Cbc_K6hU1ighO28Vc9Z6bquZYj90BfB3IOyOnvbg-6Bo8iCgujlrOzLxrUWZ99jPbRPQV5vHsKQHVNhiYQ-4Fj1iaiHU82EOdiTwGWYL2n33FNuC=w408-h544-k-no', '0d93fca9-ae3b-4cc7-a6d4-f8ae9aefc06c', 7, ST_Point(21.051774, 52.279334)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #146: Toaleta płatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta płatna', 'Stanisława Augusta Poniatowskiego 14, 05-280 Jadów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqv2ADulAWVSPcA6IFH6Xi8Ew7EKM0jfWjHYJVg_b1KaBvtTXjDGy8uvtu5h_DnIWD53cdg3q_jYmd_jezcVi9jlcL6uB2oz_dc4xCqklkNWOkOJvDitJhDRMhXoZUjcS-EB5wu=w408-h306-k-no', '0b6ba721-d890-445e-9940-18ce47f617e0', 6, ST_Point(21.634318, 52.478259)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #147: Kibelek przykościelny
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Kibelek przykościelny', '05-280 Sulejów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nof-ATcbLeNg1ISrtAtFKWZ3efohHUi9HVmVhHj6dtxAZAzE7_mEZ9cETnpDcGATLNDmGf4aEGXnr-I0iPSfPt7HIGQyHDaoqZQfYO6VC7Qd0wnBB3S1e37ctGT_U7JCcblX8o=w408-h544-k-no', '91f7e155-3b4c-47ac-97e4-775c8c052fd3', 8, ST_Point(21.562194, 52.44015)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #148: Toaleta na Dworcu
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta na Dworcu', 'Marszałka Józefa Piłsudskiego 105, 50-001 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr1_oUOmN3l4SmbGpNIyKzmqrDI7kkJf7eVtDBeds_CkDBl3_JWxQuGk06OP8D6IMN-bLSSToHaAogEvkKN-QhFIm09XNOtgx16nApj4jEV_U3Ro-_SPKYSuSqcFAWyFz9jDWKbkQ=w408-h544-k-no', '91f7e155-3b4c-47ac-97e4-775c8c052fd3', 3, ST_Point(17.036646, 51.098984)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #149: WC LEJEK
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC LEJEK', 'Żelechowska 7A, 96-321 Siestrzeń', 'https://lh3.googleusercontent.com/p/AF1QipPqkyPl-9EiueRwSj19ozm2pxfEe9QfwBJH_3s_=w408-h307-k-no', '91f7e155-3b4c-47ac-97e4-775c8c052fd3', 9, ST_Point(20.722237, 52.048812)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #150: Wc
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Wc', 'Konstytucji 3 Maja 2, 05-300 Mińsk Mazowiecki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=P-3AxMpXBVvGmjobzUYwrA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=193.82898&pitch=0&thumbfov=100', '17fe7bc5-0754-491d-acb5-fe5f18ce00c5', 5, ST_Point(21.558764, 52.180994)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #151: Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety', 'MOP Moczydła, Moczydła 80, 05-306', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqXVG3NpnTu1SQjJ0fjNjU7I3n1tyEZUhTUvguUGrMmmANYAUyDD7pz8mTDDd5Hn0WlI9lVfmM8dneUHfYgyNFsVSrZDAfcaMfVIvKl0QMADeBiYdsvaFE8KRuNI53463YFIQKpYg=w408-h306-k-no', '331bb557-255b-414a-97c8-c2b010600f91', 4, ST_Point(21.71818, 52.204081)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #152: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Wczasowa 1, 05-540 Zalesie Górne', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vT2rhcusf7A55pODn94oxg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=24.760038&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 1, ST_Point(21.043048, 52.028681)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #153: WC Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Toaleta', '00-001 Warszawa', NULL, '41698b0a-45ff-45bf-884f-710802efa9e2', 1, ST_Point(21.043631, 52.128892)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #154: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Okulickiego 10, 05-500 Piaseczno', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=OfUYT56i_cT3spkIOmJT6A&cb_client=search.gws-prod.gps&w=408&h=240&yaw=91.113594&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 1, ST_Point(21.027423, 52.081424)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #155: Toaleta Publiczna (bezpłatna)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna (bezpłatna)', 'Franciszka Klimczaka 2, 00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=DY42sw2ocPRYw7nIp98LKw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=357.7395&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 10, ST_Point(21.082442, 52.164555)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #156: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Bielawska 9, 05-520 Konstancin-Jeziorna', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nou19z8QJmqyyy7EcU1ZSHe0rkWoYxWk8zqrk5k3A2hl3TTeZ288QpmGEXBs5rAN0841gfquOLrxQJb_9M5qIMCt9EkPJiQAAtfCbwEXpNASkQNT2aIGf6BUZs0OEoR7vQN7JBm=w408-h544-k-no', '41698b0a-45ff-45bf-884f-710802efa9e2', 8, ST_Point(21.119041, 52.094411)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #157: Toaleta publiczna w Parku Zdrojowym
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna w Parku Zdrojowym', '05-510 Konstancin-Jeziorna', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npNsSfUSOeDQbeNafIynykoDP4jlTaypXkNrMCCgOasqornNr_mXarI2YSSk5sSK-qVGZ6K6B4-JNogEf9K-Vb6bRth719HRNkw0p42n08D7bKk58J9b0s_IK75sav6gUd7JaJvAg=w408-h306-k-no', '41698b0a-45ff-45bf-884f-710802efa9e2', 9, ST_Point(21.111937, 52.085482)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #158: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Karczunkowska 145, 02-871 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=n4VN7Vp5XcfF6Mt1f2zG4Q&cb_client=search.gws-prod.gps&w=408&h=240&yaw=189.53804&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 1, ST_Point(20.993724, 52.109789)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #159: Toilet
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toilet', '02-958 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xHLtGk8adgbmyi1jNA3dBQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=243.9053&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 2, ST_Point(21.085223, 52.166983)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #160: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=VsOtxyUeW_b-QKFqYaOlyQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=176.29729&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 10, ST_Point(21.103426, 52.120748)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #161: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Park Kultury w Powsinie, Maślaków 1, 02-973 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npp6Uq8CIlHADThVcyDd0GYthlavLKssga4MKQ8_lViuqhJGAPUsx8t8OD_-5Dqk3KT0UCgsOsoNmnDYad6H9dd1HOfeSSxdr4_8OCBX3InT0OzEX-AEcjJhLXuNAnFIQMtSZEVaw=w408-h306-k-no', '41698b0a-45ff-45bf-884f-710802efa9e2', 7, ST_Point(21.090737, 52.116478)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #162: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Warszawska 4, 05-510 Konstancin-Jeziorna', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TLkZtL64_vAE5G91rhQ6vw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=40.495735&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 1, ST_Point(21.119411, 52.092195)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #163: Toi toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi toi', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pMZdyYQFotzPQCA5DwkqBQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=247.91904&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 10, ST_Point(21.10474, 52.128295)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #164: Magazyn PandaBuy Poland
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Magazyn PandaBuy Poland', 'Kusocińskiego 6, 05-500 Piaseczno', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-4EOveDJFkhDk5fS4fsNWA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=316.65335&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 9, ST_Point(21.021191, 52.079363)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #165: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '00-001 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=NFFlMKJiN3e7MxRJqciynw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=182.12122&pitch=0&thumbfov=100', '41698b0a-45ff-45bf-884f-710802efa9e2', 6, ST_Point(21.059557, 52.132894)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #166: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Unnamed Road, 00-001 Warszawa', 'https://lh3.googleusercontent.com/p/AF1QipMLXjRuykSGgup_FDeo0romJeoibQl8iIpLZ9s5=w408-h544-k-no', '41698b0a-45ff-45bf-884f-710802efa9e2', 5, ST_Point(21.08902, 52.11628)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #167: Toaleta Płatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Płatna', '26-315 Poświętne', NULL, '7a1b0738-80f9-4872-bbbf-c519c7f221d7', 1, ST_Point(20.365238, 51.530819)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #168: Toaleta Miejska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Miejska', '08-530 Dęblin', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrMUfMl-6_ekBIvnCsUm3j3kwrAx1L8F4eyvo-PLKflhqXnXOlYIxOpUGH1BfzZrQQYeHhAIrriN0Mvp-FAvD0qLVE70Q7QNHSevz3kv885B-G_liuEo2iqvSOsJEkyixt0lVa7hg=w408-h544-k-no', '6740edc3-1a39-4ffb-9315-4bbe3682c333', 10, ST_Point(21.865478, 51.563025)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #169: Toaleta Wc
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Wc', 'DW805 79, 08-440 Lipówki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TIAjYZjIrMiuXAbAf65U5g&cb_client=search.gws-prod.gps&w=408&h=240&yaw=9.890228&pitch=0&thumbfov=100', '29a13405-69e2-428a-8590-dc3b3cdea762', 1, ST_Point(21.569157, 51.957221)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #170: WCExpress.pl | Najlepsza porównywarka ofert na wynajem toalet przenośnych. Zamawiaj online 24/7
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WCExpress.pl | Najlepsza porównywarka ofert na wynajem toalet przenośnych. Zamawiaj online 24/7', 'Wiewiórki 11, 05-506 Lesznowola', 'https://lh3.googleusercontent.com/p/AF1QipMUqtvHGvmpHS_yhIXHgelqQyq21_XWpxScBZ43=w408-h304-k-no', 'd0465430-3902-49cd-b504-b459871282f6', 10, ST_Point(20.952474, 52.081992)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #171: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '05-420 Otwock', NULL, 'c1fbbc3e-4b5a-4f7c-bfb2-d706dd0e7f64', 8, ST_Point(21.237336, 52.124055)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #172: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Łukiska 29, 04-123 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rMeJDPo0W8NFN5QacQRHgA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=279.5524&pitch=0&thumbfov=100', 'cf754f8e-a066-4f9d-89b1-757736c60d50', 1, ST_Point(21.096869, 52.23758)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #173: Toaleta Wc
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Wc', 'DW805 79, 08-440 Lipówki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TIAjYZjIrMiuXAbAf65U5g&cb_client=search.gws-prod.gps&w=408&h=240&yaw=9.890228&pitch=0&thumbfov=100', 'c4e57369-8db3-48e8-9906-4a06d23c6627', 1, ST_Point(21.569157, 51.957221)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #174: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Sierakowskiego, 05-509 Piaseczno', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nplvMUt9Jyo4fWgh46A8KgrGNws0-XoI34D-x-Hz-olLHJtNL_qfBNqPIVVYKTcMLQUgbgPzjIzr0jEKQTaB8kSBb1fWQyLMGo-zzGi9C2euFIOOKve6W1rH8lCe63lFA696-ying=w408-h306-k-no', 'f77f7679-e065-45ce-b616-8ed3862c3760', 7, ST_Point(21.02855, 52.07417)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #175: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', '05-077 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rfcz9DYF9Qer3fJcaAICCQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=112.04782&pitch=0&thumbfov=100', '04b3d052-b9e2-458b-9197-3978ab0d62f5', 8, ST_Point(21.18881, 52.149922)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #176: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', 'Bronisława Czecha 8147, 04-555 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vEhW4yusqQx84dJe52la3g&cb_client=search.gws-prod.gps&w=408&h=240&yaw=350.32184&pitch=0&thumbfov=100', '04b3d052-b9e2-458b-9197-3978ab0d62f5', 1, ST_Point(21.180851, 52.22584)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #177: WC Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Toi Toi', 'Dominikańska 15, 05-530 Góra Kalwaria', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ISqbhZ2W9-lu8HXEXxONCg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=81.7767&pitch=0&thumbfov=100', 'abb56c16-2949-403d-a16e-0ca7e875f847', 1, ST_Point(21.216022, 51.977865)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #178: WC (Płatne) 1zł
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC (Płatne) 1zł', 'ks. Z. Sajny 0, 05-530 Góra Kalwaria', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PxmaTk_11v9feuP7NP0Iag&cb_client=search.gws-prod.gps&w=408&h=240&yaw=80.610466&pitch=0&thumbfov=100', 'abb56c16-2949-403d-a16e-0ca7e875f847', 10, ST_Point(21.221335, 51.979508)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #179: Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety', 'Łubińska 69, 05-532 Baniocha', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrnvdUZDlF7VMm99ISnpyINo7W0D50GWtbLx3S5CXJR18pyuTwfJKpB9jG1W1Hme7jpgxISxEVw9p4fH_eCzsdGlGTCsnGYVsABpbT_qXExeAh9n4PK2nUwByG00tfeEK5lo_nI=w408-h725-k-no', 'abb56c16-2949-403d-a16e-0ca7e875f847', 8, ST_Point(21.121469, 52.026851)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #180: Toaleta publiczna na basenie miejskim
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna na basenie miejskim', 'Pijarska 119, 05-530 Góra Kalwaria', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gpELIWBxBJDW5qvVXF-lzw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=209.40541&pitch=0&thumbfov=100', 'abb56c16-2949-403d-a16e-0ca7e875f847', 1, ST_Point(21.199884, 51.988401)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #181: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '3 Maja 10, 05-530 Góra Kalwaria', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lrxFgW5yErKmaaLSwmbtcA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=206.95656&pitch=0&thumbfov=100', 'abb56c16-2949-403d-a16e-0ca7e875f847', 1, ST_Point(21.218087, 51.981606)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #182: Publiczne Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Publiczne Toalety', 'plac Wolności 1, 05-600 Grójec', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CGg24G_KAEsY1PwOjx0juQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=252.82777&pitch=0&thumbfov=100', '0e9d42fd-c92f-45c5-9f25-04e2e9d55a9e', 6, ST_Point(20.866097, 51.865819)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #183: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '58-260 Bielawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YQi0_ocP4aV0DzvDGjaiCA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=153.91293&pitch=0&thumbfov=100', 'e8192609-8462-48ef-ae04-91409b8c74a6', 4, ST_Point(16.611495, 50.684926)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #184: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '58-260 Bielawa', NULL, 'e8192609-8462-48ef-ae04-91409b8c74a6', 10, ST_Point(16.589378, 50.679688)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #185: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Wojska Polskiego 39C, 58-260 Bielawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no5U9QgbQuAaQ8mSnXH43rgjovvXSi7FwSvrZMNpDBrAZhVUBrexMLBHaNicBCPGJUoO4MbaxHsXTJbKgIutLahQ_sI7wxvdoeoZNw7jYfmwi9fKSq16rhqQbOaiR4RFlCfvu9MlCGzGWtf=w408-h544-k-no', 'e8192609-8462-48ef-ae04-91409b8c74a6', 1, ST_Point(16.634616, 50.682973)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #186: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Wojska Polskiego, 58-260 Bielawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6LfW2H5NURs53e1Qu6-1Bg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=272.9028&pitch=0&thumbfov=100', 'e8192609-8462-48ef-ae04-91409b8c74a6', 8, ST_Point(16.628088, 50.686457)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #187: Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety', '58-260 Bielawa', NULL, 'e8192609-8462-48ef-ae04-91409b8c74a6', 1, ST_Point(16.589643, 50.681056)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #188: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Wojska Polskiego 39b, 58-260 Bielawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Lhz1Qh78D5L1MvMWsrbEJg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=70.57399&pitch=0&thumbfov=100', 'e8192609-8462-48ef-ae04-91409b8c74a6', 2, ST_Point(16.633909, 50.681236)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #189: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Skowronki 26, 05-622 Skowronki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vvVhxCmonoX1eBm2_sunyg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=299.2135&pitch=0&thumbfov=100', '5bd76395-762c-4f3c-a2b0-2d898e12811c', 1, ST_Point(20.786906, 51.797441)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #190: Publiczne Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Publiczne Toalety', 'plac Wolności 1, 05-600 Grójec', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CGg24G_KAEsY1PwOjx0juQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=252.82777&pitch=0&thumbfov=100', '92192b9e-351f-4731-8818-6d4d06d678f2', 6, ST_Point(20.866097, 51.865819)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #191: Toaleta WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta WC', '05-800 Piastów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq-OFPV-N6vOk1RUwfjDE7ZxCp5QbiwWzeYD_FKaj1tFn9sjOJ5gtWf45NXdRok6dtAwaziJQIXgJpfu-YaHlrTP3N411dVcrHnA4hLhWDLLWOh05rZpxqrZf5GdgRYxQsvPQuW=w408-h544-k-no', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 3, ST_Point(20.842155, 52.182109)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #192: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Stefana Jaronia Kowalskiego 31, 05-800 Pruszków', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=eqgJSzBkNKXUrARbjn5asA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=306.02206&pitch=0&thumbfov=100', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 8, ST_Point(20.799909, 52.182864)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #193: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'A2, 05-840', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrzUSBxXLjln4e34XQax6ugcvsdWfR72v6D7PiVYReXrxTPQwj8yJCXvgpqVLYWCOuoUGkW2M2FEdkfZGP3ghpUUnIUUo4z4MGWyW5jFH2BPzUJpgRI_kbAzKGyuoGMM7kzaDdz=w426-h240-k-no', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 7, ST_Point(20.687235, 52.154235)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #194: Toaleta Publiczna Bezpłatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna Bezpłatna', '05-800 Pruszków', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no87QfPcx-gfrYg2Pjs_ZIVcRLj56PiLTp5hC3xxL89MkTQQip_hQ1ZeSCd7v2F4K6msAul53GdHEasAHBjbFuagMrTK1Ipzs3FAIYZMQ6f0b-zvc9rBNVnZzrj2SYV9fSRgI3S=w408-h560-k-no', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 4, ST_Point(20.817124, 52.164479)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #195: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Malwy, 05-800 Pruszków', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gt4jU2UcMxB32DKYVH6XQA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=12.467407&pitch=0&thumbfov=100', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 1, ST_Point(20.78569, 52.176389)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #196: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Kotowice 17, 05-840 Kotowice', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrxXKIuajWAXiZd-Nt9etj8mo_Sthw4Oqj7ZDp0HWjWRUcBzzdWDIp7bNl5axX_Pa9yZJYg5-HAzgKdo3EaLLi1dMF7BlFQYUoJtqyGDePReZXPICXAijzYzb-X_ofGe_7-xlJ_HA=w408-h306-k-no', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 4, ST_Point(20.684502, 52.155889)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #197: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'al. Krakowska 26, 05-820 Piastów', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2EjvAuMI5gno3dlzyemfTg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=82.60534&pitch=0&thumbfov=100', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 9, ST_Point(20.844913, 52.189366)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #198: Przewijak plenerowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Przewijak plenerowy', 'Fryderyka Chopina 25, 05-800 Pruszków', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7GoF54Cv5COps0wa4qk4_yGTWHYMRimNQ2Oh4CVH_K6H3FVnrbF78DMo0izu2zELuTLKzpYf0vOHDj2ZVT5CkYb9dDATjxkLNfniK4-64315tk2VsoFknWtgeBg2x66q2QnU_Ag=w408-h544-k-no', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 1, ST_Point(20.800232, 52.164535)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #199: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Henryka Sienkiewicza 2K, 05-800 Pruszków', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nprchLMB4ehRiAkqV7gbWnYNhQp_IuYyA_r9e6UXeigE7yvSWmMNih2wszlkWjluT0Gy_nuO450N8BQoTmccQdeStOcChruTRsQ1jKczKZXueP4PtvzdZnYWZHMs_RT0pfsLDoleQ=w408-h401-k-no', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 1, ST_Point(20.797607, 52.167565)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #200: Toalet płatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalet płatna', '05-800 Pruszków', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=e2Q6S7Nt6daSPx6zf6Wp2A&cb_client=search.gws-prod.gps&w=408&h=240&yaw=77.48537&pitch=0&thumbfov=100', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 1, ST_Point(20.799788, 52.163778)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #201: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', 'Marszałka Józefa Piłsudskiego 30, 05-822 Milanówek', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hOLAENRKscpKPiWPS95RAw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=70.694374&pitch=0&thumbfov=100', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 4, ST_Point(20.666385, 52.12383)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #202: Toaleta publiczna w Eko Parku
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna w Eko Parku', 'Wolności 19, 02-496 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=BSyPQs55MLXd-DdN7lWQAA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=117.83367&pitch=0&thumbfov=100', 'f444d944-25db-4fb8-a529-1af6ec6b8c60', 10, ST_Point(20.870955, 52.202208)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #203: toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'toaleta', 'Park im. Adama Mickiewicza, Zgierska 139A, 91-488 Łódź', NULL, '8dd274da-65ae-4cec-99f7-095da5422534', 10, ST_Point(19.443076, 51.805169)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #204: Toalety
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety', 'Międzychodzka 22, 62-045 Pniewy', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Hg43rzpdwD6fGD5wJix7EQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=11.738305&pitch=0&thumbfov=100', '8dd274da-65ae-4cec-99f7-095da5422534', 1, ST_Point(16.25572, 52.511695)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #205: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', '90-001 Łódź', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrnW-JZjSkw78d64BY7ySiy1MXPWrBgYjlVe6j2pVKcBy93pFaeP2XeidlVY8X6BGW9aQPFE6Qo8ImtLcM8QlTb2GDwuNsyGUn2SKBcGN7i_bQM2UZGZrjcsER1f0_PvQ05yCg=w408-h725-k-no', '8dd274da-65ae-4cec-99f7-095da5422534', 5, ST_Point(19.487175, 51.790431)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #206: Toaleta przy przystanku
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta przy przystanku', '05-620 Błędów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noeTps2XBhQJN0SxT9yR7ciNYXPTSozOrGIQrMElPreQolUMCKLCoaTw3aGU2vsfsVWAy4q7Z73YspdbDx0PJOGd0yJY0ooYEmbNXS_FZlgb_TEI5jSp_AQtCkgm4V0MQuO0r6RP4NzfOLH=w408-h544-k-no', '87120190-cea2-4576-89c4-cc1641575a9e', 1, ST_Point(20.696731, 51.777225)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #207: WC szalet miejski
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC szalet miejski', 'Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqwa9pdxtYZqojeuvRV3cp5p51MoRC44qP1IuoHyHpvB1i80b7uLBq-rkGc3q6qGRY-tbw0a2KgHkL4B4uiBOXEdPwhh_hqbjrIHlmlVwDfyFfa4QRwGNyx_JQZ49CZSszULLw=w426-h240-k-no', '87120190-cea2-4576-89c4-cc1641575a9e', 10, ST_Point(20.990154, 52.280426)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #208: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Promyka 7, 05-830 Urzut', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npvTa2nHyEzngfIoJ4lOv8F_-IX1MEbnkapP_r3MOzSE0JQZU6fvolbrHVP9OzywuoDN23PBRLITrQjo4vl1y4Xi4MLLDnXtP3kKQPqh0p21kIXjRj52iTSXDnmWnTrv4R6bOhv=w408-h240-k-no-pi-0-ya20-ro-0-fo100', '552bc98b-8edb-482e-981a-7bdbedaf1134', 4, ST_Point(20.746891, 52.066122)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #209: WC Tron - toalety przenośne
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Tron - toalety przenośne', 'Wybrzeże Juliusza Słowackiego 9, 50-406 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipMukbHthnHMkQiqfYcOZjMXGLKuPEDnBCS36a9B=w408-h305-k-no', '5593ef60-9372-4004-aa1f-388088909a69', 9, ST_Point(17.052047, 51.107807)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #210: Toalety i Prysznice
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety i Prysznice', 'Toalety i Prysznice', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npdJUhk4ARQ9pgZjTNerNKGRkDYJHo4JlBX5nhnEaCT4e4E3Andd7y6YWUWY54DUKefEY26jVKAwSmSFF7uHJNIjRguNQZeILIrJGJDD21Ea5gNWM4rvz3j6umpxsdJeAoK1tlEAJ4VLTc=w408-h306-k-no', 'be486190-a82c-486c-8ed0-28adbcdcfe08', 9, ST_Point(18.23949, 51.311559)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #211: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '98-360', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npKHJ9iPX5NJAVGZNfg14oefUcjb-xJlyMo--HXNn5H2FPrgiI0V-CuEAzWQIq1mFPAhcQjJsOCly6dF8J3gzDHLLljOET0ggLzfHvHzwiwy9oUyOSmGwRCdGL6U-uyShgC1fmU=w408-h306-k-no', 'be486190-a82c-486c-8ed0-28adbcdcfe08', 9, ST_Point(18.522707, 51.357905)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #212: Toaleta publiczna im Piniaków rodaków
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna im Piniaków rodaków', 'Piniowa 3, 05-830 Stara Wieś', NULL, '28d56b09-d2bb-4dcc-80e3-ed5f0d28a76f', 4, ST_Point(20.757081, 52.080522)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #213: Toaleta miejska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta miejska', 'Słowicza 3, 05-807 Podkowa Leśna', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr5VmRaQIbxMafIWMB7nl8L6scN-XFdlFCI-3bxZwDhbnidlCCrycMoSGSP3-tGlhbui78hYYJ6NpdOt59ukzwHei1k2Z2PvlNUn2eebGXOloGczgz5ICsg9vXQeke5UEDUfB6bSQ=w408-h272-k-no', '658bb727-e77f-4aaa-b2f2-e425b597ebdd', 3, ST_Point(20.724089, 52.122735)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #214: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Elizy Orzeszkowej 5, 05-827 Grodzisk Mazowiecki', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr96VNwt9GwNDhs01r7e6P9T0HrOGqrhpGP56hklqKAuCAALMkovg_a8d5lwTHc9Cojz_5cezQJf60kUNqzZ_AKQimGSjnzNDZC6ctX_VYhRJNqMJPWH7CyPOc1TPRCtUp0lcYJ=w408-h544-k-no', '658bb727-e77f-4aaa-b2f2-e425b597ebdd', 9, ST_Point(20.6394, 52.109327)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #215: Toaleta publiczna (WC - bezpłatna)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna (WC - bezpłatna)', '05-870 Błonie', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqHE1XPXp0dUNQlQDcmZKAN9CRmwalX_-SGXM5-DzphPPIbSbTmx1TrwqWgSAKQ-sduDJ3jxWjRyseW6axz9NfJAV_JRfhcUJ4KoXHSAWePMs6edy7BY_o-Neogd8Y-t_Vzw5M0=w408-h306-k-no', '7059329d-6d86-446c-8e92-dcd1a98b6603', 10, ST_Point(20.615504, 52.19215)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #216: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Marii Skłodowskiej-Curie 5, 05-825 Grodzisk Mazowiecki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=C7bO1YiX4qbpp7b9G6nWgQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=133.23375&pitch=0&thumbfov=100', '7059329d-6d86-446c-8e92-dcd1a98b6603', 10, ST_Point(20.630954, 52.105033)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #217: Miejska Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Miejska Toaleta', 'Rynek 13a, 05-870 Błonie', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YV_7aR2x1urQL9PhWNBUGw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=240.56047&pitch=0&thumbfov=100', '7059329d-6d86-446c-8e92-dcd1a98b6603', 10, ST_Point(20.616025, 52.195053)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #218: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Nadarzyńska 63A, 05-825 Grodzisk Mazowiecki', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGO3gTd3HbgQpumICaf503iWAtOpgSYDhFs5HGSAzgr_aEdS7Aq0mZpVm0KQNYDFs1i6Jbt7dR1oE3UKj5J7onyD6swdSMNQHOGjtXoSk9-vbSGman-paZtT6jBflfkZ3P46c=w408-h544-k-no', '7059329d-6d86-446c-8e92-dcd1a98b6603', 1, ST_Point(20.639047, 52.101092)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #219: Toaleta toi toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta toi toi', '02-495 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npnpAruAT25SI_X0OmYlh0LfYfrkUWbEFZj60OB9fdAJ7ueiaHM-GuoN4rNasMBMdvwCkCgeCcm3fM29qF1jFxCqMolSwGEZAdBtjdGygRRTTXHBGzlgR1UYVLGWtAw1jDcQfFEKg=w408-h544-k-no', 'e0e665f9-7bc4-49ca-aff0-bd90e8b30c6c', 10, ST_Point(20.902679, 52.198356)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #220: WC Partner
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Partner', '02-495 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=tfY7NyBAzVz-p21aAiD8xg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=247.05942&pitch=0&thumbfov=100', 'e0e665f9-7bc4-49ca-aff0-bd90e8b30c6c', 4, ST_Point(20.890951, 52.185564)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #221: Toi toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi toi', '00-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr-UO0SvCJpPkLAtGHSYaGuzm7feAmb-WJcFaV7jeuPKo-okO7-mESBULN3wGfhkZT5IRM6Q4KI1awsJJrr-AIXI1VuiN0rLz-um0Yyujyk8fjdWpMVeCk2ROmsbufpF_doaOJb=w408-h306-k-no', 'e0e665f9-7bc4-49ca-aff0-bd90e8b30c6c', 8, ST_Point(20.868754, 52.19161)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #222: WC Chatka
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Chatka', 'Zbocze 18, 02-493 Warszawa', NULL, 'e0e665f9-7bc4-49ca-aff0-bd90e8b30c6c', 1, ST_Point(20.92407, 52.201496)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #223: Toi Toi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toi Toi', 'Ryżowa, 02-495 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pEOPRvRiDjCKIuFTOO9uKA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=106.52042&pitch=0&thumbfov=100', 'e0e665f9-7bc4-49ca-aff0-bd90e8b30c6c', 3, ST_Point(20.911093, 52.195999)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #224: Toaleta publiczna WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna WC', 'Żyrardowska 16, 05-825 Grodzisk Mazowiecki', NULL, 'a40b450a-7e8d-483f-a0ac-1124b33410d1', 7, ST_Point(20.608172, 52.098562)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #225: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', '05-825 Grodzisk Mazowiecki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UeBDSn6ZPPSLYHn3NXX_fw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=332.57474&pitch=0&thumbfov=100', 'a40b450a-7e8d-483f-a0ac-1124b33410d1', 1, ST_Point(20.620096, 52.10353)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #226: Toaleta na dworcu w grodzisku mazowieckim
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta na dworcu w grodzisku mazowieckim', '05-825 Grodzisk Mazowiecki', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqsVSXcdzK_SaZpEe1eCO_sgnO8dnUyqnH0lOmqNJhSA2gntWb6i-Ln6bXxSB387Ub6s1mZtBMAxgqgeww_D8CKcvo3UZjmOf2YZlSS9sJG94k8q7Hy3Tu8FwjGMt5PFpIhZWyRQh4XGiB7=w408-h544-k-no', 'a40b450a-7e8d-483f-a0ac-1124b33410d1', 7, ST_Point(20.622654, 52.10987)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #227: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Emilii Plater, 05-825 Grodzisk Mazowiecki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zvKRfZwIGXGNTOTHax5b0A&cb_client=search.gws-prod.gps&w=408&h=240&yaw=349.8224&pitch=0&thumbfov=100', 'a40b450a-7e8d-483f-a0ac-1124b33410d1', 1, ST_Point(20.639349, 52.098281)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #228: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Juliusza Ordona 15, 05-825 Grodzisk Mazowiecki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=HCt5PYEORfR6KZLhnKpcaA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=206.79782&pitch=0&thumbfov=100', 'a40b450a-7e8d-483f-a0ac-1124b33410d1', 2, ST_Point(20.610351, 52.119303)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #229: Toaleta publiczna ekopark
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna ekopark', 'Marii Nietrzebki 2F, 96-300 Żyrardów', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2B31YSv9iEm6jK_hW_BVw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=273.37485&pitch=0&thumbfov=100', 'e978cb18-f185-4108-8939-d45246b3cc86', 8, ST_Point(20.433921, 52.070532)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #230: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', '96-300 Żyrardów', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq3L5VVSOK7ay9LNUnTU9hgI5dra9VNbAeu4d0VBpkuelq9c6I1lV-DPrGVi4wcr8liUYoaoE-2lrMJEz9lAo-CvhGLG9M7sCbllVi25gCtAS_TYC2wsFbyH0TZA5PLVtH1zpiQ=w408-h741-k-no', 'e978cb18-f185-4108-8939-d45246b3cc86', 10, ST_Point(20.437243, 52.053496)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #231: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Dittricha 3, 96-300 Żyrardów', NULL, 'e978cb18-f185-4108-8939-d45246b3cc86', 10, ST_Point(20.431959, 52.058076)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #232: Toaleta publiczna w Galerii Żyrardów
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna w Galerii Żyrardów', '96-300 Żyrardów', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RfNqAF3w1KYM9kUcellX_Q&cb_client=search.gws-prod.gps&w=408&h=240&yaw=235.13576&pitch=0&thumbfov=100', 'e978cb18-f185-4108-8939-d45246b3cc86', 6, ST_Point(20.437129, 52.056305)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #233: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Stanisława Staszica 35, 06-100 Pułtusk', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XpBtXWrymxvHt5RvwEohdA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=62.906605&pitch=0&thumbfov=100', 'bd139815-d1ed-463b-9d71-d6f5c4fd777a', 8, ST_Point(21.0928, 52.702997)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #234: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Młodzieżowa 3, 06-100 Pułtusk', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xz3K-TX7ytyaFMYKj1nfLg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=352.30588&pitch=0&thumbfov=100', 'bd139815-d1ed-463b-9d71-d6f5c4fd777a', 7, ST_Point(21.090284, 52.70744)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #235: WC, toaleta, pisuar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC, toaleta, pisuar', 'Bolesława Prusa 61, Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjG-QUaIob59cePbgBjG64ajaLTrSiqrZhMF0WCKr50zUbGDI037YwTOJFPadXPJuC5KuNoavsnr1iIcc3aLXlYQYQkUw0OU3FBvhVLu44-D9F0RfHothOeiA7fyeL_jNW1hL-=w408-h544-k-no', '4977234d-a4fd-4376-baaf-a62b31816532', 8, ST_Point(17.056272, 51.119634)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #236: 06-210 Krzyżewo Borowe
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', '06-210 Krzyżewo Borowe', '06-210 Krzyżewo Borowe', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noWAM-SFmgoROay5d8QGJu0TRePthniQDp3oKnPyvmrmlBXYd2fnzCcsjcbmzq6m_lxecjCMQz5rE6_6T8WllBAtqethKw-3y1Cgs9B0VDsAwp53aQ2M7-9T7z2amL3ZB0rlqyV=w408-h306-k-no', '0b0297b2-db18-4eb5-a78e-3a632309db7f', 1, ST_Point(21.068389, 52.981368)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #237: Toaleta miejska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta miejska', 'Kardynała Stefana Wyszyńskiego, 55-120 Oborniki Śląskie', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Z15ukUIoJieiTCqUbH3n5Q&cb_client=search.gws-prod.gps&w=408&h=240&yaw=118.22579&pitch=0&thumbfov=100', '2a88b89f-08e3-435d-aa2d-4d6624ad01a7', 1, ST_Point(16.915497, 51.301419)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #238: WC Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Toaleta', '50-001 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noFGI6zbZG1Gz8xbVPb9JgfDxKBVGTIzPMYOajAfAdGh17wJThpgz7Vua60nNEr35q7TUyz4DHugz_R--GuYgSKwNaN27CI_AqepjvL98fH4i3_7ZbJnURT8BwhUgY6mhWNCBHd4w=w408-h544-k-no', '2a88b89f-08e3-435d-aa2d-4d6624ad01a7', 8, ST_Point(17.042308, 51.07596)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #239: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'plac Klasztorny, 59-220 Legnica', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no99wAJ7Q6pT-mPfQi3pW5g8VQI3z9-XyEoixrnO_3bCSORabPRfVncPwbbAhDBWDDacaBPZxT1135m1-GlnRYdAwnd70xEX2FsU56B1CqvMCVvexERAvpeyyti0ldFVuLrhHRNVw=w408-h724-k-no', '2a88b89f-08e3-435d-aa2d-4d6624ad01a7', 10, ST_Point(16.166177, 51.209976)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #240: Publiczna Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Publiczna Toaleta', '59-220 Legnica', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bNVZT6qjYEM_5pixUTsiIQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=244.07747&pitch=0&thumbfov=100', '2a88b89f-08e3-435d-aa2d-4d6624ad01a7', 1, ST_Point(16.159745, 51.211639)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #241: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Górnicza 13, 59-220 Legnica', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqtrErhVPIFpplPIVoh1Rxns3SyHRhTKzRqe-P48UTpkp3DiDcaLOlEL1RhHwZ9TD5su2SgGjScx_XK4e8ASsXK32C5V1Kz-QOiiHW6qUm1gJhGfqlTQsSChPAajprQWUH_QlcKdw=w426-h240-k-no', '2a88b89f-08e3-435d-aa2d-4d6624ad01a7', 3, ST_Point(16.186053, 51.205884)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #242: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'plac Strzegomski, 52-443 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noMi99SlTIMS_XmluhNBfekIdA3czuI3_MjbrGy7jB4OlmP1N2LdOVQnhfp5HBm6DXrAB_PDlpM5EjmehS0hVD2sUJ-QFDS8RAm6JyOGFHGdKz6OTRjkbmSHav-3urvQEBsZg5-=w408-h544-k-no', '2a88b89f-08e3-435d-aa2d-4d6624ad01a7', 6, ST_Point(17.006647, 51.113059)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #243: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '50-001 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npL8Tl8NEBy4nh0MOslWN77GAiAndv05Pmd23pb79CRHrGq6Md-IdYyoYKgUIQ2v2jaMJmQM-7aCAZvJ1GfwLNQNkbmhF9ts2z6qzX4qBfflJAw8xSILFlvOcYd2hm1kosFKQjC6g=w408-h306-k-no', '1d11021e-9a60-4a47-9da9-e338ad84df41', 5, ST_Point(17.074783, 51.085215)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #244: WC Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Toaleta', 'Stanów Zjednoczonych 25A, 54-403 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=T36XwX_3pXxXmbtSL-Assg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=183.97249&pitch=0&thumbfov=100', '1d11021e-9a60-4a47-9da9-e338ad84df41', 7, ST_Point(16.965492, 51.106915)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #245: Toaleta publiczna (automatyczna)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna (automatyczna)', 'Pilczycka 26, 54-144 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nocIJuIm42yQrZIaa0we48BjxhgAORXaqEDjuPd4PvhldDUZwgeWKBNMDOSmSwTO8t6XRyWeWEioKgd5aFhgRXLcHTcvsWhrDocUws8IQ8ZDoVJCO_npuTOjlaU5DLR22ENT7BL=w408-h544-k-no', '1d11021e-9a60-4a47-9da9-e338ad84df41', 3, ST_Point(16.975392, 51.130747)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #246: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '55-100 Trzebnica', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=96DO5eRc55dTnqfZQzUSIg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=238.47348&pitch=0&thumbfov=100', '17955def-f924-4eaa-83ec-0bb490c0d789', 1, ST_Point(17.067391, 51.316213)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #247: Toaleta miejska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta miejska', 'Kardynała Stefana Wyszyńskiego, 55-120 Oborniki Śląskie', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Z15ukUIoJieiTCqUbH3n5Q&cb_client=search.gws-prod.gps&w=408&h=240&yaw=118.22579&pitch=0&thumbfov=100', '69332776-634d-4cc3-9b1d-cdc899bc1605', 1, ST_Point(16.915497, 51.301419)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #248: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Turkusowa 45, 71-899 Szczecin', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npHiFUYt8cbDXhOE_VMp-aye6FPrQyAkVutCu_CqHOKsOCkC57hd-gagd8oFp-zKhQ3N1CU2kJ7NCx1Lc287_KqQDdV2arpC3gB_i2Zuc-36J8WBUX2AwggHmvN65WUL2iCoI40=w408-h306-k-no', '6774164a-f4aa-4711-a479-6d74fa8c2960', 8, ST_Point(14.644002, 53.379991)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #249: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '83-250', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4now1yHj8pjlcBbSVX8WQu_3fbTmxjj7RfZv-aVnZFBgIcE2uwOIflWHhCdUIpF9cKQ-h42Osi2JhJL0arnaDrTJwS5tAc_RnCVQUYwuAnwxLfMU2mmjOdrLzsDpMcEU3EeEjzly=w408-h306-k-no', '6774164a-f4aa-4711-a479-6d74fa8c2960', 7, ST_Point(18.628344, 53.887111)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #250: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', '87-853 Włocławek', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr5KjOO9uGRY8F2NyhgpwQ7nCWl9cVHZPv8xXj7F_pfO4g3JwZYwUKFHVmTPcUqGeyWqPSW1O5bZY3J7hSlOQnJTX-jGaFiBomDj65d-QiwmPl_1HKkme8wKxjnKBUlCGRVw0bM=w408-h306-k-no', '6774164a-f4aa-4711-a479-6d74fa8c2960', 9, ST_Point(19.01253, 52.567018)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #251: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', '12-122 Narty', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrWuyDCbKajaYVOtwBMWtp3ukDMcZehbJszrpZvCvZiMinOREJ6v1Anfp6BMR3y76ovQRbm2sO-McDqLlV4RxqdgMPfnhe66-yMR5U6qZlGGFyKYhc2wWl1s8wp4UYHdtnHi-3emA=w426-h240-k-no', '6774164a-f4aa-4711-a479-6d74fa8c2960', 1, ST_Point(20.786424, 53.540878)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #252: Toaleta w Metrze
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta w Metrze', 'Stacja Metra Plac Wilsona', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npovLzkj-2i_-ubHbVzA18GbnVVgKKbWTQeThaom1FWI8FoyS33jDyIZ4tC3YUTnBTz7XPLqa9vu1UaT66XYAJWXpm-pQB-QioeMPBG7M9nI3Yi4NI3wxccZFUp-Y_uoRkPM412Jw=w408-h306-k-no', '6774164a-f4aa-4711-a479-6d74fa8c2960', 8, ST_Point(20.985403, 52.269233)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #253: Szalet Miejski
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Szalet Miejski', 'Gen. Ludwika Bogusławskiego 19, 07-410 Ostrołęka', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr_RXLsHv0wGil7PqshDHX1pAvmKBqobcm1LgSWzg-5LOsAWkHttwIN5aCO9DvcD7JMHzeq8c6yaF-GQ7rp2q197W10WHtZuFzAr1TKbZUFmno3cAe-0pi0BIhcc5JmPmiqlCXYhg=w516-h240-k-no', '6774164a-f4aa-4711-a479-6d74fa8c2960', 7, ST_Point(21.573246, 53.085292)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #254: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Łazienki Królewskie, Al. Ujazdowskie, Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npa7hVZoabJxPert8vV49qj06qBa2mbXjvwla6CAS9VXtdkZmn4T4NLq-QCCbS4aKGAL-W1_yk6wT15f582CJ84HjHZhKMQv1XF1sMnmX-dXEhtUcwbSzGV85uzAQ0J8o3uPauZdA=w426-h240-k-no', '6774164a-f4aa-4711-a479-6d74fa8c2960', 7, ST_Point(21.027236, 52.214035)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #255: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'C239+R4 Toaleta, 42-584 Dobieszowice', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqS5oUhYs0N6MmytdDg8GgN8H_srgSWHJgV3V7zBPMM36X3CTGI8Rm-UcZ49wrv109SIeiS4SrISXyPExCHZDgyGXGvqPMcS9S6MWpsBc6dwtolnedRXV7fSUrLpSJnFpTIQH2oLd0_M6Sh=w408-h725-k-no', '6774164a-f4aa-4711-a479-6d74fa8c2960', 3, ST_Point(19.017754, 50.404526)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #256: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'aleja ks. Janusza Stanisława Pasierba, 00-401 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noVyaCp_lF-U3BT0EE1403VDg_LYX3GmTRomMgnSBN5Lz-bNTAjEpW-C7VHKBDXRKSwelN8gY9QyEeawa0rYt8hVDeiZL7wtQE4k1ytu5dahJBd3d0j-vhqq23vbKy0sDtcSxij=w408-h544-k-no', '016d0b25-1690-48bb-858e-ec134470c29d', 4, ST_Point(21.026137, 52.233337)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #257: Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta', 'Marii Konopnickiej 2, 58-320 Walim', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PdJEcX_geLgUlCOzHQW7xw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=320.87622&pitch=0&thumbfov=100', '016d0b25-1690-48bb-858e-ec134470c29d', 8, ST_Point(16.440131, 50.699949)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #258: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Kościelna 4a, 47-364 Komorniki', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=iNmH6WfpwjsvON43_AUtZg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=155.02756&pitch=0&thumbfov=100', '016d0b25-1690-48bb-858e-ec134470c29d', 10, ST_Point(17.900213, 50.433512)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #259: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'CH Blue City, Al. Jerozolimskie 179, 02-222 Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ras4JUscVjGI2lpPb4zIeQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=271.38937&pitch=0&thumbfov=100', '016d0b25-1690-48bb-858e-ec134470c29d', 10, ST_Point(20.956383, 52.21313)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #260: WC, toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC, toaleta', 'Edwarda Przymuszały 4, 64-200 Wolsztyn', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqOySfOCYvnzpVcIqiGLlx4q8DJzCU1dxFyWVxaeOKzI9WHxS0RiBMSpc7LIxQwFMewwiqCNCREoDFbfJ5VJmD9H3ry6aQW3AQlRjIB-QwGcgqD-lM2CWelzj2nStMYVz_8OMwBcw=w408-h544-k-no', '016d0b25-1690-48bb-858e-ec134470c29d', 10, ST_Point(16.110585, 52.116039)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #261: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Adama Mickiewicza 5, 18-230 Ciechanowiec', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Cgw6AE0DZMZt_RKAqmAVPg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=68.0613&pitch=0&thumbfov=100', '016d0b25-1690-48bb-858e-ec134470c29d', 1, ST_Point(22.498928, 52.677967)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #262: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', 'Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXHDaP1M6yifyUlMkLDPJGGboaXHylujCU_lzTe42yvaITZRjlYYv2WxAjtf8_y8ivLND71q1Bt7msqBEZiisgKvLM4FgPiODyj1X7vbmtq5WixweWjUF-CfdBKVtXKB4r79Q=w408-h306-k-no', '016d0b25-1690-48bb-858e-ec134470c29d', 7, ST_Point(21.042972, 52.237767)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #263: WC Miejskie
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Miejskie', 'Jedności Narodowej 185/191, 50-260 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npxATeWyRKmrAP3EAHMbx_Sn7Qx3gGEs4ILldtW5xYEYISsv2hWIOoy7SyZ3VWmjJSEhQ61e4HyJKPyj-6Kz3vgbm_HqnvHHI6hgmpHQyiZgGn0Uga306xjc7IbwMqqmUGb_oai=w408-h306-k-no', 'eab5430b-1c9b-46c8-8da6-f96775ce07ba', 10, ST_Point(17.050888, 51.127495)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #264: Toaleta miejska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta miejska', 'aleja Cytadelowców, 61-001 Poznań', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrFmSO1AWoiRCPaWeuah9wQdAeeyjKC6-2ighrz3K8fQS10XQEvCVstt9A3ROexuTPtoxCPC8mGZQJcfOnMV27s5YJMKSg1GvCZannlkgQWWPv6MlCJuADdrMqTpfVmFeeLoqld=w408-h306-k-no', '349a463f-22cc-409c-88a1-d75446b3e17d', 7, ST_Point(16.931947, 52.420005)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC #265: WC, toaleta, pisuar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC, toaleta, pisuar', 'Bolesława Prusa 61, Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjG-QUaIob59cePbgBjG64ajaLTrSiqrZhMF0WCKr50zUbGDI037YwTOJFPadXPJuC5KuNoavsnr1iIcc3aLXlYQYQkUw0OU3FBvhVLu44-D9F0RfHothOeiA7fyeL_jNW1hL-=w408-h544-k-no', 'c97493e1-91c4-467c-ab1c-a5a553634f3c', 8, ST_Point(17.056272, 51.119634)::GEOGRAPHY, 'public_toilet', NOW(), NOW());

-- WC Photos
-- Photos for WC: Toaleta w Warsaw Hub
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqo4QtdJy8T39KE0PJU8yL6_kz_yzHmCeCYxxpPM37EgsOHlqT2hpvpf5HFeo-5K0Ki6rQAjESUK9JRLOSYFGmkKm4MzdpeUeupb0-GhVgGiz5BvOnECwKFv-36PO_vsKnnR_U=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Warsaw Hub' AND address = 'ul, rondo Ignacego Daszyńskiego 2, 00-843 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9WaGmfPagvl3jU1k8qDLyEzpNzyrEvuNxkWn1I7OBEUFY7_mvQjJfaGkwB4-BhOI87YHHkpwss9AL8BswWKjw0Gw8PSAdWzZV7nJ1ZbG_IgO9qhux5J7jlstHzv2Henvy6KT4=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Warsaw Hub' AND address = 'ul, rondo Ignacego Daszyńskiego 2, 00-843 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noF6mEm0AnWIEw8rVX3TI_5FvmigtEchwMYSZq29KKrqnHhxfa4V2ZBQGgNupBhhkNxecGFPV_iMU83gfyhh9YkjwlMIAWVcvfWcSTKdL_IuAiVvMUcx2gCwTAIfmJjmtyntaM=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Warsaw Hub' AND address = 'ul, rondo Ignacego Daszyńskiego 2, 00-843 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noHpKGa5g6xtq4VlmntdbuJbNTAihMJvjLChuAc_gNcO7BMB_B1iDX2PXipdladEzIpcaehBlv24BBzdFafdCB8VTuQVLlypAYx6DueyUAzcgEikTj8Wh84ILjhhw-lph7e8d3r6g=w528-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zn_K_kN0zuUm8CpZf76Qrg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.4275&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjVp1qEUmrFdNaCqiy3k_s432_CUakvXGQb7oko_uO1lMYQ5rZ8LGiHeFftfx4CEwPm-i0Jb7hsI0BeRIqFO0WFiQ-G1niJWiU6nzUYwL8r1O-6tMlZvUYG-8sv7dRnEUiWu49=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ecHiHs4N-_zFf5IoZ-x0bw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=263.12213&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'Muranów, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ecHiHs4N-_zFf5IoZ-x0bw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=263.12213&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'Muranów, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Bezpłatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RU21a3pUvSJs09b3cXTp_w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=68.982796&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Bezpłatna' AND address = '00-017 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RU21a3pUvSJs09b3cXTp_w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=68.982796&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Bezpłatna' AND address = '00-017 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nLPE5IYQQkfXaCEfdLNxMw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=62.80716&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nLPE5IYQQkfXaCEfdLNxMw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=62.80716&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta w Metrze
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrS0dEYsR88p7mGgjDcZ5JRGgzV1CtjX_5ucMc9rYNKyTCe82kCVW-gNpArzW1KQxylhkHwJmIbb0KD4EpZeDRqZGFl-OQ_jnv7zC1UjrdmSZRvmwgJZuQDNUTzhhQowgQm_nhT=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra Świętokrzyska 00-001' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=QYFGUYN-0mBJjX0Yvzn4QQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=237.32883&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra Świętokrzyska 00-001' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrg-ZCSWuxoClsA7j2M8pMFLT72H0UdCjarHcSxEpKq2W8TQ-PfTIG5d30dzSldD44ua-KyV6AKZ62yTlPK8iCMJt35hPuyuShAPiyJUiaWSiSm5TZu0RsqTjR_LjXNAMsYzw7vBg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Kościelna, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noeuF8Xw5Lob_GZo3Ezb-jUYgjCKVnXCs4gdydvzWS3HreRVnRGp0Jho7w2VKeFLoZPWqFaTsbC-aQbia7JOimYTFU3uc8KDWf_7hEoggzhw8mpgKcvDBLG1mRBZJu4sepkRHIy=w224-h298-k-no-pi-10-ya223.99998-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Kościelna, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrPra8z1pIIM0FCQmkLn1R3zV7eliRU1oAJtJYyyyDLtsuBqGu71xo8_yCFVNNSoGXf2OKZowYxGosyTsLiadNkyOVvFsegE5_EvZeiTcMbOyTGY8GvaZAUewRFEST9xhZdaY6n=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Kościelna, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOgVFKl-h2vEQ7T57hTrmlUOOxn3CwKPS3JZraT=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Pałac Lubomirskich w, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMujwGKwq5cOlUKgJBJOSomsn5gusfh2biIY0U9=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Pałac Lubomirskich w, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNflsfDz2PAep7TYW0fh37uyg1Z1-BiX_ncVmV1=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Pałac Lubomirskich w, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNx1tMewf1R6mR2u0x8SL91KPffhf_ceuNY-LZl=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Pałac Lubomirskich w, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gdvwy9yRdiVEXIMNUAABgA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=290.75385&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Pałac Lubomirskich w, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC metro station Nowy Świat
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noX08T3c0sOkhqhZcXJpzl5SE2umWib9Ps48gltozep-ZowbeyKkUbXvjGCzB7uGYtjOUw7xJ7g-8WA7SlsxDq3ZXZFoNOl0J7lLl60N4gojnQJ5v6SHOjScmAGqVAX87l7vrNsQw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC metro station Nowy Świat' AND address = 'Stacja metra Nowy Świat, Świętokrzyska, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6SeSgK07YYzmLEDMCB1z3g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=347.38446&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC metro station Nowy Świat' AND address = 'Stacja metra Nowy Świat, Świętokrzyska, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noInasOg-ZPZAo33oxfLKmHSjeG9lw6XhjJ_huR7EfRNrM43jhhnABCC1Mte43mbEp4s0_I7MIuBLxHtMv2Zs53Q_OcnY9nqn_6fQzigdRiO8uktD07mt1GaG8b650VobLHHH04=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Wybrzeże Gdańskie, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=aC_ZBNwgrAIOEqZhVmwYrg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=53.30817&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Wybrzeże Gdańskie, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta „Lapsiu”
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=316.32266&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta „Lapsiu”' AND address = 'Rynek 48, 05-079 Okuniew' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=316.32266&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta „Lapsiu”' AND address = 'Rynek 48, 05-079 Okuniew' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cFmPFYFDcdiNjel20D6ZmQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=101.0444&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Stanisława Żółkiewskiego 17, 05-075 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cFmPFYFDcdiNjel20D6ZmQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=101.0444&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Stanisława Żółkiewskiego 17, 05-075 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta „Lapsiu”
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=316.32266&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta „Lapsiu”' AND address = 'Rynek 48, 05-079 Okuniew' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=316.32266&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta „Lapsiu”' AND address = 'Rynek 48, 05-079 Okuniew' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta „Lapsiu”
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=316.32266&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta „Lapsiu”' AND address = 'Rynek 48, 05-079 Okuniew' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lHaU0WQA8imP2kvOoIwdtg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=316.32266&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta „Lapsiu”' AND address = 'Rynek 48, 05-079 Okuniew' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety Darmowe
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqU8Xeir5qe96HxzFRDnqrB1bKFTr2ffmdpi20ISs6vgiQcTaRagx_YLkNOqxUISip0EkJUZbe0gR4RzWhMwYszbWK6_WrldCksS58ZiihchwCR7zVh_QOdR25wg7HkEo3kM51U6bN-HpkK=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Darmowe' AND address = '01-999, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqgYfQgkmZwMIV16nbYx1wx_d3UZcRbDQRpFi1eFdpkNcvrwEAEaiTl0SsQBy3lXiTWTzRjoxdl2iDC6ns4o-FRBsncqgmdWDpxOcPwz8HUv5V_VmcOLNfylP-rNv4pY3BB58Ls9OyikCBt=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Darmowe' AND address = '01-999, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqhnkrJayIEG1ONsdTZVUznT8Mwus9sxsnTb48-aHP2xNPYHoohGgGXCjmO0dyuT1H9zDHa3Ku9u8tR0ASxLEDo7kx4c2LRm0tuoJ32BlqPCWnhnAOWLNMej9lYn4yt8-_lsUKE=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Darmowe' AND address = '01-999, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrfzRcblcxOc-Sb7QXyXmEdANjUqE_JKccsXZzhdKrrP0JsXmuyL-zNLzOrERimoqQSW4TB6p3MgNQdUfPyMf_U1NAtYypGihJexLrUQ5c85WlNeNTJ2dy5GYH9Hczw9YIgWXvv=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Darmowe' AND address = '01-999, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: toaleta w parku
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGms_x_d2LtR9TaTGn2HHg1ckM06bSX8eR1G3E4X5wfVhAIu_Leo4NdwiSkWVkUpjmMP40xAtKB4ERKPhRHKFDHkiPNlds91dnil8diafMtsBE1mMXcESFnh7V8XBt0teZiZgocg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'toaleta w parku' AND address = 'Biedronki 6, 02-946 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrXPXVb99V0PSYBVm3X7X2NUWW5Pc6vPzmCMCeXJAImlI1ykZkpWV4MVuxNZw9r0v4XDu9bfI9M5u0elfAQdFajdj467uvd0EO8YM3eWPn3V4NGPOszshr2OSABrGB35ax3RrMofQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'toaleta w parku' AND address = 'Biedronki 6, 02-946 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rMeJDPo0W8NFN5QacQRHgA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=279.5524&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Łukiska 29, 04-123 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rMeJDPo0W8NFN5QacQRHgA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=279.5524&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Łukiska 29, 04-123 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrbGfQAmgOjMdIntBeEj_W9Y-WVOuWKdsGg4BSCxeW9eJSv6GP2rjUlRbBHWmDs0XY-4OwMHuVBvG5RtTPMBH_9uRqJSrT_bmdp8nS3R3kobSXs0EjIGnbDEW43P6wM0dH9tKpOPA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Książęca, 00-418 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nretYkeOU8QTylKB9mlU2tyiXeXZZMA8KFTTi39y-QpRvhD8DE_-C-zav0vJg2uFhuNIeV1dJn3D3OWDERUnKPnX5YjMumLuiEqdleC5_v_XO8_k73zLvsM-XuBaKcCBhCTqDIUcA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Książęca, 00-418 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np-ChWQ0m4HVrTuTCXoEjN8RPapz9n7RrS-gBfZrH1gC880-qk6KZ6jh3uvG2qDrL8Ic3_I3oRLH4l-5I3FIzMUISw1DAMbvmXIe4SOciSLrCSyePM1Zz-0hKubauH0AflAVFL2lQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Książęca, 00-418 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=v3DvL5hcxd_FDOut5c4pwQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=342.99948&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Książęca, 00-418 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npLNi3zNMQiuHfpuFAKxvppmRkm0ejh3WpGMm0Bsf14ucH-QUllHGS2oaahOLSUaY9hfl5mmwEr4sJ0x_K_jtoMnGYrPCPx8U3GjQ1MoqUxVDq8rwG8ZRpZVBiUiFsElILtOIzA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC' AND address = 'Chyleniecka 4, 99-416 Nieborów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqwew3OjiDrAZmC5QZVbxrBhGGyQGkZwop8FMmM5R-PEztrw_Kq8GO8YSv4anoTfmgVziZRgMtxRGHWPLA7bCWAiGBPc0upTF74VYs8guc7hUG8lLjc-gz_FNUCSRKQMRym8ngO=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC' AND address = 'Chyleniecka 4, 99-416 Nieborów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqxrgpgJWIwadCwwvvRsDJLl4JDTJLe7roZ8QjO7CHvTKxyt5npy10tjt5h_KYCCv3COYopXPNN3R1GWzNfKt1UFSzzQAfccQ3eysSM5tgTG3uTCalRlK989Qo5gG1dLeAVKYhV=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '89Q4+96 Toaleta, Niedrzew Drugi' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqgzB6awe4d918FYKmrccWwoRgWQ5UCHOF97bAztkp9Nw5VtbV-2VN4HfoPE1vLBOfmmMxIk5HasqiMKQ3g_0KALot5oC1qnoAvtG7pW42acpnmHrbhaonMAa79nkKLJb69NTNRuXAEgYW9=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '89Q4+96 Toaleta, Niedrzew Drugi' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noKwfV9UgAzsC8r3uPWDJUjqgwkl0XV9XWyhrL6uVG-jZx6rWlG5aTiohXg55qYVvky0qY4mQFFBbsa2gC1v4PyWh5HmHF78XeEwOCmf1bmyoP4p7dOGz0ro5TJzZ51CBOYIRQ=w224-h397-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '89Q4+96 Toaleta, Niedrzew Drugi' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqVeFcDKphZI4JWArqE2Oi0vFzSDNWpPaJhgwrLaNU5x1o6z0kXGKLD4eBIHz0RG_IsIZmzJTNKRoKWOLavwyEwK2-MFFv5_wKp2PmnmJXLDOyGNAmfGWCP7-0zpJykmMZ_6Uki=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '89Q4+96 Toaleta, Niedrzew Drugi' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta (płatna)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrAsfnE1pne2w7gtppLN07dBjmSZj5GFLPDGbSoLV0BraBdt2lzQr5EuryiQLNt1kfuxRCbHuy0Ee1IShe1NGqoR77KRKcUNZhOeRBJYAg0jQj-0rwu-NH3UcL5GNR4S3kwgj8nrQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta (płatna)' AND address = 'Parkowa 15, 05-850 Ożarów Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=R-ZNYyWtiEQ-ZnbZgc7mfQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=16.80472&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta (płatna)' AND address = 'Parkowa 15, 05-850 Ożarów Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrAsfnE1pne2w7gtppLN07dBjmSZj5GFLPDGbSoLV0BraBdt2lzQr5EuryiQLNt1kfuxRCbHuy0Ee1IShe1NGqoR77KRKcUNZhOeRBJYAg0jQj-0rwu-NH3UcL5GNR4S3kwgj8nrQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta (płatna)' AND address = 'Parkowa 15, 05-850 Ożarów Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np8JDcRuSz878VvxxTNCZVElQCaX2Bm4mt8HsAr4mqZHavI6sfq8oBxTcfCxPlENtyVeTonprHHUbRXafuxZFV1l298epJRIIL1QS1kOXlmXjlndUJgRjRcxpbYx-NZ_iUB1WtcbA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'toaleta' AND address = 'RMR6+QH toaleta, 95-060 Nowe Skoszewy' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=DuX9F9PIi-qD16atNOZHmw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=86.50663&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'toaleta' AND address = 'RMR6+QH toaleta, 95-060 Nowe Skoszewy' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noIswkjxL8F38_kj8MDXhxLZxYRH8m98MUKbXG-g5LiNqJhOBNDEaSQayQf0mCprCyOXPf-CfG-hk2P--9PtPA4UWJjQ9oo8gR1k3IvCeh-i1S1WCVNrYADf5DeRA0E8tIjO6Y=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Nowe Skoszewy 13, 92-701' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8m3UkoG2OBM_jsCSf-3Xgw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=278.61752&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Nowe Skoszewy 13, 92-701' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nooommvWKk41-8vjeQXDqTDxHBo7I5Ox1PpJ0SbOygnQCOH1sTVZV5nRNQ91vb4vfkO03GeicWXR92tAW5myrsbwmzycj06G79VXrGjZulooT8cK7ERqU8Kp0vZkvkAVuCnDNOC6g=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Mąkolice 9, 95-015 Mąkolice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr9w1S3DHbJ9ANMGUL3kbHqoDvYhwcj1ew6zKVSBved9A3MldQ1fpKRJ3XFypkYxmN6PGy5sH5l5FawJPCI-BVKWJw3h5bcRxY_d5uc08bV1AIl18J1YnYypSboBSsomOFrffJH=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Mąkolice 9, 95-015 Mąkolice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=4gr5LdiL8JFzLl6ToDN8eg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=31.987328&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Mąkolice 9, 95-015 Mąkolice' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wj8wshofFOrvpMgl73v8zA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=16.443604&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = '95-100 Zgierz' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wj8wshofFOrvpMgl73v8zA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=16.443604&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = '95-100 Zgierz' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=R4104rNBklQlFT6RLybPNg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=120.69012&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Zielona, 99-200 Poddębice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=R4104rNBklQlFT6RLybPNg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=120.69012&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Zielona, 99-200 Poddębice' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC (toaleta damska/męska)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6MgQQxIVpTF_JnUgkp6sOg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=337.29236&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC (toaleta damska/męska)' AND address = 'Przygraniczna 96, 95-100 Zgierz' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nowMmVGGOlCfJOf2FWHkU2JWQEo9tTlUt8-KjIOMHz1wbaIwU-7GpfoKF2dFgl7Lpn1wdSkvli-y4QU72NpYT72XwdKAV2ELixhR2Weh9A85LZhPXDuS8Qv67dHGypwccf0iBos=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC (toaleta damska/męska)' AND address = 'Przygraniczna 96, 95-100 Zgierz' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6MgQQxIVpTF_JnUgkp6sOg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=337.29236&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC (toaleta damska/męska)' AND address = 'Przygraniczna 96, 95-100 Zgierz' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nphqiSKb-LOx6OShd8pnA6MyzXy2XP0LepFl-D4yIc51PZARynLZ9QreDFz0aNnfvJURvryBfERNR7cbH41nTRPpHQmpxhb3D6o9sObqOVfsC9uY9AomARc7YFilhz9fbdPEM6Eww=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '99-314 Krzyżanów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr4y5PoavNuLhzO4oaZsFAUPbl75yQnukAuVOj5c50vPTYreF1gWYYGjW97OdrtoaC9dUSBXcHBGputUrkuYAwIwFd1q9oCAnsbywXiS4MRx_-jFh6XgIyJecM1S33bnJJOgWoa=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '99-314 Krzyżanów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=9m5T-ufW3PlLuUB7sDhtkQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=141.40367&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '99-314 Krzyżanów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toilette
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no-VnAo8UheaMoKgnNvIodhqGkvBNSCNFVPBcOPcZ266K_wFMo-dFXisNKMwLy2NrEI-bXwtzoIblm2KjdtNvHyMpXDltN9HD_OhkbgPXV_7BDN0SajoebRIw5v3idAe_Mhmb8FSg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toilette' AND address = 'Północna, Nowomiejska, 90-001 Łódź' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UrAmMqc1jT0V6S8T1Xf3pQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=99.398384&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toilette' AND address = 'Północna, Nowomiejska, 90-001 Łódź' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nouqcoFMn_CGpKeIA_X6XSkLH2OUf0hpcBeL0sSKMpMngB8Rg-ak9EAMEoZYy-s-6clo9xvgdybXWcKt-mDrG8OgkRtBzgpbCVWcmIZR8BoTa4rMFm61C-2EgFvANO-iMl-VOQF=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Stary Rynek 5, 99-400 Łowicz' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gBWcM5uBdRDDm4vv8ljaIQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=297.8436&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Stary Rynek 5, 99-400 Łowicz' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr0QN52jOzQjZf-aUarpnEWu41_ki1L_8Uzfdjw-_cH7Uijl24vVsYlEBGKDPwj1TFjce5hYl-fjt-6Y33eQdWCSuoKsnI3FqPLHWiORirZNT4Nd2rKqBd70jCyo4ijQk1QCuYW=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Konopnickiej, 99-200 Poddębice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cYVdlgeukB5NS3622TwNSw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=250.17343&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Konopnickiej, 99-200 Poddębice' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YTJ1mkj_rVqHDRMEGo0mkA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=295.71527&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Al. Jerozolimskie 142, 02-305 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YTJ1mkj_rVqHDRMEGo0mkA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=295.71527&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Al. Jerozolimskie 142, 02-305 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=3p2bCtbrhjA9feUgi7H2Ig&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=306.70218&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '99-101 Łęczyca' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=3p2bCtbrhjA9feUgi7H2Ig&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=306.70218&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '99-101 Łęczyca' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ykpKuRD_aj37ueUtonKwzg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=161.77911&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Chomiczówka, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ykpKuRD_aj37ueUtonKwzg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=161.77911&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Chomiczówka, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta w Metrze
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npfQJY-rxpSsOMKsXL1aGWkwyHzeOWJe7x_LX8BMEl446BS1XsX14Ajx9GJtYsv9ciKH8OY0cQdi1JCfqm3JzUpMxdTfZ7M3ws4rMQZkQDnwjO1m7EtxiJXVsyj1H9LjiViQLU=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra Słodowiec 01-001, 01-001, 01-001' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npE193bNEglf6rOLt_vcRVshReCFvKjqf31aOeajnDlYlfAQnGTxYqdFFTsxYtEYzdH3HxRs7hoM1U7eTg_xyxn-5nfllkOX8bQcdN9bmg_hyhhsFkcYUjnUwqYjuixo1KH78IVRA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC' AND address = 'Kazimierza Wóycickiego 14, 01-938 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cderbi-YyRSmRBYIAK1VMg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=322.65872&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '05-082 Janów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cderbi-YyRSmRBYIAK1VMg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=322.65872&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '05-082 Janów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zRPAMiIKtF5aNtCxPQtATg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=60.55868&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zRPAMiIKtF5aNtCxPQtATg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=60.55868&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8P4QQyHBTpAALiIL8zPfpg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=217.40114&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Marii Konopnickiej 8, 58-100 Świdnica' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8P4QQyHBTpAALiIL8zPfpg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=217.40114&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Marii Konopnickiej 8, 58-100 Świdnica' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Warsztatura Hubiego
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bnXFEHjJIRdxjIR80iS0Fw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=195.67526&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Warsztatura Hubiego' AND address = 'Dobra 28, 05-082 Zielonki-Wieś' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bnXFEHjJIRdxjIR80iS0Fw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=195.67526&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Warsztatura Hubiego' AND address = 'Dobra 28, 05-082 Zielonki-Wieś' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta (WC) Płatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npkwq2ahTqdqX4bTwkLi4zDNPI2tb6sJ2PXVgPKNKqB4p5isYZDroa2Zj1_grOOaQr-O_U17O819mU_Xy6ceI-fKwI0g4Zug2uxMdx5cWzsVW-Br955A6AD0D4i6gVBTMw3eu-cWQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta (WC) Płatna' AND address = 'Kazimierza Wóycickiego 14, 01-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=7F0-P6TFaEaKd6PTVdnqDQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=339.37192&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=7F0-P6TFaEaKd6PTVdnqDQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=339.37192&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrfe8vHJyC4YILJO5Zq4hI_2VFvSVDt3rFHjrJyGLg4DtaopFbZEqlftGybKqEsoaqqBsxzTl6noVdiJnhlbVWB5p0k4O2X-ptDPDUAvkF7wnkxGI58i0Pka2hDqdgRqvzwMPxp=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Jana Kasprowicza 203, 01-949 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-KAROrKpnUMRccw9ZzZFnQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=130.75899&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Jana Kasprowicza 203, 01-949 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cENPVCzxHtbqtbx_nxDAHA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=311.51883&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Wrzeciono 10C, 01-829 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cENPVCzxHtbqtbx_nxDAHA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=311.51883&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Wrzeciono 10C, 01-829 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RqmOfrPPQZGzZrID2M-_Rw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=164.46982&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '01-995 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RqmOfrPPQZGzZrID2M-_Rw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=164.46982&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '01-995 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ZtvC4x8AeJ0gil9QJ9ewdQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=123.01296&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '01-493 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ZtvC4x8AeJ0gil9QJ9ewdQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=123.01296&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '01-493 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gYcOfw2UMxIzYAkvz1nQOw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=93.14624&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = '05-088 Brochów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gYcOfw2UMxIzYAkvz1nQOw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=93.14624&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = '05-088 Brochów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta w Metrze
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RI_iXA4RsoLiExjH_XZXyg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=229.47632&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra, 01-859 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrsfJ4PdmjzwhVSfWbquANh-5MiEsQE7yle2L-PDK8x_M4omxZKxkBdBTlDV61TQtTr-XjVL2Z24rmnHMs1Jpc_pWBp6tdxyVK1-7TqBD4bBBCM6N430xSlqE51sxtP0PN7ov4g=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra, 01-859 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RI_iXA4RsoLiExjH_XZXyg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=229.47632&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra, 01-859 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Szalet miejski
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8P4QQyHBTpAALiIL8zPfpg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=20.161983&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet miejski' AND address = 'plac Świętej Małgorzaty, 58-100 Świdnica' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8P4QQyHBTpAALiIL8zPfpg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=20.161983&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet miejski' AND address = 'plac Świętej Małgorzaty, 58-100 Świdnica' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety (TOI TOI)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noXoY_y3T3QZPcpRd2_GiaDOWIA4hhF8KCXUaA4XnhJcS3VwaPi9YF4yZZSib7BE9VFVSVs0sxOfpgj17jAd7PQo_-nMZpL9JuLWuxJBNhj15LYSbxnQbQb0slo8h8sf1RzC5vUpg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety (TOI TOI)' AND address = 'Wawrzyszew 00/001, 01-912 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Sub Sole
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=99J45oOPKxAn_Cl0l6F1tg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=267.03516&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Sub Sole' AND address = 'Powstańców Śląskich 61, 01-355 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=99J45oOPKxAn_Cl0l6F1tg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=267.03516&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Sub Sole' AND address = 'Powstańców Śląskich 61, 01-355 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna w Parku Górczewska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noOLj_5BOqaJUnr_8o_2pz-Sdaq4hgT3L7rnU8RZ0o-duRwurXwbXnaB8mZwvYWFiuMJGPKav3s3jhDcONFPujEJ9IV74bMLSkmcPtygOpUcW_Ti4qxRfCnc4Z6zLiMlyWDe2lR=w396-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna w Parku Górczewska' AND address = 'Kryształowa 45, 01-356 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: O'BLOCK Wojcieszyn
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=QeSRgNd7kGX-CHKXRNqkvg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=341.46893&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'O''BLOCK Wojcieszyn' AND address = 'Trakt Królewski 74, 05-850 Wojcieszyn' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=QeSRgNd7kGX-CHKXRNqkvg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=341.46893&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'O''BLOCK Wojcieszyn' AND address = 'Trakt Królewski 74, 05-850 Wojcieszyn' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna - bezpłatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqfYjvtiMfTZS9RvMXyHjE42OpHq0uNA1QWpOcoy92bvuNiQTZ2yACnhpeGYK5SE03p71dQrf7aD4eYUAaYU_jDdJvI8TdWGVZkK8ZNNcT62XUByRwFD-W-fPoGVfIf-8DIPIvnfRbG8UQ=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna - bezpłatna' AND address = 'Krakowskie Przedmieście 87/89, 01-195 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrRRtE-CgVg0SZe1fTozolr9e5TlvdkI8Qgb4d90iJ1k7McsiT4SBIWRVnUQ9bkf_hFcR6AYPFQldfqsZW2TeNJRH5oZUKj8AZQWZe8Yt5DRcD5ntw5RmZWgnTWQxb3BJQPOnJSz52LMcSK=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna - bezpłatna' AND address = 'Krakowskie Przedmieście 87/89, 01-195 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npBupMXeVzhuakuuHA4Mg73umD4JG9Ipk32ckRkw1fCmqjSTY4g4U_jO0n0MLlkfs3lNiXwFUUDvFjYa3Roq6Smwvxc1VS9H6-_bGAe37d9G-0xG1YjOr3eGEVm054pmhEbdiQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna - bezpłatna' AND address = 'Krakowskie Przedmieście 87/89, 01-195 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrM-IJ2o_9XW6Xa5Q6WjPMOi3ab-BHd1FBMOwM4Ni9PWiefXJP3Ys6PmCJi-DpTrl_dSEzY1K2m1Mng9Ake-I0w8MLP8gQvQFmwRYsKiFXk2RWbP22WpKdNU58FYyEOlUiVOJ_peQ=w628-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna - bezpłatna' AND address = 'Krakowskie Przedmieście 87/89, 01-195 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noediCFP3G57urTkE4C-5lwqHFNdF0e--39SMoU6of3wfHU5pb9e1oghXuHCox8RR3EnZBEL9XosL59rC3TR7f6qpS_N2r-Z9p42rITSxyuliLXfQzHjcJJN7XD2xuzB0B1lLvYag=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna - bezpłatna' AND address = 'Krakowskie Przedmieście 87/89, 01-195 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cv1FhCF6fstlwPbJ1PgI1A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=126.268745&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna - bezpłatna' AND address = 'Krakowskie Przedmieście 87/89, 01-195 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np5pbfhSw5dUgMbP9omrsCMKULBdL637wOXDjt9JtV8UhXfJKo-dAn9HosUFVXg3GjPyzUOqx1e8xhAzDo_Q_1JjQrTnWgEGHlWOvUfpmOBUYNj0oZXerU13VWs8CV13vt7Ovd9=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Regulska, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rrWsBrn8_ifmycmT72qQ2A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=352.3429&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Regulska, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Wc
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nooStI2NtXEagdesxq0y0eEfcQTrKnLyVXDvXFdeOCIBIHCP9plxjNGyIPq14U40gBhEhq2-lNvwq3nPlcxB02kdB2FFPYaSBv68qiFL67n3-7pfq7f4CxV3VIl6ObHAjna3efzmg=w224-h319-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wc' AND address = 'Unnamed Road, 05-850' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=7dToOm1Sa3EmCA3InSM-Jw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=353.9658&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wc' AND address = 'Unnamed Road, 05-850' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety Westfield Arkadia
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrzUoDUSqDfUFL34TJP48M8Vj2MiaZ_pduSUhxnA3thgZTI5Y2bCyVL-2Jc5ZTVxCDjFLT9BuxNcONCvXPEmtg2ZuWQ53qhJdXvFEM1Neir-4dwRmxq38V-HATdBexMzE-nPfYelQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Westfield Arkadia' AND address = 'al. Jana Pawła II 82, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npDlRVeSsSflZBMQ_b_QbqX5jiMFsMXkbmscAgKPZ3a1rQRllXtgiGn920GftRnCz7olanDePyWo8egEyTOLG91Ri8qsi6CJdhdHFwVJhnLPzuzuX3ADXaVKuqg0i82BOPTWwgARA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Westfield Arkadia' AND address = 'al. Jana Pawła II 82, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=5i2mfH3xufVs32osMDgQag&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=164.4868&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Westfield Arkadia' AND address = 'al. Jana Pawła II 82, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq3z4lvLAxUEBCYc6qsWjDvg0Q9agjIS8I9Nt3b--N4W7bq9ooEumG_1PzJryyuIXfXHN4U77moVBLwDmb_c4kX5vGvzgnBBfETNpQp2sA8y_qBagvqBrYLtz35CAzL_XpVvS-h=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=dTdb30XxRMF8V_DdmY4BrA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=96.17512&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npfiCeeyWKIffp8RNVkphJyXF7P9M4H6kBJNGomePkotdkQt1hhyh_Bn1z2CedKbIT-3-l8Yt2mRsP1pdNBH1bTZyeF3CSfTxDRDEQrb53G899tq_-8K1_rk0NA3HR4GJU6Ry_n=w224-h354-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Rynek 1, 64-100 Leszno' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=GU_Cuq4sexY4KEfRDAQjxw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=270.04645&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Rynek 1, 64-100 Leszno' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Y0KWKNY0Wm2rMSqdNjFVOw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=32.117928&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Nowy Rynek 33, 64-100 Leszno' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Y0KWKNY0Wm2rMSqdNjFVOw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=32.117928&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Nowy Rynek 33, 64-100 Leszno' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr6D-xplO1dVaS_Exwhte-VeJpCo0zz7JRAuHeHN4YOLkwJT70QcASt7JYYKIcMtfqRSH3ZZka8v7J0n_fx9_F9HtJRsv6TdMTAAdM53rEQptjlEkRJ39pMVCqFqOP0aNL_84pJkmSgQiiA=w557-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '99-314 Krzyżanów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=qQHD9_8rP_xQywZ4JuSDGA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=278.04706&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '99-314 Krzyżanów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=f3MUEnjR3nUq3nVTmvDemw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=278.72598&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Romualda Traugutta 2, 96-500 Sochaczew' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=f3MUEnjR3nUq3nVTmvDemw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=278.72598&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Romualda Traugutta 2, 96-500 Sochaczew' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Bezpłatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2W9DXl-4C_ys6aOrQQJJTA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=125.53367&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Bezpłatna' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2W9DXl-4C_ys6aOrQQJJTA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=125.53367&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Bezpłatna' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pEt3sFVdGSA2lfYB87b7CQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180.9193&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pEt3sFVdGSA2lfYB87b7CQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180.9193&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1kVDUGe-EDVUz5OV09VrMA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=103.33082&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Łopuszańska 22, 02-220 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1kVDUGe-EDVUz5OV09VrMA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=103.33082&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Łopuszańska 22, 02-220 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqAzquWuW8ldjjfPjl_eV1MR92midwGjHVkDo-5iIM_k5SinWBBR7F-rZgT7TqMCRwci1Z69UxyXdxmcUsGV-hbXqhpemBYqFG2R7fFmqXNQxQuYpc7HXdnahD2Gnter_4h-siT=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety WC' AND address = 'Henryka Sienkiewicza 19, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np5ZjdDoMAFy0eT2b1tTczGiKu60-22HEAzL91XYL_K3pR9E88I7SCcxUMjtKlChAhQ_13TM3LhTSDiSxOYaOo2upg9nLGEiceKQetrrxJjm3DD0behzcQQCkv1JnNDDiLqO70f5w=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety WC' AND address = 'Henryka Sienkiewicza 19, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=9r7aRW9aOHuXyqYRkL2XKA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=297.687&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety WC' AND address = 'Henryka Sienkiewicza 19, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna bezpłatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YESu1cgthRccV3VidwChfg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=339.53284&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna bezpłatna' AND address = 'plac Czerwca 1976 Roku 1, 02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YESu1cgthRccV3VidwChfg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=339.53284&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna bezpłatna' AND address = 'plac Czerwca 1976 Roku 1, 02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-7pD_GQUHzLrcGrsjyX7jw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=74.12026&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-7pD_GQUHzLrcGrsjyX7jw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=74.12026&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna w Parku Kombatantów
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjH9ZMDli2uQWffpc2kNkFmrlskPS2LG6W_Vmqw2RqxDlZppcGYpXyLu440x4MWt9K2LlNIAv1oM7n9khbqLyofttUrhBz-Xa3fakawVk00NDSaUHSixG49x23XekQGa4BkE_G=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna w Parku Kombatantów' AND address = 'Obrońców Pokoju, 02-435 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Kvlz4UmW8cywayuX9_JPtg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=221.9372&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna w Parku Kombatantów' AND address = 'Obrońców Pokoju, 02-435 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nozsh6MUBmEVVNCYrO48Ji456VilDa_nqPZoVowxKpyxWhDTp9kJUvbc6jPgrutUAKBTm4PLAO85wJxI7e7mJvDUnxXtdWQ7M8Ji66_F_I_Rpdm-Sxx4k6zTFxauX7U7W-WjPcmqA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Daleka 16, 05-802 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=M1_ijQZHFynN8RZpS5vRYA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=259.70407&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Daleka 16, 05-802 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zuEBqVkXgzJxkTd13Pjjig&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=279.1869&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zuEBqVkXgzJxkTd13Pjjig&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=279.1869&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta mejska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=w2i4yWTNT7uwjy3Nr0JByA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=332.26785&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta mejska' AND address = 'Fryderyka Chopina 30, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=w2i4yWTNT7uwjy3Nr0JByA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=332.26785&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta mejska' AND address = 'Fryderyka Chopina 30, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Miejska toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrl9-zcPxPtP1DM33bdNkRvyozN4g8w-PRKcfIDbQCyQbRqIo9-pbSRu8K4BeDM2_FXhGmGOhhH-36SyjHwukr9Zat2PFoxG_pNBDptii4zwJySgLLMfN7l1feq6-PrykBrrygnnQ=w224-h312-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Miejska toaleta publiczna' AND address = 'Unnamed Road, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=5qUeiXeZXRjDhqhn3VHWCw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=124.149536&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Miejska toaleta publiczna' AND address = 'Unnamed Road, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna (bezpłatna)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bnO_hBA1A8WoAWqVPXEHfw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=122.393166&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (bezpłatna)' AND address = 'Gładka 18, 02-172 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bnO_hBA1A8WoAWqVPXEHfw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=122.393166&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (bezpłatna)' AND address = 'Gładka 18, 02-172 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq71hhPAFoEVbJf_gKYw-HvfG1F5_96rxQ_VVJ0uSGcbq_rUxW-3EZ4fW1U1tbVamdbedouxrhdx5wXBM1MGctP7sKQaXhEMESBl4STOmb92QPfzXg6qrOImZoHblQh1JV2c06v=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Stefana Jaronia Kowalskiego 31, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=v6_WngtQCLGuBlz8j5TkuQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=77.25368&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '02-479 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=v6_WngtQCLGuBlz8j5TkuQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=77.25368&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '02-479 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqSKTKeeAqKhkQWhpPSU8dtnPhWFJN70Xdx55j7WkICgieTxnUbb76zL0XxHoYpiG2ActIwm-DP8HypVWgygyyr376TTaoXFtIaiXu9To1iCyeyIGUkP0zyok1rBFUld01mGuZOuQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Aleja Antoniego Nowakowskiego, 01-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_jlqyoFt_7FPcqY6F9fUYw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=285.97208&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Aleja Antoniego Nowakowskiego, 01-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nplvMUt9Jyo4fWgh46A8KgrGNws0-XoI34D-x-Hz-olLHJtNL_qfBNqPIVVYKTcMLQUgbgPzjIzr0jEKQTaB8kSBb1fWQyLMGo-zzGi9C2euFIOOKve6W1rH8lCe63lFA696-ying=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Sierakowskiego, 05-509 Piaseczno' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F8l-D0lVhFw_cNHaS4jicQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=263.75595&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Sierakowskiego, 05-509 Piaseczno' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nohyYgLpN9hXZZAlZ5I33ICilq8UAa1SOfLTxcSNKWkO11OV5RgH7E648WjyjIQ9uM1TjLZpQIs23poz1S6hfYE21T_cyWPqgGYcJCBRcvafhuSzGhAte97tcRCmz24VI1eKqXTJA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Piaseczyńska, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Ośrodek Leczenia Uzależnień pod wezwaniem Kamila Chujowskiego
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=IJszLWib-jyC6ocj7UpOAw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=339.49667&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Ośrodek Leczenia Uzależnień pod wezwaniem Kamila Chujowskiego' AND address = 'Księdza Ignacego Skorupki 81A, 05-091 Ząbki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=IJszLWib-jyC6ocj7UpOAw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=339.49667&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Ośrodek Leczenia Uzależnień pod wezwaniem Kamila Chujowskiego' AND address = 'Księdza Ignacego Skorupki 81A, 05-091 Ząbki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqbmQCk4qwI-bizzMshygLgiDSRRdXwS-AyglTct8H3AW4PEvmNG4DMebnFfrEUzlMDaYAxI2iNj3WMJwc1KtWgLo9Uqki5Y2C0XH84mncpLTicTao98mBVWhFQFR2RSs4-OBI-HQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '05-091 Ząbki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TX6V-ZlOTvNg2QFw-VP27w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=320.5587&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '05-091 Ząbki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrxlopqfKUgqZLomOeZd7XY5Pf-VMWJCTV7C5ax5ZZro47a0EeSiX0wDivqwwJbaSuZ0a0AVZcL0MgSDW3HpHt1tXcMinCDHD9cpuZymeQbKSsiczND1h56KbS_zZt0K98nQcAx=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '05-091 Ząbki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Samoobsługowa myjnia dla psów
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqJZq1Z0kC-EGOwgcAtuYTFvcq_ZK5Qa_k_NuAz2g67FefWEzKMiKrONNj171xQs2zSyl_MAq3h24ZVRRaSUU-vvqj48uRxynCAP0hDz7SngH38Ti8leq71CIHga4byuUx6_FKk=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Samoobsługowa myjnia dla psów' AND address = 'Powstańców 66, 05-091 Ząbki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nofqgMgRM79H5Tvp_kxhQ_HJkbSxBo7qyK8WVzL0A6dskVpZr6I3UTLaGGPeca2Nlsrgd0ZgDeBNhS6XMVO0Wa1aaSSrx47TArZSlMiPHnU2ywglZePen1eRAaUKK7GUfMau74h=w241-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Samoobsługowa myjnia dla psów' AND address = 'Powstańców 66, 05-091 Ząbki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wWxsCFTnG_TXYl6oCZ37ug&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=151.3613&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Samoobsługowa myjnia dla psów' AND address = 'Powstańców 66, 05-091 Ząbki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC toilet
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=I3slB5xRrpk6ZbY8A_fbcg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=344.9086&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC toilet' AND address = 'Malborska 39, 03-286 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=I3slB5xRrpk6ZbY8A_fbcg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=344.9086&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC toilet' AND address = 'Malborska 39, 03-286 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=GEpX8MntFtait16cwt2Ecw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.7413&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=GEpX8MntFtait16cwt2Ecw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.7413&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npHm3OnOv0htu2yPyfwfuXnFqkeXNjBxdoKU8OKCmXQsR95kEcz3fYDpILKjutEq2G8iREYdC9EZak2nPMiODfIPyHVpfjR8ohnXa13IppcZQNkG_UHhXL9wp1ZnpRtbAm8HI6T=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Pułkowa 60, 01-969 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=MiHl-NKNbjNoJQnBrZAPmw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=135.25684&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Pułkowa 60, 01-969 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqyceTvR1xe_xMg_KnLLpD2ixMkCcf9nQrv_Yrl8SNrc0N4nBDNiyVo13TXmPfRvNJeNVgXicY4K8vAGIH6ojINECbvwnW_8As7qjG9WYqNFUDGW3n-V3NpjKLZVioRl7HJW7a1=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Pułkowa 60, 01-969 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta na placu zabaw
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrvI1kU1kFTZRDaEaR8DxL786wpkVN6VsENuUGbBs2GreVI3kkrBKnJ-VJfEzfGWhvoo9MN1Em4o4E4q5N2M6ypRPUJfUPhJ0-Nc_-KjvfqmU9BK6qkRydCFA8Y8eQp1dPlH6XiCA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta na placu zabaw' AND address = 'Józefa Przyłuskiego 2, 05-092 Łomianki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CLlJ2c8M3mLYBNHBPEm-6Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=31.945456&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta na placu zabaw' AND address = 'Józefa Przyłuskiego 2, 05-092 Łomianki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqkvGG8LXlrCdYJlvkKHs_lEWlYjoS1PIAkHeYQ1op7CqhmRNm19MrvbsZU6O-4Ape7vt9tWYZ2jud2ah0UVKL27XO3bz_7mnjJMX86HuEN6S6Evd-07oLt86OG2--mPShnlPEr=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta na placu zabaw' AND address = 'Józefa Przyłuskiego 2, 05-092 Łomianki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna (bezpłatna)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Op_8obpruMrwHk0Y7DRXKg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=295.13474&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (bezpłatna)' AND address = 'Modlińska 197, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Op_8obpruMrwHk0Y7DRXKg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=295.13474&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (bezpłatna)' AND address = 'Modlińska 197, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=l3lMJ4n53iDNu2g0KCtPWw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=164.85834&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Wyszogrodzka 4, 05-170 Zakroczym' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=l3lMJ4n53iDNu2g0KCtPWw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=164.85834&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Wyszogrodzka 4, 05-170 Zakroczym' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC (Szalet Miejski)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqB5Rs_RtlAM45nrNs3xXdfgM8YawTXONqrenB4ClMIygdZ5fAlt_gzhSQiaLJITNVPerWMRMe2mr33atDh8_TgKpdQs1mnljAsHk-Gy8gd1_yUN9SUoPPAkxunOg-3LnyF2YyQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC (Szalet Miejski)' AND address = '100, Zakroczymska 36, 05-100 Nowy Dwór Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nsVXuGtLuoT3k-pBjJm-tg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=91.04199&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC (Szalet Miejski)' AND address = '100, Zakroczymska 36, 05-100 Nowy Dwór Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=30E6jcSha82wXjNofc2yAQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=236.9096&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '05-230 Kobyłka' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=30E6jcSha82wXjNofc2yAQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=236.9096&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '05-230 Kobyłka' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=0IPPPgHvUqnWbFFJPP0CJw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=40.189465&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Tadeusza Kościuszki 8a, 05-120 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=0IPPPgHvUqnWbFFJPP0CJw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=40.189465&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Tadeusza Kościuszki 8a, 05-120 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WIyQtwleIFvUo2BaAd20Xw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=77.889656&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Zegrzyńska 115, 05-119 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WIyQtwleIFvUo2BaAd20Xw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=77.889656&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Zegrzyńska 115, 05-119 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqwHEZEaBWb3N4nyJbD8gqSs8z4RNjf1iukqq7gtAuUacvGVhjZdop34gB8V6XYj-I0XEe3WKtWsLj4l6YDCqmrScrYWQUqj226-__kJ6UwNyquySb7Qol3MUWQywhamOkOEmQuLw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '05-120 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=77a-uFbVJ9csQ2HReoYkGA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=276.68625&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '05-120 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=i5tIcTpVucuCcOsmmtJA8A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=4.963238&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Gdańska 05-120, 05-120 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=i5tIcTpVucuCcOsmmtJA8A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=4.963238&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Gdańska 05-120, 05-120 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cb3obnjHA35BRSF7i1oCMA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=146.83466&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Generała Józefa Sowińskiego 9, 05-120 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cb3obnjHA35BRSF7i1oCMA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=146.83466&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Generała Józefa Sowińskiego 9, 05-120 Legionowo' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npuCUO984DRAJZwauD0aKERgHxTUFp-RnbITzcxyObn52G54lDz3J_0tHpgNFxTlw0q_ckjumil21teDKALdQp1yau5M60HgM1A3-8U6FEzZYlQQIVI7gdvsavr-CuKjuS9XItabA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Długa 5-3, 05-126, 05-126 Michałów-Reginów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=eIPQDa5yeMzsef1phmF05w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=164.52673&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Długa 5-3, 05-126, 05-126 Michałów-Reginów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC KING
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN8BPo1HLt9Fp_YgDiVbkpPR9rZQKXeUkBER4Sl=w827-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC KING' AND address = 'Kościelna 1, 05-126 Kąty Węgierskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN8BPo1HLt9Fp_YgDiVbkpPR9rZQKXeUkBER4Sl=w827-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC KING' AND address = 'Kościelna 1, 05-126 Kąty Węgierskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=OhRRm-4BMYNhT_6i66D86w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=278.31738&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC KING' AND address = 'Kościelna 1, 05-126 Kąty Węgierskie' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrM9PcAQKLfiphUEasvcpn_i_AHInZ4-Xl2HpqfCtM94TRdQpjszOwEZdv9xdzGmVEwH64XsczWIaWeSFlo1zy7kOaW7NcJ1tH5qGWQ5CSHxJzD-mP5TM9GcuSduTG0RV48ROs=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '05-126 Nieporęt' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrM9PcAQKLfiphUEasvcpn_i_AHInZ4-Xl2HpqfCtM94TRdQpjszOwEZdv9xdzGmVEwH64XsczWIaWeSFlo1zy7kOaW7NcJ1tH5qGWQ5CSHxJzD-mP5TM9GcuSduTG0RV48ROs=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '05-126 Nieporęt' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=uvNlwz9zuQzqpq0xAp-QCA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=94.28142&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'Retmańska 2, 05-140 Serock' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=uvNlwz9zuQzqpq0xAp-QCA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=94.28142&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'Retmańska 2, 05-140 Serock' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Szalet Miejski w Serocku
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqUFwT2mn2MTd4Or0poDNU0loWgFvA6Js4salMwUNF2Ji3nauPE72iVLc9jMEvd_eJo97WdjpO-asCaeLHD2lIzIkCRw1uoQvwiSYNJhCpkBKHezooRxFAF4jiYyaf-PMmJAYfM6Q=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet Miejski w Serocku' AND address = 'Pułtuska 33, 05-140 Serock' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=9I3gyOyHWZwbHxqtqV2KVg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=24.928162&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet Miejski w Serocku' AND address = 'Pułtuska 33, 05-140 Serock' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=McfNjYDP6n3zCHRqAE5JBg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=121.12774&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Smoszewo 6, 05-170 Smoszewo' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=McfNjYDP6n3zCHRqAE5JBg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=121.12774&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Smoszewo 6, 05-170 Smoszewo' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Automatyczna toaleta publiczna (płatna)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrE6EEWBN9JzU87jukZlO-1S7ceO9gJV80KV5PvCa9lDeXaOWNlvSmonM0ACqKPbWDmmokK88_AiACiY7Q4jikQa_pa5t6cSVrHg3CbI9-323GQodAMlTOEAclG1_a6w5gX37I-3g=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Automatyczna toaleta publiczna (płatna)' AND address = 'Józefa Lewartowskiego 10, 00-169 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=4w3MvApuT0MyglZmqsA12A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=145.90317&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Automatyczna toaleta publiczna (płatna)' AND address = 'Józefa Lewartowskiego 10, 00-169 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC, toaleta, pisuar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjG-QUaIob59cePbgBjG64ajaLTrSiqrZhMF0WCKr50zUbGDI037YwTOJFPadXPJuC5KuNoavsnr1iIcc3aLXlYQYQkUw0OU3FBvhVLu44-D9F0RfHothOeiA7fyeL_jNW1hL-=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta, pisuar' AND address = 'Bolesława Prusa 61, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UDWTrLKsUGN6L64PLQ4l0g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=7.289921&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta, pisuar' AND address = 'Bolesława Prusa 61, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety Podziemne
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr54dELQ2g8AXhto7kO5Ih9TSMo1QllPUFFykgKofSXFazIMXzT_FF7Et9OcjANYevvcyaE7tHWgUOj0c9zVMR3bE3Xn0S8hZJPyLRGGy5r1XlGFU2WuIrABoM2Yt-l2fSB9OFa8Q=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Podziemne' AND address = 'Plac Solny, 50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqWi4DlpgOX0C7Zq_x2Ccd4uw-NzTTw_qQ6-aeo-lt3wMT6ZfxAVgijMbVBUZQUbxQi4Sk7UNRdVuafB-RFfXbbOZvmnpWqcWUqXJX8EJm1bsmajAjByqFFkyEeU5r8ydUwKGrS=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Podziemne' AND address = 'Plac Solny, 50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npBm8VQws-Ezadzb-U1wk9a5EAav--aBPmI0c13SN8mD_sJuqXMz1GW5IT8p7ZRckSoPJvBiuQrorJb8p02ZV9t33JmmTqeDK51BL4KjjuHJDHtDThYZxsJsWSsscfXy4miVMdPaA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Podziemne' AND address = 'Plac Solny, 50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=JNojUj-grt3nT4OkoIpy0A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=120.219444&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety Podziemne' AND address = 'Plac Solny, 50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=0B7baM7NO1bmF1hw-AgprQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.2083&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = '05-180 Janowo' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=0B7baM7NO1bmF1hw-AgprQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.2083&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = '05-180 Janowo' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Publiczna toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=oKLaLGf5V91m7RPA7q3RDA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=109.040825&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Publiczna toaleta' AND address = 'Zygmunta Modzelewskiego 83, 02-679 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=oKLaLGf5V91m7RPA7q3RDA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=109.040825&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Publiczna toaleta' AND address = 'Zygmunta Modzelewskiego 83, 02-679 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Wc
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WaZrQIWnpOXqS7GxPzyqWg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=93.217705&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wc' AND address = 'Legionów 21, 05-200 Wołomin' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WaZrQIWnpOXqS7GxPzyqWg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=93.217705&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wc' AND address = 'Legionów 21, 05-200 Wołomin' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta płatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqv2ADulAWVSPcA6IFH6Xi8Ew7EKM0jfWjHYJVg_b1KaBvtTXjDGy8uvtu5h_DnIWD53cdg3q_jYmd_jezcVi9jlcL6uB2oz_dc4xCqklkNWOkOJvDitJhDRMhXoZUjcS-EB5wu=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta płatna' AND address = 'Stanisława Augusta Poniatowskiego 14, 05-280 Jadów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=SuYS-1x3xFD5VShWY_quZA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=185.07256&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta płatna' AND address = 'Stanisława Augusta Poniatowskiego 14, 05-280 Jadów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC (Castorama)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npjrmEbolvM7KhahyImeXSnU9z41MIEph0BzMsANb27IFnwD-_rrAbIFcq1B1r6-lQYkBTHP0Cc34tjZdgQY8KgRd7Et1I4EeXHzVtg5WrHjwtq3fsnZY0FD1o_P4toWuCQykARAQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC (Castorama)' AND address = 'Głębocka 15a, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Ad4i6Gu11yCc96TAcuP_IA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=289.79688&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC (Castorama)' AND address = 'Głębocka 15a, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Female Bathroom
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wegxKHR2dee2y7SlQtF6Cg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=16.52794&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Female Bathroom' AND address = 'Głębocka 15, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wegxKHR2dee2y7SlQtF6Cg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=16.52794&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Female Bathroom' AND address = 'Głębocka 15, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Female Bathroom
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2n6-alJBoLPLNsNIXrCZQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=14.438052&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Female Bathroom' AND address = 'Głębocka 15, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2n6-alJBoLPLNsNIXrCZQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=14.438052&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Female Bathroom' AND address = 'Głębocka 15, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Bezpłatna toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrsKbz4GIkFkKh_BYUdU7t-YZ0fNea2odQEVYiHcYiL79IUUfncx8YMcGoDNGahnT7vEFT5geLm25hi9ZHzkOXHgXgKWm_1KO4RU3j7qcFPivGqQhV27kJkUfILblZ-7wG8YTE=w224-h484-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bezpłatna toaleta publiczna' AND address = 'plac Piotra Szembeka 2, 04-142 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fh80KTityETTrXQqSER72A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=98.117035&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Bezpłatna toaleta publiczna' AND address = 'plac Piotra Szembeka 2, 04-142 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Hurtownia skarpetek
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrHCfzpe4fgKpZrpKxRxCO_PHxNHf8wcy9Rwz40-ngfnwj6uR5Dyv-ieiBoY6HvQ39kLOdIiMwZqBd6wiZesZm6ZgDmgAYw0giooaygIPPoehG6uYtmoIF_1BwguKgb48krJ4Vnlw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Hurtownia skarpetek' AND address = 'Stanisława Moniuszki 5, 05-220 Zielonka' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=I2fblUbU5eAWSJai9DZprA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=120.66955&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Hurtownia skarpetek' AND address = 'Stanisława Moniuszki 5, 05-220 Zielonka' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: TOI TOI
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noczyfMWnWRAySB55wSxgEPY3cbVCm-B1FuMTYeLCbNCRibXiOLvmUczm8ILi0HferXSuFJ5U96yf-M2yZ_V7_1Inb-nP-MPmj3yIkGFmNw6af7Bbf69Ufdn61lyvdSyV7kSC6T2ho0yZH3=w224-h486-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'TOI TOI' AND address = 'aleja Zieleniecka 2, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wIif6R8bhRY6GCoup0ywNw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=187.5721&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Park Nad Balatonem, Jana Nowaka-Jeziorańskiego, 03-982 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wIif6R8bhRY6GCoup0ywNw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=187.5721&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Park Nad Balatonem, Jana Nowaka-Jeziorańskiego, 03-982 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=a8MUXDmzfSVa5tZVYC7GJA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=146.90485&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Rembielińska 20, 03-352 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=a8MUXDmzfSVa5tZVYC7GJA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=146.90485&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Rembielińska 20, 03-352 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Male Bathroom
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nDXop3qVIqj4bBubmBijkw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=10.774489&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Male Bathroom' AND address = 'Głębocka 15, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nDXop3qVIqj4bBubmBijkw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=10.774489&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Male Bathroom' AND address = 'Głębocka 15, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta kompostownika 3
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-t6OkB0Lp9jfUSF-nyfZWg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=50.149895&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta kompostownika 3' AND address = 'Gimnazjum nr 2 Miejskie, Budowlana 26, 05-300 Mińsk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-t6OkB0Lp9jfUSF-nyfZWg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=50.149895&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta kompostownika 3' AND address = 'Gimnazjum nr 2 Miejskie, Budowlana 26, 05-300 Mińsk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=q86s5r3pT5if-rnGFO3MIA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=320.27994&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Nadrzeczna 4, 05-300, 05-300 Mińsk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=q86s5r3pT5if-rnGFO3MIA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=320.27994&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Nadrzeczna 4, 05-300, 05-300 Mińsk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqBSLDkh7MwDwKRi-5WgRPM4O0WWb2zTkM8YnXIlcigoeWrD3sTVljfrjSsnXqiJwl0xOcejoCSExGsaG7ONt9IUU-GKWuMyHmBJNwVuOh6m5wCrxsQj7YOb8znB4WHtXxHPHmH=w662-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Park Eleonory Czartoryskiej, 11 Listopada, 05-250 Radzymin' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1Nujk88Req3J8Cg804MUzA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=301.4252&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Park Eleonory Czartoryskiej, 11 Listopada, 05-250 Radzymin' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: 05-252 Stanisławów
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noLc5lcX9O8stNe6j24sAYBpOaSvLf24NNS7pvpM1ukp8SuO4ROtDIK0eMduypXg4jCebmUnwo2SdzW0t9pPSSYjsxThoMr-rPk1fKQNbBwETEhz72yeMA4GJmORAe-YNFRIrk=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = '05-252 Stanisławów' AND address = '05-252 Stanisławów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: 05-254 Kuligów
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npOGgbq-T7rDM5xhPeZlhjLgWLEXyCEU8jOvjt9lxgH-izpJLVo35L0mlyl35ymujGJo5iWnDQWzubwl7Tb50t7I5RMXiBXMQ-vWxG-xFtXfqh10xBFe6bkJiL97T3q15WqaztfkA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = '05-254 Kuligów' AND address = '05-254 Kuligów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqBSLDkh7MwDwKRi-5WgRPM4O0WWb2zTkM8YnXIlcigoeWrD3sTVljfrjSsnXqiJwl0xOcejoCSExGsaG7ONt9IUU-GKWuMyHmBJNwVuOh6m5wCrxsQj7YOb8znB4WHtXxHPHmH=w662-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Park Eleonory Czartoryskiej, 11 Listopada, 05-250 Radzymin' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1Nujk88Req3J8Cg804MUzA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=301.4252&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Park Eleonory Czartoryskiej, 11 Listopada, 05-250 Radzymin' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna (bezpłatna)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Nlt_bjVKlZfAzu-wesd5gA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=304.6072&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (bezpłatna)' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Nlt_bjVKlZfAzu-wesd5gA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=304.6072&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (bezpłatna)' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Male Bathroom
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2n6-alJBoLPLNsNIXrCZQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=34.433987&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Male Bathroom' AND address = 'Głębocka 15, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2n6-alJBoLPLNsNIXrCZQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=34.433987&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Male Bathroom' AND address = 'Głębocka 15, 03-287 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Automatyczna Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Pr8PgegTncx2ULZ8uM6P2A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=112.37773&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Automatyczna Toaleta Publiczna' AND address = 'Solec, 03-901 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Pr8PgegTncx2ULZ8uM6P2A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=112.37773&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Automatyczna Toaleta Publiczna' AND address = 'Solec, 03-901 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna płatny (2zl)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npDOggblt6OzZ_9ZUgAhYX0Cbc_K6hU1ighO28Vc9Z6bquZYj90BfB3IOyOnvbg-6Bo8iCgujlrOzLxrUWZ99jPbRPQV5vHsKQHVNhiYQ-4Fj1iaiHU82EOdiTwGWYL2n33FNuC=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna płatny (2zl)' AND address = 'Samarytanka, 01-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=dTjHvEJhSSaCVBHwlkTeVg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=334.56387&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna płatny (2zl)' AND address = 'Samarytanka, 01-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta płatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqv2ADulAWVSPcA6IFH6Xi8Ew7EKM0jfWjHYJVg_b1KaBvtTXjDGy8uvtu5h_DnIWD53cdg3q_jYmd_jezcVi9jlcL6uB2oz_dc4xCqklkNWOkOJvDitJhDRMhXoZUjcS-EB5wu=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta płatna' AND address = 'Stanisława Augusta Poniatowskiego 14, 05-280 Jadów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=SuYS-1x3xFD5VShWY_quZA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=185.07256&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta płatna' AND address = 'Stanisława Augusta Poniatowskiego 14, 05-280 Jadów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Kibelek przykościelny
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nof-ATcbLeNg1ISrtAtFKWZ3efohHUi9HVmVhHj6dtxAZAzE7_mEZ9cETnpDcGATLNDmGf4aEGXnr-I0iPSfPt7HIGQyHDaoqZQfYO6VC7Qd0wnBB3S1e37ctGT_U7JCcblX8o=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kibelek przykościelny' AND address = '05-280 Sulejów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rIr96Q3GFIDtQ3xsVig9kA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=162.22952&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Kibelek przykościelny' AND address = '05-280 Sulejów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta na Dworcu
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr1_oUOmN3l4SmbGpNIyKzmqrDI7kkJf7eVtDBeds_CkDBl3_JWxQuGk06OP8D6IMN-bLSSToHaAogEvkKN-QhFIm09XNOtgx16nApj4jEV_U3Ro-_SPKYSuSqcFAWyFz9jDWKbkQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta na Dworcu' AND address = 'Marszałka Józefa Piłsudskiego 105, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC LEJEK
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPqkyPl-9EiueRwSj19ozm2pxfEe9QfwBJH_3s_=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC LEJEK' AND address = 'Żelechowska 7A, 96-321 Siestrzeń' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM3QrGhv5VygTsNHS1jHcVyUZzuyqchHJqTBFWc=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC LEJEK' AND address = 'Żelechowska 7A, 96-321 Siestrzeń' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMNPKTpGNAbbBqsE6U_gdACk7VyPCGlGa3iRl_d=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC LEJEK' AND address = 'Żelechowska 7A, 96-321 Siestrzeń' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no_U97xWvTqw1BPJGiBZDRGg6cxA1CsnKGhiJHTqQYQnev6XFnd9h2yRIIGbKeyaYUCyezT3eGUgTBogaewCktqpK_m-Iyl6_8rvd7IGxhCW8PWB_mMKv5qrxoA0VJP6i985EfNfw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC LEJEK' AND address = 'Żelechowska 7A, 96-321 Siestrzeń' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNTaSu52b-a3rT9GatEUFA_P7ze4IzkTXZ2E7Bk=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC LEJEK' AND address = 'Żelechowska 7A, 96-321 Siestrzeń' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=oJOd8tOxSpFMylNkyUs-1w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=66.35993&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC LEJEK' AND address = 'Żelechowska 7A, 96-321 Siestrzeń' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Wc
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=P-3AxMpXBVvGmjobzUYwrA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=193.82898&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wc' AND address = 'Konstytucji 3 Maja 2, 05-300 Mińsk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=P-3AxMpXBVvGmjobzUYwrA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=193.82898&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wc' AND address = 'Konstytucji 3 Maja 2, 05-300 Mińsk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqXVG3NpnTu1SQjJ0fjNjU7I3n1tyEZUhTUvguUGrMmmANYAUyDD7pz8mTDDd5Hn0WlI9lVfmM8dneUHfYgyNFsVSrZDAfcaMfVIvKl0QMADeBiYdsvaFE8KRuNI53463YFIQKpYg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'MOP Moczydła, Moczydła 80, 05-306' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ZdUN1SFLT18tR4xUAdyAlg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=348.86032&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'MOP Moczydła, Moczydła 80, 05-306' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vT2rhcusf7A55pODn94oxg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=24.760038&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Wczasowa 1, 05-540 Zalesie Górne' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vT2rhcusf7A55pODn94oxg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=24.760038&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Wczasowa 1, 05-540 Zalesie Górne' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=OfUYT56i_cT3spkIOmJT6A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=91.113594&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Okulickiego 10, 05-500 Piaseczno' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=OfUYT56i_cT3spkIOmJT6A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=91.113594&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Okulickiego 10, 05-500 Piaseczno' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna (bezpłatna)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=DY42sw2ocPRYw7nIp98LKw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=357.7395&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna (bezpłatna)' AND address = 'Franciszka Klimczaka 2, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=DY42sw2ocPRYw7nIp98LKw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=357.7395&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna (bezpłatna)' AND address = 'Franciszka Klimczaka 2, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nou19z8QJmqyyy7EcU1ZSHe0rkWoYxWk8zqrk5k3A2hl3TTeZ288QpmGEXBs5rAN0841gfquOLrxQJb_9M5qIMCt9EkPJiQAAtfCbwEXpNASkQNT2aIGf6BUZs0OEoR7vQN7JBm=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Bielawska 9, 05-520 Konstancin-Jeziorna' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=5EEfP99UNZAQfrB1R0N9Nw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=5.069881&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Bielawska 9, 05-520 Konstancin-Jeziorna' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna w Parku Zdrojowym
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npNsSfUSOeDQbeNafIynykoDP4jlTaypXkNrMCCgOasqornNr_mXarI2YSSk5sSK-qVGZ6K6B4-JNogEf9K-Vb6bRth719HRNkw0p42n08D7bKk58J9b0s_IK75sav6gUd7JaJvAg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna w Parku Zdrojowym' AND address = '05-510 Konstancin-Jeziorna' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fV4perW46ow9iJjr6uvbWg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=242.44687&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna w Parku Zdrojowym' AND address = '05-510 Konstancin-Jeziorna' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=n4VN7Vp5XcfF6Mt1f2zG4Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=189.53804&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Karczunkowska 145, 02-871 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=n4VN7Vp5XcfF6Mt1f2zG4Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=189.53804&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Karczunkowska 145, 02-871 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toilet
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xHLtGk8adgbmyi1jNA3dBQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=243.9053&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toilet' AND address = '02-958 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xHLtGk8adgbmyi1jNA3dBQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=243.9053&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toilet' AND address = '02-958 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=VsOtxyUeW_b-QKFqYaOlyQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=176.29729&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=VsOtxyUeW_b-QKFqYaOlyQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=176.29729&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npp6Uq8CIlHADThVcyDd0GYthlavLKssga4MKQ8_lViuqhJGAPUsx8t8OD_-5Dqk3KT0UCgsOsoNmnDYad6H9dd1HOfeSSxdr4_8OCBX3InT0OzEX-AEcjJhLXuNAnFIQMtSZEVaw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Park Kultury w Powsinie, Maślaków 1, 02-973 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TLkZtL64_vAE5G91rhQ6vw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=40.495735&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Warszawska 4, 05-510 Konstancin-Jeziorna' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TLkZtL64_vAE5G91rhQ6vw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=40.495735&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Warszawska 4, 05-510 Konstancin-Jeziorna' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pMZdyYQFotzPQCA5DwkqBQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=247.91904&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pMZdyYQFotzPQCA5DwkqBQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=247.91904&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Magazyn PandaBuy Poland
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-4EOveDJFkhDk5fS4fsNWA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=316.65335&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Magazyn PandaBuy Poland' AND address = 'Kusocińskiego 6, 05-500 Piaseczno' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-4EOveDJFkhDk5fS4fsNWA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=316.65335&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Magazyn PandaBuy Poland' AND address = 'Kusocińskiego 6, 05-500 Piaseczno' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=NFFlMKJiN3e7MxRJqciynw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=182.12122&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=NFFlMKJiN3e7MxRJqciynw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=182.12122&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMLXjRuykSGgup_FDeo0romJeoibQl8iIpLZ9s5=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Unnamed Road, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqxZ5amMnVx8_gjU6QVePFTJCmg61NqxIzETId86w15rVC71zQ6IK5kvaOL1mdDD20Xeght3sb2zm90dVmZqj3cY3E1dJucQUPuye8zIDv1cpf_at7uqrpDTZGiKsIymfQkepDH=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Unnamed Road, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMp-hYw6jkrTLFRajADnZUCdY0Yt1HbhgYHEicn=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Unnamed Road, 00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Miejska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrMUfMl-6_ekBIvnCsUm3j3kwrAx1L8F4eyvo-PLKflhqXnXOlYIxOpUGH1BfzZrQQYeHhAIrriN0Mvp-FAvD0qLVE70Q7QNHSevz3kv885B-G_liuEo2iqvSOsJEkyixt0lVa7hg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Miejska' AND address = '08-530 Dęblin' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XWNxijRbTPwOOB-0l6jl_Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=159.50139&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Miejska' AND address = '08-530 Dęblin' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Wc
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TIAjYZjIrMiuXAbAf65U5g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=9.890228&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Wc' AND address = 'DW805 79, 08-440 Lipówki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TIAjYZjIrMiuXAbAf65U5g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=9.890228&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Wc' AND address = 'DW805 79, 08-440 Lipówki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WCExpress.pl | Najlepsza porównywarka ofert na wynajem toalet przenośnych. Zamawiaj online 24/7
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMUqtvHGvmpHS_yhIXHgelqQyq21_XWpxScBZ43=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WCExpress.pl | Najlepsza porównywarka ofert na wynajem toalet przenośnych. Zamawiaj online 24/7' AND address = 'Wiewiórki 11, 05-506 Lesznowola' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPstkqFsc5G0U6Yw1oALzZ7Zx-PuIisyhKpDlQC=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WCExpress.pl | Najlepsza porównywarka ofert na wynajem toalet przenośnych. Zamawiaj online 24/7' AND address = 'Wiewiórki 11, 05-506 Lesznowola' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMKHDKF8MzErmqUl5easeUtm64UWTe3zn86iME3=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WCExpress.pl | Najlepsza porównywarka ofert na wynajem toalet przenośnych. Zamawiaj online 24/7' AND address = 'Wiewiórki 11, 05-506 Lesznowola' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMKHDKF8MzErmqUl5easeUtm64UWTe3zn86iME3=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WCExpress.pl | Najlepsza porównywarka ofert na wynajem toalet przenośnych. Zamawiaj online 24/7' AND address = 'Wiewiórki 11, 05-506 Lesznowola' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1s_xS3Z5COcpXvrMkMzihg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=213.0461&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WCExpress.pl | Najlepsza porównywarka ofert na wynajem toalet przenośnych. Zamawiaj online 24/7' AND address = 'Wiewiórki 11, 05-506 Lesznowola' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rMeJDPo0W8NFN5QacQRHgA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=279.5524&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Łukiska 29, 04-123 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rMeJDPo0W8NFN5QacQRHgA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=279.5524&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Łukiska 29, 04-123 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Wc
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TIAjYZjIrMiuXAbAf65U5g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=9.890228&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Wc' AND address = 'DW805 79, 08-440 Lipówki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TIAjYZjIrMiuXAbAf65U5g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=9.890228&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Wc' AND address = 'DW805 79, 08-440 Lipówki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nplvMUt9Jyo4fWgh46A8KgrGNws0-XoI34D-x-Hz-olLHJtNL_qfBNqPIVVYKTcMLQUgbgPzjIzr0jEKQTaB8kSBb1fWQyLMGo-zzGi9C2euFIOOKve6W1rH8lCe63lFA696-ying=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Sierakowskiego, 05-509 Piaseczno' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F8l-D0lVhFw_cNHaS4jicQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=263.75595&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Sierakowskiego, 05-509 Piaseczno' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rfcz9DYF9Qer3fJcaAICCQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=112.04782&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '05-077 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rfcz9DYF9Qer3fJcaAICCQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=112.04782&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = '05-077 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vEhW4yusqQx84dJe52la3g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=350.32184&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Bronisława Czecha 8147, 04-555 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vEhW4yusqQx84dJe52la3g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=350.32184&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Bronisława Czecha 8147, 04-555 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ISqbhZ2W9-lu8HXEXxONCg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=81.7767&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toi Toi' AND address = 'Dominikańska 15, 05-530 Góra Kalwaria' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ISqbhZ2W9-lu8HXEXxONCg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=81.7767&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toi Toi' AND address = 'Dominikańska 15, 05-530 Góra Kalwaria' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC (Płatne) 1zł
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PxmaTk_11v9feuP7NP0Iag&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=80.610466&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC (Płatne) 1zł' AND address = 'ks. Z. Sajny 0, 05-530 Góra Kalwaria' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PxmaTk_11v9feuP7NP0Iag&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=80.610466&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC (Płatne) 1zł' AND address = 'ks. Z. Sajny 0, 05-530 Góra Kalwaria' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrnvdUZDlF7VMm99ISnpyINo7W0D50GWtbLx3S5CXJR18pyuTwfJKpB9jG1W1Hme7jpgxISxEVw9p4fH_eCzsdGlGTCsnGYVsABpbT_qXExeAh9n4PK2nUwByG00tfeEK5lo_nI=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'Łubińska 69, 05-532 Baniocha' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqejSwCDd6mMlhB8r0WwXJ0URqKmQe1_rU_EzVw75bhlEvdQO1GBe-5k1tfVtJhqo6lCOnzvlDAWW4FNahoL5iwsE_ogdIRwyTaOzTVEFLYqSm-QTmtyH2-d86joXF3sbB0t6w=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'Łubińska 69, 05-532 Baniocha' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna na basenie miejskim
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gpELIWBxBJDW5qvVXF-lzw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=209.40541&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna na basenie miejskim' AND address = 'Pijarska 119, 05-530 Góra Kalwaria' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gpELIWBxBJDW5qvVXF-lzw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=209.40541&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna na basenie miejskim' AND address = 'Pijarska 119, 05-530 Góra Kalwaria' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lrxFgW5yErKmaaLSwmbtcA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=206.95656&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '3 Maja 10, 05-530 Góra Kalwaria' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lrxFgW5yErKmaaLSwmbtcA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=206.95656&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '3 Maja 10, 05-530 Góra Kalwaria' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Publiczne Toalety
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CGg24G_KAEsY1PwOjx0juQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=252.82777&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Publiczne Toalety' AND address = 'plac Wolności 1, 05-600 Grójec' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CGg24G_KAEsY1PwOjx0juQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=252.82777&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Publiczne Toalety' AND address = 'plac Wolności 1, 05-600 Grójec' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YQi0_ocP4aV0DzvDGjaiCA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=153.89896&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '58-260 Bielawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YQi0_ocP4aV0DzvDGjaiCA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=153.89896&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '58-260 Bielawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no5U9QgbQuAaQ8mSnXH43rgjovvXSi7FwSvrZMNpDBrAZhVUBrexMLBHaNicBCPGJUoO4MbaxHsXTJbKgIutLahQ_sI7wxvdoeoZNw7jYfmwi9fKSq16rhqQbOaiR4RFlCfvu9MlCGzGWtf=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Wojska Polskiego 39C, 58-260 Bielawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CCGq0aCvxR-o2iPQK7dtuw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=190.8581&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Wojska Polskiego 39C, 58-260 Bielawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6LfW2H5NURs53e1Qu6-1Bg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=272.9028&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Wojska Polskiego, 58-260 Bielawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6LfW2H5NURs53e1Qu6-1Bg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=272.9028&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Wojska Polskiego, 58-260 Bielawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Lhz1Qh78D5L1MvMWsrbEJg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=70.57399&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Wojska Polskiego 39b, 58-260 Bielawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Lhz1Qh78D5L1MvMWsrbEJg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=70.57399&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Wojska Polskiego 39b, 58-260 Bielawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vvVhxCmonoX1eBm2_sunyg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=299.2135&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Skowronki 26, 05-622 Skowronki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vvVhxCmonoX1eBm2_sunyg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=299.2135&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Skowronki 26, 05-622 Skowronki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Publiczne Toalety
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CGg24G_KAEsY1PwOjx0juQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=252.82777&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Publiczne Toalety' AND address = 'plac Wolności 1, 05-600 Grójec' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CGg24G_KAEsY1PwOjx0juQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=252.82777&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Publiczne Toalety' AND address = 'plac Wolności 1, 05-600 Grójec' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq-OFPV-N6vOk1RUwfjDE7ZxCp5QbiwWzeYD_FKaj1tFn9sjOJ5gtWf45NXdRok6dtAwaziJQIXgJpfu-YaHlrTP3N411dVcrHnA4hLhWDLLWOh05rZpxqrZf5GdgRYxQsvPQuW=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC' AND address = '05-800 Piastów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=jAi9Ovh4bYRVi608rFSnFQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=327.11282&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC' AND address = '05-800 Piastów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=eqgJSzBkNKXUrARbjn5asA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=306.02206&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Stefana Jaronia Kowalskiego 31, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=eqgJSzBkNKXUrARbjn5asA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=306.02206&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Stefana Jaronia Kowalskiego 31, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrzUSBxXLjln4e34XQax6ugcvsdWfR72v6D7PiVYReXrxTPQwj8yJCXvgpqVLYWCOuoUGkW2M2FEdkfZGP3ghpUUnIUUo4z4MGWyW5jFH2BPzUJpgRI_kbAzKGyuoGMM7kzaDdz=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'A2, 05-840' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CoD_-F5DY1efJ--6aHSC8Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180.31396&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'A2, 05-840' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna Bezpłatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no87QfPcx-gfrYg2Pjs_ZIVcRLj56PiLTp5hC3xxL89MkTQQip_hQ1ZeSCd7v2F4K6msAul53GdHEasAHBjbFuagMrTK1Ipzs3FAIYZMQ6f0b-zvc9rBNVnZzrj2SYV9fSRgI3S=w224-h307-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna Bezpłatna' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gt4jU2UcMxB32DKYVH6XQA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=12.467407&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Malwy, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gt4jU2UcMxB32DKYVH6XQA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=12.467407&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Malwy, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrxXKIuajWAXiZd-Nt9etj8mo_Sthw4Oqj7ZDp0HWjWRUcBzzdWDIp7bNl5axX_Pa9yZJYg5-HAzgKdo3EaLLi1dMF7BlFQYUoJtqyGDePReZXPICXAijzYzb-X_ofGe_7-xlJ_HA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Kotowice 17, 05-840 Kotowice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TfQ62paYuLw3VwyCxAg2Fg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=241.75053&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Kotowice 17, 05-840 Kotowice' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2EjvAuMI5gno3dlzyemfTg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=82.60534&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'al. Krakowska 26, 05-820 Piastów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2EjvAuMI5gno3dlzyemfTg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=82.60534&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'al. Krakowska 26, 05-820 Piastów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Przewijak plenerowy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7GoF54Cv5COps0wa4qk4_yGTWHYMRimNQ2Oh4CVH_K6H3FVnrbF78DMo0izu2zELuTLKzpYf0vOHDj2ZVT5CkYb9dDATjxkLNfniK4-64315tk2VsoFknWtgeBg2x66q2QnU_Ag=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przewijak plenerowy' AND address = 'Fryderyka Chopina 25, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vQ07NEwb2bWROU2vQ9bR7w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=99.73196&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Przewijak plenerowy' AND address = 'Fryderyka Chopina 25, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nprchLMB4ehRiAkqV7gbWnYNhQp_IuYyA_r9e6UXeigE7yvSWmMNih2wszlkWjluT0Gy_nuO450N8BQoTmccQdeStOcChruTRsQ1jKczKZXueP4PtvzdZnYWZHMs_RT0pfsLDoleQ=w303-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Henryka Sienkiewicza 2K, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=sb0sTY6L6HGDs1EDMB3CTg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=326.68454&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Henryka Sienkiewicza 2K, 05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalet płatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=e2Q6S7Nt6daSPx6zf6Wp2A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=77.48537&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalet płatna' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=e2Q6S7Nt6daSPx6zf6Wp2A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=77.48537&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalet płatna' AND address = '05-800 Pruszków' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hOLAENRKscpKPiWPS95RAw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=70.694374&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Marszałka Józefa Piłsudskiego 30, 05-822 Milanówek' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hOLAENRKscpKPiWPS95RAw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=70.694374&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Marszałka Józefa Piłsudskiego 30, 05-822 Milanówek' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna w Eko Parku
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=BSyPQs55MLXd-DdN7lWQAA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=117.83367&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna w Eko Parku' AND address = 'Wolności 19, 02-496 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=BSyPQs55MLXd-DdN7lWQAA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=117.83367&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna w Eko Parku' AND address = 'Wolności 19, 02-496 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Hg43rzpdwD6fGD5wJix7EQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=11.738305&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'Międzychodzka 22, 62-045 Pniewy' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Hg43rzpdwD6fGD5wJix7EQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=11.738305&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety' AND address = 'Międzychodzka 22, 62-045 Pniewy' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrnW-JZjSkw78d64BY7ySiy1MXPWrBgYjlVe6j2pVKcBy93pFaeP2XeidlVY8X6BGW9aQPFE6Qo8ImtLcM8QlTb2GDwuNsyGUn2SKBcGN7i_bQM2UZGZrjcsER1f0_PvQ05yCg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '90-001 Łódź' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wErjIQcealnS-ZZE5RjuZg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=115.3347&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '90-001 Łódź' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta przy przystanku
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noeTps2XBhQJN0SxT9yR7ciNYXPTSozOrGIQrMElPreQolUMCKLCoaTw3aGU2vsfsVWAy4q7Z73YspdbDx0PJOGd0yJY0ooYEmbNXS_FZlgb_TEI5jSp_AQtCkgm4V0MQuO0r6RP4NzfOLH=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta przy przystanku' AND address = '05-620 Błędów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no6sIPzMLup_G7UYFgeNh4RZgZDBftm-QII_xM-_1XqqxMzjz8AolzuyPxafwGAjKiVYZsYDHEAzQ9e9TkcoHIXWEKMX-mDKrOPYDR8eEYrS5DkaUTAVC_2Mz1MaabyIbmyxRcAsDWejck=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta przy przystanku' AND address = '05-620 Błędów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=mJ_gdRlEspXkqHvhp9pG0A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=247.27441&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta przy przystanku' AND address = '05-620 Błędów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC szalet miejski
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqwa9pdxtYZqojeuvRV3cp5p51MoRC44qP1IuoHyHpvB1i80b7uLBq-rkGc3q6qGRY-tbw0a2KgHkL4B4uiBOXEdPwhh_hqbjrIHlmlVwDfyFfa4QRwGNyx_JQZ49CZSszULLw=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC szalet miejski' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npvTa2nHyEzngfIoJ4lOv8F_-IX1MEbnkapP_r3MOzSE0JQZU6fvolbrHVP9OzywuoDN23PBRLITrQjo4vl1y4Xi4MLLDnXtP3kKQPqh0p21kIXjRj52iTSXDnmWnTrv4R6bOhv=w224-h298-k-no-pi-0-ya20-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Promyka 7, 05-830 Urzut' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npvTa2nHyEzngfIoJ4lOv8F_-IX1MEbnkapP_r3MOzSE0JQZU6fvolbrHVP9OzywuoDN23PBRLITrQjo4vl1y4Xi4MLLDnXtP3kKQPqh0p21kIXjRj52iTSXDnmWnTrv4R6bOhv=w224-h298-k-no-pi-0-ya20-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Promyka 7, 05-830 Urzut' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npHh3NfO8e43dWyqoGfOKsF2tAq8M04q0kArbHX6CIBkzDq7sT64cr6JauHvbHEV6xGo4DzDxYfaSv3RI168JywcptaXllic8a3nVeD2vmuQX4Lx582ObBnU49JEuf9gzACggpROQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Promyka 7, 05-830 Urzut' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Tron - toalety przenośne
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMukbHthnHMkQiqfYcOZjMXGLKuPEDnBCS36a9B=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC Tron - toalety przenośne' AND address = 'Wybrzeże Juliusza Słowackiego 9, 50-406 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMXb5MQvngpkKZ05WAw2M0A68c5-OSed1aZwggZ=w326-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC Tron - toalety przenośne' AND address = 'Wybrzeże Juliusza Słowackiego 9, 50-406 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=C8dVlE--IfIHnkvBA4UGrQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=251.20349&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Tron - toalety przenośne' AND address = 'Wybrzeże Juliusza Słowackiego 9, 50-406 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toalety i Prysznice
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npdJUhk4ARQ9pgZjTNerNKGRkDYJHo4JlBX5nhnEaCT4e4E3Andd7y6YWUWY54DUKefEY26jVKAwSmSFF7uHJNIjRguNQZeILIrJGJDD21Ea5gNWM4rvz3j6umpxsdJeAoK1tlEAJ4VLTc=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety i Prysznice' AND address = 'Toalety i Prysznice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nonHGfmNJseelLwKcatqFFci_WXD2-qIfBlFiMGeSzeudvC_Y6Tdu12yQXA0ga4jJZrqc-dow2oQ36P58RdmuBBF9RJclLVpNspzOKNJCTrj37tfcZTkmGDvz0BvHD40E2ZYWxhP8rfFWE=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety i Prysznice' AND address = 'Toalety i Prysznice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrIuSGGuwznQ7x0kYPo0JMyNcFRYD5rfWtGnoDAeDqZqnNGQWb4Xyz45IJ_sM3BcFOlbqbvM21wUYOXla9AdS00Ql3OW7gkoJBpZeK9dZtXd0zumsCSPcYXkjy8EmuderN3T2Y5=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety i Prysznice' AND address = 'Toalety i Prysznice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no1SqkNpXhqQheg281iQG8iG9m_Qldl-cpoNtQ-A3a2PRQHaOqG9pvQ3WlxirKKTvPipRcKUxLEFVU7DCm_9iaquD7jH3BPP8XdDsrQPW7mZ7T3Z_GYvPeRHVyDas7uWl5xW8Qt=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety i Prysznice' AND address = 'Toalety i Prysznice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ER1GwDca6wA2aIM6PD0QFw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=305.7834&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toalety i Prysznice' AND address = 'Toalety i Prysznice' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npKHJ9iPX5NJAVGZNfg14oefUcjb-xJlyMo--HXNn5H2FPrgiI0V-CuEAzWQIq1mFPAhcQjJsOCly6dF8J3gzDHLLljOET0ggLzfHvHzwiwy9oUyOSmGwRCdGL6U-uyShgC1fmU=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '98-360' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=7W6k4VSpD2sr0MFrBM7c_Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=326.78912&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '98-360' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta miejska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr5VmRaQIbxMafIWMB7nl8L6scN-XFdlFCI-3bxZwDhbnidlCCrycMoSGSP3-tGlhbui78hYYJ6NpdOt59ukzwHei1k2Z2PvlNUn2eebGXOloGczgz5ICsg9vXQeke5UEDUfB6bSQ=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta miejska' AND address = 'Słowicza 3, 05-807 Podkowa Leśna' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hss5xIbpeSWsrSgkyNWd-g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=158.63321&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta miejska' AND address = 'Słowicza 3, 05-807 Podkowa Leśna' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr96VNwt9GwNDhs01r7e6P9T0HrOGqrhpGP56hklqKAuCAALMkovg_a8d5lwTHc9Cojz_5cezQJf60kUNqzZ_AKQimGSjnzNDZC6ctX_VYhRJNqMJPWH7CyPOc1TPRCtUp0lcYJ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Elizy Orzeszkowej 5, 05-827 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-kSx91x1s-uZCfab_b3FAg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=8.612481&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Elizy Orzeszkowej 5, 05-827 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna (WC - bezpłatna)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqHE1XPXp0dUNQlQDcmZKAN9CRmwalX_-SGXM5-DzphPPIbSbTmx1TrwqWgSAKQ-sduDJ3jxWjRyseW6axz9NfJAV_JRfhcUJ4KoXHSAWePMs6edy7BY_o-Neogd8Y-t_Vzw5M0=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (WC - bezpłatna)' AND address = '05-870 Błonie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrLP7FIbpWEVH4ztcl_dDI0QqpccU5RKuUGNaamM0NhLqfZC2OQMlxV_797DAF1viIZFGvtcZqwNH4kGEhmDuT0wZ5YSm4GRHvXcLLZlYC4uQtE_sawS_faR85YfPnhTFHf2VDirw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (WC - bezpłatna)' AND address = '05-870 Błonie' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=C7bO1YiX4qbpp7b9G6nWgQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=133.23375&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Marii Skłodowskiej-Curie 5, 05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=C7bO1YiX4qbpp7b9G6nWgQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=133.23375&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Marii Skłodowskiej-Curie 5, 05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Miejska Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YV_7aR2x1urQL9PhWNBUGw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=240.56047&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Miejska Toaleta' AND address = 'Rynek 13a, 05-870 Błonie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YV_7aR2x1urQL9PhWNBUGw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=240.56047&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Miejska Toaleta' AND address = 'Rynek 13a, 05-870 Błonie' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGO3gTd3HbgQpumICaf503iWAtOpgSYDhFs5HGSAzgr_aEdS7Aq0mZpVm0KQNYDFs1i6Jbt7dR1oE3UKj5J7onyD6swdSMNQHOGjtXoSk9-vbSGman-paZtT6jBflfkZ3P46c=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Nadarzyńska 63A, 05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1Fux9T1uxMc9lR4DWxGbng&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=132.77077&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Nadarzyńska 63A, 05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta toi toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npnpAruAT25SI_X0OmYlh0LfYfrkUWbEFZj60OB9fdAJ7ueiaHM-GuoN4rNasMBMdvwCkCgeCcm3fM29qF1jFxCqMolSwGEZAdBtjdGygRRTTXHBGzlgR1UYVLGWtAw1jDcQfFEKg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta toi toi' AND address = '02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=BlogJVzBm_iJeKtB7NfJew&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=158.54082&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta toi toi' AND address = '02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Partner
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=tfY7NyBAzVz-p21aAiD8xg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=247.05942&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Partner' AND address = '02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=tfY7NyBAzVz-p21aAiD8xg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=247.05942&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Partner' AND address = '02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr-UO0SvCJpPkLAtGHSYaGuzm7feAmb-WJcFaV7jeuPKo-okO7-mESBULN3wGfhkZT5IRM6Q4KI1awsJJrr-AIXI1VuiN0rLz-um0Yyujyk8fjdWpMVeCk2ROmsbufpF_doaOJb=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-JYVwDJTmsmP47i5U1OvBg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=174.78345&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi toi' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toi Toi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pEOPRvRiDjCKIuFTOO9uKA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=106.52042&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Ryżowa, 02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=pEOPRvRiDjCKIuFTOO9uKA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=106.52042&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toi Toi' AND address = 'Ryżowa, 02-495 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UeBDSn6ZPPSLYHn3NXX_fw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=332.57474&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UeBDSn6ZPPSLYHn3NXX_fw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=332.57474&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta na dworcu w grodzisku mazowieckim
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqsVSXcdzK_SaZpEe1eCO_sgnO8dnUyqnH0lOmqNJhSA2gntWb6i-Ln6bXxSB387Ub6s1mZtBMAxgqgeww_D8CKcvo3UZjmOf2YZlSS9sJG94k8q7Hy3Tu8FwjGMt5PFpIhZWyRQh4XGiB7=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta na dworcu w grodzisku mazowieckim' AND address = '05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np2GOUvWCHJHZl9Q2wYE0GZYledel-jD_kMo6YjPe86vOy0LxZelUm9N5r2fXuSHBn2JEWknQ9aCh3pBNvFDbBVdaNMH_WldhvFVaN_0ac2nJcaiSkBZqWm3vJt2jCjIxB5IdMbJcBic7Q=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta na dworcu w grodzisku mazowieckim' AND address = '05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PDwBkRJdjwGz9TuCmymDdg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=357.3074&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta na dworcu w grodzisku mazowieckim' AND address = '05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zvKRfZwIGXGNTOTHax5b0A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=349.8224&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Emilii Plater, 05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zvKRfZwIGXGNTOTHax5b0A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=349.8224&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Emilii Plater, 05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=HCt5PYEORfR6KZLhnKpcaA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=206.79782&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Juliusza Ordona 15, 05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=HCt5PYEORfR6KZLhnKpcaA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=206.79782&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Juliusza Ordona 15, 05-825 Grodzisk Mazowiecki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna ekopark
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2B31YSv9iEm6jK_hW_BVw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=273.37485&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna ekopark' AND address = 'Marii Nietrzebki 2F, 96-300 Żyrardów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=F2B31YSv9iEm6jK_hW_BVw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=273.37485&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna ekopark' AND address = 'Marii Nietrzebki 2F, 96-300 Żyrardów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq3L5VVSOK7ay9LNUnTU9hgI5dra9VNbAeu4d0VBpkuelq9c6I1lV-DPrGVi4wcr8liUYoaoE-2lrMJEz9lAo-CvhGLG9M7sCbllVi25gCtAS_TYC2wsFbyH0TZA5PLVtH1zpiQ=w224-h407-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = '96-300 Żyrardów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=OWQCKQprPr2CW2PLgIgswQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=252.30849&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = '96-300 Żyrardów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna w Galerii Żyrardów
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RfNqAF3w1KYM9kUcellX_Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=235.13576&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna w Galerii Żyrardów' AND address = '96-300 Żyrardów' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RfNqAF3w1KYM9kUcellX_Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=235.13576&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna w Galerii Żyrardów' AND address = '96-300 Żyrardów' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XpBtXWrymxvHt5RvwEohdA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=62.906605&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Stanisława Staszica 35, 06-100 Pułtusk' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XpBtXWrymxvHt5RvwEohdA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=62.906605&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Stanisława Staszica 35, 06-100 Pułtusk' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xz3K-TX7ytyaFMYKj1nfLg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=352.30588&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Młodzieżowa 3, 06-100 Pułtusk' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xz3K-TX7ytyaFMYKj1nfLg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=352.30588&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Młodzieżowa 3, 06-100 Pułtusk' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC, toaleta, pisuar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjG-QUaIob59cePbgBjG64ajaLTrSiqrZhMF0WCKr50zUbGDI037YwTOJFPadXPJuC5KuNoavsnr1iIcc3aLXlYQYQkUw0OU3FBvhVLu44-D9F0RfHothOeiA7fyeL_jNW1hL-=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta, pisuar' AND address = 'Bolesława Prusa 61, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UDWTrLKsUGN6L64PLQ4l0g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=7.289921&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta, pisuar' AND address = 'Bolesława Prusa 61, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: 06-210 Krzyżewo Borowe
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noWAM-SFmgoROay5d8QGJu0TRePthniQDp3oKnPyvmrmlBXYd2fnzCcsjcbmzq6m_lxecjCMQz5rE6_6T8WllBAtqethKw-3y1Cgs9B0VDsAwp53aQ2M7-9T7z2amL3ZB0rlqyV=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = '06-210 Krzyżewo Borowe' AND address = '06-210 Krzyżewo Borowe' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta miejska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Z15ukUIoJieiTCqUbH3n5Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=118.22579&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta miejska' AND address = 'Kardynała Stefana Wyszyńskiego, 55-120 Oborniki Śląskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Z15ukUIoJieiTCqUbH3n5Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=118.22579&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta miejska' AND address = 'Kardynała Stefana Wyszyńskiego, 55-120 Oborniki Śląskie' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noFGI6zbZG1Gz8xbVPb9JgfDxKBVGTIzPMYOajAfAdGh17wJThpgz7Vua60nNEr35q7TUyz4DHugz_R--GuYgSKwNaN27CI_AqepjvL98fH4i3_7ZbJnURT8BwhUgY6mhWNCBHd4w=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toaleta' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noFGI6zbZG1Gz8xbVPb9JgfDxKBVGTIzPMYOajAfAdGh17wJThpgz7Vua60nNEr35q7TUyz4DHugz_R--GuYgSKwNaN27CI_AqepjvL98fH4i3_7ZbJnURT8BwhUgY6mhWNCBHd4w=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toaleta' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WeIFkJgEXFCUZfR7IPoGsA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=183.28351&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toaleta' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no99wAJ7Q6pT-mPfQi3pW5g8VQI3z9-XyEoixrnO_3bCSORabPRfVncPwbbAhDBWDDacaBPZxT1135m1-GlnRYdAwnd70xEX2FsU56B1CqvMCVvexERAvpeyyti0ldFVuLrhHRNVw=w224-h397-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'plac Klasztorny, 59-220 Legnica' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=an9zGA5AFaWuREGZv2Mubg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=33.198673&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'plac Klasztorny, 59-220 Legnica' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Publiczna Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bNVZT6qjYEM_5pixUTsiIQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=244.07747&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Publiczna Toaleta' AND address = '59-220 Legnica' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=bNVZT6qjYEM_5pixUTsiIQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=244.07747&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Publiczna Toaleta' AND address = '59-220 Legnica' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqtrErhVPIFpplPIVoh1Rxns3SyHRhTKzRqe-P48UTpkp3DiDcaLOlEL1RhHwZ9TD5su2SgGjScx_XK4e8ASsXK32C5V1Kz-QOiiHW6qUm1gJhGfqlTQsSChPAajprQWUH_QlcKdw=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Górnicza 13, 59-220 Legnica' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nD8q0rzMfrWD5ojVRs1FUg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=212.54967&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Górnicza 13, 59-220 Legnica' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noMi99SlTIMS_XmluhNBfekIdA3czuI3_MjbrGy7jB4OlmP1N2LdOVQnhfp5HBm6DXrAB_PDlpM5EjmehS0hVD2sUJ-QFDS8RAm6JyOGFHGdKz6OTRjkbmSHav-3urvQEBsZg5-=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'plac Strzegomski, 52-443 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq93DXhRV6rIvVwh-JgwRWghzcZAPCl9rf2e61ronJaaWc0vtbokxy8ZN8tKD1o8V3pYs2adbjbLNV1kTxjEN60jZjCt7HVyUtXq-w-yeSooYGevhDkEXyPar3ZFDI3AJ2OYd61=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'plac Strzegomski, 52-443 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=w28d7Y9DXe98f9T4Hw-AMg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=21.79873&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'plac Strzegomski, 52-443 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npL8Tl8NEBy4nh0MOslWN77GAiAndv05Pmd23pb79CRHrGq6Md-IdYyoYKgUIQ2v2jaMJmQM-7aCAZvJ1GfwLNQNkbmhF9ts2z6qzX4qBfflJAw8xSILFlvOcYd2hm1kosFKQjC6g=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrYFHHU8Aq3DTr9cpk_sIT5bUOULUT1RI7AYpTt5_VGWX6YXcEnrenmHC1_U937neNkuWkUjFCN86T1O1q2Q7via43Nuhktnqfb5h_8Zq79zM3a7mhi7uMM9BAtfDU_BErY1sAm=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqSP5YtuT7Zm3mv5sesL9dom3IiJMb0qOCud4eJqs9g83ZUeufsGOnuNNfm2GypvWEb41ML7VnBoUxMF7Rjqkn8yiwCRo0Dy5uKV4vHllKucNCV7cqDNLhq_5FFVl7_Z9Vv3E7uqg=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=eYl1NCFOVjDWK6HMeD1xdg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=16.532162&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=T36XwX_3pXxXmbtSL-Assg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=183.97249&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toaleta' AND address = 'Stanów Zjednoczonych 25A, 54-403 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=T36XwX_3pXxXmbtSL-Assg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=183.97249&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toaleta' AND address = 'Stanów Zjednoczonych 25A, 54-403 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna (automatyczna)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nocIJuIm42yQrZIaa0we48BjxhgAORXaqEDjuPd4PvhldDUZwgeWKBNMDOSmSwTO8t6XRyWeWEioKgd5aFhgRXLcHTcvsWhrDocUws8IQ8ZDoVJCO_npuTOjlaU5DLR22ENT7BL=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (automatyczna)' AND address = 'Pilczycka 26, 54-144 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6KkhXRe_FOqBu28IrwzgZg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=262.94125&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna (automatyczna)' AND address = 'Pilczycka 26, 54-144 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=96DO5eRc55dTnqfZQzUSIg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=238.47348&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '55-100 Trzebnica' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=96DO5eRc55dTnqfZQzUSIg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=238.47348&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '55-100 Trzebnica' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta miejska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Z15ukUIoJieiTCqUbH3n5Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=118.22579&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta miejska' AND address = 'Kardynała Stefana Wyszyńskiego, 55-120 Oborniki Śląskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Z15ukUIoJieiTCqUbH3n5Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=118.22579&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta miejska' AND address = 'Kardynała Stefana Wyszyńskiego, 55-120 Oborniki Śląskie' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npHiFUYt8cbDXhOE_VMp-aye6FPrQyAkVutCu_CqHOKsOCkC57hd-gagd8oFp-zKhQ3N1CU2kJ7NCx1Lc287_KqQDdV2arpC3gB_i2Zuc-36J8WBUX2AwggHmvN65WUL2iCoI40=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Turkusowa 45, 71-899 Szczecin' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-ZQQVZVTPd1oz64JZaBoDw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=64.630066&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Turkusowa 45, 71-899 Szczecin' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4now1yHj8pjlcBbSVX8WQu_3fbTmxjj7RfZv-aVnZFBgIcE2uwOIflWHhCdUIpF9cKQ-h42Osi2JhJL0arnaDrTJwS5tAc_RnCVQUYwuAnwxLfMU2mmjOdrLzsDpMcEU3EeEjzly=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '83-250' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nphIwWyS1lRRahn0Y4OelSWz-PdTM4IkYMcA6j35_z0rmzxpXPMtSXXCUNWRGzRQgHNMUy9bN4BW8ezorpV39UCwjAx7-sakM6UtkTWBKJWrp52sHKuAW6I2XbZJ4KfxVxHtp_0=w445-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '83-250' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqE3rieZCgawzdgqvzTxArYt4kEm2enRnvPhBmQuVMTYSvvV6jm4vYDuG5-HSooHiJaSHzUnEckOYh-DXfLJcV0h_PAlWRniNTft2d6GcSIIE4p9AgZtizVjCa1A1VI20kuFDFspQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '83-250' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PrBi5ux3wXNuIJkI5oufgQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=279.60565&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '83-250' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr5KjOO9uGRY8F2NyhgpwQ7nCWl9cVHZPv8xXj7F_pfO4g3JwZYwUKFHVmTPcUqGeyWqPSW1O5bZY3J7hSlOQnJTX-jGaFiBomDj65d-QiwmPl_1HKkme8wKxjnKBUlCGRVw0bM=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '87-853 Włocławek' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noo0k8pm_1JWop0FvDPqykoOcAS2Ku_Vi6S6gBObr0bHKF92YLQx9KbwuOmNdqMzXopQSx15JNJdj2a2327A1MrFTO_-t744wUw-S7bp1566qAaPAZZeVUpoly9JvPt3WEeZyejpq3T4Pnd=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '87-853 Włocławek' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npOMzU68eFEgpfPvoTLcevMSDBylt_AqHje2c3tMmz7-I1XZYkNnBYm-elrtFjUkQ1heBLw-9IudWuwhZKnBsz5D1d1AzCbR_2Bi7aGWGZvcgoVrf2swcPMYZoUxBT0fSkPYP1KWZj3iQVj=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '87-853 Włocławek' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noPQyUvJMHR51z6UcdmHrC6azJr6kUNK_q8qpjEO1bfo9KvIhUlKhmnzCYzFWLj5qBBYKEqLVqB6BcnRQGf1CpVKEQbnjDWPEgqOYRhs5R4f4XKnCKalObuvXo3K4Lgw8Y553o_hLh6vzV2=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '87-853 Włocławek' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4novXyvhPTZ3GrEX9s_SujUoEB0hVitnONdxq23br7g75ikcDeN-KtPGaxsAyALzMUMrTOEjkU16Kozeo287lct3mjLXpNPSdzT6D_-7FgNV3akEsbBSqlQd8s6WFCL1uBiD12SlXg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '87-853 Włocławek' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fUEsaIvvMnZlszcpzFC_jQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=0.29394993&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = '87-853 Włocławek' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrWuyDCbKajaYVOtwBMWtp3ukDMcZehbJszrpZvCvZiMinOREJ6v1Anfp6BMR3y76ovQRbm2sO-McDqLlV4RxqdgMPfnhe66-yMR5U6qZlGGFyKYhc2wWl1s8wp4UYHdtnHi-3emA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = '12-122 Narty' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta w Metrze
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npovLzkj-2i_-ubHbVzA18GbnVVgKKbWTQeThaom1FWI8FoyS33jDyIZ4tC3YUTnBTz7XPLqa9vu1UaT66XYAJWXpm-pQB-QioeMPBG7M9nI3Yi4NI3wxccZFUp-Y_uoRkPM412Jw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra Plac Wilsona' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npovLzkj-2i_-ubHbVzA18GbnVVgKKbWTQeThaom1FWI8FoyS33jDyIZ4tC3YUTnBTz7XPLqa9vu1UaT66XYAJWXpm-pQB-QioeMPBG7M9nI3Yi4NI3wxccZFUp-Y_uoRkPM412Jw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra Plac Wilsona' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gu2GaPctor3NeOaoxfn7Sg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=298.38342&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta w Metrze' AND address = 'Stacja Metra Plac Wilsona' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Szalet Miejski
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr_RXLsHv0wGil7PqshDHX1pAvmKBqobcm1LgSWzg-5LOsAWkHttwIN5aCO9DvcD7JMHzeq8c6yaF-GQ7rp2q197W10WHtZuFzAr1TKbZUFmno3cAe-0pi0BIhcc5JmPmiqlCXYhg=w641-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet Miejski' AND address = 'Gen. Ludwika Bogusławskiego 19, 07-410 Ostrołęka' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=uYFx1BGAeBfTmakjlYU72g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=98.376625&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet Miejski' AND address = 'Gen. Ludwika Bogusławskiego 19, 07-410 Ostrołęka' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npa7hVZoabJxPert8vV49qj06qBa2mbXjvwla6CAS9VXtdkZmn4T4NLq-QCCbS4aKGAL-W1_yk6wT15f582CJ84HjHZhKMQv1XF1sMnmX-dXEhtUcwbSzGV85uzAQ0J8o3uPauZdA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Łazienki Królewskie, Al. Ujazdowskie, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqwCzgREcTB63-oiR-vNNBArAxvah9wyAmyPTnXuqX17zisWhoLLObKwSjdns3YekZwc2aU9zb1I55zg1zSjrXqUNe32m0nS1RO17O_vyGeW7A1I9-OLWUN7m4USyTv6aYhHDD-qO6E3Dt8=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Łazienki Królewskie, Al. Ujazdowskie, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zA37PvvBEU64h_TC6p8T1Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=43.315548&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Łazienki Królewskie, Al. Ujazdowskie, Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqS5oUhYs0N6MmytdDg8GgN8H_srgSWHJgV3V7zBPMM36X3CTGI8Rm-UcZ49wrv109SIeiS4SrISXyPExCHZDgyGXGvqPMcS9S6MWpsBc6dwtolnedRXV7fSUrLpSJnFpTIQH2oLd0_M6Sh=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'C239+R4 Toaleta, 42-584 Dobieszowice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npEZeQX8FogIxBQvc_sCRiyDde4f1-bJj4hMzGwq1_DQyGoojzlSQ1oMKhDChha4y3ugYoOMkfJmz3hbZ1iIPoBDNGXWZoPTcieosabOeJ9abeIP_SYXSru8Mm4tJqeOsHjMXTN91Q8BGM=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'C239+R4 Toaleta, 42-584 Dobieszowice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npEZeQX8FogIxBQvc_sCRiyDde4f1-bJj4hMzGwq1_DQyGoojzlSQ1oMKhDChha4y3ugYoOMkfJmz3hbZ1iIPoBDNGXWZoPTcieosabOeJ9abeIP_SYXSru8Mm4tJqeOsHjMXTN91Q8BGM=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'C239+R4 Toaleta, 42-584 Dobieszowice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=9vvXKodbfqYzOhG51VKJ0A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=165.78252&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'C239+R4 Toaleta, 42-584 Dobieszowice' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noVyaCp_lF-U3BT0EE1403VDg_LYX3GmTRomMgnSBN5Lz-bNTAjEpW-C7VHKBDXRKSwelN8gY9QyEeawa0rYt8hVDeiZL7wtQE4k1ytu5dahJBd3d0j-vhqq23vbKy0sDtcSxij=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'aleja ks. Janusza Stanisława Pasierba, 00-401 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrdU3UMGXAk68IeNwf2-hXmcorrb2aklkli1QG1pltfRMHNMEEjhYwMm9SP-QD756o2jmKQ4kQCh-prJADtXOJSG8K8u14FOQp3HwdB74VmnTzrv7DH5CniHxnZ6xvB9v_LEAO9=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'aleja ks. Janusza Stanisława Pasierba, 00-401 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RzkomhRyPsr6hRLvyn_bXg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=99.6661&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'aleja ks. Janusza Stanisława Pasierba, 00-401 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PdJEcX_geLgUlCOzHQW7xw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=320.87622&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Marii Konopnickiej 2, 58-320 Walim' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PdJEcX_geLgUlCOzHQW7xw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=320.87622&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta' AND address = 'Marii Konopnickiej 2, 58-320 Walim' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=iNmH6WfpwjsvON43_AUtZg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.02756&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Kościelna 4a, 47-364 Komorniki' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=iNmH6WfpwjsvON43_AUtZg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.02756&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Kościelna 4a, 47-364 Komorniki' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ras4JUscVjGI2lpPb4zIeQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=271.38937&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'CH Blue City, Al. Jerozolimskie 179, 02-222 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ras4JUscVjGI2lpPb4zIeQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=271.38937&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'CH Blue City, Al. Jerozolimskie 179, 02-222 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC, toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqOySfOCYvnzpVcIqiGLlx4q8DJzCU1dxFyWVxaeOKzI9WHxS0RiBMSpc7LIxQwFMewwiqCNCREoDFbfJ5VJmD9H3ry6aQW3AQlRjIB-QwGcgqD-lM2CWelzj2nStMYVz_8OMwBcw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta' AND address = 'Edwarda Przymuszały 4, 64-200 Wolsztyn' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-EXkWjmI1rFvEyTOOOUTUA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=351.11484&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta' AND address = 'Edwarda Przymuszały 4, 64-200 Wolsztyn' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Cgw6AE0DZMZt_RKAqmAVPg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=68.0613&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Adama Mickiewicza 5, 18-230 Ciechanowiec' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Cgw6AE0DZMZt_RKAqmAVPg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=68.0613&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Adama Mickiewicza 5, 18-230 Ciechanowiec' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXHDaP1M6yifyUlMkLDPJGGboaXHylujCU_lzTe42yvaITZRjlYYv2WxAjtf8_y8ivLND71q1Bt7msqBEZiisgKvLM4FgPiODyj1X7vbmtq5WixweWjUF-CfdBKVtXKB4r79Q=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr2zoKafN1N7PEK33Vbxahk_-zMjoFOZT1MZJaLJHtGBJN6AP1fZaOU_eaoESn1sUIDxBQMRYjOZ3JD9i6xaR2NfjAxxViTCrT8vG8BP4RMhVImWibZuGV9xsuyKEUawQeaB8OZHA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YcOaGcPex1kd5kbpyCYjlw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=253.48479&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Miejskie
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npxATeWyRKmrAP3EAHMbx_Sn7Qx3gGEs4ILldtW5xYEYISsv2hWIOoy7SyZ3VWmjJSEhQ61e4HyJKPyj-6Kz3vgbm_HqnvHHI6hgmpHQyiZgGn0Uga306xjc7IbwMqqmUGb_oai=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC Miejskie' AND address = 'Jedności Narodowej 185/191, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_JSVfLWQH8oubxrDNlkbzA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=2.3346577&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Miejskie' AND address = 'Jedności Narodowej 185/191, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta miejska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrFmSO1AWoiRCPaWeuah9wQdAeeyjKC6-2ighrz3K8fQS10XQEvCVstt9A3ROexuTPtoxCPC8mGZQJcfOnMV27s5YJMKSg1GvCZannlkgQWWPv6MlCJuADdrMqTpfVmFeeLoqld=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta miejska' AND address = 'aleja Cytadelowców, 61-001 Poznań' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC, toaleta, pisuar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjG-QUaIob59cePbgBjG64ajaLTrSiqrZhMF0WCKr50zUbGDI037YwTOJFPadXPJuC5KuNoavsnr1iIcc3aLXlYQYQkUw0OU3FBvhVLu44-D9F0RfHothOeiA7fyeL_jNW1hL-=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta, pisuar' AND address = 'Bolesława Prusa 61, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UDWTrLKsUGN6L64PLQ4l0g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=7.289921&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta, pisuar' AND address = 'Bolesława Prusa 61, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;


EXCEPTION WHEN OTHERS THEN
RAISE NOTICE 'Error Name:%', SQLERRM;
RAISE NOTICE 'Error State:%', SQLSTATE;
GET STACKED DIAGNOSTICS l_context = PG_EXCEPTION_CONTEXT;
RAISE NOTICE 'ERROR:%', l_context;
END;
$$;

-- Summary: 265 WC locations processed, 1 skipped