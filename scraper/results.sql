-- Import WC data from CSV
-- Generated on: 2025-07-01T09:39:38.600Z
-- Source file: results.csv
-- User ID: cac878bb-3f77-42a7-9221-919238bfae76
-- Created by: public@sviete.pl
DO $$
DECLARE
l_context text;
BEGIN

-- WC #1: Stacja Paliw ORLEN
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw ORLEN', 'Tęczowa 5, 53-601 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNjrQbV0mCVyOnU5lvsEfck6htAREbA_7Z-BAtL=w408-h306-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.018194, 51.106712)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #2: Circle K
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Circle K', 'Romana Dmowskiego 5, 50-203 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np96YrT5uDCgyB0Iyy8fJk_cVzsgxSnm8GmIFPaPr8oYM1zoUWj8f4heKQyQEuEJsIO1e-L2fA44gwg8w7XdRgQvZb9KWRxlMLLwYWKNgF9AZIEVmC9fojJAb_LYMRRU0eBcnbrzxsz7UR5=w408-h306-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.021664, 51.117145)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #3: Stacja Paliw ORLEN
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw ORLEN', 'Grabiszyńska 187, 53-234 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPtmMLtS4EXF3TQagPGHGOedPhrBjqWTMxfvX6y=w501-h240-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 7, ST_Point(16.992823, 51.098058)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #4: Circle K
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Circle K', 'Sucha 15C, 50-086 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrbBUngfyZbp6REHWN1w0B0jbeenXJefUkNX0Aq7_1ezRLu3p2amQ6GMmlef1pnYr3EppsQHVuRYLtbpKayy_JTBmcu9YUGGmWScLWHEvVUyPzCpWBk2McIJ5-DbrTXiS7tiQ0=w425-h240-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.039986, 51.096172)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #5: Stacja Paliw ORLEN
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw ORLEN', 'Księcia Witolda 55, 50-203 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOeN37TzJ9hOiFz8Bq42WeDwgY1TYdk_ERPOXVE=w410-h240-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.022956, 51.116392)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #6: bp
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'bp', 'Krakowska 6/7, 50-425 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr65cIBdcljq8CEpldeZhrh6-15Wp1n7Br03ZBW_cO1dxnZEsYV_3fr5C9-hNoWOArvEaadXsibyxibYJclNqZDBczBHDHA9IVZVdhQqVbtT6oVC-0C4RHFxKyZXTtzAdwBkTsd=w408-h306-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.05672, 51.0953)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #7: Stacja Paliw E.Leclerc
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw E.Leclerc', '2-4, Zakładowa, 50-231 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nppe8jOdl3WfrnIXjtBKRo8Oy_3j5JQnc_lNvaJEmIq2UCUNmoNgTimDve52Ean-ZgSF5LYEVA5tg8XbQbRmK3SDaqI9XC_vt5TITj9IGTdYuWCQ_tKkE2iD-yAFq7SeCulvzZF0w=w408-h305-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.03875, 51.130215)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #8: Stacja Paliw ORLEN
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw ORLEN', 'Plac ks. Stanisława Staszica 6A, 50-221 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipP2NdO-pMaE6g-ankkz91sFWXwe_pxgKDajKhGJ=w408-h328-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 9, ST_Point(17.029606, 51.123321)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #9: MOYA Stacja Paliw
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'MOYA Stacja Paliw', 'Długa 47A, 53-633 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqNv6lnta0_8AFp-6COSg_xJFyGOI4-n8SGHQclCbqsdpwh7Hk7C0HDnpgATVW5NH9XJm_TXipLzSbh_KTNceBWDd0eGgdPZzwCqrm3RHuNLUMQMSxBgWUBkdY4nnK3Wq6MgXzBjg=w408-h544-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.014179, 51.120435)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #10: Stacja Paliw ORLEN
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw ORLEN', 'Jedności Narodowej 156, 50-303 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPV0vB1MR4iApNxrQNfH0hht4fRXDIR1-dvI_kk=w508-h240-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.046451, 51.126682)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #11: Stacja Paliw ORLEN
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw ORLEN', 'Krakowska 11, 50-424 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPeOd1_rUmk6DaHLFFz5cOH4rkLAc8m8EqTJViU=w448-h240-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.057635, 51.094605)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #12: bp
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'bp', 'Słubicka 18, 53-615 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqzHHMeHu199r4Ms67NS0ojHIzaVndhVSN-FPGa7jsRS__TOdXzjxCfaLA4ngNNoCAMizrYKMXkXQZAXgjwuAYJuBsrVh3mHcHDXwSpLjU3ZWql4EdBfZBPNZ_fDyMtTI5XLdi0=w408-h306-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.000025, 51.117774)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #13: Stacja Paliw ORLEN
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw ORLEN', 'Ślężna 129A, 53-301 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPaWdyyxDyceMo35Qgc24roFcTJn2WaMNtxCJrw=w464-h240-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.02476, 51.084427)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #14: Gas Station
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Gas Station', 'Romana Dmowskiego 5, 50-203 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=stbxvgWs1xRPPF1QoJdkcA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=33.28626&pitch=0&thumbfov=100', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 10, ST_Point(17.021652, 51.117189)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #15: Circle K
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Circle K', 'Braniborska 84, 53-680 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no93MV5wFtOntHHmoNpPad50XI8CJFbzmN7bIfU2h2AmrOtV3tSwDQfp2TZZiktKIeOZfZCeBav2-Ak79-rp847CPmQD5B9SJ_HXF6x3d-n3Tm02-H9MolyZ88K13WoGZqWgUGr4ur3YMQ8=w408-h306-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.006191, 51.111832)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #16: MYJNIA SAMOOBSŁUGOWA INWASH
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'MYJNIA SAMOOBSŁUGOWA INWASH', 'Tęczowa 51, 53-601 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq8efWNvEZ4lXdfK-tmMbCvZdnRv8a5SvlHMhpTtdTYI48JBOB_H5KpdofvaMsfRPzFc4_y0A5iFENgv9gTflJFaIbb2XfJ05YMtR8yqMUBH6uOOz6SCxTnLMIuZBQG_sxaeOQCfw=w408-h544-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 9, ST_Point(17.013399, 51.105401)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #17: Stacja Paliw MOL
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw MOL', 'Trzebnicka 39/41, 50-231 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq-B7Wy0tsxzLpe0T2f2gdNJ2EapjDGNUjt-Lj6idg2mh4LtLMEKejaPFsJ8umWFvoTwjB2DdC69j5owNkfdj6VPvGccvoEQ_QgricxxZSTBPrmL8eoUgbKwdtfZ8YA-MFcwaRPaA=w408-h306-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.037571, 51.130409)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #18: Myjnia bezdotykowa 24h
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Myjnia bezdotykowa 24h', 'Długa 37, 53-633 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np8WptgbftUEpSw_gE7n6MIUMADaI9mhIX2qYcZ3YodUF7qIfOaYT_G6gYVCEIg7fXAIRRjSZ4d07aMytKYrVOlUnTAmcQZWJgyAfHAa-iEofFMez7bTB1B4WlSVm8spdAR1bgV=w408-h464-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 7, ST_Point(17.014249, 51.120117)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #19: Stacja Paliw ORLEN
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stacja Paliw ORLEN', 'Curie-Skłodowskiej 14, 50-381 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPuwq3XIngJPTE5HQM2RM5pMJ4BAzJupJv6aMuA=w464-h240-k-no', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 8, ST_Point(17.058467, 51.112217)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #20: BlueBerryOil - Oddział we Wrocławiu
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'BlueBerryOil - Oddział we Wrocławiu', 'Grabarska 1, 50-079 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=SgR2VMsAT8BdrqKQ4BJonA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=280.0678&pitch=0&thumbfov=100', '99eee902-3fd3-4761-9fb3-f7af6c8f7281', 1, ST_Point(17.024948, 51.111058)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #21: Kaffe Bageri Stockholm
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Kaffe Bageri Stockholm', 'Nożownicza 37, 50-147 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqWhhqNVd0uZJI9lPuzLkzs_wQ0gF5HHcvQKUj3vSBCzsVrZhJgna4b97e5H2GGadtPj2ZBRcUxDZSQunAdUBrtpZkwlFCKtqgzPwjn0oUBtsIg-D4c9n-DfbnLwgnIweQrJnLzSQ=w408-h544-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.036568, 51.111804)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #22: Chmiel kawę - Specialty Coffee Concept
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Chmiel kawę - Specialty Coffee Concept', 'Szewska 27A, 50-139 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNB1mo7G2XPS8HPeI8CrtfIJ1EfWQ0uxA87Av3t=w408-h510-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.035236, 51.11136)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #23: BANANA KAWIARNIA
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'BANANA KAWIARNIA', 'Hugona Kołłątaja 29, 50-004 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPUtxCde_1A7I-NO0lrmDuUENpKhfI74j3uBQAj=w408-h306-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.037126, 51.102557)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #24: Kocia Kawiarnia "Cat&Alice"
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Kocia Kawiarnia "Cat&Alice"', 'Igielna 14/15, 50-117 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPcXRgPkqr3_wRiw2esLfDV-KtnBU1BEpxJTJu7=w408-h408-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.032096, 51.11148)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #25: cafe rozrusznik
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'cafe rozrusznik', 'Wojciecha Cybulskiego 15, 50-205 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrF23zkT3CTyMj1T5V9WCYKL6srPowv0xwdfvtuTAjrYiHfmGIqku0szb81ebBpeHYxyrTW-Ycv0jHz2MLjFeoA2VpdF6Cpbva_Hg7iDK2SX1uRbFu-FESWI3rynPQXwhWcEp5j=w408-h306-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.031215, 51.11672)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #26: Cafe Równik
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Cafe Równik', 'Jedności Narodowej 47, 50-260 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOUli3hHpNQTwPdNNkJrQNxoMkxXzFZ7YJZ1oRs=w426-h240-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.038821, 51.119195)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #27: Cafe Targowa
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Cafe Targowa', 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNfOZSO6AnskyEJDx-Nu7Ar6J7xyUxYnNYz3vWC=w426-h240-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.040693, 51.112579)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #28: El Gato Specialty Coffee Roasters
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'El Gato Specialty Coffee Roasters', 'Odrzańska 8/1, 50-113 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOShGFXxTtq-Og_P-gw1Gi9EwxDdjM5zPpCx-7e=w425-h240-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.031398, 51.112206)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #29: OTO Coffee Bar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'OTO Coffee Bar', 'Świętego Antoniego 28, 50-073 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noBjWA3gkIpT1JL6F5hemQcWffDscf_eh5mcmen9tjn-YWvxjgDjMGqFGtu82WodRsGRr1MN69GnNRJJpfnWW-tHix9HfLEZb7Sl33NGiKYZJeqJqLu4frNh6I9GBwwpDGqxv_r=w408-h544-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.024554, 51.109349)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #30: Kawiarenka św. Jadwigi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Kawiarenka św. Jadwigi', 'Świętego Marcina 12, 50-327 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipMYLPHtKlalKQGfc01d2sA0uyP-vyknyJKyo-aI=w408-h271-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.043437, 51.115943)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #31: Cherubinowy Wędrowiec
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Cherubinowy Wędrowiec', 'plac Nankiera 17a, 50-140 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nroLWO0bG2l4YHfXInEaBLWavJuZWBHSjGDXlV3grlQtRegccZFJ_s9yMSV8FZiE6ZwgIS_Kvb1SaHZAbZvWsWGEi6HbGpz6ajobSzKh1a0wBRJUXMPLKa8hDQ0UPN8dooUcdJ7=w408-h544-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.036593, 51.113195)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #32: Parrot Coffee
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Parrot Coffee', 'Generała Józefa Bema 2, 50-265 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqzQ3i2_MZNIjoQdSt-5deuA4BwFoSqE6D6zyDkJztvgJIEZjJ4K5yCKH5UOrJcDXIr4DQHoR-3O9l2czRJkVwapDYIt6uzObpMo0Sd33yOVFmYobZQBr8o4bo-bYr-nGiJ_31JBA=w408-h306-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.041745, 51.117555)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #33: Baldachim Kawiarnia
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Baldachim Kawiarnia', 'Świętej Jadwigi 9/1A, 50-266 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipO37A_QDbeOW4RGoV1lfjioYlcooD-EUVzIObPI=w408-h544-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.040788, 51.115222)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #34: ARTCAF
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'ARTCAF', 'Braniborska 10e, 53-680 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrI13BHEjuNptJz_D4lz5-YTET1iYMM9EOMFS0vwomm6WfP9xex0VUcHKIfGO7THmgePSo9m5dCXVBwSomLGflbW1kV-hA0SbdCf8SAmMckTYOmcIsUwDOFdphpkgrc4mJont34NQ=w408-h544-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.012996, 51.110104)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #35: Fama cafe
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Fama cafe', 'Bolesława Prusa 51A, 50-317 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOuMcSxk4E3j_jhTKQWEEelw8fU_WQlWDzSesGB=w408-h544-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.053221, 51.119164)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #36: NIECAFE
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'NIECAFE', 'Tęczowa 1, 53-601 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipN46fwkAUBE9VNoconFLglD4YRVH3pHrrttkHFR=w408-h725-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 10, ST_Point(17.018783, 51.107013)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #37: Vinyl Cafe
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Vinyl Cafe', 'Kotlarska 35/36, 50-120 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNSI1j0i0skUgUNaHLz88OKHKAibExBPqJgYebr=w408-h306-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 9, ST_Point(17.032643, 51.111728)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #38: Kofeina
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Kofeina', 'Szewska 68, 50-139 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOew7cTI5LkOeOuAsQmfwvWg1B6pqCnBuA0_6xE=w408-h544-k-no', '0f3bfa86-0bcf-430c-b2aa-285bc7c3478c', 10, ST_Point(17.034755, 51.110686)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #39: lotos - centrum handlowe
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'lotos - centrum handlowe', 'Grabiszyńska 3, 53-503 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npX78qBcpjqSg97BB08ci4eJrEOmGNJp8WiD1UD_la6MY7X_av2rGg3WK64UW-YPeV8gkHzFyG8J0yZrrZ2EVQ7QSipMiEi1mNIDRJdTsSHuO8cSjU3qRpKe8ombu8oWzIR6KV-=w408-h544-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.021173, 51.104577)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #40: Centrum Handlowe Auchan Bielany Wrocławskie
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Centrum Handlowe Auchan Bielany Wrocławskie', 'Francuska 6, 55-040 Bielany Wrocławskie', 'https://lh3.googleusercontent.com/p/AF1QipN-SLgRJZMgjbYfasn8kqvwdPNN8W3SEmJqCvi7=w408-h306-k-no', '359bc108-832d-47a7-a5de-581da2726272', 9, ST_Point(16.971785, 51.053396)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #41: Galeria Dominikańska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Galeria Dominikańska', 'plac Dominikański 3, 50-159 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipP_Bqr1eApTbf-5n_XqrTL3bAJoTULyjevzliGj=w426-h240-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.039349, 51.10812)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #42: Renoma
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Renoma', 'Świdnicka 40, 50-024 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPF9hnxlL7tkvN7AlXLNYhdKk9uquzQKPKPIUAb=w408-h272-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.031966, 51.103857)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #43: Pasaż Zielińskiego
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Pasaż Zielińskiego', 'Swobodna 37, 50-088 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqksOo6ADee85kay3V1c023as3YgALxDCTxB2yZXbMI_CFrMVF_vvYWef9_Ykp-A90wnBp8dykYl_FLYs5fE8Bxp1LfeAGoNj_7d8yoV8_xkPcWXsDRLiO2aC7HjoGbphFG-01M6nvbEx-M=w425-h240-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.024922, 51.100044)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #44: Pasaż Grunwaldzki
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Pasaż Grunwaldzki', 'plac Grunwaldzki 22, 50-363 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqghWOIiC_TfJGF1DRulq5LGlmAqU1Lbk-2pugfhPO6nURnB9rOu6jZGdhFseqgcTXopyHgAlXhyX5E6LcX8FaIWMbNk5vOcIWg6hQvH5s5UX9UKNq0PK9ONeRrU9WHjhvwTbEg=w408-h306-k-no', '359bc108-832d-47a7-a5de-581da2726272', 9, ST_Point(17.05972, 51.112156)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #45: Wroclavia
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Wroclavia', 'Sucha 1, 50-086 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqH7nF_KKmBOkpHcQI9ky2sxLCRlzSaN93zSiacPgnb0jXgzdH0EI3KSXPqphwF3akNs8aS6kxCUEwbehNBhPGCvrPu9ZlK_llo1DVhxcczkmX-1J1jALxSK-eo3wFQHTg5a6p0WA=w408-h306-k-no', '359bc108-832d-47a7-a5de-581da2726272', 9, ST_Point(17.034842, 51.096431)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #46: Szewska Center
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Szewska Center', 'Szewska 3a, 50-053 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noCRcI-HTjKofqzcRbdmLSZUHEx5HI4OPz9t3s0NHfnujLw53eT--hNWVlWREX-oE2dYPFtU_WJJWlnHlrjpd0XLP1uSiEdxLx2zlgiAhJTkMXDiI2AVjr1D7_EwEnz7yTkovI4IS0gboWe=w408-h544-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.034312, 51.107857)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #47: Dom Handlowy Podwale
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dom Handlowy Podwale', 'Podwale 37/38, 50-040 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nphCLThH6savAVPsD87Qngrr3qW84z80svtQPtwwjsNSoyfeDwg1D6ubqa8KqjRiQoSyJwaYAizRDVpEPkphaVzUEtHIVTEkz_sL5tIMffEz1t501OeOUCoNIDaiOJZ7chm=w408-h541-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.029961, 51.104158)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #48: Centrum Handlowe TGG
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Centrum Handlowe TGG', 'Słubicka 18, 53-615 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNO-vRpiNwG7UCdcIyQ1oqb6zEiLs2L2qQJmSl-=w408-h306-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.00079, 51.117829)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #49: Pasaż Pod Błękitnym Słońcem
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Pasaż Pod Błękitnym Słońcem', 'Kiełbaśnicza 2, 50-108 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqkpboQoMxGT8ZdXSIuyFw_S83oZJDkLNcdQVkl5Q79VY9WzIfE4R5IbMfAaasixYsL7GIN9lIDx5cGG0iJwVCr7yZItAuNy8WwqwHy2J7SKLEv2UbKTp-GCo5upMN6hu9YNDNe=w408-h545-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.029319, 51.110218)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #50: Dom Handlowy Kameleon
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dom Handlowy Kameleon', 'Szewska 6/7, 50-139 Kameleon', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqxnf9zN7tC0FIT2iUmGR-NVwOUmfpUCRHe6O84VeZHxNealoNyQg27TtJlIF4WJ-bR0Y4v6Ert6QSIE4WJhK7eP0RAgT_N5ly75jLutdu-XrUH9JKuHc2RdzvSLMbrGPBWGDDadA=w426-h240-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.034093, 51.108551)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #51: Sky Tower
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Sky Tower', 'Powstańców Śląskich 95, 53-332 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no4byL4pyou7ikO7j1oYE95Ismgn6AuFgtKNdeYFFb2WL2eiDOGDCtDUcxe-uVvknzh9TaEvl0VgJXHU99k8Bd_DgmfsszAidRpsvSoH2LqewLpVrvXNxO3FHlaSqzXFaLb0jq4WA=w426-h240-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.01895, 51.094573)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #52: Centrum Handlowe ARENA
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Centrum Handlowe ARENA', 'Komandorska 66, 53-342 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npR5iqYHsXlOH60X2GSnz2Shsxf_vWsmWozn2liYwuaRyo-K_mNbYfkng2NOMSf3erx4mnbYwRXxJqmNyAHD2umvnlKt2ZG2nz4V4rwZmRGUc-ze31suPCSIuYHAPbVG2HdkTXU=w426-h240-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.028001, 51.094836)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #53: Centrum Handlowe Borek
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Centrum Handlowe Borek', 'al. Generała Józefa Hallera 52, 50-984 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no6z-pwKvQU3YLL_sDzxF0WfM4ivk_BxqqbgtxSU-h0wXyg81aGKtWo8PIvsN9b-OzRddkP1oEMeOdoX6GVBfxJ9T7cEbnojqm_L5kFVSZ9RV_kOzGSlMw-YSlRQ0G1VxJtCJsa=w408-h306-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(16.999819, 51.089066)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #54: Magnolia Park
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Magnolia Park', 'Legnicka 58, 54-204 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOLu8d-sezn1zHPBFrQVvbKjnbqahrw73kioBy8=w408-h240-k-no', '359bc108-832d-47a7-a5de-581da2726272', 9, ST_Point(16.989657, 51.118702)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #55: Galeria Wnętrz Domar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Galeria Wnętrz Domar', 'Braniborska 14, 53-680 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipM4GlSVKU3VVX3Ukcd6TxPP3UtOzi1L_6nONKLs=w408-h271-k-no', '359bc108-832d-47a7-a5de-581da2726272', 8, ST_Point(17.014544, 51.110489)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #56: Galeria Sylwia
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Galeria Sylwia', 'Krakowska 1, 50-424 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrRyOLWbtB2n68LbqIgvcDZf73Fg7Yp1irlinMmW5Bpdv1GtfXNEJm-FJAdjFAxJ7cSE7nwB50FMLNWNXRjxGT8TNnURJLL390-5dTK10jAqJuOSOpMHb3g2af6ApBZqsxq9IeVTQ=w428-h240-k-no', '359bc108-832d-47a7-a5de-581da2726272', 7, ST_Point(17.05511, 51.095993)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #57: Mamine Smaki
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Mamine Smaki', 'Pomorska 27, 50-216 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipM-CTwcOWgahyz09necr8VXVgfbIXsPfH6Kdulc=w408-h543-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.031959, 51.118748)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #58: Drevny Kocur OVO Wroclaw
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Drevny Kocur OVO Wroclaw', 'Podwale 83, 50-414 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipN0DwcsaMs22sIuylBOd2NepauzHv7x6z5zRlP4=w408-h507-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.042944, 51.10793)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #59: The Cork
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'The Cork', 'Igielna 14/15, 50-117 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no06UwY_l6vzzEkMirGVlbIkiI4-yiYw7QWVxgXMx_zbQuzNtT6IIhAHzAwrTvAFo5eQRmkM1mMPPk-o5wcxKUZ2j9twXh6b0dr_qSkZQTwNUVP7rx5mmgpSRu7PlAytDDGbD0=w408-h544-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.031998, 51.111376)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #60: Jolie - Brasserie Cafe
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Jolie - Brasserie Cafe', 'Plac Solny 6, 50-062 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPPy0oKLuc-xfEuhtuVHIRbOe48dwtdDsV06Rdl=w408-h544-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.02881, 51.109629)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #61: Bernard
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Bernard', 'Rynek 35, 50-102 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7OxS5LhvSOTjOvmx_DLU2Of00paF-tC09Tfe9XnQaYINwTMz7INfhxp9GZtxwBcBIBD_Bva_o9SRK6vWBxUhsI8tSbt0lW-7vrF6qAexlq0gMh8NRtnRL0Fxzv7VJs8zbFCVx=w426-h240-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.033414, 51.110003)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #62: PAMPA
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'PAMPA', 'Podwale 19/1A, 50-043 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nofr4zpBoiT2NalGA2V8TfSSIrYCWk2o3pZZmplW2GAopYQ6yjevpxJnl7Ld3qKXgtINpTJszU75u8NXro92xaiWBLtL1a7vxEs4ZS6LIY3jA72mMA-u_JXRsvm_sAM-RqIDWXL7Q=w408-h544-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.021608, 51.109294)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #63: IDA kuchnia i wino
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'IDA kuchnia i wino', 'Łazienna 4, 50-133 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPmLK1igzxhw2xwy5VR_W3jtdfUW6kaqJkZMlaZ=w408-h509-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.029053, 51.112525)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #64: Pod przykrywką
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Pod przykrywką', 'Więzienna 18/1, 50-120 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNLVzv6r0elEVH0-ufERqPLNJM6fojZv1Giikx5=w408-h725-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.032564, 51.113171)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #65: Małe co nieco
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Małe co nieco', 'Dworcowa 28/32, 50-456 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNs7Kz6iKLPrWeUxKsrFqLIuwMKRtokY4w-aH9R=w408-h264-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.039523, 51.100084)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #66: Czerwona Koza Restauracja Lokalna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Czerwona Koza Restauracja Lokalna', 'Braniborska 48, 53-680 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipMqQDkxrVPYBTsoTzpMjvEHNScKuE7VUBDk3xbd=w408-h544-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.011183, 51.111216)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #67: Restauracja przystań&marina
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Restauracja przystań&marina', 'Księcia Witolda 2, 50-202 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNxRlb-Hlc5m6SUgR5ggyKxYrR0vfPFqS1GNplI=w408-h271-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.03293, 51.114832)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #68: Gustaw Restauracja
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Gustaw Restauracja', 'ks. Piotra Skargi 18A, 50-082 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOxyli49iSRq_gV3Gkpxh85TbUl6RTIDZisoTHh=w408-h272-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.038052, 51.104906)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #69: OdNowa Bistro
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'OdNowa Bistro', 'Wojciecha Bogusławskiego 13, 50-031 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no2rU5QgUd85MEtBKX4YodNc8U23_Zn8-UJlAyGhh_aeIZIy32by6leoh7SQm_ueg6vNO_CdL06Sjr5ISja3ixBZeFdYyxsMXFmBY-rBOj8t2U1_EK_twJoHkCW0lpWjyxv_SYG=w408-h544-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.025138, 51.101078)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #70: Restauracja Bella Storia
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Restauracja Bella Storia', 'plac Wolności 4, 50-071 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNgWy9UUe6AxcqwLTqrF4U7_Y8PWLvO6J9mUyzg=w408-h544-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.029731, 51.106473)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #71: House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław', 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrAS8MMmG8Q-OlKqE4zacKjSd-comN9g9ZSvjLChgIRPdp2rfNLSVjgkBEpwJCIhHjI2FbWj_GpI90M6VwPJYEjkP997qE5r-SmDf4lReON8rhbXXT2kE-kOxLOKoj5aQoAJaWQGQ=w408-h392-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.043634, 51.106225)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #72: Restauracja Wrocławska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Restauracja Wrocławska', 'Szewska 59/60, 50-139 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipMWhUdvvKpfxRNeyp6_fyAf-g_ONqUWS05PEmbJ=w408-h544-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.034996, 51.11114)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #73: Peruwiana
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Peruwiana', 'Pawła Włodkowica 9, 50-043 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipO2HyPVuRa20wuTLa4kIiPHvvmgfG9Zo9mwMnoH=w408-h408-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.024557, 51.108297)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #74: RAGU PRACOWNIA MAKARONU
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'RAGU PRACOWNIA MAKARONU', 'Henryka Sienkiewicza 34A, 50-335 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npvqxNnq35wYshYb4NV9wXfiRk_C78t4P15ovc9u-IyeA2FhwDcJaalX4AcrltPLEB3Hsq1QYQnCTrqvFtyNQ-wWLoHGn1jYqq7CnM93wLVOwfCigYE0yBMVweD0KYKS8itNwnv=w408-h306-k-no', '850d80ab-c7c2-412c-ad08-49facc36bcd4', 9, ST_Point(17.049017, 51.117096)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #75: Toaleta bezplatna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta bezplatna', 'Skwer Wrocławianek przy ulicy Bernardyńskiej, Bernardyńska, 50-438 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npdU92AbH_VIaT_azBXq80xdp8iQuv1E1fcLNwR-IlcPDq3Jm3TGoQ_D6SrLD2TW8TrtIHh0MMtzl68s6pouOUk00a6Zih6MadG0Re7_l6vLNbMwAObZNnvZYn6FwwIKYVOJH78hA=w408-h306-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 6, ST_Point(17.042889, 51.109937)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #76: Szalet Miejski
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Szalet Miejski', 'Bożego Ciała 1, 50-001 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqSBUSdjscMwMiznZv7lJ7WZwDoM0rH335DQi5IYmthn486zUBdoMNaU4n-_jjaTfx5axVw5zgGqkG77QHLDN3K9jtwqgYWowtkZdFPd0VINRQ2ZiZBzlQEwZyUnzIDRTjT2h4=w408-h544-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 8, ST_Point(17.031657, 51.104687)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #77: WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC', '48-300 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noPIfr2Tb8F5LQoeNT6_BTmBS5_-X2aa_6skYkaVYOvVVDlFV3RCFDyJ7-NHJidLTeJbHWJgIbm4k6hd2792t9xeFZEmLYTE9AD5_N9tqCJRnwKQw_UeSBM1T4pNkfKC0flsTBRPQ=w408-h306-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 7, ST_Point(17.041608, 51.11659)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #78: Toalety Podziemne
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toalety Podziemne', 'Plac Solny, 50-079 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr54dELQ2g8AXhto7kO5Ih9TSMo1QllPUFFykgKofSXFazIMXzT_FF7Et9OcjANYevvcyaE7tHWgUOj0c9zVMR3bE3Xn0S8hZJPyLRGGy5r1XlGFU2WuIrABoM2Yt-l2fSB9OFa8Q=w408-h544-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 6, ST_Point(17.029135, 51.109689)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #79: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'Katedralna 1, 50-328 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7gSS0b1LC5iY7o4-mixPeY1jtEXfQO3AdxiocGCuqGGOHJcGQzfwNwvr6SWvAwMD1MdvJdZhBYQo_0wDiiob3Ly35Dsg_kF8evG3rYrf8cF_X3_bh7ZR_BIeBDAoS2X1Eea7K=w408-h544-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 6, ST_Point(17.043065, 51.114547)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #80: Public Toilet
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Public Toilet', 'Kładka Słodowa, kładka Słodowa, 52-007 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no-aY3mzHMdWIZXgzEtdc9A8wLEjJFQE_YCSJyRITkgsBp5K6RbOqq63JYi0y-p1QU4Zd2wtKGVBHcsd1fwI6VwS6wk5iu7LLMMZ_cguAzAoyRHzLR2mKhdXehZKOsVRwV6oQaNfw=w408-h543-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 5, ST_Point(17.035337, 51.116103)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #81: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'Wita Stwosza 40/41, 50-149 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npsUokZBZFnbsrZy8IVTj12GlxXcfUH0mv6u2SgTbGtvTrmFEf50UCXAYP11670kv9rEG4Anw9mRul2LlDSoX4eXRw_z023EV64_j4-spEk1p1-5zlNFj5ikh_TeqvgywuHbcgWFw=w408-h272-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 7, ST_Point(17.035527, 51.10996)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #82: Toaleta na Dworcu
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta na Dworcu', 'Marszałka Józefa Piłsudskiego 105, 50-001 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np9nooQvxxEXyhWLoJaVip67tl9DOfegbCEw1DASG3dkz1ezo3Y6Qz6kpplnDvGnEu7jPDRtbXEGy2ZK6NrC_2w8JLpLT92yijKsc1533mnJ2wxyQhMhVsb6Sy3_jmW1NZb2F1Kig=w408-h544-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 3, ST_Point(17.036646, 51.098984)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #83: WC Toaleta
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Toaleta', 'Henryka Sienkiewicza 23, 50-335 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_gt1zoxSBFHFKlCNuD3NZw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=190.64644&pitch=0&thumbfov=100', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 10, ST_Point(17.048675, 51.116669)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #84: WC Zb
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Zb', 'Młodych Techników 58, 53-646 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ToVMlerAlmDz_evTSdOnDw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=266.4841&pitch=0&thumbfov=100', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 1, ST_Point(17.013158, 51.118741)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #85: Darmowa toaleta WC
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Darmowa toaleta WC', 'Żabia Ścieżka 6, 50-422 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npJe7aP-vW8lCNUy1YBBMldnjak6heaV_1llgBNWZOJCbaPrqepdeYZVdDhpkpBRGJUJwC-rxCzwN4S3L-IJ3_O1tu7EmpasDSBApCyC2rm-ZGh44ta9sCinNgBcUyoIsJWt27diQ=w426-h240-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 8, ST_Point(17.055336, 51.100813)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #86: Pisuar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Pisuar', 'Katedra, 50-329 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=NVJr26wxC0ZqadSxhLmXmg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=352.49072&pitch=0&thumbfov=100', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 4, ST_Point(17.051986, 51.113718)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #87: WC Lech
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Lech', 'Podwale 57, 50-039 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=FKvUAYncIZHLKk3oNr_eew&cb_client=search.gws-prod.gps&w=408&h=240&yaw=134.1046&pitch=0&thumbfov=100', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 1, ST_Point(17.036137, 51.10378)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #88: WC Qub
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Qub', 'Świętej Marii Magdaleny 1, 50-148 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XPYuHGh9_aI7gU2kp6mYAQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=180.48201&pitch=0&thumbfov=100', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 1, ST_Point(17.035362, 51.109103)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #89: WC, toaleta, pisuar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC, toaleta, pisuar', 'Bolesława Prusa 61, Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nokRViq8JU4jBqDMRNAvZDk4QovoBAxg8MMzGUKMzlT-Y3RMcWnwuvodNsOCdOvuEm1wnNvAKCSfqhSD2Yp94B1vXBu27Vj2SyezC1U0C2tvwZLj43_LsDVaIPHFvoSARcHguoO=w408-h544-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 8, ST_Point(17.056272, 51.119634)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #90: Toaleta publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta publiczna', 'plac Strzegomski, 52-443 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrPrJIK27bjnUla_lphvL4zaTPOEagVMuubF3W9-vVhqbBAuf4nIpk8hsH7KEAsmCCzY_9c-0EpsLsb001-hiL0gXMe51AR5MNEVsuavAtXmQo2ip4T_cp_b36mC_dktUdW6Ogc=w408-h544-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 6, ST_Point(17.006647, 51.113059)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #91: Toaleta Publiczna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta Publiczna', 'skwer Pionierów Wrocławskich, 50-301 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npHPtnfcoZvgXcHvB4zH8VGXHEELlcHDZtnOZfXF4CHLjNBp8EgH9wDM2Nmghdj8W9mYfeAtRluRpJrG6RHXzLTqxvlCDXGvXyg7MFVNlbFAdwtyefSQ-uqUSgf-jJ9letYCds=w408-h305-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 8, ST_Point(17.043514, 51.121694)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #92: WC Tron - toalety przenośne
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'WC Tron - toalety przenośne', 'Wybrzeże Juliusza Słowackiego 9, 50-406 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipMukbHthnHMkQiqfYcOZjMXGLKuPEDnBCS36a9B=w408-h305-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 9, ST_Point(17.052047, 51.107807)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #93: Toaleta WC na placu Staszica
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Toaleta WC na placu Staszica', 'Plac ks. Stanisława Staszica 26, 52-007 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq2KvJCSKUnEDCx3T3i76_KI49vKQcGWbw6NpuqMch1gjP0AHTw9jiwajL3JgY9l_cFvg0iUInfMsDgABjW_joxnm_F7_BB5e1bhd1A_rJa5oF-9h-zF0M1j4AssDy0_nnyNnLf=w408-h510-k-no', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 9, ST_Point(17.030663, 51.122504)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #94: Piwnia skullera
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Piwnia skullera', 'Zachodnia 55, 53-643 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hgNa4m_gKUJGK91gCp9zQw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=24.463339&pitch=0&thumbfov=100', 'bc82df8f-91c2-495a-8d3c-d63b2a5880c9', 1, ST_Point(17.008878, 51.117241)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #95: Dworzec Główny PKP
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Główny PKP', '50-002 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nokzfDoYd3eTnKiW_WtRpB1wtFOhoYXcfP9jyzny78N5jGZuW34hxkDneQaILOonEuAlVx6sjbE51BfW4EnIBk6q8fbQNk0-dR41x0ue2cS5UYGqvfmWDpIZnso6rFI-HAUCtqc=w408-h306-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(17.03606, 51.100771)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #96: Centrum
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Centrum', '00-057 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npIFaqgEAVWpVJHHv9p6XRwI-qgcLC9LsgR4TJSdnapKrEFyUMS-Tx7J_0lIcl12xxFTBo4KUTO8p4R9E45wFUhOly8zQT8uOLfuYlEYoaX_od40g5ZYBGKk5l5-jL1QhC9gk4k=w408-h544-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(21.01021, 52.23118)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #97: Środa Śląska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Środa Śląska', '55-300 Środa Śląska', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGB48ddrUR-WXypvAuu5SjiQe4too8c5KvRGT0uL21LTZeMV0sqoHbMR4DtrSc0qY0GX5Mo3uWdbo_ltrV6fyebc_SkEJMvA6m5UiigsQ6NcLv4muyR2W83VZeCNMBuvuZDvY8rQ=w408-h324-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(16.605971, 51.189232)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #98: Rondo Daszyńskiego
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Rondo Daszyńskiego', 'rondo Daszyńskiego, 00-869 Warszawa', 'https://lh3.googleusercontent.com/p/AF1QipM7EzYXPIaI3a-9-irsUHVHbdrL6ObYalXf_4GO=w408-h271-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(20.983394, 52.230247)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #99: Stadion Narodowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stadion Narodowy', 'Sokola, 03-724 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq3J3h0p0Ushf1pWAPoM6hM9S_FJAEta9bmF70HIQdCzrGkaO1xlpbGs1o0Me7NlxAYXS7ox0GDx6u9k67LrZQwsDxr-Mp_5wbV9sMCDggFJ1tOC8Z3d9-8mHWjtk6H-x0gqfig=w426-h240-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(21.043252, 52.246957)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #100: Centrum
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Centrum', 'Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npb-_XTouyMIW9a00ciTufxhRJJlCOZS8PAEumjGC5a2ukYj-clDPDXO9guVsS5F10oBA9BeqX-7rfANPyLMb5zx-rjrlsNbs9tZiP1owF2wT7XDihjt5eX3SSnmddSmLgGuoh7=w426-h240-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(21.011392, 52.230209)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #101: Świętokrzyska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Świętokrzyska', 'Marszałkowska 0, 00-004 Warszawa', 'https://lh3.googleusercontent.com/p/AF1QipM5YwUJHYsXYPoyuyJ1MAya4sFLLSvagrsKDc7s=w408-h271-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(21.008446, 52.235234)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #102: Dworzec Gdański
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Gdański', '00-204 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noiQw-cU6--9YzjcSkxyYBhnmMtMgMQu6aRZ7SJCroCAPO2qdKmT_J-SpYJ5JiLPl0kV9apbAJsGwWZmuNR929yXdoGTChI9N_KqimY4AHD4GO2MPyvkxJ7t6cBaRsaL8TvTUUxDQ=w408-h544-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(20.994597, 52.258007)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #103: Centrum Nauki Kopernik
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Centrum Nauki Kopernik', 'Wybrzeże Kościuszkowskie, 00-347 Warszawa', 'https://lh3.googleusercontent.com/p/AF1QipOA246W-lFV-7s2edspbzIXCi4l1QKyvZO3oShl=w408-h271-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(21.031071, 52.239644)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #104: Politechnika
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Politechnika', '00-636 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nreuv79tMDCK0q8hY18iU2XIUro1hIxT--pB3o9Y74ptQw4AiBflafIiDoUkEQlJOjqOJDf275j595rw2_b13Ns6l7dLtKQYZs9k9KCBBfsC68PHnsf4I0GPhBitaWYvcomw7bS=w408-h306-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(21.01448, 52.21762)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #105: Bródno
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Bródno', '03-242 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npUjwjxwRVrTf35NPJGZDS-UCFT39lagDMnfvqNcu3wDLM9X0FQbAijeuuDURwUBWzTH-ms__QdbtQUwMMmbX7Y-5rzqjDryXNJlFSsLe5uRFDg9gAREQYkqJlEqgERuA-ArE2ivQ=w408-h543-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(21.02907, 52.29356)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #106: Wileński
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Wileński', 'al. „Solidarności” 3, 03-734 Warszawa', 'https://lh3.googleusercontent.com/p/AF1QipPxBiF4PdfYHS3CHGpVb_4O0XbBoJ1NZhaoUrU8=w408-h271-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(21.035238, 52.25418)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #107: Nowy Świat-Uniwersytet
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Nowy Świat-Uniwersytet', 'Nowy Świat 0, 00-046 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nodICw_9RvQlFSZLhf6D4Lld5AA2dMgbsZZPwsqM_7qC0VvpqMQI4fVsgyDzAOkMkQY7xHPipAhaz2W312dCTIQ6Kgcee3kKsvKQq6Xk2ItiWy2UspsAjrQ3iObpR_wXQWluIfM=w408-h273-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(21.017133, 52.236794)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #108: STACJA METRA ,,PŁOCKA"
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'STACJA METRA ,,PŁOCKA"', 'Płocka, 01-231 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq4hhlCPKm7pZM-arZUHsbVd0PChJjLQvVG-c0t1VFpb7AE3fW2YnZ4MyLB4pJflVCGkoe4xdh513qkdeezIdcxhYsFDMZOzd_LLwaf4qUaSCDTIcwHZt8SU5wt9BXPY189bSxW=w408-h544-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(20.965981, 52.232971)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #109: Pole Mokotowskie
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Pole Mokotowskie', '02-521 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no7HZhMc7fuyf-uuEWlee0E8qlI1IXVMJZqK2did1J9HvJENq3V5OGmrBqA8d-6_K8XGvoMZT-ojoqP8hQWMw7QprRF5DK_f9U9U9lITXKESuFbLRlnvZNTQIRM0AWqWXxhfC95=w408-h306-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(21.00776, 52.20858)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #110: Stare Bielany
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Stare Bielany', '01-871 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq2U_hFEu97tnBjNUISn04SOdI-a0e8n78I5RmEbYpu-TXk9y_qVzKPC7AabxJ9_xZc7Gc4mFDDFkGRTgBVsG4Eyr4QghsaGR9YqS3rWcB5Suovt-BWrYhmEDq7az4tyj3WUq0HYw=w408-h306-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(20.94926, 52.281873)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #111: Plac Wilsona
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Plac Wilsona', '00-001 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9FjGWhw_A77bN7BZpqn011gSB_H7eHw_nQKEeWeL9IOmv_12N0U9hKWwIGpwvT9mTVSy--JFw4oPHnvxbJgXoxRTLzQ-lG3jWaJM9pBllB7X1TS69HAVGPM5dz8OAMpGq0D5g=w408-h306-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(20.98413, 52.26938)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #112: Kondratowicza
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Kondratowicza', '03-291 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrlsqTBKbmKRPvn8bhBmilDJvHwWG4GOCiQ4IUDftaX8EjAC5YAtoyqvjK6TRdnoXqZ_dHqrAl3UQdCmKkiH63nzAGjuQfssOvw8h2oTboxLLxKyasF4wQ1inHHBHiSlPnfrqQ=w408-h306-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 9, ST_Point(21.05019, 52.29208)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #113: Racławicka
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Racławicka', '02-617 Warszawa', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np3h7s4aeckM_w1e_lDFqQnDOsKIO2Cvs1DJT5HfMLM31eQSfhZp3HJ7ztdL6Zzrt_p15MB9oXi2LXdDfV-Xf2DTfZL-owhP74TLOLM9gL_cRsaudmK18hikIb9_7l8iYfIjDS3=w408-h306-k-no', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(21.012146, 52.19954)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #114: Wawrzyszew
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Wawrzyszew', 'Warszawa', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=GtND2rCZo24AAAQ7LuIYjw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=180&pitch=-10&thumbfov=100', '5f2e1f2a-6138-40ec-a582-95188d1d0c27', 8, ST_Point(20.93947, 52.28637)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #115: Mistrz i Małgorzata
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Mistrz i Małgorzata', 'Wojciecha Bogusławskiego 21, 50-023 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPVURKjHEbp2vH58gfjjPNy_L6S3Na340i3QmvQ=w408-h544-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.025652, 51.100969)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #116: Barbarka
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Barbarka', 'wyspa Słodowa, 50-266 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np1pivgzf1xqPf-H0QstwVB8IF5cKfCnnQwdKf7IYc309wIxpGNn1RvDn8-qdBETQ4YVqi5pKcMNaXW5_1DD1f2cqAA6a2O7UxjZSIve4IPNYtWvA0KexxBTi1DegLW1UHDOn3uK0tia23a=w426-h240-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 8, ST_Point(17.035241, 51.11598)::GEOGRAPHY, 'bar', NOW(), NOW());

-- WC #117: Cocktail & Whisky Pub Szkocka
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Cocktail & Whisky Pub Szkocka', 'plac Orląt Lwowskich 20a, 53-605 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNhM96JpDv-W0KYUfpR8pFukJTgSC25z708lkHN=w408-h272-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.018127, 51.108193)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #118: Spritz Break
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Spritz Break', 'Odrzańska 8/1a, 50-113 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npttapV9Notq8ar3uCKp0HRcrkPoEuf7RyMdSPlnoCD1JS8zZFZwv8Sj32e-7xd-awfr_D5yYZmD0ATKIuVvBAcvkpYwV08yI0Kpx23gopv9d8Nfkow6N56no7maYiWuPEugixK=w408-h544-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.031363, 51.112179)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #119: Dziady i Koktajle
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dziady i Koktajle', 'Jatki 3/4, 50-111 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPc7PeffTRH-VwP1osbSaue6f68wkJIV6fHg5qQ=w408-h306-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 10, ST_Point(17.030621, 51.112105)::GEOGRAPHY, 'bar', NOW(), NOW());

-- WC #120: Le Barometre Bistro & Cocktail Bar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Le Barometre Bistro & Cocktail Bar', 'Rynek 42/lokal 2, 50-116 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOn87oQJYqdc_XN-32PQbCWBgtKA79st7bCpNPu=w408-h674-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.033385, 51.110751)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #121: Przedwojenna
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Przedwojenna', 'Świętego Mikołaja 81, 50-126 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrZSgB_kQvaZvot3_a-iPSqCGJgAwdjmV-a8kPskBeFDj1FKJiLox43MZ3Fl4bZWmY2fMggTMYKcVsycv-YRdguvUI9Iu2p9hZKvafEBZg4253m1PoOkQoucu2iQmphcwxhK2JAcA=w408-h543-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.030392, 51.111044)::GEOGRAPHY, 'bar', NOW(), NOW());

-- WC #122: Zagrywki
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Zagrywki', 'Wojciecha Bogusławskiego 16, 50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noop6zSGFuzAEaVjf7B3IDLTS5US_pm07dO3FnS0GHcNiFzVYjwhOW49hEF6gUEFRcXhS7vPncz9Hs45zAFOdvQCuM5r7ckuLbHRP-_xn-aWYxAWqIe5p5uJHYDllA3ULtwE5yR=w408-h306-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.030047, 51.10002)::GEOGRAPHY, 'bar', NOW(), NOW());

-- WC #123: Szklarnia
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Szklarnia', 'Ofiar Oświęcimskich 19, 50-069 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOkVrcRbomffD56FfhRzE-zbr34Zfn8hImKxPzD=w426-h240-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.031889, 51.10836)::GEOGRAPHY, 'bar', NOW(), NOW());

-- WC #124: Mały Bar u Babci Jadzi
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Mały Bar u Babci Jadzi', 'Hugona Kołłątaja 27/28, 50-529 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOr-TAY4pz3Hjh9o7ZsQGEVAsyIfwjeH0AplKao=w408-h306-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.036968, 51.102224)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #125: Proof Cocktail Bar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Proof Cocktail Bar', 'Plac Solny, 50-438 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNsh7UyHnKC2FxvkZzc3lfglucVhtRECLfaNUJ-=w408-h271-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 10, ST_Point(17.02927, 51.10932)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #126: Sztuka na Miejscu
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Sztuka na Miejscu', 'Łaciarska 4, 50-104 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipMQzJZ3OdDOl5yEM4yaiOpRSELcaS9LtYBj54_a=w408-h272-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.035206, 51.108282)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #127: Przybij Piątaka – Pub Wrocław
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Przybij Piątaka – Pub Wrocław', 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipMo6XrSrhbX265WDH9k14S2R9wOtqZq4tpypAcX=w408-h273-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.039591, 51.110257)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #128: T57 - Cocktail Bar
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'T57 - Cocktail Bar', 'Tęczowa 57, 52-007 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPr6_nqyiP-qiZyAOzCMTTy68HvYr3L1b1FKjdg=w408-h611-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 10, ST_Point(17.012761, 51.105326)::GEOGRAPHY, 'bar', NOW(), NOW());

-- WC #129: BAR NA 2 NÓŻKĘ
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'BAR NA 2 NÓŻKĘ', 'Staromłyńska 2A, 50-266 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPRkggq1ZHWQorbxjlPu1x1SRfCdXIb2pxFM_57=w408-h544-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.040143, 51.115354)::GEOGRAPHY, 'bar', NOW(), NOW());

-- WC #130: Mixturium
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Mixturium', 'Rynek 5, 50-067 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipO9-pLk0VHKK-c4PeYdb8FrBqfIyu8b8adH5h4n=w408-h544-k-no', '12e106b6-65e6-43bf-aef4-ec1f9e602740', 9, ST_Point(17.030433, 51.110552)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #131: Zamkowa
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Zamkowa', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noBokpBSF0XxWP10uDwsDRJr2btCYvYaMOy6Io4ZrWwe-_bdjyGZiIuLc-j8l_lD2nXspLzB-VaQaHr2B9ZME9tAUa6MreH8q0DU1bLsYK2m-UNplQKqyOV73UEcllE6CfEIsN5=w408-h306-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 9, ST_Point(17.029711, 51.107885)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #132: Oławska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Oławska', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noJ9vHLITFEcxOu2kcpw-VaoNeVVSrFTearbtZ5uEvuqIn2SOVipd3tcFJnMYjtbVF7wrsY53qryoa7Yn8HPkcXmOOzYjmJYZym_AS3RLEaKMrAAVoHwU2U7Z452hfLVKvpRHvVTHFix48=w408-h409-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 9, ST_Point(17.033987, 51.108635)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #133: Wita Stwosza
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Wita Stwosza', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np4KTBTl8unDJMPxg78S0Zsnv2O7DWIfCZ-msqGVI4f_umU3zbDGGxC3T8APuEz1EgEhYsC7lxUI0jupolS9iRLESkeKcSZ5jPuDsWE-pbYIJzSqP8f2vvivQ4cYpTPeaKXL1Q=w408-h272-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 9, ST_Point(17.034973, 51.110738)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #134: Świdnicka
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Świdnicka', '11-400, Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noUi6RjRsUNWeA48G1aUAPEDVFN9JCFWQyKw7sGbyXi-T5s5iMhEsJYkZHGgWoh0APQNOaxPO7leXhokw-XmfU0EURi278vclag4NNnvZawSs_OPkwY2NudNMM-FFo1Ely6qS31=w408-h490-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 9, ST_Point(17.031992, 51.107452)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #135: Świdnicka
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Świdnicka', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqD7eMvzw1iTPEzATcOOgaBSqQRRCqiN6L929G4zEGacTYVV7fsNyW7wqL4KDTqibDPkbWOjeS-fC5gKKJRJdvoMQFfZH9Eo0XIgSDhGSIEDerl6lSiZ5UOZf4VQbuJl4BVkRNz=w408-h401-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 10, ST_Point(17.031895, 51.107381)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #136: Rynek
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Rynek', '50-079 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqV-vEJgGJOTHGUDq2BYVFZY4fj-tS51sND3O4DwBGfaKHvgpaL6sls2Rogh6g8zIJwQeqBW9p7en2txw_FvkBoJH8Z7B4aOPGYTuvqZQkT1pDteBhZ5m1UIdGZHLa8k763Ky-gSw=w408-h272-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 9, ST_Point(17.026714, 51.109768)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #137: Rynek
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Rynek', '50-043 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrdkDvkPnxd47up3806-AtJDbywuTO8In8kHYvdrMkjx63wgJ8QfO4sDITPzyTFfL6cpoX1ZS1Hoin7fX-lJFGgCgqhs6ywxpIy3uwT5diFjlve6J8MQZ4-rsUCwvpburKnt-LO=w408-h306-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 9, ST_Point(17.026964, 51.111048)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #138: Ossolineum (Uniwersytecka)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Ossolineum (Uniwersytecka)', '50-120 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noK2vWIjsGLxghOO3-uBvaS04OFz0bYQN6SCGssXz_7bJRiu1_v1kYY01nmU4slcHzXWE2cR7rpT3eXkt7Gm2s1sHUncpBO_Qy-XOLQnd71u2LH0mA7x9K00TES4QDjSGC2D3U=w408-h544-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 9, ST_Point(17.035853, 51.112632)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #139: Świdnicka (Dom Europy)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Świdnicka (Dom Europy)', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npuGgGbZFn2dP4tY0_INKaOWWHyQ2jO4Ft8QICIT9NqF-u7kHlR759QwXnoch4cVxOsM5ssppBeY4O0WHI86pRyum7u6r5sWWP4JDHQCFF_Yw4hKlq-QAaeWIIvXWTZkpPG9oc=w408-h242-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 9, ST_Point(17.033413, 51.106812)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #140: Zamkowa
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Zamkowa', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npdO9Cfu34tQ9cTJ1SBc3gtvtRVdO8XI67Ol1PNlT_XWK8X1RCKPOFzmzIf9dn7FG3cNFYBeycJFJKxXF4gBcoB6AyPkWqKvde9aYUoPC2G5QZnfB9_ZJSSc1I8Lkf5F522QMdZbuYvcew=w408-h306-k-no', '19a1fede-05af-433d-9e13-6e66866680f1', 10, ST_Point(17.02935, 51.108031)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #141: Dworzec Autobusowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Autobusowy', '50-086 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqelvzyY9Gp62s14SPntt04bDYJPrluhb_L8gjr55X8Kwg-aj5tqMq9oxmpPlVCH7WhmyzyIsGrQjNo7kOw_3FdCfikv41lcq-qdDRD7C50wDFWHnbb1llE0YiJcfo8Go7bFoUg=w408-h444-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 7, ST_Point(17.036343, 51.097204)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #142: DWORZEC GŁÓWNY (Dworcowa)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'DWORZEC GŁÓWNY (Dworcowa)', '50-441 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqW95uJAymK067mhJtk8jN4AOdxJ7FkqGO8GxwenHouLnSQ68gaPZTWH3WStgCRWiHnSiF9Lbu8YG7IpPP2Jm3waDeQXIpwzTkVZOIPU5IZU838zFmUpftZUdRLfep33C3b3HtS=w426-h240-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 7, ST_Point(17.039202, 51.100278)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #143: Dworzec Główny
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Główny', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no5LrDh4mzU3B64Zv6TWYa9rsyW3Gy8oA-0pie3OigtW12j829pdahJe3_nzxQw_DAucoUjtT8MD8vwBPFENbfKqjDyzrx9uspSwPmim-jv_vv0vmRKngR6RK_xzA5EMCYF55SbHVq_URgb=w408-h412-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 9, ST_Point(17.034299, 51.099203)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #144: Dworzec Główny
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Główny', '50-002 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noT3V4ZXhymsi5b0CBYTu6IpwnPdDOPdkgrVF8tRIUP4KV5y1QTn_5HroZ_1wGqWnKsQP42OHRQ9oXuD3fU0WsIRztTNtT2-ESY6aPixSn7JcipvbEBVJiuOYRYFgCD_rnAk2rd=w408-h510-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 9, ST_Point(17.035309, 51.100002)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #145: Dworzec Główny
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Główny', '50-002 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npJUi_ouSJOe4gnFgX9C0XysmYOzhae1n4GOCoLaaz73-kFOrSncWumWPN4BodTni5cs3yGQibfahXyorsStCXeMiUfn7wucOZVV3AOdltfQsqTc4j4z2w_UXldwKgeEyuNuiOEeBZKlfYS=w408-h510-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 9, ST_Point(17.035193, 51.099621)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #146: Dworzec Główny
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Główny', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npKct4djT_I5_4vN4ejDHqkmyxM09iEkOwzUkrT0V_neX1_QoHrUc8x8H-OQN0EpDZYhMMbv7QQmbi_WLMQJZj4rYOT61c06J6386sMhOI2zjVIdWVfx2uCr_e1RLWAtfYLexHcwA=w408-h306-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 8, ST_Point(17.037263, 51.099646)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #147: Dworzec Główny (MDK)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Główny (MDK)', '50-002 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noKVilegnB7uFILwKbxLlPv8A0B1JJYUTLhS53VaCWMXyW0mHEUnxbl4wfNERKvhLMvG1Q-ypDvkoWnxOFOl_9MD46oSa4pFpvA5ybBvxrY1nuf7Qs8ifR_M3_4Jvin9opfKx-h=w426-h240-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 9, ST_Point(17.036071, 51.100729)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #148: Dworzec Autobusowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Autobusowy', '50-086 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no1HehLa_qaxZIvqhWWpUW3YD32hgvi8RNl5s1JolOrn0P6xZxXSr3CGChBXLq9LJeXMiSt51FJw3CImXcXoIOULMJNxIMElbw06MEp69qNzh0ZUqZP8W6C2lZIS5Dqs_EzrhCR=w408-h306-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 7, ST_Point(17.032777, 51.097464)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #149: Galeria Dominikańska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Galeria Dominikańska', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXLnMFa9DssG6SBI0uUJltvMwCtx3kNoD-IAnOya2u8WueNzJdRQv1Mya0KuHqxWf5hE7sHc_Hkz6jtZGK5TsWmbO4TA9wM4vpUxJ9CDmwW_Acp8fomLXwKmI1lFYjGzXkv0ze1A=w408-h408-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 8, ST_Point(17.03991, 51.108916)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #150: DWORZEC GŁÓWNY (Stawowa)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'DWORZEC GŁÓWNY (Stawowa)', '50-529 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nouqwtGXsKg9stpeePWdxp4f1Er5hw2E9qYb9qoLYvvJxN8i77bUzRTSwzX20XWk3ESA13YZGkdujdmz2fDs0fM6eMs3FUIdZFlVvk2oDj7XfWSqXIjuEqTUDf3puOKbGNwWVs1=w408-h306-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 8, ST_Point(17.033884, 51.099905)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #151: DWORZEC GŁÓWNY (Dworcowa)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'DWORZEC GŁÓWNY (Dworcowa)', '50-441 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npm_IHejauOdl4k-D7sLEOTzOFHt2_tNmi4OiqBHRkRokTAW6woh8vle0oWdmlXH-FLyUEO5YY6-NfEL4S5kkFgLuXJ5KnKCEjV6dAE-mC5TZbNJPKgfB0zt_gYfS9_zBGX20nhAGM9116q=w408-h403-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 7, ST_Point(17.040017, 51.101149)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #152: DWORZEC GŁÓWNY (Stawowa)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'DWORZEC GŁÓWNY (Stawowa)', '53-112 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npmVnl6iSYmbUPCNXDv7KcEEOthExI_UxyF6W5ofZNxH23-5AfhN77_Ym7CCEOHIqKp0JtdKhgqM0ZymgoixZugeHAATnbfR9sioWmIDKD90FDnag1pWsSzUC3n7EhSugOEhwdnfbU5XpgG=w408-h405-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 9, ST_Point(17.033382, 51.099372)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #153: DWORZEC GŁÓWNY (Dworcowa)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'DWORZEC GŁÓWNY (Dworcowa)', '50-441 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqc3N8xMQJwRwmhx9JAqR_Ez9oFtyJHqxOMiQ_Ey0S2Ge7aCn9rd7WRkwrZeZflvV4wUA7guKeEN7Clg6oZCr80YMG9d9FUtpVWhrj_76rKiD09J_zVfsw6sGqwhoC-lIC6Q-SOXZ-J-i9a=w408-h510-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 8, ST_Point(17.04038, 51.101064)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #154: Dworzec Główny
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Główny', '50-002 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noEv1MW5ItzV8qXSwHb6y5BKmlE0JigQ13ehCB0XBYM8EZl0_XpAvo1JC1dCcJpCrS5Tl3YhQv9e5S6rDiaqWg9baF2E20OrXycXCVx19vFd3JBgem_qtbQUwEQ2DRO81TLrma2az-tFels=w408-h411-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 8, ST_Point(17.035396, 51.099604)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #155: Dworzec Autobusowy WROCŁAW WROCLAVIA
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Autobusowy WROCŁAW WROCLAVIA', 'Sucha 1, 11-400 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no5Vssa651_mFGTut_bqu_fsrdVPQ_J9r3Bvv7Zb9Da_E-KLZO49vAplcjQSKBBj2mO5AdqK_qpw56cNV_Kr1gronMaKG2RRILL_hNXbZkhX_EnHWm9vmL3uV8-bPSQCCZr4NDo3w=w425-h240-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 8, ST_Point(17.035716, 51.096761)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #156: Galeria Dominikańska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Galeria Dominikańska', '50-082 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqKgMtIdUTIFkHtD_btwXwJQjYYEJHID8ii_Vgd9v_svYML_VhcqKIaCK3lYpOtRS9l8JseA2BcVDSDespggAI5V5hJkThdp_Y-0aKNQ8SxV9qUCMPYJ0HNOcbG5NvuXUKTqyhBiYhDnJcJ=w408-h499-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 9, ST_Point(17.038271, 51.106708)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #157: Przystanek Autobusowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Przystanek Autobusowy', '50-005 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=KGCtd0cuhAC4O4HoHiXCvg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=270.87344&pitch=0&thumbfov=100', 'd940352a-3377-4156-aab0-c82c2f718157', 7, ST_Point(17.036933, 51.103519)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #158: Dworzec Autobusowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Autobusowy', '50-086 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqyq1CdSkD3rwqziUV1tsaaiXzIJAQ-RKridc5_ZVphYzcoiA59RiDbxoUdUcWhA1Ut_XkcWMI9p36r25ItOUFqRjMLLSShvIJVjqLqPzSu1w0hWlRG0EDDW5Oku8Q11NUaXOQr=w408-h306-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 9, ST_Point(17.032284, 51.097268)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #159: Dworzec Autobusowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Dworzec Autobusowy', '50-086 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrtL6kD5FpMyj4O2SjyC5vq80UjpdwyjnAY-mbj_3ilzU5kfsstEd_A_BBI5DNzYB_AXk2-cVz2gcSjb99ceYr9sKag4ZEIJDNwUc1RcNKhj2oE69rvWxot_4mJccPyb8MDcrKu=w408-h306-k-no', 'd940352a-3377-4156-aab0-c82c2f718157', 8, ST_Point(17.037265, 51.097042)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #160: Port Lotniczy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Port Lotniczy', '54-530 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr1GBcmBc9CmADlLShR-C43ZM3a-LNLJhygvfX3hnebz9ukOFUA6GB2y1E5MuZQKRUKl5HFbdaKFjTiR84W-zpA9stxgM3Z8jdDstvOwyR7bqjmMOw0-qr4-YSBOzeA-4-XSit5=w408-h544-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 9, ST_Point(16.882459, 51.109393)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #161: Port Lotniczy Wrocław S.A.
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Port Lotniczy Wrocław S.A.', 'Graniczna 190, 54-530 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNp-pcFlF93mHyrMeBt50beAHW42GfAGBFyHILd=w408-h272-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 8, ST_Point(16.885428, 51.104235)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #162: Lotnisko Szymanów, Aeroklub Wrocławski
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Lotnisko Szymanów, Aeroklub Wrocławski', 'Szymanów, 51-188 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrD9u1ZtHye4sZ4ixSLY7wz4QPGQwewrL35-84LBkSM0pmEJLscFXPZ6SLix5gt4AK8k0ijlXIT9M5D1b5-SCqIw1aXlOBgDlkdhzJm3wLJNS6m9ZcybXoWeY5dD5dn_8AXlO4A=w408-h305-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 9, ST_Point(16.997387, 51.204593)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #163: Aeroklub Wrocławski
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Aeroklub Wrocławski', 'Henryka Sienkiewicza 108/110, 50-348 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqvd9COKX4BBLKU82bilHZYYHKSDtduC7VyRpEWaVzo2gRxta4k6tNlYEzzYMZtkCjAXKWGDxHZUWVCFexOkDZl893MzQsDSOv5n37lfZTr4lf8W1Yq9xgv8NYf6NTN7_qZsFal4Q=w408-h550-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 6, ST_Point(17.06031, 51.115995)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #164: Port Lotniczy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Port Lotniczy', '54-530 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npM1kMqE6JY9qcfmWNsT6ATBVcY6dD2Eq2wCUTm-3Z7z4G2nCibRZUfG8giEVKuBeHB_1KSLMMbH1BV1KjTy14ATG04hQ-4PZGj0GY0FqLHjFdrb55ZWTFhqY-kMPt-gI4Iz0K0nw=w408-h306-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 8, ST_Point(16.88239, 51.109411)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #165: Amatorskie Lotnisko Modelarskie Wroclaw modele do max 1,9kg elektryczne zakaz latania spalinami
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Amatorskie Lotnisko Modelarskie Wroclaw modele do max 1,9kg elektryczne zakaz latania spalinami', '50-001 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no1vBOgOeZxeEw8uBn5VJsKPwgRrNSqBgUQF48Bo6ezqNE7NrkGr3bPsQm7OYQGigAg8bxPVg2Wx7M6KqobxlIbaxjjCxbWlZr2-rj74lDmc3DGQT261tuGVTf7nCBy_Y9LipgX=w408-h306-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 9, ST_Point(17.121474, 51.101273)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #166: Lotniczy Dworzec Towarowy Wrocław Sp. z o.o.
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Lotniczy Dworzec Towarowy Wrocław Sp. z o.o.', 'Władysława Zarembowicza 40, 54-530 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOBnoPqqStZQfAe1D2yUjvB-rbYd-XFSMMBD9R4=w408-h306-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 8, ST_Point(16.885429, 51.107244)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #167: SkyTaxi Sp. z o.o.
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'SkyTaxi Sp. z o.o.', 'Strzegomska 48a, 53-611 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipNPs9b3_DYPd_L8i-f9Q6N927olUCVbuwpsmqGS=w408-h267-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 9, ST_Point(16.984597, 51.112566)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #168: Parking długoterminowy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Parking długoterminowy', 'Graniczna 190, 54-530 Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr-snH4k29-38SCGg7eQjG6gPiIK1BuEHJqZDmj2nnX38op5vD7KCb8XbZ5U886VEaJamwK3huDQtcl4dAttCRW56Qj7YR0ExG8GuPqYWvu-DpzMOyyjDGevawYFM0aQGn_r5n2=w408-h544-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 7, ST_Point(16.87622, 51.111111)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #169: Lotnisko Mirosławice (EPMR)
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Lotnisko Mirosławice (EPMR)', 'Aeroklub Dolnośląski, Lotnicza 14, 55-080 Mirosławice', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr9gyqyr5hY5RXyslMceO0Myh4RPTViCkk0A4BWJcMaDVZP1J-yhQ37Rl-gzfzUvlri58J6F1SVj3-iBDqJnK6TNPRMNIEI4QdUZ58T32zGCs6UyjbwNgN5xEY-N0SRX0z5C-a-=w408-h306-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 9, ST_Point(16.77031, 50.959075)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #170: Parking pod Żyrafą
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Parking pod Żyrafą', 'Rdestowa 22, 54-530 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipPdt-saUbu_oQZOm0_W-Nc6p_SDrNPca5A4JnJJ=w408-h305-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 6, ST_Point(16.887646, 51.11167)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #171: Parking Lotnisko Wrocław - Parking Strachowice
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Parking Lotnisko Wrocław - Parking Strachowice', 'Graniczna 189, 54-530 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipM6y9nzOh7CcPVl3HecXAQ7MBWw-trq6FIfP0rI=w408-h271-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 7, ST_Point(16.885965, 51.111563)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #172: Port Lotniczy
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Port Lotniczy', 'Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGkEJ5ozgHM3lTfxI4EHXtvNMNoX14tOhVkqshWYy0Uv3LEeUBmqfzyboM_pgFKsHvP-pkDhL7IDzQ1Gtk1kJXVfIJDmyzJmcYNd435cGrtfLky0mh9BFdtlQ31uClYWhZLJo=w426-h240-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 10, ST_Point(16.879911, 51.110198)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #173: Lądowisko Dla Helikopterow
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Lądowisko Dla Helikopterow', 'Weigla, Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noONEbcwp8gLoDINCd8HTQfFlawuohEdPrtDFnv6J_lvFjzhfiY1N0PnfODWUX5gs5VjRL_7AXe987QbUgn1ec9cGPplBgHXpCW87DzT7R07jCnNU5oP9U8YukpQODCrTTOQ2bn=w408-h544-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 7, ST_Point(17.020084, 51.072306)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #174: Wroclaw Airport ul. Graniczna 190
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Wroclaw Airport ul. Graniczna 190', 'Wrocław', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXFHqy6W-Ltci6qGzdZxU_YxhT3mvrfPQb_xjDCzREp1Y4KaNJ1jhkABpU2ipztx2O1R8BaLYVKW26zt7dSqs9yeNxovLPfmrHXOAVuyr8w-qsKoNOfRVFl6xjZCLEx4IWXhVs=w426-h240-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 6, ST_Point(16.880214, 51.110123)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #175: Transfery
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Transfery', 'Nowowiejska 1/21, 50-314 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rqIYHfifZTuqPlVV2NS3RA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=204.16989&pitch=0&thumbfov=100', '52790b44-46ec-4096-b2bb-af145ffec0a7', 6, ST_Point(17.045825, 51.124033)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #176: Parking Rondo Lotnisko Wrocław
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Parking Rondo Lotnisko Wrocław', 'Skarżyńskiego 2, 54-530 Wrocław', 'https://lh3.googleusercontent.com/p/AF1QipOztBFMoMc-KyPUVu1_ZK2v4X7JFC9jYlGlUtzE=w428-h240-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 8, ST_Point(16.902565, 51.109155)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #177: Lądowisko Golędzinów
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Lądowisko Golędzinów', 'DW342 28, 55-120', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqiC4OSvnjRVPIkxje1Dpdqoax_l0JT69TqH46dUyePz77YVoWRoavlNs3GSVh8oDeEA5fU3MVGXAaIKhH2rIJ-oqhDjVKca48ENCePB2a9Ac_S2NV3HYv0t9kmIoBRDD5Q0uan=w426-h240-k-no', '52790b44-46ec-4096-b2bb-af145ffec0a7', 10, ST_Point(16.925741, 51.26301)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #178: 8. Baza Lotnictwa Transportowego - Komenda Obsługi Lotniska
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', '8. Baza Lotnictwa Transportowego - Komenda Obsługi Lotniska', 'Graniczna 13, 54-530 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xXw_6mNCOCRxPDXpvmv6yw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=147.80728&pitch=0&thumbfov=100', '52790b44-46ec-4096-b2bb-af145ffec0a7', 7, ST_Point(16.908503, 51.108371)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC #179: Heliport Lądowisko dla helikopterów
INSERT INTO wcs (user_id, created_by, name, address, image_url, google_place_id, rating, location, place_type, created_at, updated_at)
VALUES ('cac878bb-3f77-42a7-9221-919238bfae76', 'public@sviete.pl', 'Heliport Lądowisko dla helikopterów', 'Generała Romualda Traugutta 118, 50-438 Wrocław', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=N2Bs6TZQ1vgSL0vW0wpwgw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=65.53822&pitch=0&thumbfov=100', '52790b44-46ec-4096-b2bb-af145ffec0a7', 1, ST_Point(17.056823, 51.099793)::GEOGRAPHY, 'toilet', NOW(), NOW());

-- WC Photos
-- Photos for WC: Stacja Paliw ORLEN
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNjrQbV0mCVyOnU5lvsEfck6htAREbA_7Z-BAtL=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Tęczowa 5, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nraHF1Wrb0AEbqvFJKnPC892cNFpTcZIpTF2Bn5MtSt-snMoCQ6EgXuQC_kaY99i0CZ_fVNjLJf_Iptjva_urEgD_KN5LHRpHZ3N4kNRLFwJRvc79OGsG8tiMbuMTk6NuYQrXLs=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Tęczowa 5, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noE6XZWyiXBRO55Wb5x_TX8ZBbnIQhJK9Kc18Q2gary_6nfby7LsqEVBa5B34OU3plcXyAQdWj1gpCB_yph0rZR9_1VGqjC0GtBfsC0YTruq-8iV6cyzLV8NviBmGAKwJIW7HYC=w224-h484-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Tęczowa 5, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npyS0cCA-BjaSCfmNJbhcef8xrG5Ty2IIP8YSjtM6tjJ5ekWEfGj8qmcxMSeb-OHwnUqLJ89mPRo0FzcPDNbJSz9wxBsrN4NzqYHrS0U-plY-nvOoYEhT9XE1Rsv1FnzVLNk3BpVA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Tęczowa 5, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNjrQbV0mCVyOnU5lvsEfck6htAREbA_7Z-BAtL=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Tęczowa 5, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=9-fwj2h8tynGfphYVUwR4w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=275.256&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Tęczowa 5, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Circle K
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np96YrT5uDCgyB0Iyy8fJk_cVzsgxSnm8GmIFPaPr8oYM1zoUWj8f4heKQyQEuEJsIO1e-L2fA44gwg8w7XdRgQvZb9KWRxlMLLwYWKNgF9AZIEVmC9fojJAb_LYMRRU0eBcnbrzxsz7UR5=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np96YrT5uDCgyB0Iyy8fJk_cVzsgxSnm8GmIFPaPr8oYM1zoUWj8f4heKQyQEuEJsIO1e-L2fA44gwg8w7XdRgQvZb9KWRxlMLLwYWKNgF9AZIEVmC9fojJAb_LYMRRU0eBcnbrzxsz7UR5=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nramwdSLo_KZsYm2XmYhXCBz1xx-6Tnz7zm4CvSQPeQnkxHCRkjGwbIkiNNty9NvQ8V225NrtohqalSh4wW7Jl1RP2QtDfxupIQiUWNBtHfjERoGYZSZqF5N2QBMrqH7XJ8H1il=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4norWeeJ3ai0WqUcNJK3Nj95R0-3g3ItNgLiWqdRNo4_t6jBSz4-WlXvUhVCEM7YdEaTQnxUMPAW1UrWGcVM-0eGq_5my6CABeOajgBoxZSlRX3uA1xJxrRQiS7yHiGNYu1a5m9HhQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npG40PshruKcKFpcgG_M-yWwpacDP6nBUFd8eC7uCLr_1caoL1UUH_6-KVDCIad4FErVw485tHjzDzhuimxcIpqzOoyCV2uJewsENxvVOea6guRxQMIqdD5FRADYX-NFbQ12T5OBA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nowdmm0oC2Frf7giykWDAGUur1U4-OqrKOvx5U4dLwHxApMbEkoc74iRyZ395_fHA7oncI-6cgtA1AAXIPEYTj9nguguzNQfMtD9JlH60aLAkg9DWmjD3rAVgQkTgJI-b98Rk1-=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Llw06wdda4mexg6l0tGX-w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=341.22656&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw ORLEN
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPtmMLtS4EXF3TQagPGHGOedPhrBjqWTMxfvX6y=w623-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Grabiszyńska 187, 53-234 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noBfewls9nRbDUrMhAnDfmyPfWvmyNIyO3twC0Wm-mV024awZ4D-wJA1lwHX5gSkQdLDguR4pXbE97wbjz-aq6RbgBkhEV2dJGfDKCPmtWnRbwcWmj7QjwT-lp1QqwUDHQ-XRE=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Grabiszyńska 187, 53-234 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nquh9J2hzQu6JSz9jEbVpK3LD40naUC324sRrnZOqIWV2yREKvRBu71McIQ5-QlpFtrN2ad5kO03WmCt0vK-HBUgH6HhlKuMMKVA9FFIBKi2VDSSEG_OqHgKeDkLDekmY-GqhQb=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Grabiszyńska 187, 53-234 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqO7FlAXDhFgHsxeQTD7vjmOcYajXz1hdcyFpOfLAc6ijiV4Ur-NV28cvALIPgc8UePxHwZQNp8WzgNi0WnwQLYv_j1UG3NtTyXi9x45GdoaaljOP2LBURTIw4XYsjUXSn7kxDA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Grabiszyńska 187, 53-234 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPtmMLtS4EXF3TQagPGHGOedPhrBjqWTMxfvX6y=w623-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Grabiszyńska 187, 53-234 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_WZrW9rKDPUlB_l5LvAdyw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=300.5617&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Grabiszyńska 187, 53-234 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Circle K
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrbBUngfyZbp6REHWN1w0B0jbeenXJefUkNX0Aq7_1ezRLu3p2amQ6GMmlef1pnYr3EppsQHVuRYLtbpKayy_JTBmcu9YUGGmWScLWHEvVUyPzCpWBk2McIJ5-DbrTXiS7tiQ0=w528-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Sucha 15C, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqXk4bR4ZETaAkfoohsgMVsQkyuhM88WysPVKBdr1TM2oT5_b0EZ2_kYYkJ1MefE0zubBibRi5JYaS2hN0D5VVccUDwSxS86MnI8qTb2zowjc5fc8lpA_db4XxJCrzDb0-mnlFgkzrPg8E=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Sucha 15C, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrA6rbOZqnKNRZZrwgt2DC2LKoDH6Yh49aEbIUKUAqZImdpjIrILTp_5h848c49ghUpYgjp_S1Bu0hGx5zfXspSUig8tICcB1eRjvZviok_0JcnZ8LGQHl_4lumCH0cKH7HFW11=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Sucha 15C, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4novauAlJhmvD804_4UHMBp4z3vocvoh6C_Fqe0R423o03wr6MPNJceAq-LnoqUR363LanElrXIJq9-vi7G0fWWirBhL9HmPJKsuybNatP4NH07yQ2xvScnJn1fMtdCPVqCcDoMtfQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Sucha 15C, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npcRtom5uc9qS2I-Nsj8V8VLbUbrtqc6NYB2dbao0dbHMP0YuqjQfVDAwMbLgKJczmRY4DIi7mR0d7Zzie4sgWfdEKZeUkptVyYJrjLQHpec3CupEVnJwvl2BjBW-eU3PW_VuMG=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Sucha 15C, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no6sqSSNXurHVxLFHJUT-rD8bzqsn1xJfjsUSPCJNXjvvfltofT0OcxHoRG-TXVRmN7LO_fbZWyoCYkj3g9wiCmYEEKJnWkXLPEj9KxUt8QBUArCr9raOsbflH_pwyr0igvNOoP=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Sucha 15C, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr0d9W5MqbOUWFEz2fRfHkLg1A1ngGKkXDhoHwYMorjv0tNxcjdLCbKxEVe5epIZuMG68n9ZJYM4xiVrmqgIoWf4k34uuFSTTR_Lk3srI2EjBub-yyDHMC_ZShQToc9YBjvYALh=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Sucha 15C, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=MI6sTIz_qFv7SkdYgpbKyw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=342.70493&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Sucha 15C, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw ORLEN
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOeN37TzJ9hOiFz8Bq42WeDwgY1TYdk_ERPOXVE=w510-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Księcia Witolda 55, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noQwJwFYX1oa9SENxuEgcvLMhDLdta22ArfgebGEavn2_BgvteNaCyp3cqQ16ewugkwrfXHHga2z2oS_6PnYgy2Do6dliiCtjwVJU7bKnl1WxwEwFDRAG9YCYRKcdIBq1jTYaJ4gw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Księcia Witolda 55, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrQUEKWyaxaFpEaHb-r0im12kB9UbFtaP34CagwKPwHCB02YHntKYVsMtEIkYv1FLtCMphmkKmev8towJSZn6d7rBAmbebX_r5PlxZbjKpcBbFfzqqhrasO5sW9s0trkt84CaQF=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Księcia Witolda 55, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noQxqsI4ubbYOZMsYLlQksrJsldgkeBjYKIEQWAZK4us9ILoYyayxmtU_GyTfqPXl2TSrFMRbGNnPAuPHJENnnkH3xtYgaYfAQTbQjBDWR8k71_IULNsAf7asJUM6-3QbnH39Cg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Księcia Witolda 55, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrzCBhwGvcMyHrNIX2o-hQEwEjFa_Bz0zYksRLdyfVSNM0Gx9ug-kgSF4n6YCz5OjCkezj1cuYBIiFaEMyoy7znVGBGhH5wugGPiHx6wuvOk9EYBYJ4jBB4_SNG8MZX8M7o8DT3=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Księcia Witolda 55, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nosfWVdBmYQZa-Ri2TRPyDx6pu1po300T3q6XM9xU76FsG9BKTjuVeeRumK_2vcidRDkh4tkiadFTEnb-U6IrRSnplIsdZsfNvilQDqT7qEnQWZvzJ_XoEC5sNFAmf-nbLq0h9f=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Księcia Witolda 55, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOeN37TzJ9hOiFz8Bq42WeDwgY1TYdk_ERPOXVE=w510-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Księcia Witolda 55, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Dye_0SZu4bQd2l2ijGRrvw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=292.89914&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Księcia Witolda 55, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: bp
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr65cIBdcljq8CEpldeZhrh6-15Wp1n7Br03ZBW_cO1dxnZEsYV_3fr5C9-hNoWOArvEaadXsibyxibYJclNqZDBczBHDHA9IVZVdhQqVbtT6oVC-0C4RHFxKyZXTtzAdwBkTsd=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Krakowska 6/7, 50-425 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noXb0GrDfoSRw6CtfpyzAL7ZiRKAkRHzFSaiNFE3p5wA0u8QuPIntEupxZhsLrNhkghfmFe1KGuFUoRbImW9S9CJ0tIjxboZgp5O8gXQn7LXofSgb65j1osiv5Vr7v1AF6xYOlrBA=w954-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Krakowska 6/7, 50-425 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrB-3SGwUl9PB6KWtKwo-NCeazhNp1Kq-as4HNIlaeCGkJ5N0aHh_pg_A4REGoxaOLdRzwagIPRRqlyUWayWswE3aisrhKTPYgeNpcMQQlwD4mbOCJfZf4LvtUc_FGR0RESOFix=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Krakowska 6/7, 50-425 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=KggkvN8atM-RxOriTKlPfw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=310.6643&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Krakowska 6/7, 50-425 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw E.Leclerc
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nppe8jOdl3WfrnIXjtBKRo8Oy_3j5JQnc_lNvaJEmIq2UCUNmoNgTimDve52Ean-ZgSF5LYEVA5tg8XbQbRmK3SDaqI9XC_vt5TITj9IGTdYuWCQ_tKkE2iD-yAFq7SeCulvzZF0w=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw E.Leclerc' AND address = '2-4, Zakładowa, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nren0SYuG950P1-23yMT1nMk8UGXt_VAfgs9yojyv9OO4ZcSDDq0tWSLzkaYv1Gs0vMWeujerdjKgbIZZdSpm9n5KwumTyNA99NkTIliAxLFLEse1u6Lp_kSDd7Jw4O_-aiLs_QCQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw E.Leclerc' AND address = '2-4, Zakładowa, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npbL-Ln1adyok8nG4j7fOX_0fV5ZMopeIWnHVcu9gc6cNxb-PsEVrrjr-nDJjJyCPDnHkjFKf2znpmuewD-QoCx8uf0qF8jomoB8HSmLXj6zyWCmDONOBSzFQTS579-C6-a_G4=w629-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw E.Leclerc' AND address = '2-4, Zakładowa, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noxxw5djHmYNOuWA5BLufI98Zh-tWvlypY_sYHvq6I6Xqf5W7nOnAd6jYm6TcYqC_X2v-IV50d993QixM81rQlmBrGzg6NQoOh6hbtKpxlGMrJmoVbKBy_x3MbDCSwGxZw1ko0=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw E.Leclerc' AND address = '2-4, Zakładowa, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=t-xQMZxLIJ7QIzDzq3-ARw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=264.81842&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw E.Leclerc' AND address = '2-4, Zakładowa, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw ORLEN
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP2NdO-pMaE6g-ankkz91sFWXwe_pxgKDajKhGJ=w370-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Plac ks. Stanisława Staszica 6A, 50-221 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPD0e11LLg-ISYaeALEJEOQILmk9PKCIHdMV4OX=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Plac ks. Stanisława Staszica 6A, 50-221 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrRTHofCz9_dCvUSLxucEW1OVdZZn0P201rmk6XebwIIvtoZdaHJMM0YNlSBg3Q_ysxcYogP1k1UWsvYOHE0OhJqBsaiR14lZUGC4BvFyeSTe9j4gXYlaV3vRLPSc-5Yu7hfpMg=w224-h498-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Plac ks. Stanisława Staszica 6A, 50-221 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP2NdO-pMaE6g-ankkz91sFWXwe_pxgKDajKhGJ=w370-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Plac ks. Stanisława Staszica 6A, 50-221 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=AKsaB5VWHsaDif6HvWm_Zg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=247.08107&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Plac ks. Stanisława Staszica 6A, 50-221 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: MOYA Stacja Paliw
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqNv6lnta0_8AFp-6COSg_xJFyGOI4-n8SGHQclCbqsdpwh7Hk7C0HDnpgATVW5NH9XJm_TXipLzSbh_KTNceBWDd0eGgdPZzwCqrm3RHuNLUMQMSxBgWUBkdY4nnK3Wq6MgXzBjg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MOYA Stacja Paliw' AND address = 'Długa 47A, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noSbe4ZJn2-uzuGpgd3y5xTiuNV1gXo61IJX6g6kRJPatHrPnLM3xP5chVVDemJL1Qghr9-pM1ctfjU5NvFUUb8mttj7PCMh6JurJAX0f_9SltkHUPQ0zFYADwDkk3tGqHh15W71A=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MOYA Stacja Paliw' AND address = 'Długa 47A, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqqdmELHEih7RTfl-4nbQy2LKQAMC8jFOhoOA8j9KQmEHdguYyEpiOQeyz3ZUGal5A6aNvd2o2dvPdpYfDZ4Bc5jfNNtzuz73ivgY21ukCvUej699WyhscXv9xvdO8vr06wJP40pQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MOYA Stacja Paliw' AND address = 'Długa 47A, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrcDp3ZFPhMqzQHVn0Itid1hg2wUVdcF8iJCeK5lHS5KdzROYl_nl-3XiAfvF2ztp1gDUyLaBO6JpA7gP_rxGnGa7N5U0yIMJyRnvz4dhSRDwhRK1uwW6gkbLWDejtiomeZk91W5A=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MOYA Stacja Paliw' AND address = 'Długa 47A, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPxzf-ZtQzDY3s5vK5xN6UwXzrD9lerGnAzYWih=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MOYA Stacja Paliw' AND address = 'Długa 47A, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RnhPgbgOo6DV_FmsaDm9qw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=228.2442&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'MOYA Stacja Paliw' AND address = 'Długa 47A, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw ORLEN
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPV0vB1MR4iApNxrQNfH0hht4fRXDIR1-dvI_kk=w631-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Jedności Narodowej 156, 50-303 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrxYjuotPKQDJ-LE812e-6i9ShPOVcQevaDUpH2dexygDu1yu7-D6k6t9G7Qd55mbKPrpLHJHxVm_xo0jnUnru_DXiSDtmbgZ_t2lA86Zj42qZZyOUjyFW8O7XT-wmiDIUCm-67=w645-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Jedności Narodowej 156, 50-303 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npD8d0ENusse-tgDRqlm0qA-NQsHpdMDH4LtPxjqEpF2xyCtQ9BLwqJFLdstW3gW9LJ1IQPxxdttZDNU0Ws0WqK5lyhN203ihi1uFnUTkuUCv4hjtK11Gc6D1awzjKvRyAMQPxzNg=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Jedności Narodowej 156, 50-303 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npL24NNdzddPq3N5hD_K_9uMfJ8uoFax8Vtw6ChHRDqv3p6ZWxyZpiljfpAsMHzzIBtx7FGQXXZ5-7gRHArwwyO0L1IPEQjyCWOreAlD-tJQE5anAYZZ-z64OGGSOJghDRhrL7oew=w596-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Jedności Narodowej 156, 50-303 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrXJs6Bv0QhMcqVJvZyQh_c5JOh8tLSD0PQd3qhu42bGEbscfxstCA0RrrBKndUsFTdBmk5XE1gk-Uo10DwGjXk6pr2II_ZLRdNjLN-gBjRaSt6Z1Agi9k7zZGNSdFADmbZn8Aq=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Jedności Narodowej 156, 50-303 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nooqkA403QnBUqPRg8VvmfgjFVcBGLYxAAxaew4IXC7t-tsF6ZHFgUOjQF6ZXPVaeGIQhhLNFUIkIgEtqsYHfHAh2_He7pLPZmd5BbQYR8z0XXE-MtdWFAabqjSJR7G1uy5s42tpg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Jedności Narodowej 156, 50-303 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPV0vB1MR4iApNxrQNfH0hht4fRXDIR1-dvI_kk=w631-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Jedności Narodowej 156, 50-303 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noF2x5bsbEIAylZU56Ztj8hfUt-KTFPB38YUaO52aewR9oadY6BsKFfc5EWnilPbBqL8ODgYo2BgVuwSX8JRxDXoW-7pAVFGQ0Sce62I0nmbirghwxiseLIMBTm3CX6KHa8FA3ikA=w224-h298-k-no-pi-20-ya79.999985-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Jedności Narodowej 156, 50-303 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw ORLEN
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPeOd1_rUmk6DaHLFFz5cOH4rkLAc8m8EqTJViU=w557-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqoAlCKzx9W8DfrZfwgvydfwRh01OQwC-GNR6MuHtkIx8arRoKnFR3DVuHV1VXYCvYIebClOu-2Ptbb6ijlIRV8CZgAKZ3XLnlk5ON3gL7A4YPtLap-pdfTShSePEpqwvuS5ag=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrKr8vYHWRUyhah8FhpU4drvQ1SDB5Z8UgwrYdV8lVaiuf6ditJspo-up6_xO-gMvpT7zoXORlLUoeux5EUZe2PufHBpuusqpmcJSLcFA0WaDI0LxidTIfriHYNqzNkazHruyfYVA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nonaU74KEZL0o6VEgzNDYpPzb94rOzrBp5eRKp4z0DBqxJyGax-oFpS7LTZjlfR8_FWFIDUUI_IdiNE8DTXawCskgJf2jjvwMmDqFMw0rTecqVSgapia58VOnGkuz9Ho_Ief-_V=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noRnseL0dsDT9lENJPS8ft74WK4uUJ2ODv4Xk0lrEJMomKdasSI7NMBZWXhJEr120JgJog5Mmtr_-ANntc3YvdFYPC-QdoHsqDUayCR8uVnasSIBKydCmjqoruKkpLNlJaHTbwQTw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no6BWao2o2nr6U9hn38kpDSURsbzSz7vX9g6EW5zpYMQ685TGAa3iYXCktSL9gCgBxuTStQcslidMH-Bgf_W6M4Q2hViiTWUznlC9hwDtvMvNkx5Xvoe8l7lZlGGYqVBfYpk1OBgA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np-wIhDwT3_4TpqlC3JyXkNpFDlVUcGs9PmHpUeN5pcDD32g6xOsAxWH_l2Y2RU3vIkUClKOh4l8tdwmR005eJzfiv_wz3KrZ0AJ9yVxjw7u5kQ4EDA0_UXOZ__THT7VivTVHrM=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPeOd1_rUmk6DaHLFFz5cOH4rkLAc8m8EqTJViU=w557-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wWrQAUoqvMvpRlCr97uJwA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=201.25002&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Krakowska 11, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: bp
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqzHHMeHu199r4Ms67NS0ojHIzaVndhVSN-FPGa7jsRS__TOdXzjxCfaLA4ngNNoCAMizrYKMXkXQZAXgjwuAYJuBsrVh3mHcHDXwSpLjU3ZWql4EdBfZBPNZ_fDyMtTI5XLdi0=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrQxy5fGHR6MMZvy9UR4j58DZYZPGx8TQGZcwA09HIccH-CnDlhoaEu2TKm40s29m10Y8x3VBGrnMuCRSnQboeh0hhMLqgVb-0rLsnpthCpw-7383q_BAwaiOpWUFgd6KIf0eKZgQ=w243-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npP3Nud7IfF4jkf7oFv33i6PTVoMyOK8JVOqv_MZTqDRTzY21UqlQ6HBgSkTEo3i1FxndMiJAaCeYMgmlSseui5ILSxj5h9pAJhQ42naPobX9WME9mRIy1nNqXg_eLhWzNMN59F=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np3D0-jftcjgwACAdm1qSvMGbdY9V8NChOVuwAEK_IHjU_iciLCpSLUJ6lnijIqAtVdfH29DAGjxFT3XrXF7wbEZgEgTU43-renGdmmhf01josJ24BVMFF4lxMoqcOaVDiX6vCOtw=w445-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXrHJ4vniki4t0BvswzRxxRKWeRE8iaAvctOlf3piZHAKziZUWpcXb2v0OAtDpx5glZZZGh-Md4dx0fGoRHSuv1nlj5AMH1dlNFU43Ksardj89A5f5IzJtZ6_kWugonl7JTm-nXw=w445-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=P9RHy0Cd9Vb9H2MIRAK4GA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=47.39597&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'bp' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw ORLEN
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPaWdyyxDyceMo35Qgc24roFcTJn2WaMNtxCJrw=w576-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Ślężna 129A, 53-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npDGc0WY6VXodre-76MRM_QlPldPTQ4BABG-9VDWrbS6Ld2mXGEqLn7ND5CZZ1-wOsyZvAR9UFBztJk_wbg7hCevObVfDK8wDS0mdNPwVsANSpBbLhZrKd2stboF28sgHKDMds-Ug=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Ślężna 129A, 53-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqxX__YleelvYFeNMGLUrDPFD6JlJZj6Z0PeowFY6IZgZe52lfpDabtIVa7IQkRo2nfnx2UttPB-rmr-FkJtaPR-3w7RchNJXbTPOpYQrVQPT6ZVUsdFWE7t4Gnuf2cYHT_mlhGfg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Ślężna 129A, 53-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrWayzAls08HhFmdKG4JJT3PUkox-_zucAbu6ezgmzRz2jMdQVibDQpBMr8yJ4XvcyDGfFCGu9yxKoNUldTMgzzEVvbn1k7PYxDTNr2K1Ej8oW7M74LmbbMRVFh2UlHL_KyYXS30g=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Ślężna 129A, 53-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4non0hOeP0xk0gyLWrxW9hG8q-6Rb92Kagq5KVrrDEwBXuEfohL9qrHtC4YeRHXnPzbrB0R8kLy8Cc0sFGWv13qx6ZHHtS7INDGs4brOc648L5q9jAuDoIS66Y48V1qjhSByfIb6=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Ślężna 129A, 53-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqRGUj6zH8-oJAG_DySxow3Y1IihxUAsF6EZdj13qBI6pINcjUPo61et4qeg0AcvFi0Kb4UbA97Z7d3VEOw6ysYq4L9pjnQ0B9Oyiqueg3GWar1x0_pD8ef__LkrPJgvykthfs=w297-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Ślężna 129A, 53-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPaWdyyxDyceMo35Qgc24roFcTJn2WaMNtxCJrw=w576-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Ślężna 129A, 53-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YAKA-w6CWGZCX6D9yP0R1A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=53.603535&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Ślężna 129A, 53-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Gas Station
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=stbxvgWs1xRPPF1QoJdkcA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=33.28626&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Gas Station' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=stbxvgWs1xRPPF1QoJdkcA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=33.28626&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Gas Station' AND address = 'Romana Dmowskiego 5, 50-203 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Circle K
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no93MV5wFtOntHHmoNpPad50XI8CJFbzmN7bIfU2h2AmrOtV3tSwDQfp2TZZiktKIeOZfZCeBav2-Ak79-rp847CPmQD5B9SJ_HXF6x3d-n3Tm02-H9MolyZ88K13WoGZqWgUGr4ur3YMQ8=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Braniborska 84, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no93MV5wFtOntHHmoNpPad50XI8CJFbzmN7bIfU2h2AmrOtV3tSwDQfp2TZZiktKIeOZfZCeBav2-Ak79-rp847CPmQD5B9SJ_HXF6x3d-n3Tm02-H9MolyZ88K13WoGZqWgUGr4ur3YMQ8=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Braniborska 84, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqm728acyj9_N71Cn1JY_rMjwaw-kWtOmh89IUDh9RnxWlqq-uLY4FpzKhXDkqOLOTfmGRkzC0PfOxIic4xGBwkgw_1BAVzDk-xYYc4kYQfF6U-bo1cFfSe32Qdsn0z-xLfvuRH7w=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Braniborska 84, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrubAbgvBKejcov7RtLNAoufL9FulAe90YPEySOBypkeAOSYx7U8qmBVDQHWkoOtHGNXmyR2H6F9S2Cv1DVY_BwAsGiQnEibw4XXV-5L2l_xuqWAqd3RMDPRXGPSKRs3auGYkJj3A=w530-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Braniborska 84, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqScIyvda26nYNQDQ0DttwYXxhSOEFgt5CjX3DHT2OJX1kVndC8uxuPNVhxf2-kphmW0_mDsoPrvaKA4B7pPce0TRySpprj02PIrMiaDaNnYn9ozQ6a9dVKTYRfgAFenn906_4=w224-h485-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Braniborska 84, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqm728acyj9_N71Cn1JY_rMjwaw-kWtOmh89IUDh9RnxWlqq-uLY4FpzKhXDkqOLOTfmGRkzC0PfOxIic4xGBwkgw_1BAVzDk-xYYc4kYQfF6U-bo1cFfSe32Qdsn0z-xLfvuRH7w=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Braniborska 84, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WB0SPXvm13HC13Suuep_cw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=175.01639&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Circle K' AND address = 'Braniborska 84, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: MYJNIA SAMOOBSŁUGOWA INWASH
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq8efWNvEZ4lXdfK-tmMbCvZdnRv8a5SvlHMhpTtdTYI48JBOB_H5KpdofvaMsfRPzFc4_y0A5iFENgv9gTflJFaIbb2XfJ05YMtR8yqMUBH6uOOz6SCxTnLMIuZBQG_sxaeOQCfw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MYJNIA SAMOOBSŁUGOWA INWASH' AND address = 'Tęczowa 51, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9qwN2tC8vnhCCyZjEm7-gOTawpUPTr4axNwToU6ixWDh46QXZmX3iqMfE9KQKwkDsBrA8NEottziWg6P9CyxZ_vOWIf2raLB3gIsuMR70265NsAGZBsJDOA2RA153WtTFgqJxCQFjto-6=w324-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MYJNIA SAMOOBSŁUGOWA INWASH' AND address = 'Tęczowa 51, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nosw2kK9gJSIsp1oMU_treI7Ldfc-Ihpmh4wwn76FdozGe8WgMQkhAltMmSFJborYEv38bKVi40m-lbD03chD6lmR0UHPy4da_UMtVY9rgsHN2WninTLVB5kB4RnkPy0e2TmXDzxg=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MYJNIA SAMOOBSŁUGOWA INWASH' AND address = 'Tęczowa 51, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nptOeWJ7uREF-zVl4aXuiY81iTE1zvOPXd8iEmcTj9C2_k9eYPhhhMJbMzc3BqhcG0Tm_mzFHmcnMLIbMOeLuehrhdszAPm5WMAjzwherhRso5FW9n4G25FOvaZUyTNYZX7J5l1=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MYJNIA SAMOOBSŁUGOWA INWASH' AND address = 'Tęczowa 51, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqhVYb0EJxUoW3VvEsRO8YF93-risQQesNpHNy03hffDgmLcxteQkYXzCyhIoVG5M2sPQnNYTU9zKEyW45ll49jMHflzzZvvs5iN1Bv5i1_ldGbcqcvmhxqSMVXkRv497T8gCCS=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'MYJNIA SAMOOBSŁUGOWA INWASH' AND address = 'Tęczowa 51, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ikgViCf82ySIbxliNIZJOw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=329.52374&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'MYJNIA SAMOOBSŁUGOWA INWASH' AND address = 'Tęczowa 51, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw MOL
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq-B7Wy0tsxzLpe0T2f2gdNJ2EapjDGNUjt-Lj6idg2mh4LtLMEKejaPFsJ8umWFvoTwjB2DdC69j5owNkfdj6VPvGccvoEQ_QgricxxZSTBPrmL8eoUgbKwdtfZ8YA-MFcwaRPaA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw MOL' AND address = 'Trzebnicka 39/41, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrzhz4-rNDRC0HJs79F3TLbVUBuneVP3MQbLDrJVHpsTVZcV_2SuhDS0UYj-EvNNXoskS-cyc1zQLL7v_uZhlIn6ZLT6v6k--Zhz3BQnY7gLJIibx6dsrmwhyUrv-xMeyZbGhoFaUMjywo=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw MOL' AND address = 'Trzebnicka 39/41, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr8z2sUR0XT4AgLjDM2VFePxdCMKHmtulSN-f_spgOfGiO4nC0Gd940qerX-sZbMOs3CgSEvPqGAnZ3FdVNwwn9-pXlBoGzsJUbA1r7Vjbq71J4mftfCMVLlM22715TccrmyNme=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw MOL' AND address = 'Trzebnicka 39/41, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npEQMS-hWgs7Ejx-yIJzeGmd8HEha8Jh_qcdrCvDjwMknGTpaXpwCr-Yd4d8XOLQgnfCbpfzIEFOPGu8h3x7rhLQGs1WI8tgDrlLSC_i19oUJnB0elfdR7mUd6M4oL1qLGWfQVEXg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw MOL' AND address = 'Trzebnicka 39/41, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrq3ezKf6e3Zjm8SSlydR-hFFbNkLEi3QfOLsz0k54PQyrjCfCSgsJt_Q74pbxVuUymI5JYtRA-w3XulDekB3ytVQM-wTLow5wsq8Yb4llziIGS9VENni_nm77IXd051h2J0qE=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw MOL' AND address = 'Trzebnicka 39/41, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UQei7vkBg-eXfcHPgjcxHA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=114.44843&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw MOL' AND address = 'Trzebnicka 39/41, 50-231 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Myjnia bezdotykowa 24h
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np8WptgbftUEpSw_gE7n6MIUMADaI9mhIX2qYcZ3YodUF7qIfOaYT_G6gYVCEIg7fXAIRRjSZ4d07aMytKYrVOlUnTAmcQZWJgyAfHAa-iEofFMez7bTB1B4WlSVm8spdAR1bgV=w261-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Myjnia bezdotykowa 24h' AND address = 'Długa 37, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrgldwm0yUZ4_Hg6WhLtqvHjbtWk2PTFjXhcmiqGpU0cxRCXfqIpXEZ-kP4Te7FWCjvAQZQnA4GgYwP31QV5KOeQ4Q01_D3EqipIgOTKGZTgeOYOY_SYnneXlAk9UKSnsL4esY7=w662-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Myjnia bezdotykowa 24h' AND address = 'Długa 37, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrWes7qHw-NacTRasIWJXjOerteh9mSQ9JnHWrqlAIIATXwZ4nEtIgurMR367vAWiyZqiwyXDl_eJNv85HrarlsED9YPIupgX39JfKpBqPKGT_AzROpMmvun0fR-TyJVkgc_nP_KQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Myjnia bezdotykowa 24h' AND address = 'Długa 37, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=m7S8JMSs4z80fBX9lmy1Fw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=253.95836&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Myjnia bezdotykowa 24h' AND address = 'Długa 37, 53-633 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stacja Paliw ORLEN
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPuwq3XIngJPTE5HQM2RM5pMJ4BAzJupJv6aMuA=w577-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Curie-Skłodowskiej 14, 50-381 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrYzN11GiID308v6h2IAhwbz2jRilvwbUhxZQ1iOM0h_QF5kBREPKZeQ_qBaBx-4CqlPiPU1s_Y7hHgsTEsowJ0xGy_2V38DaHYmxy4xDrBPmLkHtNllBBkYjd59Ux3SHeKVxgArMxGFCU=w224-h397-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Curie-Skłodowskiej 14, 50-381 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noRNDQ1FVT89JSR3L05pJxlb1Sj2Z9EPLTJJqRjSPqH62q75tJjbucGZavo9QlXqecLl6ZLzwj3hBK9wplsCQc7S2yP7nbY77plGJTnur98KaqbKZaUMI3PWEDUzVyfaNUWfFUp=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Curie-Skłodowskiej 14, 50-381 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noIlQzPvbMWgkUjsTI5FD9zrsuM5H8tUvGgTqC--S61qzFZZqlbuqZR6SCronDjoIMhiRpAMzC2UIm_WoRj-vO5wnTq-fURkQaDXqzi60pKTB11vUMPMPQG5qA6BL_LTU1rLm0Z=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Curie-Skłodowskiej 14, 50-381 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOfTajkiOg-l7E3HIh23g-6jLmS_CYY_uBs6Ugv=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Curie-Skłodowskiej 14, 50-381 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNNZyffwZy1-H3pIm2H3ejGHNMOSonYqg7UwFb4=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Curie-Skłodowskiej 14, 50-381 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=KDr5Wr7DtJM3QHVgoZNFpw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=299.4539&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stacja Paliw ORLEN' AND address = 'Curie-Skłodowskiej 14, 50-381 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: BlueBerryOil - Oddział we Wrocławiu
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=SgR2VMsAT8BdrqKQ4BJonA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=280.0678&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'BlueBerryOil - Oddział we Wrocławiu' AND address = 'Grabarska 1, 50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOKDW2B22pCJUzg_8kB4UdmxSpAwkW56huL8P-E=w488-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BlueBerryOil - Oddział we Wrocławiu' AND address = 'Grabarska 1, 50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOKDW2B22pCJUzg_8kB4UdmxSpAwkW56huL8P-E=w488-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BlueBerryOil - Oddział we Wrocławiu' AND address = 'Grabarska 1, 50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=SgR2VMsAT8BdrqKQ4BJonA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=280.0678&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'BlueBerryOil - Oddział we Wrocławiu' AND address = 'Grabarska 1, 50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Kaffe Bageri Stockholm
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqWhhqNVd0uZJI9lPuzLkzs_wQ0gF5HHcvQKUj3vSBCzsVrZhJgna4b97e5H2GGadtPj2ZBRcUxDZSQunAdUBrtpZkwlFCKtqgzPwjn0oUBtsIg-D4c9n-DfbnLwgnIweQrJnLzSQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrNBeMbFOMlwiXspP6xmxopZgU3VO92B0hr3cdMQWY8EJLKN-xBTufiDHyJ8DqVIYQCYWuFm_tlRiTznUh1Y1U8zHGimUYkqSG8z9Ut0_G0ZwE906rYSYy4A7k_91BoEibaZT51y6hHJ0qG=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq5CORieAxW1kgtMTMEpcaW7M2lnMprdlEhYmHqgDe6eKmMYwtkg47UCG9GsyI8gUg58zxxgPHuus9q8nmhwtAYoCat28NdvH-ChnVz77PmsLs24B99RO2dT23xnd8hX6OC5dKO=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np4fxVgXJM9r_nvAVpERzrOUNKlQFC51U7TWETIkaKiVABoYNHGrB-IsvYXc8ojEfm7MHut1QKxNjw7nw1VTLOazAt_49No6-G5yI8idjAIHR9_vgCIxCd0kk_rtAd-Aba2IBP8-A=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqewTlki4NtgolPEb6hlPG27hgTIZrcnNk1eAvUk_Fb7GxsiZZQTuYo-YuXJDoNjJjfB2T74_ZVk0A4eQX1gc0lB8CkEXPie8HI9SO7tvRQ7qE3mV4X4AA1S7Cvxh7PwKHqdMs2=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nodGbOgZmdoC2CSvkty8216PfHaqZgWoGfnyf-iYvkFTlHVzan5CLcsq54sQUJb5jT4dhvHrmG3XZbBOOFis9bVguxDQrrVWh6u3PpnwK9dJTBl2XMBiLMIIPcriB_2NW6YABd86Q=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noURi34WJTtTbLXXhMEg4_yqLf6xs4VKbIGzEya5G_r6PCFTB1qYvhZNikszZCj51yOPPJzzy5QMdCUoNGEYB6m4xHA-56yP6-BNIamP5mR94qrfgpt4h1_Z9KsW8CuSINKMKah=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npuwMEZLCI8Pr5TrDAddkDIUQAItWagYuGdTDFmCxmgn2-yr6FZAFBg_9hjkdlqIR_NRt9iTOIlAKcye9DvvHkCXrjYXD6KKcBw1aOmI5HjTZcD7Hxx2TbmfGR-2iSLH0ykaaz_=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqOppJ-4MmlrWA_qQVfGBbn_ZCxA9MkP3tm1_ojsChzIxdV8JzOsimizYa92QdjQoqe1gLebt3fOMYby94Rk0ZrSthEkDRRNtrIfecN6fohlT-UWGIn_w2_tb3Z3V_rsQVLdvsT=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npnfrNYc2GouTWinq2Y36ewJdk2g1QW9AwXY254sn80IskhkC32kvzWSVZeUj4UH3ufLHJYRAO0c2PVv1sU3m5skcIA0E_kUJxF3rFoANSTk3awzxSsWA5Mr0JS-7ys_eh67VxX-A=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOouzz4TF6BS0bcimpJZ5ASZH1haFHmzyJ6_OM_=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=o2QWelFbedZIE7VFAmrF4Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=198.91487&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Kaffe Bageri Stockholm' AND address = 'Nożownicza 37, 50-147 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Chmiel kawę - Specialty Coffee Concept
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNB1mo7G2XPS8HPeI8CrtfIJ1EfWQ0uxA87Av3t=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrGw8yIGzyUTkL_HTmk2RR1zhXxmBNGc6j8U5FBsgVjeDdIzrZDjZYtLuH5FjIHq8Dm_4RtceVBGx4kbedmB1-QvIh9m_4bq-O37JmywhmPL7sn0fgdnu8xAV7RU7IDP6OHnIbPNiFELm12=w224-h497-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nogXqzx4CzApKMdOXE6mFz-jTzAcaCUZfO_MWiJHg5cWKfuHkNeYug1UgOhsRBsOB0yDsb-CB6ejk6OhwH5ac686VHHSFiZgVWjLsM5x7R7oAWlN3T6Y_rHJ7N5oVTSxcf9gPkH=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrz2mn8QYafySr9S-mpZfzsl4SF84NmwWOz5GU4Mmo0I5fmb6PORotmRm6wYomr3oAGOJ63QlricXrzCveBQDcY9ZHqICrGSpU7FM1sQVH-ebobw9P8KcEeLgcyyuFUlb2v2YzC=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no3z4kQnDjRq4vhmb-L4AEYUbks-QKiitiWIZYmGJcFG56q4x-tgfKDQYNG5dGCDCLN9F6Uz5AZH1wTqvTPA2Tfmhx_4HPLJkR1uv37g2iDgLEjcd67HAmw2tcTh6RHls9p4vrU=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np_X1nHBoLRvG9TKwz3EnBm5rTjaTxTkpV6MN0vZ4Snkme_m0WlKIq6M9eob2UeDaGslkOSD_zoqqhy51GQ5J7t0D7_f_ejUuEB96GSO7ge4IKcH858-Y_xxz-XVjBhTBafXSGd_w=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOhiFRcTWKkR5zvV-qAqIEcyHuCQD9azbke9mWl=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqVpIE9xyNLSwTehLdGhTFVqbypyaXCe-Pq6mxMiZnVJmfnbjNXp4UNRVNjmUgZrKMOVvOR-7-vOK1OSUbow9A0bX-e_npQQhZMxnEPNlh1skjkt2MiYboE80KZeFhICX2sifc0aw=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrPql0fw5Q3oiRkAL8H84l11B5REJa7sM2maTwSVrpUsujoflKApjaDSSYIbIReMsMi8B-9nyBvF7eyFNVafBG-ZGwaIeyutheWmCwA06AJHhtQAQ458Yc6surm-j5S9jz9MyDTBA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPxNduBAZAnLSiVgKMgh7AU_mKmBPVmfPj3ZYas=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nocKo7QUVlHFq8biuzcORoxPabb_tvb05y-qb4AL13npvvaWoJE6mOgp8FgaOZcj1MXNfz8lkbKmVJzWb8K_IyR8Lurg_AjfTxWMK7P7dST0ZfXgvhuo3wS09lZAUr4ikrRLbNSag=w224-h298-k-no-pi0-ya240-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Chmiel kawę - Specialty Coffee Concept' AND address = 'Szewska 27A, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: BANANA KAWIARNIA
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPUtxCde_1A7I-NO0lrmDuUENpKhfI74j3uBQAj=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOIQ2OdOvjzTpbos7OBwbm6Gnex0N0wO2M32AGo=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqbZA17AWcXykSzab00crxm0D-thrd6_S4EPvYaLPvjWz5CqjCtNLt-CO4ggMraVdijjGsJnZVqmzMHHVH5ZUVyi15rJBsz4o4lbY9UbdY6w36kd2uhB4VaDgOTzLv8T4XseXAszA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqdYFFM_BMcFQidP57nd4w0nfqqX_yKV3vg9dN1UpeE3eFGDFLXZz_AuAxi207Ieb0FVpim2Xoaq7xDw8iicUD63IpgRxIpwpxABCGELjT1hT3fqlaSuj15kCWw1Rmf5OcwPRzY=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOqQRsViAxNWD_6xkPylYugEqiYIh5T3PfvfUhi=w224-h335-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr1_b7ZU5pV4zLuiB2pdLd_L_vBR_BJClI5-YUCs3m7VVncmkLVZ-x0AEkDEcPBjHJANUSYJoOjH8Na8egM878o-Vf9TeigoeddhUatD4zEaXUY5FMegBO80pK-FC3OpRCMRIM=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM_LC1oJPkkrehbaylc3GhJms9giR_0Xgo5lEif=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP3YerqcbX2Sp99hhtn1HMGUkcaA36AK74lSWFp=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqEt0T8ICxPio5W5yTwNSNkoSrTpQgu1q5rcZC96UYfp3gzNpGRxA_5w2GmXFChA_tNfkHWNSZD3eHpPdrBI0CkYLqSLzupuTiV4cLp7zECvYUgQtKnLSw05IKx3_pECXCSXDZ4=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPRxNMbe3A6qtQjPmOMksXBiR7Sfd7-XZ91lmgk=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gJqBZI5JuGnnLAeLXdqCZQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=136.3211&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'BANANA KAWIARNIA' AND address = 'Hugona Kołłątaja 29, 50-004 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Kocia Kawiarnia "Cat&Alice"
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOupGlseSc5aV1yLrfksoY8QaxXmvoIb_eWp4I7=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGrMbKyZQHQAdAb5YrC8VKEZnZx-6byjOXuN3WpyFwOww6btNUAlm_sGNMYSGFATDc3r5kI8RrPuu0r4lOpfVJ3MyaYvUGBuSO9y5hVDU8os7yCcQW14YrMQCeYVnNVouDKdb7Jix09nQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4notnR9gxvpwuA6HCeCgWV4jZ5JIinR3CbCzSoFeaXIOG9hTUhzgNp1EJFuFJ3buWUVWrl4mtuNsHF9FZVLYRyNTtPGI5Qy8_N8vXOinxo68wzaGhiVOpf40onfeVRcuvXldUM1-=w224-h401-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNW0Muoukr6ecrC_AFpumi5hGlqvddLKuX7parO=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNyC9wsLcRtpRfukZzCvBAaDfD850Up_ytqslgM=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrjepd2hrox9VVxFv993CkoERVcPgryPev2viV_19Ybr_FK_vWZpPXnE2mVXLtmw3hmZL-aQv7KYYH0sSmMPKAhaZLiZYDwHBnl6KvEbm5hvHRKcHLWqlh1t6O53fq--eFjM5c=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq5zSXETUv6BMP5S6R2Mc-yaHOLehiZD1SQfkZuzd8vu0TZBCiaDKI5pkpy7odJbg7BwMgb7dyqai2vRM2vj51czbaBAoC9J-sK5ZVVBqZRyo5aec-itQrle5hlvwUKgY3mcSS8Lg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrWlWuawiYsasSa9_32QF-wnRbUm7OgbtUvJU3qS4GoAMX8TWFTCu4Y6csKcapG-6yPQfHD8tUOHiZE0FTN_ONC3GNq5Eh45vFSieoHCRX4FdkKG7aLO2Sh--mAWy_59a4g07L6=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no-VbF7dCCr7e5br66y6DD-ZkXcei7c0-jCvnFG3JV6Fl3y-xS4YdLBLSUvDvOPHSw0zxAKttnC8Z1mJvaR3Js6GdYrAalbNmZ2pgssYjBseDtM8S3u-SRZk_rxtXWF2TVUI7t2Kg=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no_Qcfjhj_6cRzzTrQZNmoh2Mj9kQk01Vud3uTNgZcV7NMAIPs_7gsRtqA8v6ilypotUR-g8NIz1P9jBRXlWmguh7e-_HP94bJHKQPJJr5yNKGbMSqFGIn-bc0TDD3MtzJD9gpO-A=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOa1lG7SPD116LUWJc6P1LluMxS086opx_5RfAv=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-uLe-6RUzzUAsmbdC3zH8Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=228.20465&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Kocia Kawiarnia "Cat&Alice"' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: cafe rozrusznik
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrF23zkT3CTyMj1T5V9WCYKL6srPowv0xwdfvtuTAjrYiHfmGIqku0szb81ebBpeHYxyrTW-Ycv0jHz2MLjFeoA2VpdF6Cpbva_Hg7iDK2SX1uRbFu-FESWI3rynPQXwhWcEp5j=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nopG1_wlCAb5IO59k6gS-8t2FgxvwcbulliFHz7iikHXdhZukpWA_woiWIOkQRDdBCpTuSprjYPHScN6PBSH_W00Sle2KsnEt5vpG2MgqCsQwOPVGlsXuPB9EGsO2tP1JhidC0b5747K4Sz=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr6qEONWZomq50EAdCChQDI4FjuKDBLqlD8Q8A5jHCyy1BMHgyKKgeqOSDx5fKYq76WyM_TwiVOHT2a7trO7oNnCji46nTm18oLGAF1J42moF1r-1m73PVh7E9VxNsRTjIsxySufw=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np_fjyUZ5t-3nu__ICrNrMYMwW9fc2tkhlVVrj6C0flzlIyn-8WWy7ujIhPZ9VKdAL6sfMfspMXrtrySn111Pq54jIZatoHroSovUUq_o0d3gbyerxfzJJ8n6GHs1WC3_reFxQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOIWLm5x-haXhTraFqge9d1-Rr7b2SZA7D43s7N=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noBsRJOPsTZsDkXDA9mBAFIQ0l6aNugmEJy1ts1DW8yg1jCQZkHoY_J0ABUR5R649-ZHmiN3yCJ63SWLCpTCfN1km5HkqZEztCkdMqHV5qXkXn4ch_OU_pNgRW131EFfs-IlkQtMA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOW3vA2R6sFOig68wLSmppM1qgeLB6IiDWrcypb=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7ljCnJNnqZHW_qhdMEAUgNMsv4CrLK15CE6_7swDENSp9dD7GsSyMPNh8vl0Ie33OVl1KT1z1d1YMObt6wgVBpkme08x_5CLt-0cH_d1nxs7XiBat6OqlN0gXxieo74HtVF69CQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npKkarIL_SCOS9KoJMGcOGQYgINP0PzxPpRCN8YtLsqOa_4cPNc40TKqCIkWmA23WRgxY18MFdYmYOPi41vB-IF5b0XkcY4fynGW_GarcrO5NUvzdz98SzNMGyO8YDGg81dTt-5Hg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMd1pntWVAy1Hy9nFvS0lESsnkO_w2aL3r1LO0h=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=n8DJXkWV0aKFSnglT68PMQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=333.80206&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'cafe rozrusznik' AND address = 'Wojciecha Cybulskiego 15, 50-205 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Cafe Równik
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOUli3hHpNQTwPdNNkJrQNxoMkxXzFZ7YJZ1oRs=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrt7R2mdg4CDaNwoqM9hVWDhtlSB-NYXOv5BsAMWPXMnguIplTCzre5mhK0_EbrUHQ8eV7Z-LFNTi4K5z3pWspgh85qOX3Yipfz5N72BjpigXDqIzLCtkrFUDBuNUxkN6FW9oen=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrkPuuibMrEoGl_BYX4EyIogSY1mxRa9udAVs_MlyiqhQDTOgBjzFxZplPfPupzw7KeRLgvAQx-DDu8aTrgVqsImSegf7auEfzPIL-dzYhFmN10GiyNsoe4HGg1eSiyxEfb_iBf=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrRBGZv2AObe7_FzFeIuQRuPN3xspF5tknniFH6_1ONEl6V72lnP_wB-xZ7fmKMMP3JHnnJIKlQAtq6Ll8jqPsHlo0A9bx6Hmo-6aVXaB5Kwea4fuH2k1dod-8k4fdAB56uEVC0=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noQx7VVEmf_MF5cSHMgfw1iaanu36HJ_cORS_ekprajsRoFmUja-7RA6bd9RBIsLcGV611QT-qFzpc1AMNL0TJZiY14P9vrBIkItkwpPViyp8Vh1azO2wwt6hrfcbEm0n_ORpqtEg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noXFvxnumM_9nAB_-uddFNey6INjb5g3YXNEcJdaJSkvia79T7Pmmy_IMGv4pvArHNwd66QYxua_JIa8dORTrQncW4sFGNwBcdqbB5pg_dIpNrWs80IsBf5TtcxnDN_TdqRAgEA3g=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqsjPYGCZOivINHjx_gnobaWbXDE4vLuimAltVnOE1wI24NlMbLDVU4Mr9JKQSnKTL2Odrm1gmVgQgRIEzdtOsf-94t2QMeNLWgqYn1GeacwT0iF2_4N8uIC_lhfHWzuRz8AMM=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP2j0_cUKoAndXCjnRSe7ZNo6Hwvbv2UYeQHmEY=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rExcp-JSV4_gVU_cYr24uA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=149.50229&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Równik' AND address = 'Jedności Narodowej 47, 50-260 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Cafe Targowa
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNfOZSO6AnskyEJDx-Nu7Ar6J7xyUxYnNYz3vWC=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noLWw408kXtQUSsASb2rQThkyphXL3XdhdRJyoQLMVeyiL4cU7fsqQHQstuaZC-NJyeb_WJWvTVVBvcUH_q5AmPlNbXhSdPOKcghCEDa-SbJhWZFC1E_aIuo_Y_tfb61JE5McxK=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP85YE0LAiY7o31VMD-Xx_QrrVAkE8klygwf0nN=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nroLRleuL8oEIcnGUjCOjOwBt_XMLAOLhxJ8AZ7Q9QOb0QGWe34vEGlYz0mesoPWGBCCij4NhCGBS3sS7--8s4nvlnBEJ0NbJ7TyuqpaZYcctVkCIIVsWI8wnE04hPog7wS7OwH=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrVO909xNwg9tNOhpgniW4cUGTd1yurRZNEn1yWqqqM53n4js-k6co7-lh0KHk5Ij3W9dokBETNEfBwYwHajO0-x3MQKdyuabxSULE3NXeJYupOhciQ2w_js7Q8b1uYt2WtrTVM=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npcw2A4TmqiqB2HQ__iH0qtT1XOKjWhZhClYwVF1wsM_a2nxmSbwkJm5Z8f7tZjOOeeLZ9LREDn_h9NcBHJz4Sc9Z-C4P3GYyum-VPjQVcObEs2t5Uy66hoJYsamabLr14F6cE=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPTpy9sjiu4Q4KiCE1DyoKMITWvBIboBWyZ0kBI=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNlnf_-3WjDw31HvGGBZIarCgUCQsr7gWbvs0CK=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=L7CsQyZ8ZsA9pq9PnhH3ZA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=143.25754&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Cafe Targowa' AND address = 'Piaskowa 17, Stoisko 11, 50-158, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: El Gato Specialty Coffee Roasters
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOShGFXxTtq-Og_P-gw1Gi9EwxDdjM5zPpCx-7e=w528-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npUB2ogJSxm5M88Ztr3G3L9MvWJ61o4OTzGTVEUVgPnMfRfe9R3PrrbXcIAlvxS_qgicb-4OVGZ1rOLxcXzwkn9C_C9bJdB4OLnLbhmbhKz23VuYLJNQt0dtWsxg-O52e36QNUFVf770Uj3=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr8vsV_hUDhcE_1OFBUmvhKeyCCOEVP58cO66nOqujTWtVqDoY-t_hYPHFpCEgOE8fJ5ddvLGHNrHkmGPupN8P3jnBB48Ny8XCGYxUSr4OMl5zpOy5h5e7FAQ-5sP3YePIqnak=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqIcYaxiCYpiq6x2flZfMJPJgsbMy8wf-Ykj0mamZAloz54Tjdr_S_110t4TckXdsDotVX-2Gqhqy3-XdSf26on8VnATxiCr3TfpcoUC0MsCHnVIDkSSNz9ipF_0v9uM9_KX39yCA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOnYyqbBedeN-ofDM-uokc-dRAXqNjKCOAK7saB=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noHrgDgWzno3KI924-WD4v_KxDayGpfvhlwAYpPSuBmIE7Fj00G9ZB-j-o8t476hCc13rJOK8fw4PhQMBnwfF3s1rNCSbhLnBiRxbLcT0BtV-J0ZysfB_7x3PGx2xjKmZDqIgw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4notcuIwN3X9rbO0PpdI_msNyNUzV7V9jMfeMGlLSv0HWK-WeYdxrM6GrraO03xtyzZm4n522E-sHgNmAnlCdV_AB-lVb01x40DIH6RWAFzjgIfUEgE3lO-HfwksrUG1wsjQosSd=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4non0PFuoZWC1qXwDr2N_gZpwKVEMLqpYMEq6f9zYIivMIAZIOc9ni0ORodbuu7uj6ba3U50qLBdvlN6nms45rltnDtYz-TsZGC56c7Bjk8w4gUZ9nMR5xWIJbSIRI9Eur7EspO5=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npUG27KFtKal4hVy9F4bzKqOuFgZTqF8vAkK_jIo_hppPUYUFZobMeNNP34hDTxJ5BmvSP-9Vyoq4ovjVOeDtIOYzlsQ-jX9z3QJl5fnPON448rDhhtibITMdl2PTa2hDTkYNo=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no7139yKCicPf6BlYyxw57IiKhlGCldcm2nngyZslldgm_9iE2ZrbEqB3Ehy_vriv5lF4QJD3daWOwFhomsKvMCLvi04VtEsp7UNSF9OeWGYMV4Iv8sUXKN6KDaJoQ5PhNlToSo=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPaPQEMhMgACQ6_NLRD8BYFEKNZ4AcGn_DLbm8a=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=jwKNql20dlXJJ0WL905voQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=87.35332&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'El Gato Specialty Coffee Roasters' AND address = 'Odrzańska 8/1, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: OTO Coffee Bar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noBjWA3gkIpT1JL6F5hemQcWffDscf_eh5mcmen9tjn-YWvxjgDjMGqFGtu82WodRsGRr1MN69GnNRJJpfnWW-tHix9HfLEZb7Sl33NGiKYZJeqJqLu4frNh6I9GBwwpDGqxv_r=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr3d-dKP4e-L5r4EyYWpcyfU61LtElOnyebx24lX1L4EyN6fnr3QrYG5own5iOzwZCV4Z7RFi1ywaUkXSW19Fp4v0pWRgbrYw1Gt6hW1OREyxSyiD6CLbksKvDrV3OZUeX5bkjCDmVaFfNS=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrXwzlubEhKFX0wlpvebW9zDFvBGvgCDiXS7Ime2V80CbfJfRUlfJSujGzDIptW4Izf9tAQaLdOBGmxNlh_tLEOVw_nPOEq2-Snv9GUpz99JQxzg0LQmGWYZgqSKHSHs19_fzI_=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqM_3SdL2WWb7Op5ByB5dB271p8Z8WEYtvgD7GSsKW2Hs-hP0D9w54CXkb_be_xMuX_DXmrJY1UTyUZ2_Z1sbGepglk-ZOrog8MiaAsDgRBBm6a93YWZ5uJN_mPTA9QphvP38fhZvvuFa8=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr4ePSJdqq2uC1vBv-n6f4KiNgD8VrKZAm6CLY3GnmSzXydmXr0S_wmxAAyYtJDdBITLYNs_hgxkKA_6lq6xwDa-CNfvFX-t0f3Vxis2yUKXeMjS-HmsHLoey6pNR4nZd5aXrQF=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr9kzazWmRh8H8YKyytrlyloHTPvE4kUNMQ8uTtTLPAEGEd0tTKFyoyFCn4XOXcUIzR9zsc_K6HsXi1wiYOqy-gtXu1aI9r2l20ThZLHYniXHkM4W10GqZqhhyYpBrzP23cUYlTEw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrkkbEIp4d9y7RN-Ybg19h3lxKIuXSgJXlRT2heJAOWzbYbacwr71cvpJLdee3Je6LDNWobRDw2s6xF-_-IO1J03M4pTdJdEPRzyK25GRofcoEPBAZyehOetGBlTmHM9yrnxAxY=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npX15YctG_TEt41fOEr-_2G5FBReRqaGDqCVoGD5HAfoC3tuo47OkrrA2G8wlqxN7X5RP_y10NErRN7fC0mSb_JqFTJOv6BGBzjM-LnFmXxi9YBC0Z3EL4ZkGhZuGto4eIrjNw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqDwWdXRCGsq8smMgN70ZmaGmeFDcwHKFePaAHMGsSbewgralZSLjl-Y-yestcJ4rmFAjGQKAi-5qeeDWip6_t8rk_sZq2YeGNX0-tqP46dXE3rV-G5bnUlgOiJk1g2Jw5DgLGc=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMfW_zkHRQR4VZkGZN_oxRWKytxwht5D-YSAeFU=w521-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-xNtcMtOjvQuebquj8hYZw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=239.46971&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'OTO Coffee Bar' AND address = 'Świętego Antoniego 28, 50-073 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Kawiarenka św. Jadwigi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMYLPHtKlalKQGfc01d2sA0uyP-vyknyJKyo-aI=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noJfUTj4SM9529ZZdJ5J-EGCOwOzef-VsiQusxAwU-YiM4jp0gJbNZ9C3vsnQxrtqgFpQPuEMNYxz637wJm3w4Q_Q2tNEw5VowbkCapAngEkv0VEnpErEO7w8_XNG1IypAspSxs8JxRdhi7=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npGiSD9DXlfLxqXcXK7CHSbW51dlV-XTvmJ1xtlxeeDUywe7eYTXSc23872I7P8tGQCkoXXH3dx_f_Nmrt1PiYKDM54Dh3m7a0oRTvLWZ1eFpuJqYp3bd3TYEjITI2APjiA9C0h=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP90pkooP6o_7B0QaGU_W_H958R-jRPiCmFbdMR=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrENQWNH4T0WnbvJ97llDFYd5uoHKmsL9hesCPzBetR-Hw6OGzxwpGr5ftsPgR2FMgJfDo1G3ASxG-mLLofojeUYZJNchbMb58d7c3B7-A9yzh6UhQSK2Acm6kl1h1557yZDAfu9w=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrNI5cgkBv8kfP9VEjG7WyXBjIW79h_l-gdOeeaYMWR8MrIXs1mV-rIktg95tZw_sYpYccMcO8AXU3KnT803OsZHPuwvgEfBbSWqK34Uhefa1Gj4nmkgt5l2LY9uQqycr4I6rHP=w224-h299-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npinxGee9cLUgHHVfnC5_xjRRpy7lNLzM9cNdLacimpGNWlOatTVcaJG75XfWvTA5bQdXpzx0gsxWVWwB3JBy90hOa59HbAf-kexM-i3rk-_hiN7VfVbzomppX6VGxQ_poc7Mw5Ug=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMQQ7PN7Jax0E_-HiWrjV8znR4IAbwqMU9UUJkO=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=sy7QcSseeXaR3qCX0Grt7Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=42.69765&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Kawiarenka św. Jadwigi' AND address = 'Świętego Marcina 12, 50-327 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Cherubinowy Wędrowiec
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nroLWO0bG2l4YHfXInEaBLWavJuZWBHSjGDXlV3grlQtRegccZFJ_s9yMSV8FZiE6ZwgIS_Kvb1SaHZAbZvWsWGEi6HbGpz6ajobSzKh1a0wBRJUXMPLKa8hDQ0UPN8dooUcdJ7=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no2WSFFoVFgyXmYvmirJwvTSnMCqG84bZZkBRt1LLzZtXyy2RCgK-f5vyDUqqz8clVh8olr4fCm37-j5fJP8CRSNfPZRWpnm1MX2mlUxBFfFf5lLZv3vevgEzPEGbA857TNZoOyoJ9uTeWV=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqDB5L1pzUw-AQnI_VcOaiiPpbSyd-QUUFOHwJbM2RkeUJnwT8DsMfZ8PH99qH0BfbwbQpHEnunXzmBh7dmmqs9FQ5zr2ryFlhkrZ2qnKVMHFzZb9V911jf7PJBCPqlpY3SVP0=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMPa_hlwhq0uUz6v-34CKiexiqMy4vQovPVzdHK=w421-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqDUfTaG_lBrIBUv1SPuFCQIicpyACubg1WVsIEzNitYfKpaC2Sweq0ijUJ6tZwV1KpbTieOtjYBTWNSq50nvOvH3lVxuM6OByUA6FKS_RKBT1NE7evRrs2AuQZl_G_HGiu46XrqA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrnwRtMjXoKIF9CuROlZquqLy4RvO7Eob-GNqxHxlmEbO3ynY5g4cfi0wJ4HDHnJESec5YOEcnM3XSHTw2daq9Mp66ElwrW71JJB_sI-iJp4j1z0sPv7kFh_pYSYkruS_VQIJfP=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr-TWCoDmm09AwV6G0Q7EY8N2romnvo29lH1DKEIgpue2FdI6PaDF71Gh2DoDpqcBAPp-8z2i743r6r4HOUvfSdfGdzycjZtdWCRzGa01xJ7fT-tZA1o7moPn8gryHnaJ9sHkye=w224-h484-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrwULxXRuDQwn7gAaUmoxk6gCjomQpMbvA7nmBR1nyTyTk423BBxNlOWoCrLsHp0Wyo6bCGKvECjJ1mmDHxzBt8ObybVuZ2Bk1kRqPPiFwifyIiydMfnm9HCTJNC-m5f8xwXMvr=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqdJEfzhaYUERapcxQmByr04qodebuePGrzSZAq144E_RczIZo0LHxI1j8s2_dUFVyikZkdp-IT3ZGOj1Fsv85q0huTqnv4PpfabMEWMgiDI1lH103ln4ZXs7_zh8Y4FzmHFl4=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMLwC4GzLOOSTJSeUimhSq6X3hpS-mnvHAJ-KJT=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOQhukXi1QiKtRFKpQzRdUH4MG3jWYdwxNbn-SL=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=I9PkQbcIAjUC5gZ295pPqw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=168.07985&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Cherubinowy Wędrowiec' AND address = 'plac Nankiera 17a, 50-140 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Parrot Coffee
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqzQ3i2_MZNIjoQdSt-5deuA4BwFoSqE6D6zyDkJztvgJIEZjJ4K5yCKH5UOrJcDXIr4DQHoR-3O9l2czRJkVwapDYIt6uzObpMo0Sd33yOVFmYobZQBr8o4bo-bYr-nGiJ_31JBA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nolzlCBYj_WdRgi2t5nRJxzJiuWjGbX4h_x2e0Jqys1x-NdYK0tZu6BRhgZFe4hHJijXYDIDdj2FdqbWbjlZ3tBtY_qtTGiAaDS0S2BfsMKwi3M9UkG7MhssL8c2C3JPMjmXouy2vFnUko=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrqD3-NwePnuvLfhdusq0CIo3eGPbgVmLqizWo-VTIUYHIJINQNhlU8C7X8s6aKSwQDXC9hgPHxwqH9aRis59SSp8CFGcobXWRd6Xs3Bv4nQzUAzSINfD_nO1xzK6KNT2_bp8rI=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrZALbs4PBqjuus6t7AD5gaOUkXaYz4gZOQM9i0NCCNt04MraWGtGZ-91E-YNvXRzNOw0il8NdNo0m8prbvjxtgDkn6RTVghFs97Wb3pmBug4mEfA-Wcgkfg0fFmOXpVh4v8LPW=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOhTUNJjyI9h39prD6-OMBxh7PrNzzAaAPHCQ2I=w224-h319-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nor6ROtIQcWcg6SwkUMUksyxFSb4SnYcglZMkjQFZ0dJWxRx8gQ1GMj93EfJuNAVY0dcWOhC45TDmaWU0Ihp9m9wuPLkzQMgX2Vd3NxqVJ1cEWlgdPVLjfgtmPpjLFMaek_AUA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqzEt2NjBrdnnihimiyQEt6KtFtBwsab47E7Z3efwi0dG9eLQuyOfbna79eKBgDio9muqpDFmsG9hZbHyB8vbgntgR5NFBGnlBxDxZBKursqZvdMj8g4t5qzjhaPRPr-ZvE-QKRag=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrSE5-c5ROBvglm2rXJkllrPRmptpTRhw_GNghku-vDjr-qj9KiX8R2FddE7If51zIHDcoo2FKb6mdSfxNBsNEZ_eVrpiQoI1DIR2t8gDWYK04DlDHBSUzBy5JA9IYrwD10vOGO=w226-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPKxJEwxIhfngUx3Ul6zwWpYyPeE7vQPQZomOfY=w227-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOFJL_itnqM2SVskZouHI1g9K4YJa4GDJ0Cb0pg=w224-h479-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq6WFcZNOqFo1_EEfX2eY2TVygwm_DCnFu1rLf7dBOULQcu9Z2lTDYfncvYG2877Z-nXusaEl6SEbp19_r9rK3j7oZNylO5V-7u7SZmC-LC91gtYcyJLbUUBhUIMtjA1nrAocj5=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOUu5csu7cBrybwYVtCqleYAr5mhiCjQXdyt5Vf=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=obvRHrQ42K8mTkty4-gKPQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=262.94928&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Parrot Coffee' AND address = 'Generała Józefa Bema 2, 50-265 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Baldachim Kawiarnia
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO37A_QDbeOW4RGoV1lfjioYlcooD-EUVzIObPI=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Baldachim Kawiarnia' AND address = 'Świętej Jadwigi 9/1A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np96ABSEvRBagucmPMT4H4hI4YN0mq0Ws2WEbp04e_O0zpN0ZHjB--19JwHKcdq_4AXrv96E6t6imuZCUKMJg7x32C-e6cjZp-dJIK2fniJTzGuHzWUDY3nis0luvxYxYxrzesDETThO6yU=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Baldachim Kawiarnia' AND address = 'Świętej Jadwigi 9/1A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrN1DekPr-rM1PSEjPoQzzDwRZuWd8z5zvj5vPGCptt7N8JKkjJ_00jbUjBWtIO015X0LmrdoJr_jGDtcaNpcuYa_fR1iGCli3ndqnFYMge5uHGNyLBkKqymMbphMqEHQclKj75=w224-h389-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Baldachim Kawiarnia' AND address = 'Świętej Jadwigi 9/1A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMjgaVjV9lFUXh4Nm9pomMrQ5q36J36WNTVmmMo=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Baldachim Kawiarnia' AND address = 'Świętej Jadwigi 9/1A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPpNBjWP7d0jRcEeKxPdhDZaRTyCG_LJwzZvLmC=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Baldachim Kawiarnia' AND address = 'Świętej Jadwigi 9/1A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npH5pja-K-YHUG0i2oBuumM2Vf4m9l0HloYCly-Bkaou5LxyOScJ1IFf3uAWAzaaj2-rWP_4m3cb5GAwhF_M2cPruU-dzAvhYLb-kReeCHFqsE5Z23AGbWDxz91jz2auWukW2fK6A=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Baldachim Kawiarnia' AND address = 'Świętej Jadwigi 9/1A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP9kATxX425IZ0fJv6Sd418sYVHap0QHTE0jKrD=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Baldachim Kawiarnia' AND address = 'Świętej Jadwigi 9/1A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_MJag0JZH0c76if9Tykleg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=278.77377&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Baldachim Kawiarnia' AND address = 'Świętej Jadwigi 9/1A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: ARTCAF
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrI13BHEjuNptJz_D4lz5-YTET1iYMM9EOMFS0vwomm6WfP9xex0VUcHKIfGO7THmgePSo9m5dCXVBwSomLGflbW1kV-hA0SbdCf8SAmMckTYOmcIsUwDOFdphpkgrc4mJont34NQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqrgtMMBZTihLwxAFZkRG6ilmhhCQkzq2e335_F24C52LHb3t8OCv0Jvp4li6amCBf9GaSL29FBtk-pgP5Kr0UAUXwnCZ82yjsMoHo0ZH3Do5yz0CFp6HW0nnic7-1YbkUQVKzVJ939aUBO=w224-h479-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npiYF3ZJLVkIu9jEnomzcKnVPaypAa1PqjY1KFNLI84oumBhwC773U9iBdzouVYff8lwqXOGMpodvBhJx9HtIWr1nE9cG2w6RqU_T7G_XVN1M_fYrPhzs9TTZ8E754aSmunWFizxg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npOPG9ueO9GotCyMi7_-XnBgztruwBen2XHdSv52KnAhDaPvpdi7-vhecdSFHeop6-Ceku65HUGvkx6LjEJ2hRTg0O9Ug4ciHMskck90zPg18TEAXYZ7VAJDQQP4J_eWiDlSf8M2Q=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO5DXMlTq9k1ET-psOJ3xzPWrmTQrAF4NQaGO3F=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqN3VTRR5Pg0HyeCUt3-295-O9Ml4OHQuw_HTHCGuGi9zLTOwJHKEmVQV3oKSKyohQrj3-eyIZzM9o9Y3Pi9OfxdznYugQ5v67574MohMqTkfRAg2w_96b-CYAt5HdCRUxIHqDb=w396-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO5DXMlTq9k1ET-psOJ3xzPWrmTQrAF4NQaGO3F=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq1icqcaEIMdm68XNsnOLcGPtqq9X9Ty7VhRKtKdnFfUsLUZ9gSW_0XR2dkOz_AskU6iVm2bUtke2NVrobUEhrQKtedMeiQ1vrU1ubuYheL6AUK_GMjhXw1yFL4kmBuuSx36YbO=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPwSOHR6zzseLCZfzLayUHgyEG8VobPqd89deE2=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr2JfkoGmj6NcjRADHjo0EzeUU_Lk1Qu2qBXxu4T7m375u7FbvLGdcvohzWgUIH7gkoDfBX-zGt7hIcaoHXnKvhxz1AEyuAsYVKx-WYg_VyLjxge-oKg-agu6kZvgL7nm3HJmCE=w497-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMc0bQ7fXsOfJ1VMfPxsddLoIiWLRT9IbasRFlP=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=aBWcj6FvTXuBT7QMdstzng&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=42.001747&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'ARTCAF' AND address = 'Braniborska 10e, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Fama cafe
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPZ1Z4k9_FGcfVsyN-bFivrW_zeUHBdHeUzRs9g=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrxLXC3vfVrXvyOudZfN-pEBLiKsX_r3Lc7SD6mATRHzjQ6c9NrK3BaV5EMIh6crLRPVWCrobyNfpulpDy2naPo923yybVGZnb7jBygHDUolSVnPjUODptHD2wc3-nohAYUF0_h8NnaHcU=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nofHii3Xds73wgOO3OPkyad_apFnjK4TOS3lrQwd0_fR45UYyPyi21XukmZy0XZZRMQw_SOxtqV-N33GX2xojFbZCimLmy_SUTxg1AFsJQ2um3uQ7oclu5cdEr8EEF8gm5Go59D0A=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOlGhAaMwoSwpofELxB3rJ4dstMsOuY5UMpAcVs=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq06Zgtozz2jisGeX2DFd5aTt6XDJsS30CP6_mxUdiMtImkAYEDWHnzsJ2yU56j8c2qYpBATmaCXGWcnqRqXS78bxYbcWrqP4tDkcsC-2AUH3Fzm-bB2GtCPPTbmMHUMVqAfHA6=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrg4hJ6wIYLWkQbXrYny2xRXjtHcbbSqvIe2VmYuxFJOlp2WRwHhFi6gYyFxaUkTgpzz9-wjPTzL3Ncrvsit8g2EGLJ0ObuV9VjnJYFDvTvZUtWWtoT9pTnMrvJ044t-gygvVbN4A=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOZq4kZHJwhFuFq8g-Cj0Aa3qFYxCP7b5oT-f5y=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNM1SUPlkiItA9VTsD2kUrhlnovI3GXrff3KF45=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=EiZxYpxeoInv-VV5KLEuFw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=179.86243&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Fama cafe' AND address = 'Bolesława Prusa 51A, 50-317 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: NIECAFE
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN46fwkAUBE9VNoconFLglD4YRVH3pHrrttkHFR=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'NIECAFE' AND address = 'Tęczowa 1, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np3KS7SCOZHmHp6vC14tFTi7CPbggfhApZHgOTeT4l3cHFYxb-bv1qXSRe5U1ThC1qnmZH-teXQRVK9-n2tGVUFfVCqgdU8yZtRKaoMAOk51GzwlbjL2PpUX87YGidXaikmWgTP6j6X5uA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'NIECAFE' AND address = 'Tęczowa 1, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npABNelOgvEEwz5wsvQ44-MY5QUS2iZwIxRInIDiZOrgUEfIIW53wQZ_jKAAuXJcKRSRWyCwLwWCv-F4Ij8SVI5TsNJp6saIaYTHeepB3Y088aUWE3U7vRQ-bXYyJwAfYUAEC_G=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'NIECAFE' AND address = 'Tęczowa 1, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrlsIjbqWdUi2a6KwQ1OcVYnGZHWRQCzIkJctGcD92wCL6zLQOBMhbzPhf33jyhzU9fpsNHcKK68OiZYLi2uq_CuIjTqvKRIWrhyf8UeMmLLCFlr_DFLTXGteYCPwUohtmfa1s=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'NIECAFE' AND address = 'Tęczowa 1, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMJ8IhcWXCrq7KprUaGboVLybbu8G-ingE90qzt=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'NIECAFE' AND address = 'Tęczowa 1, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM4vtbMQ2jfOXZpRrxhWJdm7ynjkm3gvIChwl7K=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'NIECAFE' AND address = 'Tęczowa 1, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=OmtNSeOFAYe8TeN85BI3sQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=249.64821&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'NIECAFE' AND address = 'Tęczowa 1, 53-601 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Vinyl Cafe
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNSI1j0i0skUgUNaHLz88OKHKAibExBPqJgYebr=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noC3JEFdLMXerOZLnP6894u_fOf8FIPArZoQzQhXTFw-3_d3uaTkxXyjq5eh3_PODkW03OaO3uayyN82cEE8rJXeDCYkYwtCdsp0TKZDQ4FNjSORPJQs8EzVfxiLga_5DQa_PfkjhUFk6JR=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noEkvLhqOEDEuAM_9KbAyCLTIS8VTHl-rEYI6UVOT4nIk-XcKv8yRHxH_SNOBtrggxP40nXE0G5CSedr_JV59MELr16_g9LdOqZ5Y_1wSejQfvv1f5WiLM9s3QetI8EnV4lkcTLZg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrQ6BCbe6fcrCZSScI0A1CwCyQ-01OHjX0fmleBiKJeIMaXBW2MwiVvHfOUW9Uvlyi_tKTtz-8NufbGGtmocAUYTATsHwXeC8M7DXen-RFVRMyq8_f-_RzKQlYe6F9ayiSHNOs=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr1Q0pUCMfCMjX5M4pKsTPE59tksDsO5FvkBhB4P0Kvw9JGFdwMRxkzjCq-8m55sxXRyB6uQ9RXFNcXHWzEKaaKILnGg4h1Z1ESylItwrYQJybaGSH-K2Jq3_DOV0_vaiKv6aw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPF5t_CrI7gvW41mMjp2WTvUc0_kpgZwNs0NU4A=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no_7hO-M5Pxg3y9e2CbeAQfUXY7EHBQ0JWJSq8BMIx1xNM6CdYcOnwLTftGxBsENukFlpce69bs1MLZgd24Prh6vP8Pp221vYCZSs47cT7GCoUFGDb4XzYB_Pbgdnr6KJI6QvrE=w345-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNrmIcl0zHQ1wX6bJIk6Ppir4rCT6hzGexfAytm=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9HHH4w5CGEhcnBfDyQssQB4K_2B4S29AhCHgUmnQP3Alf4msEtGlIoOrgamxF_IQ_7nHhiuSt9NNOZnNJ8KdLyd_Tw9GBqCnFmJCBEG8dY1TBKTJleeMoXOXMrBo_YzSDAfGE=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq_CI31t6XDtnsnQPbdEcZDJVXNe-3OSfYtlK6styYScwrh8v4BZH3Xr0DeO1hPUJlf4zlsh27o5WYKnKSL4l07vonNI82X2sBtKk8-Jzo-_A7qPICjqyZa7F-rHcRbNgVKvfZI=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqcUJyTxM60XGFprmEGoRzLVlnW4pFoelWZW79ZZMm-485FvqsHErTTzRM9A9fNP_S1t18qJB6GS1UotXsEGLVruJZhj3G7d0dTUQQnbawGMFIX1BS_bPniZgHA1VN8HF40G1XY=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNMaMJLPFGfWNT5KHfWixaxJIsXZ9wsijxUtc1e=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rcVAi_5in_Wp0BZUA84gyw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=202.42963&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Vinyl Cafe' AND address = 'Kotlarska 35/36, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Kofeina
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOew7cTI5LkOeOuAsQmfwvWg1B6pqCnBuA0_6xE=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kofeina' AND address = 'Szewska 68, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM3oOdAgPNrrYZ7dm4kNvk73mqkZeML_IYkyhng=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kofeina' AND address = 'Szewska 68, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noFot-pfoJWauXPHruRMF7ArVBESEcB7uGPK2baBKj6iXus04D1jb279WB6OgNDNFHzq22IwADVk_rbyIMR0IksHrhdazykFeWGinfgYzcnA1VA_mFEm8pCgG3l2yNox6VCXKo=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kofeina' AND address = 'Szewska 68, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npp-dqM7PxHg1uS8brrOE9ZpZzh-3q3tF_cc_tde04a9qSUsGHFaXy22T4KPW_Gd6fG6OFYoVoLNiQ_dNXDueCnphjKr1uxY0ZrbTlj5z9USp7eukiYtCdTMVQcqGd-gksGyAmi=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kofeina' AND address = 'Szewska 68, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOHBxNbNnmL7U1K_q5QV-kWOUoGagkHAUcEEZ_u=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kofeina' AND address = 'Szewska 68, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PFPZHH4SdIf83bq8yzGOXg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=306.75412&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Kofeina' AND address = 'Szewska 68, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: lotos - centrum handlowe
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npX78qBcpjqSg97BB08ci4eJrEOmGNJp8WiD1UD_la6MY7X_av2rGg3WK64UW-YPeV8gkHzFyG8J0yZrrZ2EVQ7QSipMiEi1mNIDRJdTsSHuO8cSjU3qRpKe8ombu8oWzIR6KV-=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'lotos - centrum handlowe' AND address = 'Grabiszyńska 3, 53-503 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hsXNlZQEqA3P0rLM4kZe9Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=347.3948&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'lotos - centrum handlowe' AND address = 'Grabiszyńska 3, 53-503 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Centrum Handlowe Auchan Bielany Wrocławskie
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPC6WxvpRkvR7v32lnvb5Xj4gSv8aSqHvMeZJs0=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Auchan Bielany Wrocławskie' AND address = 'Francuska 6, 55-040 Bielany Wrocławskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqw8OunmuxeygIy1Rj0tNA13pL60f2ykSwk5oUEF0rkmdPcG73xzW-KcNjH2q3dakoMU5WCYU8PVuD12lb6Zrywu2OwJVbcyXIhyM1Uw5U5Q_gdUNb2MX5FB_zuNUsooL-rvTf5UwPSyUgq=w224-h397-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Auchan Bielany Wrocławskie' AND address = 'Francuska 6, 55-040 Bielany Wrocławskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrBeK6a_RbvrLRTR43USQc9NwBthdaD5yrMcfEd65WrikrF44kxPBtYKu6l-lIvssJE2J4flfN_xGWwBBK_TYAT81Jj4VBfggoWJL9gGMTEaZ1SedyVBrLkoHPA2cL222jVidcPnA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Auchan Bielany Wrocławskie' AND address = 'Francuska 6, 55-040 Bielany Wrocławskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPDnK9-Dlz8EZ9I8Ujl75ytn-5vTudQMSfYxOgc=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Auchan Bielany Wrocławskie' AND address = 'Francuska 6, 55-040 Bielany Wrocławskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN-SLgRJZMgjbYfasn8kqvwdPNN8W3SEmJqCvi7=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Auchan Bielany Wrocławskie' AND address = 'Francuska 6, 55-040 Bielany Wrocławskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMgPTIjR9EVOLpAwtitOT0LZcok4X0i5lYYc08u=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Auchan Bielany Wrocławskie' AND address = 'Francuska 6, 55-040 Bielany Wrocławskie' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noRcSCuX_3rwBw8gV9OQOrRpnQphg9n_wLgMjGVifXHhoDJlG-Tvey0IO5E1bFH_x8GNb6PtyzDkNOs5oJWvA5czJm2V0QLvoWjpDRPU6DpnA8Ow4D_eXJygepf72ddzQX3JdtKLA=w224-h298-k-no-pi-15.886119-ya353.14508-ro2.6657746-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Auchan Bielany Wrocławskie' AND address = 'Francuska 6, 55-040 Bielany Wrocławskie' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Galeria Dominikańska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqfEXnjnQmISO6ws4Xh1a2BoDtNUDmryw7PHt6uBjvwCab3QVAF_qjtXNNF4z3t34ApUKkSUMs15gNP4n6lCoE5NRJ9jIMRKvxKobhCYotf8XFIw6MsruEH1QI-7G79UkLH3aZy=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = 'plac Dominikański 3, 50-159 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npLtP8rS6nXFaSG5mfhoS9eggI0UgcNXmKbkCxQrAfDTfpEfHnQIK7NMeecn_IC8DCD9CkyCKCPROcl4HypariaLKwhpBdPiEnTIXO6LHirNAlHFoRARvCKdYlUt4OAEid2KoLC1sV5eic=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = 'plac Dominikański 3, 50-159 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqwFM96JViKdCqwzYhrrRGi9yxrGXmbfMbL5m7jrgYqw1MCCIjj9vKfH82S5NlG9eLEmrD1mNNSYZwJ3FnIjETs8AB95PehpeC8fwN_nqID5-mqeRPqFftW2zZjp_AUw7BhMuc-dA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = 'plac Dominikański 3, 50-159 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq-kedZf8zusndmHOwGz6M-vjD8i9VZofHm8qusqvmWQoCZDy2837bDwAd_K6UZwIlcwTRGfhUJeOrvcVYk25ezifSAt5-aNKrlp1JQBDq_QuNlDub-6iLh0N3uMp8WxILWx2-8dQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = 'plac Dominikański 3, 50-159 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP_Bqr1eApTbf-5n_XqrTL3bAJoTULyjevzliGj=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = 'plac Dominikański 3, 50-159 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrskOlWuxVSYZxNMg9biVtm9R5mXX86Nmb3tu3XnuOtYMzPXlu3lHpVUbwIy31FbBP1K0tmcUX7SPiCY6FXL3XKE7U_lq-PmsHEkub-HqoAkBJnajV-XKYMo6yT7XD5Qa7DoF8q=w224-h298-k-no-pi-0-ya230.99998-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = 'plac Dominikański 3, 50-159 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Renoma
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4notW9biLIfY7TEVw9LIXtwlgZbanZhiLYzR722LpWBX9EXT_lgZeSY49NttkVivI9KiXZsqstf5k8QuW2TK7MZZ8aV7NPeCb6fc3rpJZlp69QI7aQ-4fSmhY0dmHm-ipDcQmTs=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Renoma' AND address = 'Świdnicka 40, 50-024 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrCAUVekEQvP_I1lzZcrfu_lv9p-xeWUwPaHGxIbp6GQnYCWdXU8k5rjrBs-jhdJnkV-RG59vxWNmVuLW6AD3NWrmBx0g-08i2aTFZTCKg9Fn46h13uRINB2fBtiOveTqkfZP9bpuhriJv3=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Renoma' AND address = 'Świdnicka 40, 50-024 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrUinHm-YWwWteRw1XVPP3yNkp0HMapU949NTOhA0WzgzUkTQZYuJ6TKqCaTSTEjLjq-I1U6F4HMhFIWsd-IPEf49iWPq284MFZkxmDykZRqbo5LrS0Dmi8aeycf-ze-Xt3S2Na4w=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Renoma' AND address = 'Świdnicka 40, 50-024 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nopgnVpLXMxZckxnOj7x0kLeRbD95lpmUSNQoHtxTeNNpMrpASPNiIrA_kK-uyPG82kgIDBFKZ9R70Gi1F5Crd0ybi_SatIPW92-7_1-GrncOoWxfFizLPgqZpW6UXUN_sdLzKiMQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Renoma' AND address = 'Świdnicka 40, 50-024 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPkWTt440hksdUXfRr_v0gH-RIOFXFzE4gq66ux=w566-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Renoma' AND address = 'Świdnicka 40, 50-024 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqi6fafx23cm7Ktag6s1PLjJCiuTrI4bUQd1fcwlp72Vj0YsT-oOqQFoI-Ce9pi_Ga79lAL85slVTgx_ii_mwxnTFpAUauGUNj1N0CO65VDKRK_QCyQpcp7DFRbn0FMjHwF=w224-h298-k-no-pi-30.000002-ya238.87431-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Renoma' AND address = 'Świdnicka 40, 50-024 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Pasaż Zielińskiego
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP69UvZl6yEu7I6dkcx5G6ZDa69ZmIxWCWZuK3h=w531-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Zielińskiego' AND address = 'Swobodna 37, 50-088 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npSGEw9-quaC28qDpC6MZgRtsgbNfEIhrMZCuVxRMqd71B5Z9_WcLgxAdY0WDDUayri5zvuG13WsGO9YfKgpZ-Y1biWVp1TCud_X1rMD43ErZc80EbIFEh3O7pR85tI0A8LH35T5Y_ZExvf=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Zielińskiego' AND address = 'Swobodna 37, 50-088 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nojdZjJtzQirPNNoADJLTeTF6bKqxNsywu9dZz6TyajH6FfCPpEIIHrPp8dccvlzFFIiRK5o-GThcHIVRJJphQRkzLhrdOkjkxqOkjmFFqDdLbxaGuyCIFGauoRtl2iYpFlFXhd=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Zielińskiego' AND address = 'Swobodna 37, 50-088 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNC27BgdKPOMAQt0AkKerNGAda-TfkOrMNsCBlZ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Zielińskiego' AND address = 'Swobodna 37, 50-088 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMtQU_VQ9HoFuWWJAubcNsI0j5KywP4ZznBH4-S=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Zielińskiego' AND address = 'Swobodna 37, 50-088 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq4LIC-JQAsLcR_5uZZ5aiaEXZV6IzX3DoMoTz6nJkgWA3FAdBIJXdVyMqaiL-ilbM5KFZgHe_gbBU3cp3zZV-1GKepZGbe-2FkEw62fU3jKHB7I3RFJsbshh16XgvDR9GTpbzXlg=w224-h298-k-no-pi0-ya291.83-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Zielińskiego' AND address = 'Swobodna 37, 50-088 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Pasaż Grunwaldzki
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP_rlJNKcBMMEJNloJpAitq8BWLNuN3GvqGJRIi=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Grunwaldzki' AND address = 'plac Grunwaldzki 22, 50-363 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrYvlqNyPszzcwBW3QFR2rNcGTuQQ61eySXiZEMn5HQEbJvT8O6-Wxs8MSCglVUZcMVANxeNqVPnbgBxaLLfLnVtntYk3n1ul8TKWlBAhPgDjYnw1jGJSm0mQ1cjeMZ8_W2EoYFQT7rYRo=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Grunwaldzki' AND address = 'plac Grunwaldzki 22, 50-363 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npAY5ewf0f_Ivv4VVSyQ9iPuvCa5D8Cv2u4OSMr_Q0bL_-SkVUMQrmKsVRntnEq0Gd-gawDEx4cDI9_ZdZ6nCY0gawKonSShKwu51D6f77QiRWSN4XI70_VvfQCTHMgDeH_piM=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Grunwaldzki' AND address = 'plac Grunwaldzki 22, 50-363 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrN3C8qC0FkQLAhMyajeNIkz0MGUw03J7iIuoXrj4VkSPS7FFFy1FsRJvt8UFwA39mW6ByleSyH99ou38CcSdUZ2IIlaXGDQqXW_STjLRd60XjEI6HBgbsU09L8zxDyj31oE9z1OA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Grunwaldzki' AND address = 'plac Grunwaldzki 22, 50-363 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4norlry6daVkS0bnlDHfxynUrpRiurnvDVcIDx7UpQEgy0A1BN8xKcQ-wsBvDvJe-gAvPReJlKBbN_nAOS0TbhnamKAQ8vBjZxkGT4CjEIVYeBuXdyhlJ3WrIv0yu75ES2XZTy_7kw=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Grunwaldzki' AND address = 'plac Grunwaldzki 22, 50-363 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNSiw1mdNEx5bDPeuFSKjrQRJnO3BzjMTxKibpf=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Grunwaldzki' AND address = 'plac Grunwaldzki 22, 50-363 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no8Zdlz060y_pEOiNcRV5XVHsX9EYC8OeHf9A4uqzgkhhtSbWD5PKps4hRCWU1NQjB55jqOAilnn2VnHA1NSgvcbEM-ROgzkVGGkVPGBsck3kXxUTJ9a_XNkuqYCiPJ2EgPeV-A=w224-h298-k-no-pi33.890762-ya155.80481-ro-83.83167-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Grunwaldzki' AND address = 'plac Grunwaldzki 22, 50-363 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Wroclavia
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqH7nF_KKmBOkpHcQI9ky2sxLCRlzSaN93zSiacPgnb0jXgzdH0EI3KSXPqphwF3akNs8aS6kxCUEwbehNBhPGCvrPu9ZlK_llo1DVhxcczkmX-1J1jALxSK-eo3wFQHTg5a6p0WA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wroclavia' AND address = 'Sucha 1, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrYsU6xSdLzGVzWiB5PPWd1aHZhBUJIMsIq6ujp3_lKl_S7Pe-NfQCSbtKBr7PFR6Fe9zB3SlUzBN8350F63tq61b48TvqZeI5aXMuuec2mSfkKXgRUo_cd65NF_SX4Zm9LsIc1gyLDyAM=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wroclavia' AND address = 'Sucha 1, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqll2Cm2rEtnztHHcm_pOLAkNOxSGk8Eqy3rdA4zFiaIecoM1zA9qQQG5iPgyn5UPplmmEnrD8HbDoZWSt2nE8C6Qg0MgtgvG6jW7opQoIPjI1GpJ62CfREbiWe16XVcxxvVjk2=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wroclavia' AND address = 'Sucha 1, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no7opspaxyTs364TyevCjdUAanK-lZXkgYLe5ImqOcJXo9muWMTcjowJfV7cp5IzKo_0pKHX8cc3q8rX2OBrwvZERIxFmT6O1H4aFd53xmcYIEi6tECKGz_YfHB6Rt_HILAE9U3Pw=w662-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wroclavia' AND address = 'Sucha 1, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPvcOTypSjjkGN5XmSmgjjcyQFs98-T-lqSkUdX=w569-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wroclavia' AND address = 'Sucha 1, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqRfwZyKOnaPdmf6h4jLTevbdtpGgEP3pA1_f6Pq6F1pUp4ZocMO6XycrWZAMaqmaVBUTrkrvgwjYGWIuTPgA-ThY1c8zhDXUAjOhEAEhoJRBvnyiJUt0CJc7I461Qz0tyfn1gr3w=w224-h298-k-no-pi-0-ya180-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Wroclavia' AND address = 'Sucha 1, 50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Szewska Center
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9NHG-q_ZKWPiBpj0PPHJXfmOP0eUyADmXgxO6B9mvsM9wYFKgBdNT9cn1fEPRuE2OGg1ztIazRj9c1YqdPPEvT74lDLxdrNbJmi3zAFdS719nuJjF2SKqSU8xl_1rbHigvMAC1w=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szewska Center' AND address = 'Szewska 3a, 50-053 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqbbLqTWAJSHOiIEEP-VrFdbzQvTSfoHoDV9OtHtBTOgKkR5soPutqeNJvmh2zQ5T7xBUQnaHzSFDQIP6jVRlYeMGtF3XKoUvjbE3VB0Na6ni2-ssfso0DdHSkWSKaz_XlwJ8A=w242-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szewska Center' AND address = 'Szewska 3a, 50-053 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=OkeAuskdY8EKCqcHF4Oi2Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=212.54265&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Szewska Center' AND address = 'Szewska 3a, 50-053 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dom Handlowy Podwale
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nryY7mNNW8rru1PoY_IrZeObXrNYl66BWNpnMLXWWgwQbELXwjPgCjWFTE4iWb4SpWN3f9bokjnhi0Dbg6gkS99tZ3nbfIIDGKFL8fgHqOhwvEswGlOTBoescwdtnSXG2wGIkEm=w662-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Podwale' AND address = 'Podwale 37/38, 50-040 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no5IQ5ygATWplzIrPgI-OpYqK2JAxNRaGno3i_0vEEDPiohZNl7cwZS8C86RZ6odCJLgt216zJK9nbfX9ovQ51_qfPAM_IZferI0eJHsdKH2qCMkT0yVDfaYB1J1Sc6XIia71Z9VHHzqJg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Podwale' AND address = 'Podwale 37/38, 50-040 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrXmH9GkXD6jtzf9BR877W6DwXo9TVg6XH2ZWw4ZWUum4xuU275RZ459aGIv0uFV37-Dx9aDxk6uR2PaXYmY551UMHgsSfaggPMGD8einrgC_yrsUO3Boit8A8dkHUTQZkW1GZvsQ=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Podwale' AND address = 'Podwale 37/38, 50-040 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=lj6ll_WCvoDVu7Xon_mnAg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=203.6754&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Podwale' AND address = 'Podwale 37/38, 50-040 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Centrum Handlowe TGG
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNO-vRpiNwG7UCdcIyQ1oqb6zEiLs2L2qQJmSl-=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe TGG' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npMBWzdxNG_t3sfFY1suZQai-8TxQ6FShh4Fn1YYwPCLmWTvTy6nsh13YnkdCufuYi7MKSGgB6sJi5jKEQEP8Q2VqYKLW1y2cx8SDKUmpMBW9Sfr4R8ulAHANv30LUlX6bOduw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe TGG' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nobUITOGgZHBongwgUGOq1GGvU4GvmMYZtOltds5jfIAjL2hTSd-gmd4Ng2mZ8EhZHFonEL5vhtHydP72BWun_21VL0r_6HDjP4cwpzC9t46jwmz3irH8tXyGLtK_bc2nfSn-UTzw=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe TGG' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOeTxBvY42VIu0ocgsvfWmOlcw3ta5iqSJuLE_o=w530-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe TGG' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noxBZo_fmn5rXmX6P_ouLxFne9t4vxwZknSrQu9JG-jGBoQ9C71jRYdQjX1OVz8HhDaN66BRH-5YOj34YTjGfYF49auY8REJfEAHZkg9ye11Y99JfjQv430ncavGT-Gl5Cvyytc=w224-h298-k-no-pi-10-ya171.41116-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe TGG' AND address = 'Słubicka 18, 53-615 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Pasaż Pod Błękitnym Słońcem
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqkpboQoMxGT8ZdXSIuyFw_S83oZJDkLNcdQVkl5Q79VY9WzIfE4R5IbMfAaasixYsL7GIN9lIDx5cGG0iJwVCr7yZItAuNy8WwqwHy2J7SKLEv2UbKTp-GCo5upMN6hu9YNDNe=w224-h299-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Pod Błękitnym Słońcem' AND address = 'Kiełbaśnicza 2, 50-108 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npxGxmjNEoiVRQ7AmkfZjC8LyYK81AFN1KriPAH3LIXhK4sa3H2aa7KgKF5vtezm4VRo0sG3S0qHfDp41--qFpmS11eMnPgBwvYFYdtS_BUQNR2ZvFeUSNU_EaVUG1VLy_VhRMbxdi-zGaz=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Pod Błękitnym Słońcem' AND address = 'Kiełbaśnicza 2, 50-108 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq3rZNszo2ZilwU3uP1nOzvrHX35HWtCkKtKIiYpUfQ6zsEiB7ujLUfqwseFVyRFbvDY2I1Xz0XCFvS0s2Lbri0R7IIN-RhuIWU_Viw6Y0fegsaBfFvP6iUvdYugO8FvFo64FLx=w528-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Pod Błękitnym Słońcem' AND address = 'Kiełbaśnicza 2, 50-108 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrIIIWy3EpWc0c5tTXKfmee_RDQoeJE4SewYXkITe58RDXp4rWBECJQQRkPtK9Mv0bi7fkFmKBSGKjh1HlznaeFtOkCrlaTlisJpfK4SrihBNdL4iykk07MECIEP01Uap6WeJir=w452-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Pod Błękitnym Słońcem' AND address = 'Kiełbaśnicza 2, 50-108 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WHThk30n0M_oNZAerCXWBg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=129.8735&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Pasaż Pod Błękitnym Słońcem' AND address = 'Kiełbaśnicza 2, 50-108 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dom Handlowy Kameleon
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqxnf9zN7tC0FIT2iUmGR-NVwOUmfpUCRHe6O84VeZHxNealoNyQg27TtJlIF4WJ-bR0Y4v6Ert6QSIE4WJhK7eP0RAgT_N5ly75jLutdu-XrUH9JKuHc2RdzvSLMbrGPBWGDDadA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Kameleon' AND address = 'Szewska 6/7, 50-139 Kameleon' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np_aEiqAwVeZXfRnLik9xXj_ybAXd80AD-ixPpz1oyp4OKjqkoD8gHc_nynLctHzcCHjXU-hQcC3m7YMJngMzt5JPMQoa7M3ctLwhBL9oPbV_X4Yb5IVdvHxdZqy5SN5ia-29YcaWYCLQwk=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Kameleon' AND address = 'Szewska 6/7, 50-139 Kameleon' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nowcia0x_89eAc-wbXMUdyhr790CgkPvmbYOP2slOA-TbzKdWezxxm2zgkiEv7I9fipnS8Es3gLEr-Cc8-jZD1m_erfbs0ZkDG7aiCSo1MNhAwxx66hZ-3Flp43jXAC4m0vXygl=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Kameleon' AND address = 'Szewska 6/7, 50-139 Kameleon' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrU5vkRVodxEJPGK8DW0b5ByDo7K3WWwgWk37sqq-O85BB2Rvv7upYAd1jU3rbU6LV00oHo-kBTTmWvJK1J1VoKy31wcnrz8GsO-1fkxxsC3cr9ov2f6BweWhkYBJtjsmuD_IQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Kameleon' AND address = 'Szewska 6/7, 50-139 Kameleon' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=KwLth5deTl6xVOB8roBagA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=173.19516&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dom Handlowy Kameleon' AND address = 'Szewska 6/7, 50-139 Kameleon' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Sky Tower
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nplwGsB26xAKOQJj-w2DF6h71mT5hlMltVtn0F0kR0-L85ZaQOBf3Swfr7p9oSpuyRWvrPLX1b4eKAbwqvW1yeUF5EtMB9scCLs3srdcLn71WpjwtR50awFYB4UDf9xtATIVJw=w224-h298-k-no-pi0-ya0-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Sky Tower' AND address = 'Powstańców Śląskich 95, 53-332 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np6StNlvbImU9pclW8PisBSImKn-kjmq0NwuCr1v157PHwNMi7DBaYV81YaVPDVYRsHdfhvqLBjKIvczv9yIXeEmvF7eyL7mPzloADx4fu50naccE84itPiySIniMJePgqxIIDybaELYsAw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sky Tower' AND address = 'Powstańców Śląskich 95, 53-332 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrK3XAiZKpXbq4jMRf6o6kFt67_JiG16ccp1_zfemx4JZ6uAsmaHjGLCQN0RUp9k-PHeSffJvlsaKAXwyXkJyAjgUrSbnmf2oAM85EloZgaqfaba2lgXnSO1J38oy4m4O6XsEXb3Q=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sky Tower' AND address = 'Powstańców Śląskich 95, 53-332 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noBd2bOyY5JrVyV_ivfr-Jg8yB1VG6tlUk5cghHqR8BiQzXH6EkJHEtwFwYyGVXeFtAAriP1UbzBuc15Q27HJSGN2P7EHEl13OVaIJqwVzNOfvnk5H1Ph4agYX4Yz1dyBqpL5aedQ=w612-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sky Tower' AND address = 'Powstańców Śląskich 95, 53-332 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNrkUVqJbk0SJhk8PwccnQ0M_DK6wyCH0axmU5r=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sky Tower' AND address = 'Powstańców Śląskich 95, 53-332 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrlK_vM5_ChDfSVWQM-fAj5T2KLYDlIcRUdzNm_IF8uHZhNE_zlRxvBwCyzJ_VEpsQc4YCIyGVIGOkGbqpItn2OJYn8KNar8oSB0FfwHJzRSCVpYy0O36Az7RO_NjZ6dP5zuw3T=w224-h298-k-no-pi-10-ya100-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Sky Tower' AND address = 'Powstańców Śląskich 95, 53-332 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Centrum Handlowe ARENA
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npR5iqYHsXlOH60X2GSnz2Shsxf_vWsmWozn2liYwuaRyo-K_mNbYfkng2NOMSf3erx4mnbYwRXxJqmNyAHD2umvnlKt2ZG2nz4V4rwZmRGUc-ze31suPCSIuYHAPbVG2HdkTXU=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe ARENA' AND address = 'Komandorska 66, 53-342 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr1aHFSdIywGlhxT4hUzJCUgGsMmhU8vddiJxLnPxbAGEwkkTXfeMeV5xJGvZCr65cMTSiDCpFEVaqxCP7eAXcwabSFIRit1nRdDjstWXKH6wtcYqrGJ5O-bLr9IVapdgs96pp1TA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe ARENA' AND address = 'Komandorska 66, 53-342 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr4k41et59Wix7TfVO32rW_mGH54D-ny2UwCEJdKbq3tqqJBUtbsAXofqyjLPo1EyMVsTZ5JOikUJaofJNReaMOBLzO7jxUFPpjn5BOky8gX3Sqp15CvidksAWbqARDbz6mTvVg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe ARENA' AND address = 'Komandorska 66, 53-342 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq2Ba2irjDJM9wqlyLPGOXpsvx97P9mC6wu1RhF7XKVSg2FeOtpyjGjLaZ-tlArGIDmFA_-mRNeqZGKPQ7_qiw_SPy3N0jG1HEwhLJVKnOj4BmYRxUm_4sQwy7ygpwPBIE1VccY=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe ARENA' AND address = 'Komandorska 66, 53-342 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMiU2dVqn66SHsOVFzZW_bjJwdyGsEw_MtDVqh8=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe ARENA' AND address = 'Komandorska 66, 53-342 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npWl4SjaysC4xiJCHaAArvU8rTEnex_lSKu7qENNnZzvp33zLxlKaVb_4Y6QrjYleiOLGc6NnZHQwdPIAASZig4743R7-fWhClVG1pbq8eKQirR6-BvaM1B-UTphea455yVnib_XA=w224-h298-k-no-pi-20-ya320-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe ARENA' AND address = 'Komandorska 66, 53-342 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Centrum Handlowe Borek
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nquVrvcZk0prW6e9pAtLFlfkokb_vaLs-uI937Syfa6NxyRXZvRfq-thxZqhbGaiSbD0WXNymydyiSZyQyRnkXFV-apDfGo4-7payjdsDWBTnHgie3e_zNGavLXRmuGqsdflolNBg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Borek' AND address = 'al. Generała Józefa Hallera 52, 50-984 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np8oP1uLR0JwRkKMMimpwHJFuyP0UQlrRbXGXqlmq9hsn6yhADdQiotwXmKv8BOqv8riB0GtAdPNc_D865oAgwgjyZa31BGZF0Vckdug0QHibHjDLcWX97Cv2r9kDmeEG-votk=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Borek' AND address = 'al. Generała Józefa Hallera 52, 50-984 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrYtbJ4St8b-v3YGIDKXdkk0bGy7mi2TUJ_eXduKLxwfCW2UkG1pW-a_z8g7cbnyFCkTrN3OUJoPwD06zm1rnwSembsncEvWoFcPAJ2XvkIg1u7J7FokuyFDlIpdz8MjB2qD9OHcw=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Borek' AND address = 'al. Generała Józefa Hallera 52, 50-984 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqPED_9M6MN_nKZji7iF6rOnHAA5a5KXjJIVccVmZYc_VyuDc_fsGcm56ckh0BVkQPSGgAhtplyrXErOQWI1kZ83vdrEcYjlXHie-FZwyX3KAnGbVzExlCBDRcMf2R-daYplQ0=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Borek' AND address = 'al. Generała Józefa Hallera 52, 50-984 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=CrLl1n3D_2KO4o5J51S0DA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=291.4404&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Handlowe Borek' AND address = 'al. Generała Józefa Hallera 52, 50-984 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Magnolia Park
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOdDfYiQCbNlfM1dQexbx5ZxlV4ndR458Y6rRIM=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Magnolia Park' AND address = 'Legnicka 58, 54-204 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npMCwFOKXeCS_IppS15nqzPu2TAZpYpuThN-S1jd5oa6RWigiCc_3skaZHNgCHHVZH8w7VscFAVqiCtvmkH_nckO-b379mCn-9AqOXazkLWF8najakTzeqhudpQk3qx7jKVf1ohZZKvHlI=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Magnolia Park' AND address = 'Legnicka 58, 54-204 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npeGasUmG_gVwRb2_-FomrwLHwMkO2jemUbko3zDJ0aO4-DkN2EXwcslqY8DsBWBkO16HhHqzWE34AC_RbaeL0XUspqOeDaDKApXcmFLB7d6hk6ym_whWiKmgaiYVemlHVmmB-olA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Magnolia Park' AND address = 'Legnicka 58, 54-204 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no646AcyDkg3VYMTUf2lOIA8pI2Z9EMQQwG1NshFqqrn_HV7_xv-uia6vWz0yh8HC56M5jkOYeom4TBEEcj5qhut8XyTieXKLrMHzJmyEwYhFvQvCGDy8jupuuHxU5pV-YzeK0eFA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Magnolia Park' AND address = 'Legnicka 58, 54-204 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOLu8d-sezn1zHPBFrQVvbKjnbqahrw73kioBy8=w506-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Magnolia Park' AND address = 'Legnicka 58, 54-204 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq0CWXkJtO7wrJ9wAeFR6dF7f4KrsPRWk3NU-8HlofFyda69QBcfPxoAgrp4VuSnwQ7b6W-Y4piYZTmH1w31OrZTlFBX4OkdjrRtgYMZnaLh1whOCFuf3jwpbZl8NeNXqD4p_RkSA=w224-h298-k-no-pi-20-ya260-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Magnolia Park' AND address = 'Legnicka 58, 54-204 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Galeria Wnętrz Domar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM4GlSVKU3VVX3Ukcd6TxPP3UtOzi1L_6nONKLs=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Wnętrz Domar' AND address = 'Braniborska 14, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOwUuqKdHBnsabqfltymyqwN6p6je9pix5eLrTE=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Wnętrz Domar' AND address = 'Braniborska 14, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npdZ6EDRNt77E7eQfJ5gVnf6WduezBwMqXPrQkXyOcwblbe5oKQYL0ynsGf0scfN3Ku85GXew4SJadUoWCAiqqWNaM5iceGxn1_fnFmxZOAXmuEsOja-S2dUmF9C2WJyKZiNp8=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Wnętrz Domar' AND address = 'Braniborska 14, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXH7gbBaWORAtIW8sfLHuGYw9YRLdvR7-gura4uy9eQIdZyU3aSfmkKw57rac8hnsxSIp7F38ZA4QaEH3OdrtyRrejB8tFFYBPSCuACiR37c5G2HGKDojF5eJMouBQiYzRgNtVhA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Wnętrz Domar' AND address = 'Braniborska 14, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noeW6t-hhT4trrD8oygbWjy6SGeBg-rlryqX5I7w89zHolxdNdN2juo_q_iPW0EQ9gdUTiXIZvKIoOJ4IipSYtPpZRPK9i4uCroGjd2hmOoCbujzcEt6MTPdhJFoKmkELLpM4wptg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Wnętrz Domar' AND address = 'Braniborska 14, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPzGtw90fHM1JOII3AP4Oz5lnUi9pG_3iveBH_m=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Wnętrz Domar' AND address = 'Braniborska 14, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no-bvQOuc0-sxy-Bdoeaia3MOGom5Au-jhcC0WeqByPuw6toA9L0-MHEmeKVRg06ZCkgY_HdpZgSMiOdlt7YaS0aZe0QpTNm2VTJJLGrpLpiDkfM8a6JNrgwJLKkTpmG0zlXmUF=w224-h298-k-no-pi0.35408747-ya277.63223-ro0.48356247-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Wnętrz Domar' AND address = 'Braniborska 14, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Galeria Sylwia
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrRyOLWbtB2n68LbqIgvcDZf73Fg7Yp1irlinMmW5Bpdv1GtfXNEJm-FJAdjFAxJ7cSE7nwB50FMLNWNXRjxGT8TNnURJLL390-5dTK10jAqJuOSOpMHb3g2af6ApBZqsxq9IeVTQ=w531-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Sylwia' AND address = 'Krakowska 1, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nriDpa7NO30Dv15nkuVFhvuxXj40zYLEiZq45CeyVi22CLzMEMHUB0wzZis_zfg7m3Kd5MOYqzTete26i2MZBiMmPucw3Z_5aJrSTZUo0U_rURCS3ecbWkxgLqzyGcqOnE2cJE=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Sylwia' AND address = 'Krakowska 1, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noJqLVTffNK7V7jrzmGdQQOtE4IFcKEDjsBmMcFBx2auCTnGZQI4iDvbYcbkxku1K9o5nIrwu10eb8PWMTj1NTR8ZLCIMQInIhS9Mor0Ayp_2xbHCssvLXDd_KEr-UQg73xpY2IiQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Sylwia' AND address = 'Krakowska 1, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=w2H8hfQp5zBU-cUX33S9Sw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=108.73359&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Sylwia' AND address = 'Krakowska 1, 50-424 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Mamine Smaki
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM-CTwcOWgahyz09necr8VXVgfbIXsPfH6Kdulc=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrYZQylhB1Fg2Zdjhe9YgqsfMxfSoMPflZkW5rzVhPvUR4uIk7tuASGz6HjyOKMFDHbmlQpTrAgc7DHtssdl23fayPmSllAkz_tc2-0OO6iswEcnSU3u7vCO49igXK3LkJnL-lTpkV1DGCv=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no0IJ8dvz-t5y0lolFkwYZVNGnOO9B8RpfzINvvx75UOwkSuAcG5ketHmk3_rj-jDSY-aUokbNNOfvQwYjPhYDOY33bNL6iiojP56JtzXwOkLItjzyjw7V4dZPBdrS48xg4ZjvP=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO_YFvGrAu-H369VFtrfAfi24AHw049S26rAlBy=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrR2qW5ajwdJSabXQyOoD-e66DZ0P_-NTdREPU7da1YitiXrc_I-ta_I9h3adbCn9haSNMVL0PmunmtoctBBAVYJIV9JrmEmzSYExhSNDEyNBT_pyW9AygO9iZejmyGkkNhCn5f=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNDYPFs6IbJWjuh1P3hJizu00S4EVSX_giKctyw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNJDezw-QjUPgav96Epwpeu4JrssodJa7YlRP3y=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOaYlnHe2UbzQya05OL-vGclpIE3KKa3ptq21z4=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOZPkxD_4zHRVnKINrC7zVXIBC4T6pzqxQObbpY=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMOhvaYxiYR2-iNhYh2rHMUlK11ID2vFzJF1ZS9=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XVjYBC7JUUG4V2VXFzfx8g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=61.05782&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Mamine Smaki' AND address = 'Pomorska 27, 50-216 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Drevny Kocur OVO Wroclaw
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN0DwcsaMs22sIuylBOd2NepauzHv7x6z5zRlP4=w239-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqK0C9Jqy7n66fTXsMppo9s2VnQ4j98-w_RzGYxukdQYlkQiU5Xz8SR9r78ALCz-RPVUtEiW3qKmhzd06wrEQIgdNfdIhw62hncpPMGlEEcTLOJn3bCaIqai43TVIrhICocSNMfJx3K3XY8=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqeUizZ33mWprJs9qahJPQgPJ9zmCZovpMPRrMLVk50LRAoDhwdPWvm4HPoq-5Nnke_YYY0aA0I3walAVvDjRqeGOjHIMHCEYwSs6U65Foaj1KF4XWDyj5JQ2CI6TIko878JUF1=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOsW-D_nFmGhJZVuQQO6ULfOLHAZAQ4etlHiL08=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPZnGOIM-X6HRwPkY7D-qhPD2gcnemwVwBksR2R=w794-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrsxt01M-bRT77LgGS3TyimUc-WBjggdWc2juOrADRx0vLsxZfKYKD1pSMY2TTW3l-xjoTh6xM2_5FfcrGAxl9BRwCEWrLTyGGRPsEFYwD__gMqLpLb1aZ6GcLY_gh2qRff39g=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqwlFUh9XLhSbLJiziejom_Ik3nDDRF6piGIi4PCtmexiiDkVAeKbTdgrOGYuzi9G9bCfb1TR8n2w3JVmaCs2CoUS2ZOa88EIjI5i2b8aFbf1WHJQIfLdND-n40bqAx2gN6QbnV=w662-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr8pJk7b01vU1kJ85KPsYLzR4B8PDWKfiriwm4-8Iug61pZyYPAoYQRT1d6o3oZloE9iP3wYHmBVipkqjajlL7itvthYpglISiVxHdSIuSUNe6M3u5zahD9XOmjJ7900ucgW74W=w661-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq7W0rUm7aBv6zT_4rxH6oiOhGD4J45Xn2kXxvSKCOURYz3VN3BjEzq2i___-ffQF5v-BJBoxqJKdpyeupc8QE4IiN5G4_HK-gTZ-331R_w6jMobvna1F33s8iDlnSlh8HQvcct=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNmuQ1rl8a5EMSESfAZG5c_QHC9TVz58K7vTXfn=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMxfS-CpjahV7LKLh--oJw8vdYhFKxWqIUz8PAy=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqma-m81q7SM8s_8Tw5l9KJjLmxOPtFJTKxOfIkiM0Nlp6OrbhIqghPinKuL-lnPCxPYwQOdrMvMOQWxW1AVnvlnDev6eID3rzP-qob3lKrQSmagOHXv27lWSsFk3N5fc_tuz0n=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no8BZXdIqw6oWh1Jqfh7XZ16GzJ6mCX9wOGYJPIqkG7yI8OEkNcQ8KQp4w6_OuxeRzJZXkUzbu5IpddhEa5FqztatlEw6BkusKitfLPtkezhI_Iunrfi0h-ZjBiFE5o5Jk5Nbr1HfYjK-Gl=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq6vxKFeBK1ATdUwVT1UYZMDaBYC7vHaksKWiHzrQ50R1M93IeRn0Neg5l142X8QFDjGOQ9dZuU7inUAL4a6EDy_gNGvHMgCfJOFcKA2j77UVoj3UeWwYj8aQOhFKYJuvai7d4=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNeDuhumJOV0-QDEQa_BJbfUeh9P9fyDnm51PE3=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqeE-ZVpTZ5j4Ti8LwUiD7P38cWOs0nzJA0ZDHz10BVOQTAZjYYWSoPRnWZvosSoTzuVwi6lX2X3FHHI_Fb_s0NoMhaMEjAiiecCtY_6yCiUORQhG8R0kGuJJBb2AC5rlPZ52GC=w224-h298-k-no-pi-0-ya77.28-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Drevny Kocur OVO Wroclaw' AND address = 'Podwale 83, 50-414 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: The Cork
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no06UwY_l6vzzEkMirGVlbIkiI4-yiYw7QWVxgXMx_zbQuzNtT6IIhAHzAwrTvAFo5eQRmkM1mMPPk-o5wcxKUZ2j9twXh6b0dr_qSkZQTwNUVP7rx5mmgpSRu7PlAytDDGbD0=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrR_OZ3x4BsKI94lnzZb1Sr6RBiBPKudF97fEr6K6Sxy_p2loE_LrADrZQ0IkcbORo5TTWgHMnzu22tKVf7PeOtxRpEkxYyrryoToD1Y-g2ftEduRZy4RmZLZQbUM83XQF-YCbl6cf9chiL=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nruN_OkahE5rQvwDmHzj6xF3Vzu24AFIpbzif3zRa1-7z9GTTa4zkE4mwklDx4oXWBLevTxwXnEPj2mLzLdg0OuBH52LkajL4QRC1z3FNqffuyr6cAh3Xnh1v8Q7rBOIkaQgFM=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noUvdHE37LSfPteBruX6gb-60B_hIa2xcEdfSDxOfNt1GBF6ctoqfwoB1C50NG6WEESPdRg3N552ZcOCCHf6BKXHXSbQn5Bodx8pzd7Kb2AbSZ1ApFnT8CCup-qwnQ_Y2kVNhss2w=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMcTkM0n7snXaDXGYYH4W6O_6vEw-txfjkBQf_k=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrC-y3vyRIGKeaEJAlmxLRriS-GYL88qBTqBafVpWCAESV9na4kt-8PXz4QegQ9b8kJZVk33JjdUzBp7HwQS8uom7qEuZxOa2ho8568xb0N3AGU8CaAjgwcaR5Ohpy4bZFW6iSK=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npTsPvmGAMT2-c_wRTkdKc4mzXOS8lUGS7L9gJcrB9U-CiUzomJSC_gOA_NUTOMofaHeK-pp3QtoqWH7geietVJoSBILtwsXhTbSZNUeYiWTDFMo8YXpTDCkxrNPtYExBYVRXM=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nooZ8mNdlPrFsc98CuXDYGa5_R0Y9DIWu111CaFJss8j-G1Y72CtOG81RhB3oT7Kdq_kfxStSFEsc8Z2uCDpfgp6eT873KEDndUjNm44h7X77-y7Gff8ojkVYTiUoQWklrlTLuGnA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMHl9mVpK6EWaot4LHBZu9p5qsOxk6AfWarC9tj=w294-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-uLe-6RUzzUAsmbdC3zH8Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=215.01633&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'The Cork' AND address = 'Igielna 14/15, 50-117 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Jolie - Brasserie Cafe
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPPy0oKLuc-xfEuhtuVHIRbOe48dwtdDsV06Rdl=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npp6S_9EyJk6uJ-PIlQ0emeyYQ_XADjDiFrlmMP3U_m1z6Y860pWExhCTzZ4v_JYaY2TLK_u7dHf-zTyveNPBaTR4q419SDqdsdBpZSKUKxuDhtyBWrTIi5jnxtbPx4W6BFzdVOFbuZriX6=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nryLFSBup3wdS1THsqR6bYIeg1jsaCzCX2tHtaAicqprNV-p7pXmiiZFJPB2odjIoN2yiekvPoFCkO1DhoQnu49X7zKswUdrErqntGh2cyazCgyfuJZzqy8iy1Zivh-a0dp7QY=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npY6xGBC8xcIRMXrT_t6jMowPBzKpFAmW4ynBHvQZGlag8AEnBCLp0ICHrLVbZG5Y_ybjov4lJXnWAhs9o_WwpTJzAtAEevES1c1zvgvxCSeDxRgr7ooCLZpJZ0nIulGASewRI=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npIW5JlTQQebhVsnVtygCwF73HW3bwR54XpaZ3DS3z9k8cbZv8A0BIraGIc-3JlLZ2xyDDHPm26ubAZrvnXpQvdt4q996N0SqE5NKdE5SOv5L8C4nSzKnMPu0JZmPDLaZmeXnd6DQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9xwetX4ifaz4-YnPORB0PxH84685mkkqHWL7LeV4A9YigJp61fa3zZy4eTi793hGL-3lUwYYrte-sB4AagFoLiBVHUOuOfK75__wjBaWgFvFOP7LWDKCy5MRAlZbSY_31YV19=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no3qoRX5j--R6mwjuyf6e6ch4VH4vil08LZLvmoMXhy5l0ywaodZPOOQVc9Nl_YSbplnNab2_kBl_IyWNNsXE3E8-32L-DtN32xKXoQ-irhPxQF1DVyDGHVW4dGosrsIn1ReUtjjw=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrNQuWhOJngbPhPH4Blp0C76z4eIW2tufbqWw71rEU7ZGMG193u25_tUGSiavU7GN9ukSzDyTDyT-md_u3M7aUxKq4f5f5bPq9YUROBdU9ua61UOm_g6tyv2T6IaevAEz-pnfrP=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqfXGkVBxHA6UJJvmN15ngiiw4ccXa51q2EBwErLqr_bEXmvj405JzFpKWpweW6Wi9B_0YteUd9xSEsNE4RrTOG2BjOx3KfDC57uuW--2fmCfnaht2xRa2ngvR9T7TpGdM-m1s=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqpFLOrCijqReZ1PGxboYPvcOM8j3ln5HZYleqZwOECpoe49RvFZk0imD3f3sV-SnASOvkZ_iwsi2lW3G_UpG_nR6iVcTU6yauzD_B6mGKeovx5YPy3dNW50kE4J6dkqd-wnzlT=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqSyiMY612JeZChw1_M5FhgMSQ5RV47HkqpzV2hbO-WBGscD-0J_modyxDT_zYAaLBLjcJZujxVRFmpcPvLxXRvv2JcnnR3VXfdC0t8g6Xk6XWgKO_8yrzfuNRLAfd8I0LSnEDzLq4fu8Uq=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noYRZrHZAazlEKQF8Sfml8fGfcHH2CwLwTz_sf6OqkE35uUX8Jp2ByI_KzfLglwdxGgZCTiUgy-pXOQWXMFdDB1vKm-vjhJHp0EJCQsr7-EWuofR0bR8AFpkq8kncIKpqIYoNex=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOrhCmh0V0J4sjaKsJoEK_-JCptIxTQvNVid29P=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=o2Is4ehy0gSLWckiPRUW_w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=271.76898&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Jolie - Brasserie Cafe' AND address = 'Plac Solny 6, 50-062 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Bernard
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7OxS5LhvSOTjOvmx_DLU2Of00paF-tC09Tfe9XnQaYINwTMz7INfhxp9GZtxwBcBIBD_Bva_o9SRK6vWBxUhsI8tSbt0lW-7vrF6qAexlq0gMh8NRtnRL0Fxzv7VJs8zbFCVx=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqvvWCUkcANxNRrvz7ytgeaACcvGrirjN-4LfRwp7ujOBFrvwAoLYti-7NXzVEaxwetb7n-FhqLlawQ5nM57oa0hb71JqZlGEyYfBFZNVEwTwEbAPHZUDzraOr7cmm1ZoJLbYtkerwIhZPo=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqU8XL_03jMtX5YicYk9vF7Cx5etWz666yLFXmmpBKpdAVwdCxgVaBnSiNyWX6cODU_z58enounMmLaY9U5YHpH9lJLP9Jk-v2Dk653rAgxk4PrIQFKsY0xaFvSTqBw_dau4K6p=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrCOi-YzT3zqHdoe2KlFs0FUJ1rWwXrwkT1JnC2E25D9jwDMyO_iyvtvgOTnoNY8Lk2HUzULWSwXqQIeu0zlHfXUb2fUXjf9OEM-B3YoMsh-6wIOEPCv19eE38YioMHA1tvUuAWow=w415-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no9g3M-lHONYfPmEgf3YzZnzyc078StpjfvO-dzafd34X2gwWbcqE_89NpgYgXdeDdDX_WnSBNG9GYXL1axXpeELtfBi8kRhcTLxptYdP3vbgRuboPziN4KtSd3BhObbEEwfTafxM71p9TX=w370-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no3Zi0pW9Lejzidwdp2wr0DbnbiWp1HnG2NKvPvOrtcSDBS46eZNqS13urNMQQGvKJGL3GscMe0kcPDEinQ-nqDJIZGjws9I_RU-YMt6B4Li_V-P3ljqua3GVR_Ojy-tr33rSVX=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrhFh2cmAQwgMAPQjv3tMKRjnGCl1qy1PPjQx4Y3hEOHAnYRSUKKVyeYT8mx0VfXMfzRA-X9uLCW_QQXU4XS0TdlPDuaan4IkzRkzDdQ1WJgFudllov9d5i6H3WAAJvxoFrE7Y=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrRLF5gvsjMxy_V7d2OwYiQJ1mkL1zPL-Dpftt27NiFq6oCMfzdG-zs3M0CvYWCUp8WgNs1yJq8fZvRu0N7A3L_A0f_MbXRGdn53FDkBH6U_QjEM0ysY2Y6p-pjsh1staOpT_Vy=w383-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrS5ZQBed8PbUp6wyl3k0Aa8EwpJ5Is5l_-DY05bUzWJoPgGRjHDM2JYg0i4Ca8K5bcgduHONux0L6OWPqWkh6mDBzFIx0b7b0QDxCCFgAquO58Ubh9WHbgm_Nfr32Y6ejtR-79Hw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np1fRPEDFpKzOk4b7fvpv5Q0-Ne7L1tb-SHtgGCvRiTgwd6s-6tglhw6BSSkvfG2O2dBmfdfyYmxDJuyreabuaUp73YWfjbnKl5d1rj4kX5LVFYhZLfJkkk8uLa5sQy4e_pn0F5yQ=w265-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrPU_zWpJr0etmzg2LOudApxHv-aOxaV3rPpr5Xhn8fSk_ym5N9mAlwBg3cRA2Y2xS62gAyP5-9WFGYdCN3aw1a0fWIPbRuRlDCvnEHJ86pODTRaaG6veruuGNSOR7nDzFf0Sr4=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noABiSBOavFHnGs79pfJoRUxDO_cZ6pD8kKh26y81OJa2RHvz0YL3a-F0RZE-q6WR7jvJT3uzM4HGE1Sz0gEBDnpM5goCfYjgI8ILBJC2RXc6jOilAZqpkJ2X7KBU8MV-PqYoJw=w450-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrfWemdPQIYSI6xUEcik8GE0hp_y1QAewBBCBXUquJBmqRbW7fF3IOCTmncODxBS_ZOxiTDGDgD101X21qruXCxe2cSWZ5GT_TZqYJa8sDEiYFhhhpn4YCstePocZY69ZxkSb0sVg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gKhoAs0qQC-CAM7x5sMvag&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=84.60282&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Bernard' AND address = 'Rynek 35, 50-102 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: PAMPA
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nofr4zpBoiT2NalGA2V8TfSSIrYCWk2o3pZZmplW2GAopYQ6yjevpxJnl7Ld3qKXgtINpTJszU75u8NXro92xaiWBLtL1a7vxEs4ZS6LIY3jA72mMA-u_JXRsvm_sAM-RqIDWXL7Q=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no_wNvclRuFqeaT00Lfakh0Jb1Swgpls-tpnHENCdKDl3OqsZu8mOzhqZjvjevPRDFSuHpnaENn_KpaTXL-mav_9AxMFOUVsE_kaMZ1LoLIoPlde8mbkgEbnWopF8WbY7e_Gn0kggLpAt_w=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noe-uaIHv6B0bvpSBHPWChOxbIoRyG7Q_90iqjZ1A9vpIGlmkT9NLW5oME83ImGBYJu6uBSGi9vrPk3B2iF3W7bUEqtTuMUvoOhRHr2qwrFRS7ndsqu-C_6KPd0pK3OwEMFLUbC=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMPHoAyJ7dqcGZInfTUaoCaFeiFLcZ3T2qeNdXd=w421-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP1gn77t94c9QRJVphmibk8cA8qICuY8ZkWxQp-=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqiQTotp7epawFUW4LGN6frGLzzCN5B1k5NBm64Rh60J9azQe8Lr2Jl4ykVlbVl5T1WheMU55QKttwYZXMwneZJQ7TdbzzPk5LCv1RT_5WUDurimaIoRySLNjgVIPExYQWjs5_E=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noIvOL8yh0evPivZbrk5dWbUyGJ_YvJxSLnQUaMsOWBb3yBzgpLHIM4so88n7yNVw6J3bEEjDHdKXdg-HJQx1jH8rDkEOi4PKapO5xWj-bGBU2Gd2z98Og5XouCQG0eSVCL4t7dTg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrl384bCpNZXjn7UxQKTdd2Tmvnf5xKJBKXMkufWM_r2KtAAkOOKyAcT3_hBwhUXztn3oE4IIPODyQqRY5iAKlj-8dpGb0d6gyu_GqnPmRmV-unPD2KiEsosRTDG0q-uJy-V2rkTA=w592-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN1gRoMD0XBzpmDbj7oQLl5SMhG7DOPC0MBU0G1=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNGXBsK0wsM5ZgENNA95Yib2vcg0dhI-b4rELiX=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npydi5UnhbyV3dkRAqTzeQz8qnvZ3YN_DMk2cJPhwHlwFEW35Af0syTaSLtgi-Jf27Y8XisMk4AdlZ_nNMy-kei1Zz6fczVbHltWHz6tYrfCKO_IjppSZUiwFdumtq96G2A6uF6RQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO7xMGngpIjFg_YvzyKTVYzUEVcM7sTdydYzoVC=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nonIdCogqV2BQ7SvZiqV19t6c9HhH8gje0pTmAstwQlzctVplmsJJxci4Pqb5IKR-Jm36VA_HcMVSuDYiKQ1PF7-KNWE50onha6_o56OAwOb6IXDmgdf8S7Kn8MJ6XP5DsFQjhjdQ=w224-h298-k-no-pi-21.238617-ya239.67831-ro0.5445162-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'PAMPA' AND address = 'Podwale 19/1A, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: IDA kuchnia i wino
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPmLK1igzxhw2xwy5VR_W3jtdfUW6kaqJkZMlaZ=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npL00GBMnxyzzBfw1-C9wQrC3N0AuoSqcDYHK29VoGx15oIZ5-pgEBHYQqDyUrF2m7lag2pUpbaYLblfXgCygHAqgxx5ft4KenDf7HzlMjeWk2pDnjWXAzY3f0MPhZscf7RYo3WeNl6rxP8=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqqSlyfBDK90eMIPTTkEKXrg2Yo7HUa7igHDltPX2RmAFcDssnByfBSYU01yGxqJw-_--C-8du4zIgXVPnoV4ISFL-ldeTLHxkDwU8WLUeG9jcsMvujMUmp6LIEXnpg7MKmjDGg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqCKuxmN8tX52pDlCGA8xH1pwRjzbxF-1Goh9abjXD6B53tOdG8g2UduOF4udoETl5pxU72uuMmhLq9nH-kxJ4AaG414iL3sG-jenExLvJXKFcXj-qgFNAbDotcra_wM6BbitH4=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNnRzRzxpolxIVKvr48-QIv2MciZxbnp-Sdfvo2=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN2qmQE0hI_2aKryzxjb6yrmc3lPmkedFh1_BlX=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqZxuIbQdD9SIGge7aSYN7pmyTVnpOYixkbNG9GViwkmgzg-rJDregtZz5Zl7ovXbCG4ZmriXyfFkTzGnS63c-u_lMPcyB-qBS0ZWXbjDuAlk6RxP8KxT6yXXTM-SZ6ujhEcHw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrXDuAGlAbMFBC777tOQh4BVnFHaSJC29fQ96yZmRapUn0enxhhdGmUZv7tYd0QSuMsvK-PDdVatP-wZt7Q_xpSmVK8lz4oQl1GNfHgF03Nnur-72TJk1jxblElsAO52ZZfMXYKvxT-VUw2=w261-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNYyFHQ2hl-A9x1hM2nu2_Fyg5qx50VaALdbHxA=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqgOXe58wN8ev1A-R51nUKICVYxgY-OUUCxYKkYIjAH08IbB1p9lU40cjtRCjj58JdG0J8isK13SZH0EiuBl3yFhtJA3Sd4opZ8wuyYS1sNbvSBHXSfQr-Wv5JK-H1C3blUa4ztD3vuoRk=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npROEE-NYoiryrJS6j6wU2QJzbNQ9xu4uF57BSnQtHBK_usj4NtJOgdGpxMH-vHgAzP2k7TwSJ7AAYFNQe5YV1xic0rQpUDb8Ptg2A_enOtofQEs7QgjEg8adF48xLQLyhhNSAS=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP_n_HS7cRUKBn1iFEJ49I-kwpKuZZMZmILIfXB=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=z56pYRzNpShpoIlb76xUOA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.56871&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'IDA kuchnia i wino' AND address = 'Łazienna 4, 50-133 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Pod przykrywką
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNLVzv6r0elEVH0-ufERqPLNJM6fojZv1Giikx5=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np3ovsMBKCZpCGNamAZebVlcCPiImkTIRkYRbypkr2eRlEcmz3e3g7VzWFn-1g97bgwwikqxuHXrERZXMsmZ4E3zW_94zG5RZPvTyX7jcITskLItJz9okaMYUdXGu_daZv12GBEz_Gy0lZ3=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr8_j3MHfVd0ibjFgHJxyZNs_Thmu6Gbkn_ZPhey2In1LRgt4Dzt5eudXAOwERXaakHxsiai0qkaPZWSLemOzYf9lpg_icaQn_di2vWDqhR1zJbunZkDfOj9MShtVfq9KGmVfJ9=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrFxrVNtXNOpejaAXoWcT5R575u0cbLsYfb3FAyH2bbD0zl0UkXspZqx8yUx_eLJcyXyNkVxr2OKqziAKfYK6eeFb9Ml7nU0JG-cVIE-6QbNp9JdD7uQykpzNPP_7tyyU9UdyyY=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOOYWzCRmkZOLV3r9JwW8IyhU_m_l9v3ZKdMXR0=w387-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqskeiGQJxuzulWi_vxlL5bTjGUdYfel_0pgYxsdzgyo-WPVn3udy9d4-OcIKHOe8Y9YShBg83uScl_hJSU8JOmGyzZGlHXfR6NHGStEUuoN4zu9k2yBa-4fkIdJn35v_Zcz4ek=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noylQya8j6dJ2uXgyS4lbL69wSSLK7AmU3C87szxtutWB-vy9_mVePetn0ErdadfJbnvo23SN88YXM2gMpzhUrWv4Fk8jmsFSQO_pf8ANy2vlpWUpDEx_zWL18g1Fo8J0nLjjU=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrPkG4ya42TPvuS2W_XLhr4-oUp29BVqqNzikd5-ztrTXR_26VCrxqRyllyrB-iuDXAA5CXAEKE7R5zcZ4IEHIFAsV2ZRbnZXNIqfsE5PsN5OlS4h2XCsNVjSoJLyTpyUB_tz1PSQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqoa-rPnfDA06kuSWq_77Irp5eAAMOrN7ZR967iiebrGpQm-6V3bVB0PPZLc3EhI7Z-cZDqH28B4uwNW2e-UvVdMklRuTRliiVBIzLQ0rb1vFN9KA7CAZQzDUl5kWqijw=w224-h497-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noWdQGm2iTpnuQXUUb_cTRtqtrsD7Io5G0kfL-CwCR6ZLINMgVSe8ThTOFqDaWvKRSbDFVyNvTF-AuOrDgO9Z8QBmvMpPB05cdIm5FULrXny_OM3jDJSG0sA8CJQEtUqzakcgk=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noavz3mEeeTDFj4VlLK9jodMjlXxIbh2n1tmDE9nAC94ICUrZRk8M61gVeJzf3higYfZvioJE9vMCm4KoarbOMOxVz17N1RRGFiN7iZSg-8XVqRXFx73_rhMF73YmDmr0VZVD8H=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrWFU1dlymhY6BHbqXQwfIk6ScsZKjR3E6Xx0UkR0nVt5HRoaNvPHUdqqpxqfefWBLpT-FR7MnLZ3kkJg1Ug4fDSC8xGQnlESuhfgGnsaEswvtAE4ZgElO6hyxBf9Jd6FAZ3BLvDg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noYDwPbUOXTJb2qmrqHHQEw7xLtdgjHPuU8XcM7IL-a4zxF17wZjDfFXzYexPKmnR49BskAHlw64Ak04ndj9_UWj6cr9_aUfOmhQRM-Z6nc5zTlPubTnvRxYmlCzy6khV5xC24t=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nowo9QbxQhIDdpK76PMgWGpdBVR8AgW_XEvCTZEBAeMwEa3J1FX0l5PrIT1DNz8a9CDJjcgI6t9tVx7eL1aPtPqM7BN0QVQF2RsWOJTVvOdQncDWzhVjOOw5kVmscfCBI1Ss48=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npz5lf94cHGyzmc2XbXtsb_ee_TpJzBK7crcqcGtgbq-K8KW9d2Rxk6fwnO9Yi6-q9F4CZ87wLLdcrO2N-ofPF8_kOOPpKDnpFN68h5Rrz-sqCwhlh5nJZz2VPeMVJzjS6bZhes=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nok5YrOjKtoKP7Y7b_H8ZJ3OxO_RFO7-jh6_xXJtZ4qmTxRNErsk5FOrOFNUSVAoDstW1SNj4o2Xei28T6D_38YfE5uTtgk0xtjxfu9yryk4b13Dm3hBrVlXH46WLDucD2ez1WkeQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNw0mjBxTc-Ozyj6ZxzqU_amS35ImIZrDjz6rCu=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2il19B7p00LmofW0coc-hA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=225.80627&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Pod przykrywką' AND address = 'Więzienna 18/1, 50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Małe co nieco
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNs7Kz6iKLPrWeUxKsrFqLIuwMKRtokY4w-aH9R=w459-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npLWMMuoH9NB07iY6rDDsLuXslciZYR-tKNlmdDjE125ph_5HRcnNiwkPH-ghIFIhlp9NLnt-SXJEJMI7XhIP6vO-4VJD09qRGwRNl5rGZ5UrQcTi9Z89M7YjE-xYApUikBHiuV3YciYxTC=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nou3PtbskelGVYWupfqeHVU8Rc3oNqtwLd4xmY0TEf5GPaiyVHa34I4qboQ8Zh4oY2Fpcuf6YLpA1x34v8ZvTLcV2oW1EQxZGBeGbdq1dg7NHr-6oX1MaE8PAMa6S8n0v9G8iwdIA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqfwvWmaVnuzrX6ZRqrPV3m87Ww_rCtVurbCKelWIxS-90PP6L5K1A72uzjLotBYZz8NKRi579FKuRIi0fAEivifhGvn_w3VnxgUq-LEoLt58GzYYS1vcqFgpmDjCHnYGHxZqqz=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMfAIN2gMM6VbAOwRfKenbC7x02d7KeV3Smxjla=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqXdP63IZHV-T7WFO8XsDTcWo18DOo9pB9fuVL83CrigidYsZ53NsC-N780lE67JCI5eeRRUnqQZek_E-Nk_qR_PEY9E0WBZJtlQktjJf9QIuY8nK40xAI56syg-kAiXzO_9Bqp=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMPIoW2qSX_ur5nLpeYQ3Y_jnwtR8lxz67l8lWG=w224-h322-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMQb2N8_EsqK0iQsd795M7ZEVmS4cUEMAWMVy7x=w528-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=yBaGY7zp3eMtMqhPUUem7g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=148.84962&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Małe co nieco' AND address = 'Dworcowa 28/32, 50-456 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Czerwona Koza Restauracja Lokalna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMqQDkxrVPYBTsoTzpMjvEHNScKuE7VUBDk3xbd=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqZFcKWkRP-ABHxpfHheEHsN_WKf5SmlkPS0ulJJAgnNPw3nbhn7hcB17LdA7uehCXX4B0icI4avtEmXN6qkIHbZyumQS-OhlZRKScqhm2cy8FTSb1NNQX285FTVh48Pb5LNq4uSsdmortm=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrwd8_zraGdMYnIINdhRyo79TZyvSIfoS2Z5J_emYmZ6j-vD3FFpnECOatdzIyx4Jb3y4jkV8pHlG7cwdZalhyQzbLdbOT5p1oemdCuVzsiyxVO4zNiXZ6wR8bLK4jY6WJ6n2q4lw=w224-h484-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrtCeVAH0WS8EpEcL6lCCrwjI6RcKgm-pKN-k-39v9nDX8WwcNXBMLuynAdR51yaAxiZcp_WiFN_MaAL_zBmyGAgt7TV-Of4Sr-rOexYkuV80RcE-JBiP1OWCQ787qfikrwKXF62g=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrWXkVmp-LmoI4kBKB15S6Q8h0q13rVA11E5N6lGYOXPN_X9EpJRpVgfnMYNyTmqlT0kXC-upK81kuzbkE3_eQ9UbD_E0488573qnurlayZg5LNqSmynDLnpCNHkqVhtxGYDjzR=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npLooJOZcNsmQHGj4aDJjgF3vfHvF5aaNuNB9O7-gRuA_ha-HMQ-DTWqwI0Z2mHcUwp-rklyzD5bqs2sW4P2PzwcKCKqrpN7yy5M7LZfbpPm6Fy8-jNbWpPUOvPqyierj_mD63r=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrp6K_rsiGcgWLUrnrUgNqxIWBXQfX51ShykS4E_zY-6ax-La3Ne1H6kkeRL9Y44IDueoaB0qE8JQyF5RcnfShddg79J-m-hHx4g4BX0jEWrS-TivhXWqVsBxA5TRAo8CfenS_3=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq8EO6x9dJUFDBf1yLVHxKhSnU1PrQkoYNjy49JWUT9yw_DpYeGm1g0MVVIpllS0eke0rS5xaepPag2HZUUS4cdgswOB4Z5gwtlGkF4Ml2P3ccpx15NVFEoHS3naR8iBhXN66au=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP5Kl1mvvKXchkyEe6PbreC74zjQaa4Ff1G4kfG=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=3zT1eD4rUZXGwow1ov60KA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=190.39748&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Czerwona Koza Restauracja Lokalna' AND address = 'Braniborska 48, 53-680 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Restauracja przystań&marina
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNxRlb-Hlc5m6SUgR5ggyKxYrR0vfPFqS1GNplI=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrDVKzGM8o_a_yXJmHXYWIAcAnVomiCqq3yDbQ0j2HuJWHddczilz7_mKf0tygm4DIxFB_d7vFYnTWPoWJOskf3HXm-2Hx3GzKwGH0Ks6dtcakwZKZiG3l1WuEq9mXjmrac6EdjiQKz1DDX=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no2cCIU02LuiAhgGya5dHTdBJW_F7ykXHQl0iGBtFKMcI5rE9wntp559kCcE507y3DDmKagBYKAfkgt2MDMJo6x7Zq7zD-8rstc1-ajWf9328JqCZhREFErfioWF4MV8v8Zu6gn4g=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npRu_o2YwfHTMAd4FJOifd58CjEZgEYHo3NVolZs8pKaoKauwpes5l2RudLyJKIuc-SOBKzGUB05fXgyAjZAFKc2CS_Z1nTRslfUqRblw8WbysJC0fUY3hn6MAQi_qrtY-WinfwGA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN0sh_Esf1SGendZ3n7td3Iz5lI49wyoeHhbWiB=w224-h322-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noD9EuO1NaXJw6xrVkFJRAcE7XDSQjMh_cYmUN7M6e48CUKzfuMDjyuvZaVl-FnMyHoMB7qcZ848jMvT9VpqXb2OfhBcCI0OBLVqT0rCTDM0O8w1drG2bSWQsvKuITURdu6t1c=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npw9TfFazIW0_ZesePsphxvJ373IyP6aGchmdVvOten8UghKbmYTedlkGoiWZ61mzC-82f9f4nEsHaUKTD4LcurevJbncd-6hGo1w73HGxcVgNTmYlnUAmiY8u3pWJs84oCk7Es=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npbv_mykVS5MH5AG8dUnMJXB1xKoqlxPzTrR2q4SPLm5nC5t5T4-UiiQDecP7AcjyiQy6PSvv4tyWW-1ZuYbDNiZMM8Q4t5h1RsvKAVAwH56zn4ooWKu5TWCbdYrovUYoFMtVhM4Q=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noMXtK5iAjzlReTxetN1Kv3r1t3N3qCDZBweEd35soltFEG7GCXEeO3WtRKCZzKmU1s3Fft4i5sVtz-gPpOe37HYgNGspl-Prdv39QnLMHme72935KlkkkDP2bIIsbcAoPQyppP=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqVuhvyTLcNg5GcivzTUhPu5Ok6VvxRiLnC_d3rgonUNCFf5HQE6Hm1F_2-iz2gzvId3te8bTsmZzwS-gVB5vgP44aJHrFRrvXktbZsU7UoS55rWlq-LZXWyeoff687QirceV3Q=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noo55JW7PmsGVF2h5ur6yvpo03ZrwHtLiAJlBbf9GkowcTr7uessxj5HkuSieyKbcYiVE23_y8nrCqjXQy5X3xPYi9W1J_3Gga-WdsvX_M01w_XszHN-AHnIhM7BHqBDqK8CeMf=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNrldV86yJgyygtsle9KktipTGyRDoaFcvQ7j_N=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=3XzwHx2zaQmESk2PhwvSXg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.3514&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja przystań&marina' AND address = 'Księcia Witolda 2, 50-202 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Gustaw Restauracja
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOxyli49iSRq_gV3Gkpxh85TbUl6RTIDZisoTHh=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP-HqmPDpGSr9mMsai5OCdIEgV9h5FByIsDeZL6=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nptRQyMMTxl5yL-WsfNwhIK0-rHaCAuxWh6EVUi_-byAfl1pXLlKq7JqN049VRfF7LNpZIuGehErOW_7wxAxQ-Mwc9poJWpgKsDXI0EmQPXx1PxtL2p9uihqGJ3QmlNhLstNj03=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMN3oCeFSY19NjIyqzppw3dcMfDkI_G7o407PWk=w224-h315-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOvpcxUl-a0WjiFeLsAfFMZaG_ie3-DygpFx2OH=w372-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOlDHh9YxBqGlh1fDx7B4maSPBAsTNnMZ3pQym_=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrjvAjJ4dVEZ6VwTSCGWcea6w8b4uJwECkB6AgdfUwqxfrbidqp5n3QjXX3aRCf0WVqCIWsrpdyNsMEq1mfGFW-FdWLgrz188g1yrBXe0fSgWrlQff7hoBOyf8QbtQThWFUoBLm66OLaV_E=w396-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqyors8nImC6jYNCfZblU-bV2n0567ETzFMuhVEz8i1-m9m_-uWA82-jMQwAskiiNlNmfkIH7veK1lQcdD1fZAGCeKzIz6KLcwz6rkEdd7AD4rMgMWN5zQmIPiQ0aCswifeh3Yc=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPdglucW1nkKewLCfreOYX69e1c7osJFAmd3iBZ=w372-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ZzTICP7ypRtb9p8OcsVfNw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=114.10928&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Gustaw Restauracja' AND address = 'ks. Piotra Skargi 18A, 50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: OdNowa Bistro
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no2rU5QgUd85MEtBKX4YodNc8U23_Zn8-UJlAyGhh_aeIZIy32by6leoh7SQm_ueg6vNO_CdL06Sjr5ISja3ixBZeFdYyxsMXFmBY-rBOj8t2U1_EK_twJoHkCW0lpWjyxv_SYG=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OdNowa Bistro' AND address = 'Wojciecha Bogusławskiego 13, 50-031 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq7W4_QpXi19h_9QdBswS5etD8cva6EKPekbXLDskpfC5ye995IrAm8NdVVMNvkJhatLgFdRpgUZaQAe5ZXEvIF5WKRS8QELSCLHPpIqbf9_3UD30pu0VKL9pqD7ejntCbJtCXXoNhRH8s=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OdNowa Bistro' AND address = 'Wojciecha Bogusławskiego 13, 50-031 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqNKg3U6RTKB0a2lorPUkoWKqdyb4EmGbES4CNjslK5mZ0CHGIN0Wa1C-P749ZEN_bSJnKpjjGc-4KShYQ1ofC_olYRudpyw4j6tZUBPx8B4Ly5dkhpz5Aj5X3ZsJzpsMOiWoPu8w=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OdNowa Bistro' AND address = 'Wojciecha Bogusławskiego 13, 50-031 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqWL5Phv7WDy2kLNwWx6FRG8d7YA-tYLg1xTY7nUu2ARW41BjwDXG_Hrv0UH78EwY_XkR5h6lzhwAG_GlzhP8shvR25LFZPnAqzZ6hf6Ez7Tac5nf_hVYWqbe-PNHhCCP4gdo2LZQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OdNowa Bistro' AND address = 'Wojciecha Bogusławskiego 13, 50-031 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr76zeNe6zjd4qyTz83bEWtKkN5pIDSYcvLAEYFjZkrpT9aUpuVhOjh4j89khEoPMsymRcRSFCJUF0zPAIufFgCWjPfSsmD6nkiA_Sf_Ppg3XPJg_1XxiYFc2Y1EYP-RVkfZn-d0IVp6hwQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OdNowa Bistro' AND address = 'Wojciecha Bogusławskiego 13, 50-031 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrwXldtq2mqwHxgPFCeC0EOosQs0rN6aS2E4vHgegU0wSZvFX0fmL0djl3n7-S0C4nJH-MlrkFjwoVP6--DgQ-DQgWN5VK26n9krPCLInav4-ME38J_bamXN8FFQgWFbajhFrtGhA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OdNowa Bistro' AND address = 'Wojciecha Bogusławskiego 13, 50-031 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM-Z1KV6mWMWpqb_9gEVi8LKUxpRK8uzFGznCdF=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'OdNowa Bistro' AND address = 'Wojciecha Bogusławskiego 13, 50-031 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=NGhqTEHtE2pcAV6jNjyUBg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=203.50092&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'OdNowa Bistro' AND address = 'Wojciecha Bogusławskiego 13, 50-031 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Restauracja Bella Storia
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNgWy9UUe6AxcqwLTqrF4U7_Y8PWLvO6J9mUyzg=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no8wFCD7UPf-x3GBGxYV0QNjuXQGsGK7BBxfApVKXrtyXCB4pZswrdeeikYyXwfCcdK1pKT9WiQNijtDe1jU-ynnWsfxUu4QwNUjP5GFKX1O_uUQuQngfQy9HOHvog853dwpM8nrD6SqYkP=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrXwVALUaFa0svAMW6oER95BAbM22DfVBNhL7KWv-95rE_Rye-P54QAUtjn1I-l5g1MjCiAnk9Mrwqb-iuUwv8WDvidAUDDftAV3spWXB_6bmjuo2JGQDl8m9KmbLQiPUuveOss=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMTnCGrunL2OU8Tpyw_PKPH7nyl_XOef41hPhFP=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMG7zZO2T_5ITCxmQd_0cAm3SLeCQiAr-4D-ksR=w236-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no6u8EpX5CXvHIEy2hKjGHNNrCH3OylFsWyZhGFjAFMp4ao8T0WVzUFvw6Ljk6cGJ6y1gl5RyOWKZxsFOfUltju-6jEWONq2Tu_akFi5r3ksxoJynXvWeIk5GhDE26v5lj5Z7QksA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN02WjL0JdLZb589wbNY2ArfRfgvp1vIRwh-J6W=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr0UQfyOoz6xXlDqRxmM3_-jnp5PxDbEBglqQ2BVUiBPDzLXavgXHIDD5Kic_FURM1cW8ZLxbwmYkYHaarA_Xyq28J5Yk115SvCnD2zvzgr0K6EPvDXFmGJwwivi8aUEBEWImIx=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrVpTfMbsSZZnNThmSMEgjnl3VbtVdCGk2kNMuL0Q12RGabDNN06YTbcN277ZwVHZASUfGpHsyn1E4TxdUMRW0DQFGXnCOoF4BrLSzGqV1MA--IuwPgPs7nX0FC4f_l8Efk_fJR=w243-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no0cwiNnT88X-wylXFTLaNBQAkM8mXv-jXGFlnW1X4zuVxV6cDfy1GKbdrlaPUMJPS6B0n8lgq-g4DBKRCTyhRnRAd7e2Izsbi73fZhUL0Dsu-W3SlwIpp4JiUboxinmDA9efKb=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO6GiWwuHJ-XcRUPq0zNHrO6yR08FeuvoWiCYmX=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=3pkrndzWzVtL4u7LTtfjNA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=36.20675&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Bella Storia' AND address = 'plac Wolności 4, 50-071 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrAS8MMmG8Q-OlKqE4zacKjSd-comN9g9ZSvjLChgIRPdp2rfNLSVjgkBEpwJCIhHjI2FbWj_GpI90M6VwPJYEjkP997qE5r-SmDf4lReON8rhbXXT2kE-kOxLOKoj5aQoAJaWQGQ=w309-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPYrycy49DfSHVkbxJwPl9bFSb5bjQnZNXBB5Hw=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMqDuPkjFM69LPLI-_pdy361mNyR1LQadYBw1gH=w553-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN3-9JnVtuDGiwbLM4LslfugZuEt7e9-ZVsDQH2=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM4ytq7G9lOnCWmaRbQG2_Gaz5yflDiwUCGQLoi=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqJ_QR9oPn3xMayFH-OpQWHfb6oFhT5_eTkQkvogiSbSxJYe25ovXG2Sgk9b6KtL6Za9rKLH6h2IGMc6J-0Zce12PwkQ1Vvy4vWvquoyfDOHfurLxGN72uZPUv35FpdiTkORRJU=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMuS2ZGFzMl7GIwU91jGPtaLKHGI1D37x-99SKH=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOWXeTkLBdCtexntmEBCLybC2xBGiv3n_6vXEJZ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPCwuxwe4w4JmuOTpMOGI40ha5S1Cy__UVfBSn1=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMwxJOztZ_GrrC-1MN1TCE_j1xuhFOT_Fp52QXF=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=VmYZFFGYgkmlBZGrRLlqZg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=125.61683&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'House of Spices | jedzenie indyjskie | kuchnia indyjska | restauracja indyjska Wrocław' AND address = 'Zygmunta Krasińskiego 32/1A, 50-450 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Restauracja Wrocławska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMWhUdvvKpfxRNeyp6_fyAf-g_ONqUWS05PEmbJ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npac0PM-abaW_9ishJnImP11RT3Ks_KwWMgj_JO8-10DgAOp54QHs7k3q_a5ZIlaBrlAOU_UGSCnXynI9jQ3vNuO4A9b4PZhzXl8Z_7gh8970hK186aRPgM65OFQl1EY8P5bJTmZ7gxMXA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMpmZKVcyjpM9Zgmt4Bd-IfHGhnaA7obXTqzPuw=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMCY_GcoYEPberf7ygCxM1bhZXXz_VYbY04bvt6=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPaTzvk9B_5MPAeObDo2aGLkTRw_tGI7OlgqssI=w355-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO8onejaDBE3hOMsirZ04GR3N9h9Ygwkv8GD9i_=w437-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqetQ1MGxDZXPS6myRYP1dW0bCRbCKroAfga7e9ijVunFqfLC4EWoAxpoPeDMEEawu1BIoJ3KTlSEnulp9Vuwl9pi2DG3hl9ZCMYyAMXodEGkF7fcamhssbnlS3u9zubxE4WN9P=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOkXYlH7jMteYMZmb_jY3NLD8A1AirNOdgYD6XA=w291-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOA7VFQ-cdlAB7bVckGBA7evVULtQEX20v8YgF9=w288-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPcBEbl4gVMvyF5VwvfRuUyQ4wLMgtiFj62B6nq=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN5MD4MWrUg01OWw3KLBdEFtSmlJAcX1R4vKzbL=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOdXShV9AlTaGWflDE02OSz_uT2V5Qb5XAEkAKX=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=mC5ftmxkwvQxPh5TDU-uOg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=252.4966&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Restauracja Wrocławska' AND address = 'Szewska 59/60, 50-139 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Peruwiana
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO2HyPVuRa20wuTLa4kIiPHvvmgfG9Zo9mwMnoH=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOishIrZk6WTxCJuAbXB_oErPcs6GcZVGe7qHTH=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqvaBP15m4sjxx98e9a43edjUi1gE-N--SQ3yEMnMwAj5D1ScoDTzH2Fp4PjV81LiKrNLGJkuQoyM5BH6zvcrZEHBI5CqzhvZdlw7v6I37rtsu8vRbMHT7XvG-u0T6ng7S2CvY_=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNs507tzXQV9ypxFzO6wq51MW9oxVUK_5Ukh2Bf=w419-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMxSS_cjwdgMorc-w6oeoGBfRWiu8N56RN3wdVo=w224-h347-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPmzQXy8YrULfkDeCaR3ozgFgIGDENBvtmk4Y3h=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nofGDHnj0Kt1h1w1140FqToOuXSt8uRqTf2rptummhaqweYCXMYAwqfC99Dc_udMf0d0ezhe8_35MBmiAUFT59U-Q0ClL3FaGfMhYId-XK3AAGjqv17YKTBvtw9fYqHNd9DL_3vKeNtHCtH=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nofdRAUX3OpJLAnM-fHSJSPkd6VVwbVhK3ZyJ1uHi2nqnoOB1BaQwpIrkjvJKFQkEsrMPjk1_u-T_iRZidvaiflp0jE2YLvN3dvPFVUh1-Eoci0kbgF6fuUdGoE7Yq6adPBRxSr=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrTf-zIFY9-rm0mw05bfoe0AfLEhZS3oh02PjVDmlPHfIESC3dGEkvrjDaubP686Iqk-ODW-Pw8pN5KEzdqBhAzfvmY6ZBOYzqdS1e-KyzfTYsXVQckzsIdmheTig45dG6Bn8aozw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npxuCeVpWdop3nWXOtBxENIAtAGZ0ejU_UARz63riQQsntB6c1UOW5YBwBNWhhpT_5LJBXrdPoWh_prX8wlVWgFnrix-micSE5Md0Crv9cCl9T5wqQsHPlNpLYnExcboSOkD4T-9g=w224-h460-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN2trpNYlBA95Ej-8igiIgK_SgTLMM2_ffxkeav=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=7YxRO50t9ONBM7SVqn1fBQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=33.69123&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Peruwiana' AND address = 'Pawła Włodkowica 9, 50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: RAGU PRACOWNIA MAKARONU
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npvqxNnq35wYshYb4NV9wXfiRk_C78t4P15ovc9u-IyeA2FhwDcJaalX4AcrltPLEB3Hsq1QYQnCTrqvFtyNQ-wWLoHGn1jYqq7CnM93wLVOwfCigYE0yBMVweD0KYKS8itNwnv=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noVQKAd_CBcRSMNYubzIiK_32JFUAvlF_zeIhK_x04rdUxLlNr9OgIMu65RRNP-uY4DFul6PG5sWKu8x1WpHXDj00SSF8uEKeksHNRG-FdoKcZ3JqAKb67AnRZUVwzAIIosusvQHXledgU=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqFzIjNXW_Krb4eru2BRn4YyASagf3QmPQpIX4MuqJzf9PVj-A-ve_AACxPEDjrBWNIbMCeOuiN8YwNNFgLQfJajS1JEThnVoVKVjXOeYBbYsInsyLYHwOBgUhHk28f1qzHrhE=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr5LFWo4XiM-DhFJlTQ4fjCZJCYtjMCUnmMCNt-nADrp0WCwwyex3AzPyj-MxKEliGCQ0a6BLx8GzyoWVcWG0D6OpiGJdcetTTAgkYCXrCURxHBZ-pF7DQjcO2NUvNrZYZ6PBs=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMHncqYMTyXj49APuFYOaMDnVm9IVBEbgWM4MOq=w229-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrpZh0SJQ7YhDPka_J8fCeMVwrGOKaVJAxNi3ODuRn-RqxwI7O7nUaoICLpKkfkoWoZSrchuxGdOS311sjat_02PU-40Ih_z3Hu4GcKc2NbcRZOa7hIpeIM29CztGLtaVE0-ee_=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqsWwgl5-q9P3uaAER_n_KhU0G4jtJOoo_he6uhQf1QRKZMSv0onmn6BHn6PxZAwOaEiPEu2fW2PPJGuQtfDj5_ilwCBAdwxF6IB5aQ14hYyk0IssJbljHAViIvvMhikrafBmhq=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr6nVMV29bqFDseOn5NZ0RI5ax2dN7eNc2VvJemK5e4CGIoIWBiliw_zVYxN1N0Li6BO3coOI8cJjTVOWkL8MM-xPV4MntDy1YHMGLvkLuizb_Aj-mBwiOa6S_YizU4DtoSRhUL-Q=w224-h299-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqj3SdzbXV_xJZ42dtD7kkdA4ej8pISGtpa1DURfGXSZ9Chl0eF0HaGCB5h0-N7TuvsYl7M4rP2azWkBZpzuXKRIPLOTvaaTaBsHBGfs9w8dNsvuw9kv7BiMK2uJVNI50u6_w=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nprwONRDoS25e-QlOlhTsDeCtT4TJMuFPlGx53Tny7Wm2CSdYhhAm9QTnREphu9fOy_mzHlOLFtcgYOrGDPBjYriTC5of_hSK4AOMWFYErtU05BYKFWYXAWFfxQvjPNql23PNdf=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrZLz3OhsKZRaYC5nN8sBmhCBeX6Hwln15symuLoD3qBKm6MtLKOwTxplsyeRdjbUFfoAVAlmgGr_c6dENFXWBY_idDms09BwnJtOFNIaiHaqLfa2ENnYqNrqjELCvJU9CBoYOc=w253-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npA6YCwKsbBnQy8zfEEc3Uef9exY3yYujXDwq9hmseZmZte7svHxeK7yoTL2XWUdvsUBywNbH69E5XxakXUc5kzoimWdKQcyusameZ1-SjCsetqepJ4PBbYZ69gQ9TOJdis8u9N=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq7KoMlo29dDfDVwM9vpVFLfoHFXQesqIPl6zwINSWJbo_RKGu0b4GciBNCpMatLjdrMZyLtWCCBqDiE4AxhEOkJV_0B64XyQWuhFLnUpJymVxTPSDGNKNLKFA6oFS_NBfTvf0=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr9O0wCxJ9cnvHsglgguYiklofxuPp7Ckm7MBiD7dPK0xRR_IIs6_SLgl7xEkkKKViKr1L71BS5a4oEc-2udA57jPt-NQsLSJfNAwtrMmZOUxy9cqjzGohzbbG0ZPBIFpxmhxjt=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npnIz5iXLEm0G8akvyE5vdkiF-4QNbB1WVdLwxHz0wu0CkHfY69ixmLFCa9nUG9R7h7RD8rMVOWYAV46ji4RrFnvCSmo5Gh9EOKpJunxYa8fC6EvbKk0rTiNkeuFjMvRjyUTp_h=w473-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMptXhexVzEWYuah8UVU75L5_u8XdGVWpr4V7G5=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=DTzC5NwFVwro6tLW4W0frQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=258.8266&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'RAGU PRACOWNIA MAKARONU' AND address = 'Henryka Sienkiewicza 34A, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta bezplatna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npdU92AbH_VIaT_azBXq80xdp8iQuv1E1fcLNwR-IlcPDq3Jm3TGoQ_D6SrLD2TW8TrtIHh0MMtzl68s6pouOUk00a6Zih6MadG0Re7_l6vLNbMwAObZNnvZYn6FwwIKYVOJH78hA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta bezplatna' AND address = 'Skwer Wrocławianek przy ulicy Bernardyńskiej, Bernardyńska, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqncAUsjHIVrZMD-D1yNka_YP29OPRnMer3JnhnC31nJ3ypr8-SSUYTPadQbsAWMIr766WWLc_qEPAm7ZL1IAOkqUmQpPxHuskzDsXWaBvg-Yh9iqAqStWYgwK7mMFmUwDT97cw=w662-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta bezplatna' AND address = 'Skwer Wrocławianek przy ulicy Bernardyńskiej, Bernardyńska, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=qLum7Nmob3vXCZWMGo9BNA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=281.5546&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta bezplatna' AND address = 'Skwer Wrocławianek przy ulicy Bernardyńskiej, Bernardyńska, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Szalet Miejski
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqSBUSdjscMwMiznZv7lJ7WZwDoM0rH335DQi5IYmthn486zUBdoMNaU4n-_jjaTfx5axVw5zgGqkG77QHLDN3K9jtwqgYWowtkZdFPd0VINRQ2ZiZBzlQEwZyUnzIDRTjT2h4=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet Miejski' AND address = 'Bożego Ciała 1, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqT0rf0ionvyDmy79Xy7tb98ucvw60Xv76be9gZJw4a2en8MUJDzMtHr1SZrDulospGojSh_TEEDZroQsm-5xG2gm2RnC1PLZZnxKDLdEeGaCgmVtUsjztNVOrXv7xyMrrYBcHq=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet Miejski' AND address = 'Bożego Ciała 1, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqnTGhm-IiJBoZCFtFoppinKPsI4wgdpLSlrcUBNnuCqlgsyXmQAR7kTZcQ9aAiz7SVRMvcD5XBO4JvXDYUk-NwdCwsGHGJe8ZkOcEgl3ndjfJvFTa2A43kUksdQo-w9-5IZk8=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet Miejski' AND address = 'Bożego Ciała 1, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=D3158rrR0BaEv6UZQOB-sA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=181.84377&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Szalet Miejski' AND address = 'Bożego Ciała 1, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noPIfr2Tb8F5LQoeNT6_BTmBS5_-X2aa_6skYkaVYOvVVDlFV3RCFDyJ7-NHJidLTeJbHWJgIbm4k6hd2792t9xeFZEmLYTE9AD5_N9tqCJRnwKQw_UeSBM1T4pNkfKC0flsTBRPQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '48-300 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noy2-fzhYcK623n_kkTknlGhXINQGwama6MvnQFF2udzzOkVn5pEQbTP0wel0zDjjzAs997wh8tiTEAf6faKz8rx63N4y6PYxWAT9PnVOAHqf22EldeG8OH-T_qRwb6xzWzJTxI=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '48-300 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqt9mhYZBXboOuSGSQ3LW3afVSBjbtLW-NWqp-Qzn_NOCnNtNYePVetlzr66RPDPirey2ESg5KaG2vY15IGIn65ofyEMO1Z380pcRlY588Qb5ZnZTMdcXT4AtyG7M3uWIWhMlFJ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '48-300 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=9NNpdiR7c7EK0fy23Ly82w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=229.14973&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC' AND address = '48-300 Wrocław' AND created_by = 'public@sviete.pl'
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
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7gSS0b1LC5iY7o4-mixPeY1jtEXfQO3AdxiocGCuqGGOHJcGQzfwNwvr6SWvAwMD1MdvJdZhBYQo_0wDiiob3Ly35Dsg_kF8evG3rYrf8cF_X3_bh7ZR_BIeBDAoS2X1Eea7K=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Katedralna 1, 50-328 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7gSS0b1LC5iY7o4-mixPeY1jtEXfQO3AdxiocGCuqGGOHJcGQzfwNwvr6SWvAwMD1MdvJdZhBYQo_0wDiiob3Ly35Dsg_kF8evG3rYrf8cF_X3_bh7ZR_BIeBDAoS2X1Eea7K=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Katedralna 1, 50-328 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=EdDjM7woK-vvJergST3coQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=214.21054&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta publiczna' AND address = 'Katedralna 1, 50-328 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Public Toilet
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no-aY3mzHMdWIZXgzEtdc9A8wLEjJFQE_YCSJyRITkgsBp5K6RbOqq63JYi0y-p1QU4Zd2wtKGVBHcsd1fwI6VwS6wk5iu7LLMMZ_cguAzAoyRHzLR2mKhdXehZKOsVRwV6oQaNfw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Public Toilet' AND address = 'Kładka Słodowa, kładka Słodowa, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cXgEnAKHRf29PP5yQSzbvw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=136.77232&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Public Toilet' AND address = 'Kładka Słodowa, kładka Słodowa, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no4M3cX8LJ5RR9CP_MOqy0q4LRBflS4iJ9oti3Zwpmow8HBCXaSJVI0ReAHbvLXAyhLaPbbuIbEPq6btTfOF6H2HLBDQwkvaTtITl8cQhy8Euj4bJLDDsyRa0YILYSIkdBXKSg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Public Toilet' AND address = 'Kładka Słodowa, kładka Słodowa, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npsUokZBZFnbsrZy8IVTj12GlxXcfUH0mv6u2SgTbGtvTrmFEf50UCXAYP11670kv9rEG4Anw9mRul2LlDSoX4eXRw_z023EV64_j4-spEk1p1-5zlNFj5ikh_TeqvgywuHbcgWFw=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Wita Stwosza 40/41, 50-149 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=3nCtLmQ5fQLej_CGlD_Syg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=199.22707&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'Wita Stwosza 40/41, 50-149 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta na Dworcu
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np9nooQvxxEXyhWLoJaVip67tl9DOfegbCEw1DASG3dkz1ezo3Y6Qz6kpplnDvGnEu7jPDRtbXEGy2ZK6NrC_2w8JLpLT92yijKsc1533mnJ2wxyQhMhVsb6Sy3_jmW1NZb2F1Kig=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta na Dworcu' AND address = 'Marszałka Józefa Piłsudskiego 105, 50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Toaleta
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_gt1zoxSBFHFKlCNuD3NZw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=190.64644&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toaleta' AND address = 'Henryka Sienkiewicza 23, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_gt1zoxSBFHFKlCNuD3NZw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=190.64644&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Toaleta' AND address = 'Henryka Sienkiewicza 23, 50-335 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Zb
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ToVMlerAlmDz_evTSdOnDw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=266.4841&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Zb' AND address = 'Młodych Techników 58, 53-646 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ToVMlerAlmDz_evTSdOnDw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=266.4841&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Zb' AND address = 'Młodych Techników 58, 53-646 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Darmowa toaleta WC
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npJe7aP-vW8lCNUy1YBBMldnjak6heaV_1llgBNWZOJCbaPrqepdeYZVdDhpkpBRGJUJwC-rxCzwN4S3L-IJ3_O1tu7EmpasDSBApCyC2rm-ZGh44ta9sCinNgBcUyoIsJWt27diQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Darmowa toaleta WC' AND address = 'Żabia Ścieżka 6, 50-422 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=j_4C2dGTjIaSPcc98KVQqw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=34.844204&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Darmowa toaleta WC' AND address = 'Żabia Ścieżka 6, 50-422 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq2Ew50bvHt3km7eCPac-5AOz8xmOSWARkoiYBIvQMv3_mCsbazTiHJ7kbrRGuCVsEV0SNZMXxRaQfs2Gc_9qF2VxDUt219HcamKB5BRZbnti4_2GaY6iIo66tHdMkJKbaTNXXq=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Darmowa toaleta WC' AND address = 'Żabia Ścieżka 6, 50-422 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Pisuar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=NVJr26wxC0ZqadSxhLmXmg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=352.5232&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Pisuar' AND address = 'Katedra, 50-329 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=NVJr26wxC0ZqadSxhLmXmg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=352.5232&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Pisuar' AND address = 'Katedra, 50-329 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Lech
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=FKvUAYncIZHLKk3oNr_eew&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=134.1046&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Lech' AND address = 'Podwale 57, 50-039 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=FKvUAYncIZHLKk3oNr_eew&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=134.1046&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Lech' AND address = 'Podwale 57, 50-039 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC Qub
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XPYuHGh9_aI7gU2kp6mYAQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180.48201&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Qub' AND address = 'Świętej Marii Magdaleny 1, 50-148 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XPYuHGh9_aI7gU2kp6mYAQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180.48201&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC Qub' AND address = 'Świętej Marii Magdaleny 1, 50-148 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: WC, toaleta, pisuar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nokRViq8JU4jBqDMRNAvZDk4QovoBAxg8MMzGUKMzlT-Y3RMcWnwuvodNsOCdOvuEm1wnNvAKCSfqhSD2Yp94B1vXBu27Vj2SyezC1U0C2tvwZLj43_LsDVaIPHFvoSARcHguoO=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta, pisuar' AND address = 'Bolesława Prusa 61, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UDWTrLKsUGN6L64PLQ4l0g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=7.289921&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'WC, toaleta, pisuar' AND address = 'Bolesława Prusa 61, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Toaleta publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrPrJIK27bjnUla_lphvL4zaTPOEagVMuubF3W9-vVhqbBAuf4nIpk8hsH7KEAsmCCzY_9c-0EpsLsb001-hiL0gXMe51AR5MNEVsuavAtXmQo2ip4T_cp_b36mC_dktUdW6Ogc=w224-h298-k-no', NOW(), NOW()
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

-- Photos for WC: Toaleta Publiczna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npHPtnfcoZvgXcHvB4zH8VGXHEELlcHDZtnOZfXF4CHLjNBp8EgH9wDM2Nmghdj8W9mYfeAtRluRpJrG6RHXzLTqxvlCDXGvXyg7MFVNlbFAdwtyefSQ-uqUSgf-jJ9letYCds=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'skwer Pionierów Wrocławskich, 50-301 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=QS9HtrR9wfqbCR5ugXkZMg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=268.38232&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta Publiczna' AND address = 'skwer Pionierów Wrocławskich, 50-301 Wrocław' AND created_by = 'public@sviete.pl'
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

-- Photos for WC: Toaleta WC na placu Staszica
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq2KvJCSKUnEDCx3T3i76_KI49vKQcGWbw6NpuqMch1gjP0AHTw9jiwajL3JgY9l_cFvg0iUInfMsDgABjW_joxnm_F7_BB5e1bhd1A_rJa5oF-9h-zF0M1j4AssDy0_nnyNnLf=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC na placu Staszica' AND address = 'Plac ks. Stanisława Staszica 26, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xMLqZY2ysl5PeEcYxyxECA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=184.61908&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Toaleta WC na placu Staszica' AND address = 'Plac ks. Stanisława Staszica 26, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Piwnia skullera
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hgNa4m_gKUJGK91gCp9zQw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=24.463339&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Piwnia skullera' AND address = 'Zachodnia 55, 53-643 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hgNa4m_gKUJGK91gCp9zQw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=24.463339&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Piwnia skullera' AND address = 'Zachodnia 55, 53-643 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Główny PKP
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nokzfDoYd3eTnKiW_WtRpB1wtFOhoYXcfP9jyzny78N5jGZuW34hxkDneQaILOonEuAlVx6sjbE51BfW4EnIBk6q8fbQNk0-dR41x0ue2cS5UYGqvfmWDpIZnso6rFI-HAUCtqc=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny PKP' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np8KSgLIl06r6KZ_tLAIvxbf7gmslUX6jwD19VVkOE8--eWvTJoS_m9wGYQyZ71VLu7-FJJyLxd31t8lxiD_tM45bw-wQ7BmN-wx7Wce8uYifyFVXl6KK3yN236ER2GxLCrDrpZ=w224-h298-k-no-pi-20-ya54.000015-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny PKP' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqkpj6M62yW3Z4Cbdx_KpSvfPneIFlzNjOEkvbk35vWrYbjDY7Gf1bVrL6Z8gPOTHtdxmwBliGDAYXD2TxkDr-eQrwCywKNOFppIAYCo5of6oA1iMsrrHxJG6ruch0GDVhQHs4L=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny PKP' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Centrum
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npIFaqgEAVWpVJHHv9p6XRwI-qgcLC9LsgR4TJSdnapKrEFyUMS-Tx7J_0lIcl12xxFTBo4KUTO8p4R9E45wFUhOly8zQT8uOLfuYlEYoaX_od40g5ZYBGKk5l5-jL1QhC9gk4k=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = '00-057 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np2M-SxIADo93vu4X1n-hVTSciUtHE8_1Xq2zX4SRXlQ7BSvu-6VOWoxGy3azu83qJhq9WsfSX9WLdo2hBaYHhDbm8edKOR40IiPUdhqtlm1nE5G2do1FCIJqBgHP_xq5m3Oexq--D-fXAZ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = '00-057 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nomgkN98Fnxox9m1WhlaWs-lLepFcPpdRELxhmohbm2G2Kl_zPms6Hx0pcY5WTa7j306x001zAFmBdbptbehHfAkTRudjPnRwHcpzAhDruYcxWh1dUBi2DwbTUHATrUlu9SGZwT=w224-h467-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = '00-057 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npOX3wXEZKizXZjrgZ7QY2YkHW8gP62lQWm4I9h5s9ROv2Tp-jVLDNYKqapg9pOzt9Gl49wcXkF0zODL9AmVEdizIv38PKoybmS_HAMy6x_eRs8M-fOAHa26VPAWjoSFsDTaaMZ=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = '00-057 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=HNWZzY-0AQ1MQlXs5upERQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=179.88747&pitch=-0.11254019&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = '00-057 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Środa Śląska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGB48ddrUR-WXypvAuu5SjiQe4too8c5KvRGT0uL21LTZeMV0sqoHbMR4DtrSc0qY0GX5Mo3uWdbo_ltrV6fyebc_SkEJMvA6m5UiigsQ6NcLv4muyR2W83VZeCNMBuvuZDvY8rQ=w374-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Środa Śląska' AND address = '55-300 Środa Śląska' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no25I-nM18ug-Gzl7on-npmNPCnL6X98Kd5aqWk47qkl1MbZpu_waGkmxAdXKBGgV35julA3u4j2cu64R64iOg4qBDKYH7FMCN2Y6GbUq7MSV84mWL9TUK10LOXVJjSgHEXTfM=w631-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Środa Śląska' AND address = '55-300 Środa Śląska' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noakjkoBgAMc4xjHSDSPT2f_40t0Cb1mGWVPkmf_tlbAuLU10TVVa4NuFLkusPjO979ugTa1b_xfh_6Z542yoDe561SbtEjTBOttOw-20OcpH35C5IJ6kubSHLVoLY5CSuS6Gbe=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Środa Śląska' AND address = '55-300 Środa Śląska' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrSr9CN2UuonIYl8WMnM2jC84R6xSaI3a4XJnkkBSH1z0WlIwd5RPOuaznIMDc2hSg4RWjxSoGQitqJE5veE9U0HI1G0PzdFPlelvCJLlZqnszpX_tm5LpougFQnwXxZdaMHUTbFw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Środa Śląska' AND address = '55-300 Środa Śląska' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=jdEaAkK3aBSj7WEuqSQOAQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=348.85858&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Środa Śląska' AND address = '55-300 Środa Śląska' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Rondo Daszyńskiego
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM7EzYXPIaI3a-9-irsUHVHbdrL6ObYalXf_4GO=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rondo Daszyńskiego' AND address = 'rondo Daszyńskiego, 00-869 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqu2KCaabzTcPrNht94vqXL3KVvAmvvL2fcsIuajFOuem_sTw2dm4pIlix1g7xJ2LKbSEgzGAdrcfuKEN_orkw4FDTonOqLjPnSzIJCskl0j8BPOg8fVvxUQ_rF1B5_A84Q7hVycfCH0yJ5=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rondo Daszyńskiego' AND address = 'rondo Daszyńskiego, 00-869 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr0zAMIf1NI1gvrBst-20TvIuv-77Q3IxPZo_oNayZ0-ahOCFVJcpjwtHG6RqlFFajnH1KMZIgaBrWzGq2BoKU2qo_gaF5HqxSC62DLjxZITMPSzk2XtpCoVeIIz1MdAOTuk8Wv=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rondo Daszyńskiego' AND address = 'rondo Daszyńskiego, 00-869 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noumdotabTtX6QisU7jduU-zUV6KLNp1a-oqxtkPqOyHnO_OZn-3-6aWvTSbjV2n84cGiNp6ypS9RI3CNmqgSY-tgGD6h4N7JCJjSdQTfuJS4lwXiZjtDYfsQPxT35z_fiP5hnv=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rondo Daszyńskiego' AND address = 'rondo Daszyńskiego, 00-869 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqjuUoxwHd-fBhdRm2Nze-S2fWGCeeBCSvdlh6AQjzc6CgKVmyr2klu4VhxXl1niZi1wKlFUI5TaO_X2k86_SM3SMMnVHK42BPt6ag9VITqHLKjNySFczncOlTKWc0r_m-7Rk_9=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rondo Daszyńskiego' AND address = 'rondo Daszyńskiego, 00-869 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM7EzYXPIaI3a-9-irsUHVHbdrL6ObYalXf_4GO=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rondo Daszyńskiego' AND address = 'rondo Daszyńskiego, 00-869 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noXkliaia9XleeRJv7mGgpjXZ8AgqH2a0IeRUuKLbihColMLHbyPYmyfDEtEuLC_6B_i1izn4XTOempZzDolzKL7ElYRUfnpm4pFBDprLWFYPHuEOxRAH7IxujgbVjQ6qOERuDw=w224-h298-k-no-pi-0-ya176.0944-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Rondo Daszyńskiego' AND address = 'rondo Daszyńskiego, 00-869 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stadion Narodowy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq3J3h0p0Ushf1pWAPoM6hM9S_FJAEta9bmF70HIQdCzrGkaO1xlpbGs1o0Me7NlxAYXS7ox0GDx6u9k67LrZQwsDxr-Mp_5wbV9sMCDggFJ1tOC8Z3d9-8mHWjtk6H-x0gqfig=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stadion Narodowy' AND address = 'Sokola, 03-724 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noqk7BGj-6OzuYxOj19KMvFWd46Y0sXKBzX7-8zP0_zgITmIoCkMm8C6mL2oqMk-NYaetvmCFkpxxmpGJ7Y5zOA-dSKsDTg4XdP9RGzGw4SaAkjamVlrtYfDduXAwWilzwH5r1lECAocHlo=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stadion Narodowy' AND address = 'Sokola, 03-724 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqi2kdXz3AKxwOeyzWM92nAFBI6bseo6GjlQg4dkJUPRitfygyipRazaeFWXy1_A53cEXe-nH9Og35FrNymDmodVqD5wUwigbOpdhdlkAPc9UIPoiWF5NUnjxqRRfaEkuJWWO3z=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stadion Narodowy' AND address = 'Sokola, 03-724 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq4_3GBezMGCSM2aJWF8tIWnFq2iP8Oit1w5hfcy1RDcERuiyWskqQGOJqcUoXAFdUpcKx_bb_Jk3vuD2PD4LwQNS8lHS95FjBY-4pYm1O_xvzXerfkfEp8WwWAXL79ny4LXpWg=w482-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stadion Narodowy' AND address = 'Sokola, 03-724 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nomj2ToZp7HlLkGp8S3B56BbdEa2-sLKssJ97XOq9q5LGgWaoLVVJe8RKydCvnk4ECH3GsezpJI3YznBMP19Cq5dFBsy-ZCot-bI66uvyAIxp5ud-fN-v3h8vLNkkR5rZsldi0kFg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stadion Narodowy' AND address = 'Sokola, 03-724 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqNgEpAMPrJxYRdQMAbcZaKeQJT6H2Rvgjt-D8OItvBc_-r0DuucHkHR1hCkG6uCo0gDDgHpG9nTkL8cY27eRRyK72Tm5X714U0QWTVe92k4TI-frWvYn_5Fu0geZHZoHh73O3wLQ=w224-h298-k-no-pi-30.000002-ya347.61722-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Stadion Narodowy' AND address = 'Sokola, 03-724 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Centrum
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npb-_XTouyMIW9a00ciTufxhRJJlCOZS8PAEumjGC5a2ukYj-clDPDXO9guVsS5F10oBA9BeqX-7rfANPyLMb5zx-rjrlsNbs9tZiP1owF2wT7XDihjt5eX3SSnmddSmLgGuoh7=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npjXaoUWSXa45bCxfQqhqifg1D17TAlDY3aY8UymY2KQWJmwDij9EnryisaPgBZl7atBoOEOrltqCSyNGgQmBE9_620tezOt7orGLI4G46ivuYSoX7jNUMwU2I7sgwm7cGfD9x8oA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np3HG7uEL_sVGJHEvobjvk-itMdrnn5H_h7ZFRbmaybyIQBEFicQVzUUGbU369d9_V8nbGwF5Xtm5atOSlcpR5-1KV8AE6iHRDM1R-3isbztnzhm6hwDSLeXazgTQaUOB72288w=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ccvt2Z-r_7UuHmRb0LPp9Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=118.86786&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Świętokrzyska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM5YwUJHYsXYPoyuyJ1MAya4sFLLSvagrsKDc7s=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świętokrzyska' AND address = 'Marszałkowska 0, 00-004 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npCJpvy1ZYIpjaX87lA29XcjBuuzL8pUTbv5REbUQJLTGSYoUjsesxHhV25mb6Fy_BNAlUw0-KIWvdYSbBhd0azP0X9cZY_5d8_GfneF8UA1pxoiYG7gnCJLlgwS-5kwikyZhkc4pnwb6c=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świętokrzyska' AND address = 'Marszałkowska 0, 00-004 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrQL5ykgpoV15p5dykIN7NHluLz4W4qCreUH6LAL7Q1d7O3bWKCPJDMiyvjjPF2BClz-wFD5Nx1W08NRnsT03NJlIdhpc2kg6zAju35-vVJ5zOB89BOxt5_lqaIgCNNk3IgkGK7=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świętokrzyska' AND address = 'Marszałkowska 0, 00-004 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrYqpxlpWeyHt8aPo6GPJ8xdjDSeciHgVgu6oOVhVByzZ_logxs5k_A42-i4SI_cOGzc6PD-d0nHAJpub93a8CGN-ctZFq7lPyEss4OVQJA1609aPa-bxKyliqP2z2SDPlM2-CUfQ=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świętokrzyska' AND address = 'Marszałkowska 0, 00-004 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npW-1XWRaEhVh3N20znk--d9bYs0EPyLwNNxBIlDM_eyPri8mqhc731goITRNS-2x1XF-VQEikMnabaY_c0GzNkLndJJq5vVoLwisfp7yxf6xX0hdoHa9RmTTjSgzBWHdugoke_SQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świętokrzyska' AND address = 'Marszałkowska 0, 00-004 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM5YwUJHYsXYPoyuyJ1MAya4sFLLSvagrsKDc7s=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świętokrzyska' AND address = 'Marszałkowska 0, 00-004 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nobiTmxN9ec7BP_DKK_2b2pZhwqerA2oW5q9lvs8Ok7GunWYb0oOvDQ_aGOn5zlZukAtSveCmfcFwSMwaYgv9R7kO7vjUnSKJ1CuDMrTHfcpUVNN4hg9fs9lMvDjuDkvkPbmvrCNA=w224-h298-k-no-pi-10-ya180.90501-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Świętokrzyska' AND address = 'Marszałkowska 0, 00-004 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Gdański
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=oOn5teFH1mcAAAQ7LsymaQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=220&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Gdański' AND address = '00-204 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npLMLr-UaEgInISQCK5hk7FQz0F81ote1QQunZKRXVSP_iMbxupQuNknoDs4oecS-N55QMNiegplh_4RBCL0kGjOU8SO-xZ-uY6n8wWyJiAq2otPUzCvLpau5s1StIiyF2k4V3EdQ3pk1OO=w224-h497-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Gdański' AND address = '00-204 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqORYzqxOnHtOSl0d0kDtiIi03HNTQxjFvy2FJM75bxUmSM4qTSDl03Jm-7uNsr0gYOwc5hdk0C1eEFjahdyA-wKtkZW5yfXMFhWPtr6GF9dZUEWAomiWB-J6VnUP5zGDvzwxPs=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Gdański' AND address = '00-204 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4notxGLFr9UxJr8oVNaEVbSRusZm_-FF6-VwVkA463vNGye6xGt1bjd68-XnWHUdWHOSWeLqTofSY5xP-kH8S1ciwUQpg2CqmIO7vIGCPuifb6nUqdOaYGfX3Yysk3zTIJBsX2E=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Gdański' AND address = '00-204 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nocb_ZZOrmGMsRmqoEPrSq6eGXYK4O9JeT0AjeFRzmP4TvMx9P1oKj-Jlz7an_BcJ5uVImb6gXrV0JIG2X9qB1arL81fj5hj9oOS2hh01FEmjYLN-zGvFfLiaRVEULe9ULvPZEq=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Gdański' AND address = '00-204 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fgq8iUe2kz4AAAQ7Lsip_Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Gdański' AND address = '00-204 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Centrum Nauki Kopernik
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOA246W-lFV-7s2edspbzIXCi4l1QKyvZO3oShl=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Nauki Kopernik' AND address = 'Wybrzeże Kościuszkowskie, 00-347 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nphZwuv5-E4_InTKNebewVTQHprEM07UgCbxRXR8Md0VoDcLy7AZ_HlplnOphqOTMtlX9YhJioFRhgAdFsm08HCLeLHzs9lMn9V49b9DGgVEF6hWaHwEm2SBadMaxcVm5_AzKxi0W17vZ4=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Nauki Kopernik' AND address = 'Wybrzeże Kościuszkowskie, 00-347 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np2JeNAFfl7uF2WN5R0mRGihZpPHNn_KEx3bNWFa9CQQ5enWc3VP4HJwLZoSqRrx8lDxaREhKSvOBfQbOu036h1tQ5apgdNT_8FjpjJpZ3vehutmdnPLD1Td7Jt_K28a0Snv0Yw=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Nauki Kopernik' AND address = 'Wybrzeże Kościuszkowskie, 00-347 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqQ_hweQf1Y_vCakmczuN7vEMDy9-q5tVV0OFypFN7ywpF5gIpZZ4lctKn_ITTgRN-dPRrMV8EvScCellPD-YpcOtrSJiszNGYDNk3OhitNnCHjf656Oi3d30_C6_7gwRt7nkh-=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Nauki Kopernik' AND address = 'Wybrzeże Kościuszkowskie, 00-347 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npP_uchqwILf240nigBiuu0apg3g21a2_O5H9bc7BW-sT1Mn_jvww1VlXpSknPAn4NDjD1-qoG0nw8IUtLr4pp5M7DrJEBlttA8F9oNlJ2UL6tzN6k2FsVodJqzaV8pGvtzGkCDFQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Nauki Kopernik' AND address = 'Wybrzeże Kościuszkowskie, 00-347 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOA246W-lFV-7s2edspbzIXCi4l1QKyvZO3oShl=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Nauki Kopernik' AND address = 'Wybrzeże Kościuszkowskie, 00-347 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrg9UxGppRHMJ5aNCq-QN-8ChLmTT8MHlZEc5VobIkH1XiveOhBBNCWA1EJ1Q3cl2BemuRL0ELYuKxOM77mUrRSfpNR-QeTx8qC9MJiNEdp7q7pwMxV3ClDyqFxnEjvqlPtigYn=w224-h298-k-no-pi-20-ya158.09686-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Centrum Nauki Kopernik' AND address = 'Wybrzeże Kościuszkowskie, 00-347 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Politechnika
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nreuv79tMDCK0q8hY18iU2XIUro1hIxT--pB3o9Y74ptQw4AiBflafIiDoUkEQlJOjqOJDf275j595rw2_b13Ns6l7dLtKQYZs9k9KCBBfsC68PHnsf4I0GPhBitaWYvcomw7bS=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Politechnika' AND address = '00-636 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqUS68ynfJGPauGPTRCbmx5PHi59ND2KSb6oQijimpn8RFe3U7iNfZMIZ_xS_0TrCGDOgkc-S9Xf16tUt2Mik88vBzMEyZYpLz18Kj6wOJU_h22QYcnxkXeU08OhnS-DE-gabywUOn-nBs7=w645-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Politechnika' AND address = '00-636 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9O88rANIAyLer-Zc_cxxKOCVa46oZPyoMUS-wNgtNAWQC7CWvUqJeyY13T1fGif6dC22inX26d88k4_n8gLvcMf8PqccEDgDr9I__E3_V-P4QLz4SHQOakH4_qwXWm1iZ24tK=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Politechnika' AND address = '00-636 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np4U8KPd-6IdqJvq9WfHPE33XXn4CjuDlrBgcdVjrqtvsmtJkb7waFg9MdT8fqImAbnG_b-EE-im-b-dUjVd14EJSQ2bbBKoRkwe3DuxTolIH6n-GyjIZH51lvhsU06OOHmxno=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Politechnika' AND address = '00-636 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noC28AcNudoDkBpfKaqfg_RoZ98yFNIBdNqdeZB6jB6yln1IwpU9zpGxygh8o7WVu2Todn8XFe69opuJ0MLX9B2Qc-ZdgZXb8l2x8fFHQZbbGX2U8tzxnFZi5q0qpr10zSOZqu8=w224-h298-k-no-pi-10-ya42.000008-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Politechnika' AND address = '00-636 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=x2dSZ2tQNLjdSfKF64PFWg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=0&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Politechnika' AND address = '00-636 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Bródno
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npUjwjxwRVrTf35NPJGZDS-UCFT39lagDMnfvqNcu3wDLM9X0FQbAijeuuDURwUBWzTH-ms__QdbtQUwMMmbX7Y-5rzqjDryXNJlFSsLe5uRFDg9gAREQYkqJlEqgERuA-ArE2ivQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bródno' AND address = '03-242 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrxzas3ecHBfgJ2Mt1gSLy2jQTeC_SRwSxtpqCZEN0Z4ovKF0JCaEDyWTHU9NdS29MUIIEJQVh2lpNnjdUNIuVmlsKUZ0zbMdnx9_bRQNmaQOXAM-68H6OXtIiQ7nU6H8z0_wZl=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bródno' AND address = '03-242 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nppM9RzQQU6eLvKw9jyBerbgcSYjLP8uzLg6bmNAo1V_lcjVIAzYw2Eq2WMsElY9wyd4BxOQh_NHc4pAjE5s4DIXLWP_R-ZqrLKL9vIFfhE2lIxIUG1GhEIRAqIvEYlSZl7cr-J=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bródno' AND address = '03-242 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqq2G6cVkBXxMLdoG6ZpsMBX0lX-Sgh1rxtW91O26GYkqSHEWz8IBrUQ5BNkqZX06KpVWwLY__crI40TmASKPOlzTtdGtcszFebcsyDgTM8xoaxR9YOJtvfJee0PIWnr1yD-ds6=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bródno' AND address = '03-242 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noENdQIibrapBNSM8IX39XmBJlqUl9oJh0-4vPbMJ1jF9CKdzQWzqBmUT33HJ8aGtI-dTa5Ylool49ZTFkA3v8Fmn-pclruIg4ZDbx4LtXKLzzcnPoeg-3lDg8lt9cKgFE75kI=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Bródno' AND address = '03-242 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=UPlaiv-ZDuiqVNd6MepT3Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=285.7771&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Bródno' AND address = '03-242 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Wileński
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPxBiF4PdfYHS3CHGpVb_4O0XbBoJ1NZhaoUrU8=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wileński' AND address = 'al. „Solidarności” 3, 03-734 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npehYboGJzh-fo3bbuizXQKHHX4xUdjRdbP1Pl9GeGHAzb8bEsH7OldAEnGWU6Z-PX-tZa8ouF8JXTr-DNEXHS4mlfpsqmNmc6J8rDIx4BrRRFD252PMpi0-pmREAC8i4RmYxW_iA=w224-h299-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wileński' AND address = 'al. „Solidarności” 3, 03-734 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noVFSY42u7rkSlp3wg9j1XVtSy6Zm6zqXlNLwctvpkVMHP78VhAuG-VmENGfd-SOLBSAZxIaowiTlrlxrcHuAV-VVGDVi9IG7AK-P2FBCNHpVgmjK04cmQ-4yvLqXBxBVYYsnaI=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wileński' AND address = 'al. „Solidarności” 3, 03-734 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npO_AssFQk-9KOCOC_Ys2Grrb_yRRHgq_Hvm5yppL5r1lMsor1vBAT4q67rJGzBE8UJOfYTbJ1-Nzn2DBTBv86HsvSQ6XOANhHnKKmeKY_ypa_nK7wlOMVUqLSdZNZHNxEgvTia=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wileński' AND address = 'al. „Solidarności” 3, 03-734 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPxBiF4PdfYHS3CHGpVb_4O0XbBoJ1NZhaoUrU8=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wileński' AND address = 'al. „Solidarności” 3, 03-734 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqCX_UF7_CH8y1Pu1tPSvqDL7VQ1a-PN5Wq2R1nJrduagnBFdfiuUynB0chU-zINhG_1SvrngpMsHonP4Dx1OSTk2bFsZzzuda_ou-5PWWwQt068fWziwWpCD29Ik11djIJwGy6=w224-h298-k-no-pi-10-ya356.8198-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Wileński' AND address = 'al. „Solidarności” 3, 03-734 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Nowy Świat-Uniwersytet
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nodICw_9RvQlFSZLhf6D4Lld5AA2dMgbsZZPwsqM_7qC0VvpqMQI4fVsgyDzAOkMkQY7xHPipAhaz2W312dCTIQ6Kgcee3kKsvKQq6Xk2ItiWy2UspsAjrQ3iObpR_wXQWluIfM=w444-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Nowy Świat-Uniwersytet' AND address = 'Nowy Świat 0, 00-046 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq-TV135gAAiWLYR73EFI1Dik7UGtWSFKRJ3wUkfcriJuUkXv6nUMnE73AVDJQGpopPtcIG-_Z2xWW3l8z34VZ-C4vqdp-q8P4vuwGzrn3C3z9snwzOKbHIowXKm-V3tGjK3TaQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Nowy Świat-Uniwersytet' AND address = 'Nowy Świat 0, 00-046 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq80UiHi1Bg1xxa3XMHYI8l0UjXWZFGRSDZorQsaAqhRq820sBoGjY__x4bBjhSWUk41tUHgDOEegw5o9z7XbKkVxXLGmjaXW1PvRcHZNMMpxrXhtqB0l3RulNheeBvYZJ79dJ9=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Nowy Świat-Uniwersytet' AND address = 'Nowy Świat 0, 00-046 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqikhn0Y-VTCe8N_5e-Vpow3OAdC51p9YXfCZAp5lW86vVpi6e48ttwD1mc3iss9WiwFDEdoQv28n_LzpR-LidDnYVe_wcZ0c4DqIKagCTbB5icWg-hIA4CgtSQ4NB_iBTyLtSi=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Nowy Świat-Uniwersytet' AND address = 'Nowy Świat 0, 00-046 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq0oV-B3ZKB8GKLFzcqSVsONUID-nIVSPyPdz2lcaHsr-n7Ej4PXhoirfgVSEvjfDEepQtjfiqZ0bHK0qaMMnP6iDzXjSfTcZcDSGXEKHD5zuUCx3Y7Jq5-ZoW2XWY3rekFNMVi=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Nowy Świat-Uniwersytet' AND address = 'Nowy Świat 0, 00-046 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOych0VP3yWw0nbqBbu8hFB6vSCFn7ODU9GT8-O=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Nowy Świat-Uniwersytet' AND address = 'Nowy Świat 0, 00-046 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr6ps0qR9xYsmSegzCP-v5bSnPWheQMkjqmZeP21xvFFf1q6tQirjRnYuB6954_1gdFExb7vHkJJW6onXWab23X097GdwBoK7sV8TEEjUDYnmZFI1JJffGkVHaELbTMYvCHeYVc=w224-h298-k-no-pi-10-ya99.747955-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Nowy Świat-Uniwersytet' AND address = 'Nowy Świat 0, 00-046 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: STACJA METRA ,,PŁOCKA"
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq4hhlCPKm7pZM-arZUHsbVd0PChJjLQvVG-c0t1VFpb7AE3fW2YnZ4MyLB4pJflVCGkoe4xdh513qkdeezIdcxhYsFDMZOzd_LLwaf4qUaSCDTIcwHZt8SU5wt9BXPY189bSxW=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'STACJA METRA ,,PŁOCKA"' AND address = 'Płocka, 01-231 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zwsysfyGgWlO7CbQ8Sz5qg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=219.9023&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'STACJA METRA ,,PŁOCKA"' AND address = 'Płocka, 01-231 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nofDTWK1LOIzNqh7tmkQWkGla2CZU-VVUBZLywfC2IrI2bWbB1tvVnpyu7TGmZC3HI9IRryYUksBSifWGOiuAVxr3-fFSg9bOdMTb0uV8Y63XXpsf_Vx01eZ6fvbgGt1ZOs9GKhqQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'STACJA METRA ,,PŁOCKA"' AND address = 'Płocka, 01-231 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Pole Mokotowskie
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no7HZhMc7fuyf-uuEWlee0E8qlI1IXVMJZqK2did1J9HvJENq3V5OGmrBqA8d-6_K8XGvoMZT-ojoqP8hQWMw7QprRF5DK_f9U9U9lITXKESuFbLRlnvZNTQIRM0AWqWXxhfC95=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pole Mokotowskie' AND address = '02-521 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nreNfrIInmE0LE1j3uRJuVQl0l5bF81RuIQuNRhkZp2LWdC3lwvwJZS8r_S3My2ZpuEHVJt0w3wL8RkMeDYbR_NbhGgfk7iRLmxnV8Gm4LmIS3ExDZHEfFomjlDuNjKsv1kcJAR=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pole Mokotowskie' AND address = '02-521 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGQa1U5EtkpnI1aDKuqnGOt0jn8oKyy-CkxBEwEXUNWkvWiULZFlC8I68WMGyjhDi_6N9dlTL5kaEN-gg1gCH-9Z8VVLMBww3qUUoXoHU3jsYFeDCt9dHK6mI0lu5xE-uVkn0N=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pole Mokotowskie' AND address = '02-521 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrM9J2pFfQYiGul27-RTNkiVe_1VePd_QO_w914zc0g6rLqPHkww6HJgbnpMQs3HGB8GzuIH-sykqnCesoLFIxl0UXRLCh-5Wf48-J9udwlO5Nhbe220C6PB214kFSc4l2gNyk=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Pole Mokotowskie' AND address = '02-521 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-BuOaCF9iP3j4hwgkOMOkQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180&pitch=-10&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Pole Mokotowskie' AND address = '02-521 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Stare Bielany
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq2U_hFEu97tnBjNUISn04SOdI-a0e8n78I5RmEbYpu-TXk9y_qVzKPC7AabxJ9_xZc7Gc4mFDDFkGRTgBVsG4Eyr4QghsaGR9YqS3rWcB5Suovt-BWrYhmEDq7az4tyj3WUq0HYw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stare Bielany' AND address = '01-871 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np1tnr5az-uQdt0nA5BGNzpV86ZcIYdid0FwRItxyo0WH1k780fw0YwWo5a8-sz7_iH0bEE1UpbK38KktywvY_uf9dZLkcEouUeXXRLLxcJgnvelvgv3pz7ZUnOPma87RPtvR0=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stare Bielany' AND address = '01-871 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqWwJBEmeqHQUjixROqH6BIJLbSBQzf6u1J7Cxfhr4ulWxEti60S4GOHc1oN4GyRE6cYYnX3X_v4qbd9fgjdhdTr-Oj9zrW_llqJL5O_zka9UrTVNbojlYdyznPQpb311OoySWFqQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stare Bielany' AND address = '01-871 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr_ZDmpkQMPjYiPL8QNTohzce3acqYm1nr8aNtcipAhMZ3Lql2ExGt0uDfd6Qg9Dh_2sDp6vKt8or9mVqjC1KxFPIKiVI7wRWzk1eIBBrKlLCrfpV9aMFg7x-t9FfXlKAARRywh=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stare Bielany' AND address = '01-871 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npS4ywfyLRA9NuPVoKvCmkF0wYhSw-Ehl1R8ZBhYrLp8MOMj_NGJonWV1FIxMXWMoDmfLQIrpuhHkNt9Ol78HKLeLEVRwnEivKQEJdmi0xrD-ZQsNA093hngQ7tRFKTg0PuM9Q=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Stare Bielany' AND address = '01-871 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hmw9YE3c8wNEv5HxvYv7Eg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=240&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Stare Bielany' AND address = '01-871 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Plac Wilsona
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9FjGWhw_A77bN7BZpqn011gSB_H7eHw_nQKEeWeL9IOmv_12N0U9hKWwIGpwvT9mTVSy--JFw4oPHnvxbJgXoxRTLzQ-lG3jWaJM9pBllB7X1TS69HAVGPM5dz8OAMpGq0D5g=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Plac Wilsona' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nobOV5vrhoJInNY6J1AdZscJQ94z5VwSqSRKypVLTej4WmMqr1uXu6Gd7rH5oE6Vkn5OIKb4WmTIseF2NftclGaHePwGpcS-LsNApP5odN4HIBT3arMIyCjVz9-63p19FInuoXXew=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Plac Wilsona' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrbKwjiV3e17aUQ9Z0nOEsaixAbQioiojT9OGBeOHsa-pRG9bEEXGMVtSLJ9E6ZM7-aXbMtJZkhHmLKwk79nrtlcWKrwEnbXMBqe-K_tCpL6Cm2iQuOZO7wG0JwegsdchjWsWHRoQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Plac Wilsona' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrD8AhKweGZJ8_9bCAHeUYw8n27LQW-lDgFQ9ZGIA_u7WuvStrddTSQ6Zzne-XgteccnkCCxx9ogFmjl6TKAxKNQbkaEOJKv4OLlAzufTCK-6pWYwajheecVBnza30Fj1PtnrFMuQ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Plac Wilsona' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrFj2ylyAITLlQBQISIkL2nXBhSeadsie3TRI3a9gUawSKbndfLXQuvqk58v0HinH3kBvDyLRxsugRuImtbKXMKpGkptwXoJDOCUtODsE6DNdZjfBSRdZU6gLqCbMEECNdCeG9D=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Plac Wilsona' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1Htp5GiSzwwAAAQ7LtJe4A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Plac Wilsona' AND address = '00-001 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Kondratowicza
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrlsqTBKbmKRPvn8bhBmilDJvHwWG4GOCiQ4IUDftaX8EjAC5YAtoyqvjK6TRdnoXqZ_dHqrAl3UQdCmKkiH63nzAGjuQfssOvw8h2oTboxLLxKyasF4wQ1inHHBHiSlPnfrqQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kondratowicza' AND address = '03-291 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqL68iveyoVEPMfNjSyPzuqg7uahgT-vG8ckmwO2h9vU7P03b2qVKshF3BvZ9gqxB8xqngCiCrjr-J18RUH5qYa8K_KKt16THNn47tDqLZpAHRd3VXyQaeeMAncb8cjh0Mo3ldFNg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kondratowicza' AND address = '03-291 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrBSzDDAghqgmocTci7KALFIQS7mQ4hFcjc7Zx_tAcWJvS6PSr9ltEguRkRK3zMmdIzMHRjmkUzwGyxJzUSphhpUf5Te1Fxjfgxfz97feCNsVRJElw0xjEB5_dB5WkmqPQWIyi7Xw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kondratowicza' AND address = '03-291 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqy8VXRXBO6Eo5-DlAe0ZkvbpOU10sc-Asdkdygw0uuq6ITQKWRpA1nQzHJ0gLMrWaWC9JdbHbkscE9dZRE1sg2OJq9Voot1NMitRX5xWW001qjRaGOz0ntU5tx0ZNQFDUM3xNb=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kondratowicza' AND address = '03-291 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqUMCwTNJ3smK-CUUQGPTF99g5OCupFLiMvcPURWSu2Po_DHAPM8bFWXwYEGQzO5ib21nLMAHxvOxXAV2JTGTCOvb_nA_FaYx4kS_-_hHq8sLgfRbE0ogtLH51TV6HxTUHVia145g=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Kondratowicza' AND address = '03-291 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=iU00tv9lCyOyJa6cJOvrlQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=94.74082&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Kondratowicza' AND address = '03-291 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Racławicka
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np3h7s4aeckM_w1e_lDFqQnDOsKIO2Cvs1DJT5HfMLM31eQSfhZp3HJ7ztdL6Zzrt_p15MB9oXi2LXdDfV-Xf2DTfZL-owhP74TLOLM9gL_cRsaudmK18hikIb9_7l8iYfIjDS3=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Racławicka' AND address = '02-617 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no2c061sx_1uOMuL7YhQ446Gi2uRcxBwrgrpGrdyRCZzNy3czcrlnHefRHNgAqoGC61DMprq93vJjKLVJZF4wvOsbrEY2FxnCGqkc4aMxYogw4RbVsPPbYK72cByhqOKiLHi1lC=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Racławicka' AND address = '02-617 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqP0mDu2-Ti1YakdM6sZMtMFXpsLOp8RHzEYiPGjU-Oay0qlm6aRHJviC24URmnabOFeIJoMAQJPJaTNsKU9OizztcHP1BwhDHqngBSbqQZgLWVX9ME4juwFx3HinQBHHByKE4jnQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Racławicka' AND address = '02-617 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqvnUyUKApj_hRGz6g9h097Jom1DofV_BX2Bp4kssOC4OBvKi18wkzgxQZNMBGxio3MJvHggeLe3vs_avG2orDCipIo6lVifUvYew3BFtAZXgMfrNnwcA9JQXGBCOcWaa3FBjYk=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Racławicka' AND address = '02-617 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ZAea5VW190hBLJFM4pRnbQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Racławicka' AND address = '02-617 Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Wawrzyszew
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=GtND2rCZo24AAAQ7LuIYjw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180&pitch=-10&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wawrzyszew' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noSxhn-EeCn52IjG82oarsC1U9fxHv1ir-4lriMCdN7r3ILRGpS57qtrtqEhjP9DE8VdkGog8-00wCybMCiheP3lFh_03BIQ5AriWzfehL9gg0v9vDUAZHHVvYYHoNsXQcxlWi4=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wawrzyszew' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npOlBZ2gze2rVBSAv9u8IE8FJ_yMqxQzIx5UkqERlfnDh8Qedrogon7aK7MJMGhh25za9zI-vURO3w3Xj_Ni2E8Av8j3P45_EKg2rp-gpHkI1m-mlk46r1AJmfeATq67SbeUcQf=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wawrzyszew' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrpHaTqXQRW8oJ_uXGQsu_hIFSXREbmPbkTgPC5Fnhin8ptF_54WlymkIy76Et5BNH918EIY5VKfFIFQ7uHJXHFAwPaUaD0PEcqDnQq-qQ_KUH5NP8HQ-lfOgt7IIi7qXIzNRJUmA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wawrzyszew' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fOPfMrT1-wQAAAQ7LukgCg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=168.99077&pitch=-1.8211523&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wawrzyszew' AND address = 'Warszawa' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Mistrz i Małgorzata
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPVURKjHEbp2vH58gfjjPNy_L6S3Na340i3QmvQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq0Kx7J6i5_gqoMn-w3QY7qRg6YboUialX4b611uip5Ie8qu2iT-ljSju16F3DsiF9O7PIJ4DfPlxN84ciZKMKYoTtquxVcYpCGV7L1UoW5DhgVrphum4fPbLVSOP4ZzamTeluE=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noDfKgeiS_h4i-ccL0NGU6b_hr_ynhWPmZSkWpIOYGKoAS1YRD7m3bIQsVRK2YjJvtYoTJFzidgctVbWX5gNXQg4mebNPiInYTAlM2C2cyAEn9DDP6hhmdPoVbplrifWa511F0uIA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrinGk-ShkRM2CC6rcOqVyC3YShUkbNDyVaTiTCcvw-m48X1Yq78swgmrBSMhD3unqHF5hV1sVd5ERqMdCVaYHz3QHUjJWs8ZChI4obNfE5CMzY1_3bwXKaTYZ0ZLBFVWkaaQ-X=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNxi6bH6u7dlm_NaOK9T9eqie87DDAhGEOe10Do=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noSC45x0niOa77SzdcoJz6Yp1c0Foml6Ukrnccj70fM72y2VPQz49QH2BAWy3C2gHjBbFqtXy4gxHVcFjp1pWM_xrudYNTiIIXp3oiVv_wkXruoJjnFpXdmCPwl6uPlNYm2uLTq=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqbkF3uock9K8_eyPG00WbyCILwYtiOzsRXHVE-woazrLozReevtN8CHzfwqZFsPRzU_ulxt2IaU4VEoH7juJqMy5ApIFC75aboB6JZwGNJZQZyaax0UA0g2J9dpjyj3ltQvyA=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNHTwHuWTZfsXeZhEwOdUn-2aWowFR94qTC-yiQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqg8uASALJx-DltPBnBmsJdNBo8ynVHLH8VPUDmGoX68AmOTVTBALzUWYoUBXpANwh0NeDV-VQjURtKJRMIQlJ9m03DDuNPXjIbMEknYqy3lbf0MjfNzKCriwPD8-EW7R6OrJZ3=w224-h298-k-no-pi1.1296428-ya349.99188-ro0.50390375-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Mistrz i Małgorzata' AND address = 'Wojciecha Bogusławskiego 21, 50-023 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Barbarka
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np1pivgzf1xqPf-H0QstwVB8IF5cKfCnnQwdKf7IYc309wIxpGNn1RvDn8-qdBETQ4YVqi5pKcMNaXW5_1DD1f2cqAA6a2O7UxjZSIve4IPNYtWvA0KexxBTi1DegLW1UHDOn3uK0tia23a=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noYkEY9zSCJWZvJDmrLrKbMBztDy_ky4Dey2nG3-WreYlCw-v80WHDZlI3_RXpFkDIJLsUihamOnkjGM2ixh6q6Uui6cWlj-0dx4PzaEDE4ic0PF--IS0UWsoZzqryzbguf-nuVg3x-bG_S=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqkqah7pX7GhEL6DPaopz-hAdNOCABb0Qf7NDpcrj5h1yWELP4_0OR3wamkIp0h6LTwqvlv9xoubtEVK2-fXtuQ5YI4Kj3HrT2pXQX7w8t6HooN1giDgTotCXdi5ILSeVi-dumE=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqTQdD7MmkxuTkALU26YAtEwC6cH9NN6Uo-40FdAhTb6TVzXwCOBTmdQhpoaFczkcgKOlZUbfMoiqDOQ7NbnJHewt1mZPD2fsmaPyK2qgs_5WPhK_cNWEEiiSst4M00faZ1muHRP-RGfZ0h=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npwXXPdkg5adyvISgbebRd6qRyULKU-Nb1hsUUrL92qgBqmXpRFHPUGtulYQvYLiIM3tNbarek-FR_T4f9OJj3_WLxj_ctOLqlVS7_C8vjMrHB27kn8ArisSLZmudBpCDPVRf_6=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqO9lvDXZ1iW8__SZdSsWExZt8zHzQ3-JPqBqvwZofxu5Th3j2zf_DXC8sNpoGC-AIxjyIrn5icImq-HEHO6mlGIXzOntT6Opzj92zg6kWp1y2MhosG7LUQV3LTi4bEXaxGVEeI=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqiak9laVXAOqtffV5Ujphs9COpkj2kUhLno0Jlr1LMhi1GHHhpxXNxXdWLP4dHZoLUhXEVpIFRLZiA6lhaBuLB02Y73wueb6Aww_mqHEogMrPQ7LQobFdA6RldujIW2Y2-i9KG=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no1afc0kW9jL2yWpHVo_u0LPb_W8TmL6h47m56vXj8PjpTXamYjr_6j50cdoZEX9Mw7pWxbcwUuAnvnnp5L6m8gO8RBFsMO_ZmQvWR4DSmvjt5x25-thMoMRbJxwYZ6RX6Q265f=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8yroU_LU1Os6-FE31gldtQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=118.544304&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Barbarka' AND address = 'wyspa Słodowa, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Cocktail & Whisky Pub Szkocka
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNhM96JpDv-W0KYUfpR8pFukJTgSC25z708lkHN=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no5d6PQSkIAP8k6PwHKgbCt1dipBznST771obYVndbK6XkZ04HxnZc7w1qX6k1WOLFVcL1XUQWiolq23ANtrdvltclTsPETFklkOJZvq2bWFmKKDpUfqAbj1Dzyywg4zTbfBLeBytbXqE1z=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np1_d4yCM-AjO9kvittrKnrD6xJzabpGICziAIL0qxKPPOcfUVTxI7pMKt3RzEwN3f1vfMDybr4G4sw5COU6Y-rf3HE2GGKIFdGHrfzSq1L_dSob4xpfXaN5t52Z8nX6FVD29yZ=w224-h471-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npwWVnxA9BYmqwM2f4kwdGgTyvST0g8eNCVah3QY3vON7I-jKOFSk73rsiDn0HnHhyAyeIPRHC8llm3fjPQpbeLvw0Isd8BupHxSxJRya2w19M_fascTZah38aN7mvvYPDSaponBg=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN_dJPbTng1DUyRgvX2SjKIh5zZSH_hFMZDTPhG=w368-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr31hgFZDmsl2ceBvQ8h4n-Q6BzkykM6G2G8_diEzucNGkTaPor_MtY3vhDP3VV_eJNDQN4DGweqpC0W6KwZCBpf19KXWIS9oVF9vlTUdIEilG8c1A6xYKy9BM_tdb8fgUt9QI=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr8ChSZBk0ylEa5Trr4W1YckVr0dErb7UNOcNDK0OxrIEWy9Q5bbmdZuOfV8KM4vNXcHyMM-JKiuA3N_3mco8-LcN8AxOeK9HuPZhyA-pLspYc90bxdsT3IjnhVqBerRHg739za=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nokZ-4x9QLu6Qx9Yu2XdLVCzFpuZCvUqdkVDXoPS5vCcaBpqObObAtlLWsS5ValyYskFWg_JWyyVUcyKDTBZKbJv3sKooci7hzq4YG1SlQTL6c1Ix5TGEZ-8eZoSRw4uD3ohMX9=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNjJPupV56d7Sd6peDZdoMTGlBZ27Dcj6317NBY=w465-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=EMV-U49rVItWVIWRi8mMlw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=150.47403&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Cocktail & Whisky Pub Szkocka' AND address = 'plac Orląt Lwowskich 20a, 53-605 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Spritz Break
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npttapV9Notq8ar3uCKp0HRcrkPoEuf7RyMdSPlnoCD1JS8zZFZwv8Sj32e-7xd-awfr_D5yYZmD0ATKIuVvBAcvkpYwV08yI0Kpx23gopv9d8Nfkow6N56no7maYiWuPEugixK=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np3lOs_1nkch8O3eLyCAn4XOshaR7WNhIQdkcZncWf8GEeslxIsNCmPuWzQ-L_Ze2x6UIsW63639Gx9U_XWYEuorymw8Ytzu719-HMh1jZ4NdVDiTN2ELcTsFWvNrcbeaY1zCZ6vsg5Dx3x=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqdTIdqK5-i5WQrvY8Q56-h1axdE3Z59mDETUKEoa-MRmC921N9fni9rD7OZTphnsJoYOCygE484e-NLD7ynlAdKzZ9w4oYi5sesS6oerm9DGUrW5FCDZP1KC4E2cu-6ois6GoL=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPlihShBJO2QF0CKiOJmISvmTWmyF2E_Jyk5ddr=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nprJXXN9UnaGNX6MVnQFE15c3yZ-fd_SW3z7jn2hm_KD9tSnqQdMWsHsdaiqYoC3NvGoLYQTblQaMDbKR8tylFlTgjmejuuhgr0us-5MrvgnzjjxO7zxA0gP7qqbIEZ_WaxYY_Z=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrv2ZUPVtJRuEs3N1m_49yyztVg_x57suJ9fyNTmrdmlCRlBl3Q4QNy9BAxRy1mTLgFIyGrREe_8jXjdn3IDFWlfA20kjqKbdJJdXYHUem_qjAdrQUm-pssrYQzj6yH8SANg8PB4eQoezM=w395-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noUPCyqefUBMy9PqarVIOQVqNmPNsd1RQePyu1ZcGMUSVhin89j5PhqWzLg1wSPE00ci68Mp1UKNDh5bmpzL1VoSnh_Wif54_dJplX6fSo46ur6abNNzlJAvk6Ti-O_BCUhuHY=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP3-2JEf3J3h95ZmeLRRtzHe9nnB-vAoBHjl17T=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=jwKNql20dlXJJ0WL905voQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=128.05504&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Spritz Break' AND address = 'Odrzańska 8/1a, 50-113 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dziady i Koktajle
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPc7PeffTRH-VwP1osbSaue6f68wkJIV6fHg5qQ=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqlgFzx31b_WJLaY37llxssB1Mkr775hp1Oo-btNzCR6kgHpDaVMAJzwex6HgtE7-04DjQEqXzf1wUTlyddIWwziiEQNX1fVKy-RoQBHPf-DNDq_xoSqxROi8bd1XZ4pUJgonMdadTLL0M=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np2PEe4P7nfTyeNfLxXVUCrvd7H_3VntA8758jcOdhSCGpPzJK_K2sGEKBnXiPMHCugaH6e27Fgxjr3FYVW2SVuZHBTSfbiogs7AG2cM0L2gaPlu05V6USfCj0Sj1uLvHRwmgBBAw=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqnmiSM6Sr3GqCfSkd38C1ThywB-s13Zh-ZdXvlnXfvKcPr9j0JXwqv5EfebGcEGiHOVtULH29xzsESnVAgEhssbTudlORhETEENjd3246bTR5XJt9RHFsLFnp2Wf3pq5tc3PmCixkD8Jly=w224-h397-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqf2Huc7zTBXTQ0mSq6ss-eXO3HNA0CZFVLVsis0w-AgAHXXqD4M3pkNr-A6k1TFWjBzUdBhKKYUiqXEL0OihpR-7i9UzstsaUItHJGqGnvt4hVJ8NFfCu2YfE2Md0G7ff868ruOw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrdX4Am_8zSYSL1UhmhsQMFMYcUxiiAl5MSz9ULbscRMHfMCTChlQRXXuE_hjjqQnir807SQoxtVEh4Rbj82bv5mEjDfh41Tx4xmoz-3TzWFEc3Xx5cI3Y8K7uzKQpMiXSoSas=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nplcmITVxdNbEZ6A8nSf03hAfC-SSyYnbqUZ1Z2WNpMKp-of6cIKU4tIqYsEA6pfxVBYlJobXi8AXDe9F1l8ZvI43P0PqDyCzuSBVp5KyZTB1ecNhF4YsA_oakLiI-ARnmGhmbQ=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqLb2joA9SduiVuxZt1BXW1w7pjIVMHuhB8WFO7lxAcddlo1XSoafz8fB8IQeJlY02LqDShnvKGSRgjufK3_RjBqZhVBzKcb37313B_8aL-uvyWsiAzE6SchTt7oxXgbXMttR4y=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMSfEr5Wn5x6oxvZCbL3FluWFL8QU9GNv6nkp4L=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fbY2CZj5hba6wBeXAkGiww&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=161.71358&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dziady i Koktajle' AND address = 'Jatki 3/4, 50-111 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Le Barometre Bistro & Cocktail Bar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOn87oQJYqdc_XN-32PQbCWBgtKA79st7bCpNPu=w224-h370-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrZF0fhiDr24-P73rz1Vk_Ejl-h6FZNnCtBRZJRcvMZThjPAceZZTQAPgtqRe0LzC8dyNT8PbX8rbL41uO8niTnD0n7KdGROyQ6vSRnjeCBacImA-COKCPL3quLsbZ-JRvoLzvqxlG3hmM=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrVL9_fhjDBCfrVEURxMuWtMIO__RbpobMUcgaE3WG2_SzFPpy-WQrDmPTyM_teApIdDONEQABWQ-a5ddq-sMMxemrtd2YHiRLvU5MeCITjuqtKkwTCe0iUfXeJlOQj5TnL7i9l=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOVrDDoBvju2MLi-mM3peO4iwh5mzC4h8tb5jjI=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOuCwis369I2pX_HhUuBC5XhYH99CwaEqiXs_TJ=w314-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqVYR2rbjqsOnwjMDLGuNGALsh61Oynj3ZUuXZTFfhZ2d5Qj7GwF-QnrZcvNW7VSUgfQLS32pRYuu9ldKWEME7wSDZ5vXq2-6Ep82f9fD9VEFfa58pMRfH2GiCD0O2Lt9GHlcVH=w224-h298-k-no-pi-0-ya57.359997-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNknfl99Ljwsfnwie6bf1wbFBVJeCB4MIAh_led=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPZ6My6NfXUXmRBzUIdwpNr2gdcTQ8xST_5m4iN=w260-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr3sfV0AL5ZS1ntbvN6dOvghvhChvI2AuIEc6LR6eQQKhoEF1UZJIxO08ZUj135TwwFa1Z5-6WaHNolM2EZjeKDwaG7u5rt_6iVGXJNzgNu8GfhQSw1DQYUwnLRzkFg5W9DUH7y8g=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqeoKAT61nSwMWnPXYuqINFaoda8AQM88SG59oqST1iK5uqZ0S1xSQnaSwisD2ehQfxtPs1c9jpOEvbJ46TdIMk2JpoEEHZAoOMop_o4nenGPotXBYACgaz-F8vwWtjsUvM190sSA=w356-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqnqY-nKQIaUjsgIPBbjvn4lndu9caR-qHvTayP6aKtCYJqY-KBIdGoXmZqkHv2E06mGjdj_qP60tpPSQgLpiAvLVxI82itrNUK0isoazcvzw709To1-KGCkKinxDtypoglgtII=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOahDddJQkvSVdnGyUoA0wWc18pNqCQHRn05C_l=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMdphq54bK2r2_NCsrTG85b3fsgET4tamuddY3H=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPjB7Dc_9TWPodgIu0ebgWuDXXKtHeBXB05CdHT=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np7-iH8voQXmEnkMzGPZJNh_yAlxUFC55-b3UbMHodiBxrL808RC3dpkxrjtZod81qFUoCOuYdKlw-qDE0BBhMUR27lmQzWyBJOH9sNin3D2dXaIGFL5KSq2u10aQVf66_owTIDng=w224-h298-k-no-pi-20.11257-ya123.08744-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Le Barometre Bistro & Cocktail Bar' AND address = 'Rynek 42/lokal 2, 50-116 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Przedwojenna
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrZSgB_kQvaZvot3_a-iPSqCGJgAwdjmV-a8kPskBeFDj1FKJiLox43MZ3Fl4bZWmY2fMggTMYKcVsycv-YRdguvUI9Iu2p9hZKvafEBZg4253m1PoOkQoucu2iQmphcwxhK2JAcA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrirdi0aZ3DjyPztrDKIrFG5mCiwZq1SuXvHTH2mZK1PO5jj5C2WuRfFdbU4wvTQrjknS_MqXAV1zYYLZkwWotShEbre4ld4OJvrreKp34R1RMFJmr7NpzTtsNxljwdh2ihe7CQ7ki_W0o=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqXhxkfKutv5bT362E2cGHigCge8SFcpap39R53BAH9PUAHTgoe908eueBX8V92WuXGPNKz02Ofj5bzL8BQaEF5wO9JeXwQ8hH5wMmdD4vJwAtu9MhfhsZdjwlYpGuUoALp7AGE=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqSX-TPqFtdC9okjoajyGmJGBhkMyhT9_S4klMg6ywUmp7lYKexOr-RyQFQihwMyj0NKq3P6pAYPJe5eXBbqtNYh2nYCwIqGODjsDujqP9hKuKrTCT7o4jqcCsHl6bsJQ7j1VDA=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqAefJzX7jvEolH63dQ-5D3yi6iX5EzArTBHEsJqLX3qe-ydPi-BhzuZo31uAP-s26DoUvp64JnkP4W7irYzGwxJ_uvVXKwyoP0e1iokvtGKy3FrrX_5McTBsAagNPDfO7nB80=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np9bl755Yj9UJm1F3SJJoLUhVkqmW56kV3num7Ju2bpiyvDowkpti9f53aRtgfYfq93SsaJoTZrwWZLey3NtMHN2efvcs_SLftP8PkCr9Lmdt3p4FiQHP08jc8nmPrQ9UN0CF-1kA=w224-h298-k-no-pi0-ya341.48346-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqfzehLsBeZyqj2wMDrREpS-BPC7-da8oqRVeg5xSNO_99eKWpCrbrhi5cKdnvZKCjeRPEdrg15aausW201OeE-BRNTpcLUWLpJ0w-gI0-xBYn_boGcRciLlaG_-w6JfP6R38ZN=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqUTuvNZayHcLHrE4Ozbedy7_NcgNXkUm5SdDwNECoYlCaheQAbizAUNWRIL_CgvPYti-RNbrEzO3bMdYNVsp41xkbsPbDgvxg0PaFmApmnttSYYY7KbiFjw7Lqs57hzMRML2fW_Q=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npe-zX9rdYT_ri9D2_SYfdOpmB26WToVBqe2-YTetzA3ajRt4Mx7t_P1XHmW4kJqjpsz9ZET7wMW9hKv1fHv-bjwAa-Q4HQ3GdLoeQAszthqi0k2koTZ7O3eXgLgoIKFmudJo28Hw=w226-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqe1msvhdMtfvFzypQz4FJJ7Oytwbt7LEASndHMDVnjBO89_AguIzVi7RBL2PnhC81-BbRJcdm8LeMCImBlaovO68Phpe14RNrhDPwvRZWuOCu4dVtM3mgYPuGEM6DE7bOGwh2o=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqhjZXUeStIo5sbjx-dCNfB6iO1lZVe6Q1_8Hcn1QjDaHQ4nnlXnV4ds_yScSYLtcqQTftRHDSeqKUWkEMdJaywasOun42kipCvGeOg4wCqiBxAsTRlQP7Z_loxGl_K_56v43_l=w224-h298-k-no-pi-16.318329-ya287.0043-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Przedwojenna' AND address = 'Świętego Mikołaja 81, 50-126 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Zagrywki
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noop6zSGFuzAEaVjf7B3IDLTS5US_pm07dO3FnS0GHcNiFzVYjwhOW49hEF6gUEFRcXhS7vPncz9Hs45zAFOdvQCuM5r7ckuLbHRP-_xn-aWYxAWqIe5p5uJHYDllA3ULtwE5yR=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNPng4uwWwncnZIifmtWCkC4wp_1NTJy4B7yhpH=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np1zSPfSvybpEMUahf_dqiM5fvgHERZcPIzn8o5Tf5anxDTueFBQyTYS8uSYrisagPLxGCO1YbTYStxqUD2ZG8j5J5CZIK_t2igT95eoXCdAOmpvBpR02kq3o9-h0oD3H8jLj8m=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npa1ykPyQjYdbB1uSr2zDCBlzYSN0GNLaFiIlGQIB8VkeSNKx4wFsB76zJA-PanBVPloUhT3bGunjk7illrndZ-hWJMgZK-viymBtP22aSghbt-Lli1kU9qOx0dUcgYK4Gs-bFP=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr6kJ_8c1cEO9nAQLTX5htLDj68YIoHSZGz1oKXhGnJNBmf_cEomHmdnjotpn9xfw5FgoV56hm1rwMRWJC4F-qGm0PoqYoch5hJf8KlzXtdm89zR9d_B_gedKdMW9l9bo9c5-PHq9gOpGJT=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNveRW0G3yGvvLBZ0vXXyMrGdf_-zMN503hc5XL=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMXhWDf2nxCpe7x0ntEWNOWEMESNHvOytkPUJsY=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNJb581mtjeIO0Qg_bHq8j3_xf-21jrJQcKMF8d=w224-h333-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=JoRu4euBgLdeAyZKr34OoA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=349.2982&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Zagrywki' AND address = 'Wojciecha Bogusławskiego 16, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Szklarnia
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOkVrcRbomffD56FfhRzE-zbr34Zfn8hImKxPzD=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNn5plz_YqPUg-6ZphqaDHsA1EfZb88bCXSh7ca=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPsJWNtWi5saLc4_K3fuYfQo9GFYGtou2e9v7uE=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMSRVlU6qzQxpJaPOv3_lLckZWFxZHQrDkzfvpj=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPU7Oe2fC6LtfAscaJqDTUTdQ9LaHeKwQMCPw9L=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNj_NYdzbI5nL66GBa0gmrMwRPVn1WM3aditLrq=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNP_VLnekP6_ixlXcrF9dFeuKba2-rCsS-KHXFU=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMympLQW0lVvEQJ9_wU9YgPtLm1SjsUdkM5DMam=w400-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM20i7JEmZgjORlnIIzAW7LTAVmnaUxCV_E5Uvm=w245-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nogIzf_yCwe2D10Aaxt99xHH31hUh0MHw8F-Bj3cL7Wfgr1TGyyb0p4ope1qOAmqXRoJPybROks2oYpO92ENW85X0juhZcEpPGA-nS1UXqEMV6bbStCz5c57gKhkT3UJRPwWQ1P=w224-h298-k-no-pi-10-ya146.41354-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Szklarnia' AND address = 'Ofiar Oświęcimskich 19, 50-069 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Mały Bar u Babci Jadzi
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOr-TAY4pz3Hjh9o7ZsQGEVAsyIfwjeH0AplKao=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mały Bar u Babci Jadzi' AND address = 'Hugona Kołłątaja 27/28, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no9nbKsA21qyj2RvBCgb4VxIXxoZqGDuUi4S52D6R9dqb1LM5srd6q_TPpTz4xuY4_vosFCRiVzWgcThkkMerQlR8WgUH52Z1XCuCidZ7UB9SWD2CuQKOOpJwRB4PW2ib9e7hnBepPHJau-=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mały Bar u Babci Jadzi' AND address = 'Hugona Kołłątaja 27/28, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nox18jBZjzGMUuMFvxEmkxahq2Yx7XRJv-g6gSCboADJslonwxIq0xkVRmwZZoOygRIaIlr7ji34unhOz0fC2LcnufD6Fi4GWVSP9L9qKOuyYP_V_mlSaRsLEJ2BrZUwf1CWbcn=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mały Bar u Babci Jadzi' AND address = 'Hugona Kołłątaja 27/28, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO5UyMv-PmyI9BYbrVx8pO0PbM3i_BDKjRcH7gV=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mały Bar u Babci Jadzi' AND address = 'Hugona Kołłątaja 27/28, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrzCkeApnzlYV7bmxAp4IvqzwxXLtTmdgnvlRTEVHi4gZGjLs2aZzqSYXBD3g-xR7cz6lO3ZnjU3a46u4vdS2sGLFIDH0Z7VHFGpbxVZBw0SatLr5Z0rmJPe3Sv3moRfjxoN-zL=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mały Bar u Babci Jadzi' AND address = 'Hugona Kołłątaja 27/28, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqiK2dRwWC1O3REjAFObggpZ9Dupg1uWA279iI2sWDeN2nuBSaptbfiJYvx83_fSHBEz1dL88mHRweZO9DXzmZrYyuBzEgVWYJELhDcf4ZriVKGG0Br9vRLFfB_AlYwThJDUWUV=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mały Bar u Babci Jadzi' AND address = 'Hugona Kołłątaja 27/28, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNoqHZGljPdSiwscrLtEhq3BO0wvqeuu5dvxkaR=w224-h484-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mały Bar u Babci Jadzi' AND address = 'Hugona Kołłątaja 27/28, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=jU-0xBG_n9Dp6DaWiqg4iA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=90.45154&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Mały Bar u Babci Jadzi' AND address = 'Hugona Kołłątaja 27/28, 50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Proof Cocktail Bar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNsh7UyHnKC2FxvkZzc3lfglucVhtRECLfaNUJ-=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Proof Cocktail Bar' AND address = 'Plac Solny, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipN6oUD6X-7lyB-yRbsEsT047KU7OTxIv7kSX27k=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Proof Cocktail Bar' AND address = 'Plac Solny, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMSantbhJin4cbRzoCqJdIn5JfO44HEh4kI-Ydu=w224-h317-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Proof Cocktail Bar' AND address = 'Plac Solny, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM6cNbn2EtBhZ705DfFtjidocNP9wNmUHET8LbI=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Proof Cocktail Bar' AND address = 'Plac Solny, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNsh7UyHnKC2FxvkZzc3lfglucVhtRECLfaNUJ-=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Proof Cocktail Bar' AND address = 'Plac Solny, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOz_15erD1tST3cr0vwzkRM0dWkWVC0KltQYWEX=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Proof Cocktail Bar' AND address = 'Plac Solny, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=IrFSwBqugRCh5EvrUKWnkA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=7.0692487&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Proof Cocktail Bar' AND address = 'Plac Solny, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Sztuka na Miejscu
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMQzJZ3OdDOl5yEM4yaiOpRSELcaS9LtYBj54_a=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sztuka na Miejscu' AND address = 'Łaciarska 4, 50-104 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPpdFfZ0HeT2TVNt1oShFcFKUdwhsxVTuYaTRpK=w421-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sztuka na Miejscu' AND address = 'Łaciarska 4, 50-104 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrWD2a4Z7nKGuTwi6Ij50VqgY7Yi_F6FR-soDgOJIE4wrbUm1Fo1XGNXtDQaC67yAc1Hv7pwV1K1PfVd2dJIVtMlg7axOKrTN5pVDs6237XRX7XLNblcO0LRhQ6tMOrVk3PHWnD=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sztuka na Miejscu' AND address = 'Łaciarska 4, 50-104 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMUhpXT-bdi2j8OP2gjHobz02qwiDfJKQAO6pUD=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sztuka na Miejscu' AND address = 'Łaciarska 4, 50-104 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPBeQuBMtWtzqmt9sRV4qStEMBJ-FDAam7NgF05=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sztuka na Miejscu' AND address = 'Łaciarska 4, 50-104 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM-qHSSVa4npRbEUXalLM8j9eolNy7lbKufSySL=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Sztuka na Miejscu' AND address = 'Łaciarska 4, 50-104 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqWHhALmonWLpJSdb1sYbXtPPH8Cd28_LAuUrlsdnx5I6zuUjcIWcdGx6WHgeyyUQDXqAjQmofB_f4avwbAU68hY8pCJ1Vo9cA3PYAmJeDnrCF4rv1CeDWfv986dSijpshQ41U=w224-h298-k-no-pi-30.000002-ya116.72911-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Sztuka na Miejscu' AND address = 'Łaciarska 4, 50-104 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Przybij Piątaka – Pub Wrocław
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMo6XrSrhbX265WDH9k14S2R9wOtqZq4tpypAcX=w444-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przybij Piątaka – Pub Wrocław' AND address = 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPC4LRa048jJXlnPT3LkPn5wVhNsJtdFKq6iMyO=w224-h524-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przybij Piątaka – Pub Wrocław' AND address = 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npCJt2Boi7HUeDzQaTZhfoys7bGrL6-FTnWFuiuxirjCTk_lLDiIcKyZ5nc-xrLJ0FNAqIZjW64JUTWsJ0qDXCltKZ2qgdUTV8-Rds1Nq3D2mlQclWhVGskhyd-qT-Oxx_zn2c=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przybij Piątaka – Pub Wrocław' AND address = 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM9ZV_q0_ELt55pHeK9OmjK8Fi_Nr0T8ackFjqs=w224-h316-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przybij Piątaka – Pub Wrocław' AND address = 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNEBm8cncEM7faRqWCHYXp4HM0qxBeKNb_rMZIz=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przybij Piątaka – Pub Wrocław' AND address = 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrGInyTU2KIcAcB5XVdvCxpYeUlkY_kjgEcxOvZKLo1v7_W3l0uL071Fhx9fspsQp-0kPFuttnZ_rTFxCLOaALOX_6dNv3I4igiXIYN83wjSgr1YT0-3XLpuUP7W84STbKwZqKmfQ=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przybij Piątaka – Pub Wrocław' AND address = 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNG79lAddDLnOCbRW15IVo0APVsH9ADxBWWkMjC=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Przybij Piątaka – Pub Wrocław' AND address = 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no6Nywe4PNlcfGxQqYg1-CyODZ_GB7_2pfmMCi5gYSTggRimFFvE4fbDviHUkH9EN1kZVKH89OcdlGTczS9biohV8FZ-sI67RtxWfbjdKOSUPEvpSwtb6dnQwCevoxH0i5K1J0=w224-h298-k-no-pi0-ya334.06293-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Przybij Piątaka – Pub Wrocław' AND address = 'Jana Ewangelisty Purkyniego 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: T57 - Cocktail Bar
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPr6_nqyiP-qiZyAOzCMTTy68HvYr3L1b1FKjdg=w224-h335-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'T57 - Cocktail Bar' AND address = 'Tęczowa 57, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXnVHnBfpPf9hPSx6nodUxFj6wilkkcUQibRjgFZVXSEMeZm61WXsOmiPnAZLEqXfiQYcfU65JS70Rys3e4MvQJdVFl83wY7t4N5tlFGGXE-R4uIalncDZ-JS2d9023eTctFcQ7n1Hpi0G=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'T57 - Cocktail Bar' AND address = 'Tęczowa 57, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOCXKNLJGFYYQObsGdhuUMgKPakWuNozHN2Xhly=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'T57 - Cocktail Bar' AND address = 'Tęczowa 57, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO4VvEf1UkbhfXFUXU5Evc4ttC72dBQOfdFLSqi=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'T57 - Cocktail Bar' AND address = 'Tęczowa 57, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOgjZ7IdcYLLsfgB_ALC5GiO37M8WS0LbAxV9B5=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'T57 - Cocktail Bar' AND address = 'Tęczowa 57, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np0hs3v65SVN3zNQD0ZdlfAUfzUquzGHhrrBvqwl2G50joSHVsUKMSfMtsnDo1zolF24B5X9uEjkMIKNY4pUKseoYA1YNofs785ZZfev9czdhP_1kXFwDesqI1UWDmQ1aqId4N7=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'T57 - Cocktail Bar' AND address = 'Tęczowa 57, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipP1cSvZ7yY6o4Uj-yfrSk2YPKjvaRAMGmQpDGcd=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'T57 - Cocktail Bar' AND address = 'Tęczowa 57, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=eZ1_--7GY2sCw_bh0JT3DA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=347.10254&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'T57 - Cocktail Bar' AND address = 'Tęczowa 57, 52-007 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: BAR NA 2 NÓŻKĘ
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPRkggq1ZHWQorbxjlPu1x1SRfCdXIb2pxFM_57=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BAR NA 2 NÓŻKĘ' AND address = 'Staromłyńska 2A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPlyq3XzoizSHkxJcapMjL44Z-1fR9Qaqtoj8r9=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BAR NA 2 NÓŻKĘ' AND address = 'Staromłyńska 2A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOYfunZUNeQ6mfqgvbJfrXcmwSdWsagMtps2qmq=w401-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'BAR NA 2 NÓŻKĘ' AND address = 'Staromłyńska 2A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zflQv-UlznOWc7KKi9g4LQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=17.862984&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'BAR NA 2 NÓŻKĘ' AND address = 'Staromłyńska 2A, 50-266 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Mixturium
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO9-pLk0VHKK-c4PeYdb8FrBqfIyu8b8adH5h4n=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no4Irr8k8I-xtwieFAKhotJQojd88sz9mrIFUhRfqcp7UWfuwAKQeeFQWR3XSVkQlM3VZjH4VmIwBDSABS2yFHYDjI4FR98L553M5sAKj6Es7BvkBMt44A9MaVfupAFLHJ5zHS8e5fmYapK=w224-h397-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nosNZw2TIQlEKiG8Fje9HTbxHH1R9_hnH_eJ3P7TgNNOwarRw0gnxDyU_FimseTyI2AufyEShAB7G3b0Cpk51WpHj6WkW2xV9X8t9PiosneL3RgiO_9B9bUnyVBOZW9P23YinqBXA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNTkbh3yM7rbfuCH1lI_ewnP6i_qlpOM3d7QvtJ=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNWDFu1drWhnz-8G5DGFU5lNcwvQBSDZHjcb9Az=w372-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPEMihzmEvJf74CxqTHy7c4reE-7pLm69Bel5WN=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npmciPPMpOvGZiew5jmbYRLmBPao_hUhoHxi7FlFyBot5RyfPsrfP-4g2UqMmQLxque1WOpAF07VDItvCOhMfR6y8L8wBTRZUFAlOsefinC_b4PlnNAveXZUojZEdkWckAEYDya=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipMYHMFHkKJ7rwsTHvs4twSkp00DPMoYgdfPGKxH=w257-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=jHQ-ehrN0bVJDHzHbWUrLA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=255.84671&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Mixturium' AND address = 'Rynek 5, 50-067 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Zamkowa
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noBokpBSF0XxWP10uDwsDRJr2btCYvYaMOy6Io4ZrWwe-_bdjyGZiIuLc-j8l_lD2nXspLzB-VaQaHr2B9ZME9tAUa6MreH8q0DU1bLsYK2m-UNplQKqyOV73UEcllE6CfEIsN5=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zamkowa' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqKc4EnuzRwj_KWyj-0Tzy7AThUstNwund55SFyz6XyyO3syzGbNMvEP6l4IzuJd83KGjTp5LZW88_w39AOeQ0T7h92dje2m0JpdiwuYZz0YWtsZWy4suFIkFT13ICnFAI7KNStyyLyQFdS=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zamkowa' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noF6-MM-GoaEE5XMf18scb8ndNdHXdDbJ_muhHKzSADh-5lIvjddsHThxzrajVVIW7jdIMAH60VM-xpEiJH6KCd-jiV8-WJnKOZRluYOWwVromLf2Py0om-QUVTvqWF0FfJC_oP0A=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zamkowa' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noFmMF-HNjuV-pm_NH7WXb4n91mNMUivzHm7J3bhlELLsso21EHmzXkF5lYBl_bNanVrXcVLyRGg1JaGic5kDwb1c1amSsd_rbF7Dp1eKVIgKmm9eEae0FuxIxEAnCI-QPW4-cn=w224-h345-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zamkowa' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=DIBesBYwVxKOr6ww1vAZgw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=59.67365&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Zamkowa' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Oławska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noJ9vHLITFEcxOu2kcpw-VaoNeVVSrFTearbtZ5uEvuqIn2SOVipd3tcFJnMYjtbVF7wrsY53qryoa7Yn8HPkcXmOOzYjmJYZym_AS3RLEaKMrAAVoHwU2U7Z452hfLVKvpRHvVTHFix48=w296-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Oławska' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npKuNRtNoitV8LGOXknfsaQ3C4a1lFhQE8OOVlHkGfhQ-ApkltI5YuyXH2T6cQUxb5Kbdv4PrOwZoM7lRnYiHkY1eENphW5bzirSSgpOsDYm3C8RAtRfM8jrxCbWvHUV8_0tA=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Oławska' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=KwLth5deTl6xVOB8roBagA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=190.40166&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Oławska' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Wita Stwosza
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np4KTBTl8unDJMPxg78S0Zsnv2O7DWIfCZ-msqGVI4f_umU3zbDGGxC3T8APuEz1EgEhYsC7lxUI0jupolS9iRLESkeKcSZ5jPuDsWE-pbYIJzSqP8f2vvivQ4cYpTPeaKXL1Q=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wita Stwosza' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fG5A3LeUpl8dx9Vklb9rJw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=60.634182&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wita Stwosza' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Świdnicka
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noUi6RjRsUNWeA48G1aUAPEDVFN9JCFWQyKw7sGbyXi-T5s5iMhEsJYkZHGgWoh0APQNOaxPO7leXhokw-XmfU0EURi278vclag4NNnvZawSs_OPkwY2NudNMM-FFo1Ely6qS31=w247-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '11-400, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noAcTb3JzQUUiJf_WslYy8ik-h0mFIVwWQ3QkPMb9e6YSJCt6uGBE21gZJp45h0K1qF-LXnkFfbpjWDv1-tSjuu-g3aC0f5HPvsshwAnxXd6AUjpjRyOkBhyCtEl1GuC-5N34o1LWTVM8s=w240-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '11-400, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no9OfLDC6REeeAs99I22wOCxutdkZYrZRoSeFNUqGKFFaHNiljOU2Sc-x3MEE8V7D1c_Y8-Xxxtz2d5IjfEipz2Arpsf0_Bq1XerLKG8eUkIMXZR0REl49ZE-xCMOg_B0UTwv2laA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '11-400, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqV5KAnXnpCOjrp-dZut4oLFrEcbwTTkQqF780dFrwH2wYZVtlROYBpHoV5fy2SW0FGBwaHxukSw_V2z9wegoDa9YQb0y8RsVSjhvLnpa_8uwrv43yHkZGs6GpxVubmiFDpylOKGA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '11-400, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=grz_NuzIh2S0Ta-zexBHnA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=227.63591&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '11-400, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Świdnicka
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqD7eMvzw1iTPEzATcOOgaBSqQRRCqiN6L929G4zEGacTYVV7fsNyW7wqL4KDTqibDPkbWOjeS-fC5gKKJRJdvoMQFfZH9Eo0XIgSDhGSIEDerl6lSiZ5UOZf4VQbuJl4BVkRNz=w302-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no4eqTgVTsfAyJo_Z37XTNa_jnaczvg_X4kTuMvDxn0jUSDrsVK95vAnupNnXWWBPt88ONocVJpoLuLGL1iNFXriulzddvPFzMLSbn3D7bdnf7Dur7gmjxuXTy7qIjwnEVtefsU_VlUPzah=w296-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no18rwW-ohB9-E4SNAGciQBA4NtSWi-RYrKkuXGBNGp4-Tf3clHnz1yUk3S8EyFtXpw39nc9XX80i5YQxyvm7SyRzYLOVkEKAwUs-tV5uGtCtVRag0YXQvR2cRLlfc4C8vMsvObQ7F6R6z1=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nroQQD0OfquhDLVUsFmc_I0oiKGDp9dto0RSzsXkExjln6qkgErGIdzIMz_-2lenCUygHP0RVLJexwQiw1BWoZ0m7Ryha5cl7C5kpMJXAjPeLdv-QO7hl17aAdKP9_QVbSsb-0=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=byIM9M0Sd8gdqVofD7KmbA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=58.44616&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Rynek
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqV-vEJgGJOTHGUDq2BYVFZY4fj-tS51sND3O4DwBGfaKHvgpaL6sls2Rogh6g8zIJwQeqBW9p7en2txw_FvkBoJH8Z7B4aOPGYTuvqZQkT1pDteBhZ5m1UIdGZHLa8k763Ky-gSw=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rynek' AND address = '50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nomYC27BXqT4McyKJxc_zMYkOqD2JXtMsMzCoNDkvUaI0z7Cw8y0faLLwOuQU0Iu_kwCN-TOzmiChK7BKcIAubJbZZh-4AiekaEaLyAvwEz6ndTgeQY2BW4xQhtgwYFEzYL5gpq14wYJFp-=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rynek' AND address = '50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npHTinN14EzoeTscD7VATCWxh0qUj9itr7iCttoQQIhzMOBTpGXrtyE1QreLsWEL7r4J8AYaOHcCjRrvdmzWbS0J0i0YVWy1tvx4q9-3m5a3e47tgbMVYgu4kdl56UY-Ek-1VA=w293-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rynek' AND address = '50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=aSeu6eh-dLwc0ZXco9m6ow&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=81.24859&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Rynek' AND address = '50-079 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Rynek
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrdkDvkPnxd47up3806-AtJDbywuTO8In8kHYvdrMkjx63wgJ8QfO4sDITPzyTFfL6cpoX1ZS1Hoin7fX-lJFGgCgqhs6ywxpIy3uwT5diFjlve6J8MQZ4-rsUCwvpburKnt-LO=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rynek' AND address = '50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4notc4uKtRU-kO-Jy9BFzYPq195l_eloB_aC7cds74BEp1ggmDAOYAUcPghizRDzLBb_qeHdnuX3PFX_GsThP6V38plUTQC_IVPAN8XkaTUltCBbJ9gx8Dc852wrlnvAQ-GxS91vvndxjn9K=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Rynek' AND address = '50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np5Bei_WwSKvBNR3Q3GaSiujaf87WuAbrwetqFjYJXLiqK2cooZS1zjXgTA_ZgTekfHpeOUwYSPCZyUisHe3Saf1otxuPEjhP9udE6CzROuttH4XrNsv96AY0eDhoJJAyGxdrNubQ=w224-h298-k-no-pi-13.575352-ya217.29984-ro-0.05822967-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Rynek' AND address = '50-043 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Ossolineum (Uniwersytecka)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noK2vWIjsGLxghOO3-uBvaS04OFz0bYQN6SCGssXz_7bJRiu1_v1kYY01nmU4slcHzXWE2cR7rpT3eXkt7Gm2s1sHUncpBO_Qy-XOLQnd71u2LH0mA7x9K00TES4QDjSGC2D3U=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Ossolineum (Uniwersytecka)' AND address = '50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no-D7TS1DZTJJSRbQOPYd9JtCvRws66BP2jf6ZCMJ4l0C7t8zCfgmwz1SMCd-4qYcJXNrzkU3qxSu0NIsBJH36oeFiqUChJKdJCfZLPGphmZp-DTjhT2hWPvBh_PnmTxT4wQZRFEw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Ossolineum (Uniwersytecka)' AND address = '50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noOxbMqDBGbMWEhsC5UNM7OidYv1w9ClPaWnCmxDxxRLxkfG7sfXUt8BHTIkqjOlrIx5PA-CW5ZnawXAfA1qozBClb2TGg2R73PS68-gRnLYKFJiye4Nqk3Xwvz-Yg-oFZHlM4=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Ossolineum (Uniwersytecka)' AND address = '50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr7mBLHSxy00KNe1ytzRya7McOXvrFQSbzGp8zLpW5sYqoqLhsZXgnQqMlX0iMe6acQUpipxIEMzwWhC6-XXgv_ZkRxO9Lc-198GR5en5RCJK1mGAW5Zfad5V0uRPq7e72gD2Vq=w224-h298-k-no-pi-10-ya290-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Ossolineum (Uniwersytecka)' AND address = '50-120 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Świdnicka (Dom Europy)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npuGgGbZFn2dP4tY0_INKaOWWHyQ2jO4Ft8QICIT9NqF-u7kHlR759QwXnoch4cVxOsM5ssppBeY4O0WHI86pRyum7u6r5sWWP4JDHQCFF_Yw4hKlq-QAaeWIIvXWTZkpPG9oc=w501-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka (Dom Europy)' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npcJvyDc6h7cz5cg7dTQkUVhHBthXytV1E8UeGIVxtmj9u4hqoyk_9s4t3I025PI7u-La_t6i5e6z0iqsoLHOlG4_Fd8uoXKtXatiMWsacqNzyuMS8UWewv4X8r8uBuNrjSKVg=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka (Dom Europy)' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=hA-SSV2w_fFGuwaSGKcvcw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=242.17332&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Świdnicka (Dom Europy)' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Zamkowa
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npdO9Cfu34tQ9cTJ1SBc3gtvtRVdO8XI67Ol1PNlT_XWK8X1RCKPOFzmzIf9dn7FG3cNFYBeycJFJKxXF4gBcoB6AyPkWqKvde9aYUoPC2G5QZnfB9_ZJSSc1I8Lkf5F522QMdZbuYvcew=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zamkowa' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nozjY5I2zkQPqCryZb2IAcGiaxpJ5G8e1tbBLzZdjIYoQwnszY5aB5eNbYD1OGNYt2mnQao4ms2ZmVDb2ruXDytjtqxAwpq1_df7h04Agv6wnYN1g36P6C_XxJjAadY3_0Ibe55eUpaUlFi=w300-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Zamkowa' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=YIwLseg32rhDOjmIjQsEAw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=193.19147&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Zamkowa' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Autobusowy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqelvzyY9Gp62s14SPntt04bDYJPrluhb_L8gjr55X8Kwg-aj5tqMq9oxmpPlVCH7WhmyzyIsGrQjNo7kOw_3FdCfikv41lcq-qdDRD7C50wDFWHnbb1llE0YiJcfo8Go7bFoUg=w273-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=JK8WF6_kXWSTFaq5SjQvAA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=324.746&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: DWORZEC GŁÓWNY (Dworcowa)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqW95uJAymK067mhJtk8jN4AOdxJ7FkqGO8GxwenHouLnSQ68gaPZTWH3WStgCRWiHnSiF9Lbu8YG7IpPP2Jm3waDeQXIpwzTkVZOIPU5IZU838zFmUpftZUdRLfep33C3b3HtS=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Dworcowa)' AND address = '50-441 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=yBaGY7zp3eMtMqhPUUem7g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=261.2348&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Dworcowa)' AND address = '50-441 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Główny
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noeowwSKArckPX0LD-xGyPXMR9uk97jk3Fj_JyWFHTwOgZCvDf5QQyP9QJKQY27Jc8qpZufzXpJ1JezF6hyK1n8AWEFndwJ9L0IDeKGzCUPScnE7MjEtFKy2wRAa9tyfKa_bf3E=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrLoEajdKjihOIdV_sDAPtDEHf8cjFF-c3_ZMkFIL5sUBVghvUseQWM5I5UmiEEtwvJkhbe-SBOIotUS1zkWhyglgaF-M3H_i73lyINpCpSBHXUxSsQWeklU-2SqCa43TafS1uYnFsh5tgM=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqHgUHZeVYQsnTTu2oF0rZgXU04k3UXWbNQRQzmKPSnaVwLCQEtWmtxgilBjGmE4FPSoCSDYXFZXkKNA7sNPR6qKgl8dKcsALYV07nm8qCL3bd5T_gdi650BGyl3InYPj-wbmyhzGofR4mc=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npSPZFDxdNb1FldBJkSg06xqrSz3-u32TKuBDotj4vivWYmCUIW1XFm_lJT6ktuPKZdvUPu_JVBuEMVqbebAQ_-kXHiaaPm5fyw5v3jFdP-dtbOAIvWWzY6qHw30_E83OZ3tQjh=w224-h298-k-no-pi-0-ya160-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Główny
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noT3V4ZXhymsi5b0CBYTu6IpwnPdDOPdkgrVF8tRIUP4KV5y1QTn_5HroZ_1wGqWnKsQP42OHRQ9oXuD3fU0WsIRztTNtT2-ESY6aPixSn7JcipvbEBVJiuOYRYFgCD_rnAk2rd=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqd_a_5BJQeEpdiuFryWZ-vKoEaTmEh_2_9mzrvXhld3gqDYJUwSbPZkal0um0b1hkD-Z-Ko0BFzmhkUdafV1QL2rxXmnMrNjSOT1g3Q1VS7k2x08WhUQRCdPPeGaZGPgec0xjlXeIZNjie=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrZK36jlWuptAkFTl4TcSjhy_JHB04igNqz1a2aUd6DiQ83JWToU1fiDUh6Z3RNzsPEos5NMrUTa2cMMIHAQTY43DIbpHgxlA5MXnw6vCd5h_vM-MoRvtMmDBTRjgr15CoafMpsmw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=eD_PWoxqGYeAZQKEMT-zLA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=50.63807&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Główny
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npJUi_ouSJOe4gnFgX9C0XysmYOzhae1n4GOCoLaaz73-kFOrSncWumWPN4BodTni5cs3yGQibfahXyorsStCXeMiUfn7wucOZVV3AOdltfQsqTc4j4z2w_UXldwKgeEyuNuiOEeBZKlfYS=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrhrBH1I5GUk4NCNOF9wixmYdex7W5kIipfOH8fKm1yvtWtvwL5oNXGppQOOrb4X9pf4FswFUW6cg3Pr2P7dKEuTJ7fVzJyIrCUmCbJnbeKv_L_-4VW556wE1_8qhKhY1na4RMhl5eGlBqo=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no3JfjsTRutxWCd5az-LgNiXkkGfBY9VAqwtvQxoRMLEmCktN8TnjfxOya8HLB5elX0rJ3-CjTR_AYM3-kxgnSAaZ5T8PY0DtdsejIDD3vzf1cG0S2FDROKPmCcvRr7OqizNuyg=w382-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=l00E_JHuute_E39L4RCxGw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=342.16367&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Główny
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npKct4djT_I5_4vN4ejDHqkmyxM09iEkOwzUkrT0V_neX1_QoHrUc8x8H-OQN0EpDZYhMMbv7QQmbi_WLMQJZj4rYOT61c06J6386sMhOI2zjVIdWVfx2uCr_e1RLWAtfYLexHcwA=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqdmH5bUzEOLG3Y8-5CDaeHSxCHStSE27VGKjFk32t_J3j9GU59Vdq28kBV7z3nPEFpVBJn4ad-1OHu5Uz7GyGfSppuxLsuz-lztB4hGJ08IAef95WufpgheHgkWjHICahLGkKHq4yL2osu=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noFXiVWDAjtZ8X_MfHkX8wefONmCouB6_23VLVgnJj1FUV51-Impo4UxfjLvW78Bv_GcrZGf7BPncLlQ-h-jTxC0DKP0kqoqmQ--lNqbNdWFVuRdVS3RdkwVJHkWJ48pTB54lcOPP6UHQwi=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq9k5ATheoVI0gmTWU2w1JIEhdSatm8yTNeaTzVGIaB4oI0wuHyCd1R01IqtP7dZ2AWCPaPYbQj2hzwTOuudTgyTb4elJH1oy1FVmAU2h03CV5FPBWgzySGNaw-sdt4K4XJMOAYMqMBSoeo=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqRFfkNhRQkQtsxGLh_YwldRUuMz6YGhxQsqc6x9Z6EwDURfeBHLOONYv8muB1qB_CDwKmT7whS-_v590lhWP_wrKUyGMamVl131eIYFCN03kpbbiIw9SmaJ1PPTpZiNAM3DM9D3Q=w224-h298-k-no-pi0-ya280-ro0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Główny (MDK)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noKVilegnB7uFILwKbxLlPv8A0B1JJYUTLhS53VaCWMXyW0mHEUnxbl4wfNERKvhLMvG1Q-ypDvkoWnxOFOl_9MD46oSa4pFpvA5ybBvxrY1nuf7Qs8ifR_M3_4Jvin9opfKx-h=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny (MDK)' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np0IPA30FqIMz4IRlf2h01Gf5fLTwYN6cakrntk3rzZBf5hkcNTom5OCtLYbxdS_hisO8EhynNQfudx-BJGIZOq73sYtGSKSuZiwjEGW2raYPui3vMyvM1_iwDncSJpfpnZQ9ikLQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny (MDK)' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noXhntqP-PviJfYf_87fdwDvJmyp8rZ4Po9ZMPDFUswN9g-VQeACyCPyEN4dBwYD7Rqh3QJnHrLWtaYV44VCkWW8rsVGZHgdhmJBKqg2KqNcRX30FclZXPc8h3awdf0mDGeJGjpyA=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny (MDK)' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=VyYT4YR8xsxB7GmPXOgE5w&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=317.42078&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny (MDK)' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Autobusowy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no1HehLa_qaxZIvqhWWpUW3YD32hgvi8RNl5s1JolOrn0P6xZxXSr3CGChBXLq9LJeXMiSt51FJw3CImXcXoIOULMJNxIMElbw06MEp69qNzh0ZUqZP8W6C2lZIS5Dqs_EzrhCR=w396-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npBWbxlq2TdnrS4HSvQa5mh8syQdEz4GREYy_ocU353cRmaX2JYgJmeJ75xwiFvCFWdLFsuIKVdaUbh0WR6c95CCUsQmI0NSl-EvY6DD8vTQlfkmI8vCkm4-C7nJVrowcmfE973nJ4pvY0G=w319-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npIafigUDi_l34hz0sLRj-H0A1ZxslkZiQjWWlxGoyxbTLeQKI_Bwuk5KBliOVNA0Qg5rSFTgItEeFaPe32Sdf0R-ULqyK1UFMhwsVs3gE4xdOwR7XW_h2YHkx1WkYyRWSkiPg=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=j-OLFBg4k-t1SUgTiJu4nw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=289.31497&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Galeria Dominikańska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXLnMFa9DssG6SBI0uUJltvMwCtx3kNoD-IAnOya2u8WueNzJdRQv1Mya0KuHqxWf5hE7sHc_Hkz6jtZGK5TsWmbO4TA9wM4vpUxJ9CDmwW_Acp8fomLXwKmI1lFYjGzXkv0ze1A=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noTW_T_UXF1skRA_VgTndr9wYYie0A33OPc3gpsSz95gMa1iUfU4QuPETQhQCpEnx-QX-g7RXYNW44ucpX2ffv-H2CF4kXWPwlqhtsZL4e5XZUgrUN-q78CobsIQqDUAMqBt2f0qw=w660-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np6Siofpicsw4qlfRoone9WNn_z1iIaxZKyddJpyRvrgMypPi3zLgNHE7SHivVwX5YQEjKKzIR8qGR3Ppmki2fwy07P-8nTCNBUDJDL7fgpaCqDusoF57R5axZwRwEcnaIVZEC-=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqdQBu1s8Gm3bEWfAcqMhTEQxaAO5kFwHM0cw6pL7YESHXclB7duviQsVCeFhtypUmpd2EiDM-JcvFH-5Ty0VdiH_00QU54Ore7eaEqbd46sI7Eo5gPDHw6RxolhAF6nOnJlH8=w224-h298-k-no-pi-10-ya102.99999-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: DWORZEC GŁÓWNY (Stawowa)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nouqwtGXsKg9stpeePWdxp4f1Er5hw2E9qYb9qoLYvvJxN8i77bUzRTSwzX20XWk3ESA13YZGkdujdmz2fDs0fM6eMs3FUIdZFlVvk2oDj7XfWSqXIjuEqTUDf3puOKbGNwWVs1=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Stawowa)' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nojgRfdrG8Z9VVQO0d3HyXgfOO-KtEo0vjj3AwsrCIoHekEsTsyPDFIKU9On5Nc2b2YMhLU1VeEBSyW0o5dH5f32fd-f16oQsS1Ys2IVmFXpIlhdq7Mlg273kmqtJtoh15NxvNB_nWv8c4=w239-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Stawowa)' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noju3JKFC88H4ev2oOiqYMNFkJ0nUB9-lCbYzSnEPct-Ol53snPlY7EvpSkHPJ0J8mn9Lxb-rqPvGT83d7nV7Cebu1MrdR82BLTBpTk2O7j-PkPR9WKf7U6Pq4PyGZu4zbyWJS1vw=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Stawowa)' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XLsv8yRbf9B9wGyKbslg4A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=130.46591&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Stawowa)' AND address = '50-529 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: DWORZEC GŁÓWNY (Dworcowa)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npm_IHejauOdl4k-D7sLEOTzOFHt2_tNmi4OiqBHRkRokTAW6woh8vle0oWdmlXH-FLyUEO5YY6-NfEL4S5kkFgLuXJ5KnKCEjV6dAE-mC5TZbNJPKgfB0zt_gYfS9_zBGX20nhAGM9116q=w301-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Dworcowa)' AND address = '50-441 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np4U_0-rSVf39f8gEYdPa0qFS9dja4pz7OX0RzWfRI8Ivm8PtxX_Gzm4GB6XXnNP1h_WzGjYzQbIVmsII0bre0O43VoVH-josmWdCvEi36qgKRVgdLQm_CKnPtoJ-rS4JXEVfL_F9ftF536=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Dworcowa)' AND address = '50-441 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WMfCwADRHE7pO5eSfUyn1A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=224.7589&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Dworcowa)' AND address = '50-441 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: DWORZEC GŁÓWNY (Stawowa)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npmVnl6iSYmbUPCNXDv7KcEEOthExI_UxyF6W5ofZNxH23-5AfhN77_Ym7CCEOHIqKp0JtdKhgqM0ZymgoixZugeHAATnbfR9sioWmIDKD90FDnag1pWsSzUC3n7EhSugOEhwdnfbU5XpgG=w299-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Stawowa)' AND address = '53-112 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noTWpAwzrnWocYLyK3A9jFFDdWipyNjGYEWjLrycOLGFUm-_LB6gCyUBJ7CcWPOa9ogdZRPoJLoNxxB1E2SPdRI2KVuA4obBxb022wkzVr2H_AJj8SCnEB7BjFOzs3b3h68KQag=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Stawowa)' AND address = '53-112 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-Z6J6lbcTAIhbQ0XZXyNeQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=297.3412&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Stawowa)' AND address = '53-112 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: DWORZEC GŁÓWNY (Dworcowa)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqc3N8xMQJwRwmhx9JAqR_Ez9oFtyJHqxOMiQ_Ey0S2Ge7aCn9rd7WRkwrZeZflvV4wUA7guKeEN7Clg6oZCr80YMG9d9FUtpVWhrj_76rKiD09J_zVfsw6sGqwhoC-lIC6Q-SOXZ-J-i9a=w238-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Dworcowa)' AND address = '50-441 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=r4H0LCC4wA9EthQoBsHljQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=180.69514&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Dworcowa)' AND address = '50-441 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nryR1srbRSLLDYsEY37lFDvvqmjnEIIP8yDXdcWHg1faKhQJ1d7DERDGFkgl9qs3OlvItnFZNX2CL6GmkafnNbO5L4Dy9wVNZZD0R54gyS0D1XP3ex5lFzDOvs-Srr-RYDGNv7HPw=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'DWORZEC GŁÓWNY (Dworcowa)' AND address = '50-441 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Główny
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noEv1MW5ItzV8qXSwHb6y5BKmlE0JigQ13ehCB0XBYM8EZl0_XpAvo1JC1dCcJpCrS5Tl3YhQv9e5S6rDiaqWg9baF2E20OrXycXCVx19vFd3JBgem_qtbQUwEQ2DRO81TLrma2az-tFels=w295-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqS8Xkh_c6gmlHnHX9BxI3UCDxDBU4quOi9ZXuCqbb2XNYaI5LVPf1Ie0siZ9_rKBp0PVd4LE7ZIjiDoRBHVUrUmcVGhs-LouKd5MtUEm67cYneeTdVsSdseDGttB8OtM1jhYwUHA=w314-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nofMys6csW1wfv5jNytEvoyt4O9EZFR-Db2ptmvIqIoGdkF3TnI7oTXWTHdOJOu5nPV2Wdvj3spJ-fM3FiSCVuSU_GqBqz3K6ddUZhSEuY7hxj4T3lplH8izR9kuNHC-bGyQH-2=w224-h298-k-no-pi-10-ya1.0000116-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Główny' AND address = '50-002 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Autobusowy WROCŁAW WROCLAVIA
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no5Vssa651_mFGTut_bqu_fsrdVPQ_J9r3Bvv7Zb9Da_E-KLZO49vAplcjQSKBBj2mO5AdqK_qpw56cNV_Kr1gronMaKG2RRILL_hNXbZkhX_EnHWm9vmL3uV8-bPSQCCZr4NDo3w=w528-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy WROCŁAW WROCLAVIA' AND address = 'Sucha 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nriXRldd-P4GUmUnrLtk6KW78Dld-TBNQegRgbnR4Z1qlKTLgMZJpD33xETWLP_nla-ZguseVeQapRlCPsarybzFeM6VzSCzNcSZGBk6EjcIdV8IGVvELUFU3yAaKMTRSC3Zl2QluRuMT_o=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy WROCŁAW WROCLAVIA' AND address = 'Sucha 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nowZjhK3qUCgP1aJmMeM_tPC2UwNtWD0f8Zqj4vftGIKU-6ZA5Y9-uVRWtHWtA6guk0TMP_rToWHCPPW2pZtSNQJkpv-3K-IFY40fiy916RW5AjsMUt7heoRLtvijJK2ynqpoNv=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy WROCŁAW WROCLAVIA' AND address = 'Sucha 1, 11-400 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Galeria Dominikańska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqKgMtIdUTIFkHtD_btwXwJQjYYEJHID8ii_Vgd9v_svYML_VhcqKIaCK3lYpOtRS9l8JseA2BcVDSDespggAI5V5hJkThdp_Y-0aKNQ8SxV9qUCMPYJ0HNOcbG5NvuXUKTqyhBiYhDnJcJ=w243-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nooOdWO5kSak5O0sVOFS_ui5PHLGDerk7T5OlE7AwdojcqcV2U17MBRLaFFy7EvO6GQmp01_66z4-zhO9pbIPIXcuA1ZlEQ24Ke1lIA2P_2tupIy9m0R_TW2_oDGUTO3PGzESoREEtT8Eji=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npODpht1xv1ltzLfdRlk899GF0lkXYOf4U3AoiRxQ6Gfu5LP__jI3GAHv0amgw8c__072AgZw7oDYkObDqIm_udE6ZqfJYvj8VVF8BD-UB9Lv2-gUsOk2VncWwUBRLrSv3r6Ow=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrg3XTKMDstlvCX4UBg5lUlKY_a7_dcNhnwJcEUrO87FWtT9URGHpMgvMl9Q4hv71-Lt_Njnmh8unkgnJX5K5y0ckGRKMuBUAGv22eanLu5hYHcIhPwg-noF75u1WvX2fUjDEj1=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fLAV_6X3Unl1-37DIVvdKA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=232.75946&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Galeria Dominikańska' AND address = '50-082 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Przystanek Autobusowy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=KGCtd0cuhAC4O4HoHiXCvg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=270.87344&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Przystanek Autobusowy' AND address = '50-005 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=KGCtd0cuhAC4O4HoHiXCvg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=270.87344&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Przystanek Autobusowy' AND address = '50-005 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Autobusowy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqyq1CdSkD3rwqziUV1tsaaiXzIJAQ-RKridc5_ZVphYzcoiA59RiDbxoUdUcWhA1Ut_XkcWMI9p36r25ItOUFqRjMLLSShvIJVjqLqPzSu1w0hWlRG0EDDW5Oku8Q11NUaXOQr=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npxSHTFXdiHtRK5eCIBMVmgUS7dJsWsgYfOmBKhnTUHf_1JlxBanE6p8iA6Qx7c1S04ODcrtPA0uMfsEypSUlPAOQhBLzM_8KDPCGftpNyn8Ul9STwh0BrIUTSBKwOdUifPOOOR2aAo19pm=w293-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrlGZM34qHGd-T67RNXHL6hnD1iwnAaoijSNDt4CPuKzpyqvviqOp7vf11M4lr_-TGUaSA3YDEw4C19PVCSo9ZWHZnsAyMjKl0qA6NVIpw1SfvY1U8xp5sx3V702YoZKrhBfWQa=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4non2PrKRJca_f5UlruOZ9H8f3W07KI5LwwxJwuBjDNuUSavyrDSpjnspNHRGU34XvnbRLzvZhbutGH7HfyrvleJ25V7bBXBQmE0wP1lffllWA4ERkJn3a8U45bBOBCstiR-R1XH9NRdVGCX=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=JE5B-Iwdl2Ns4Z1jOUDA-A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=155.08905&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Dworzec Autobusowy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrtL6kD5FpMyj4O2SjyC5vq80UjpdwyjnAY-mbj_3ilzU5kfsstEd_A_BBI5DNzYB_AXk2-cVz2gcSjb99ceYr9sKag4ZEIJDNwUc1RcNKhj2oE69rvWxot_4mJccPyb8MDcrKu=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npUQDZZXm20MpZCenuhBTfu1pDKBYyDtwJB87dK8unhgq8wkTx4afgREae-dIl9I-Iq6RYPEQ3WiW78DfD_YlOYjh2lRqZZf5zyIcjg6BoJPZECVd-wz8_HojEwIiS8JcxaNjw5=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrsrW4hnaLmA6btU9BnLKp5jRffkoB-xKfpJg6J8910_lYhcCzF0qneVFgdA5_uw80QIHaRjF8flUMpmd2ZFfxBg_5jhH5q-T5dNUwQctRBCd4mAzt2tQey8u6vkBxBXODmUweipA5-hkRe=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=gips3F6MLwMdfWvw1eh5cg&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=311.6898&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Dworzec Autobusowy' AND address = '50-086 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Port Lotniczy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr1GBcmBc9CmADlLShR-C43ZM3a-LNLJhygvfX3hnebz9ukOFUA6GB2y1E5MuZQKRUKl5HFbdaKFjTiR84W-zpA9stxgM3Z8jdDstvOwyR7bqjmMOw0-qr4-YSBOzeA-4-XSit5=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy' AND address = '54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nq5EMcBMqWngg1tCLEcGCK69jCBbv7wAC8dQWBP6ONuCVi4je9HaEKTimxchYzlVSqJc0HiYO8UHKGUYjnd9CiCZ9nGYA8FSqaAfGkcBb4e_ToH99sIf7P67DzLF7_sKAw-7cOXMw=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy' AND address = '54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Y0vbFDmijSocqnmHN3C1YA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=67.040245&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy' AND address = '54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Port Lotniczy Wrocław S.A.
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNp-pcFlF93mHyrMeBt50beAHW42GfAGBFyHILd=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy Wrocław S.A.' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrksBoggog4okcnnLYWNm2miJcs0edzaHXKS06FIy1RZQ-WbasKLZYw8A_a2cUa-LRzR8Rt5Zd1fe_gIVqqZupG7wdHWhUKFMvv67P2hLJIs6cETM7A8sZbrpsuYcbjWOIkMXM3ipXXVVM=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy Wrocław S.A.' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npgRwE72aWM6ZEAyboMGmwIfYdENNMFeyd169a3lgJqvxKEGY1NR4QA0mnEss08eGboXHsetbrvF_A5Gt6YDIXBMV0TZfx7NGaI3blO4L3liNe5dege6tzX2AlGg9nNVms0xIVy2A=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy Wrocław S.A.' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr872smBFOqHm6SOzwOVejlNjYJJybA0CuO83btVHm9x9DOQU9mEGDl9xSsr6H16ZYiFKZAPHCJTe_75YPGiI9fQeeX7XmqePqwKM_I0Rz2vnZqlQraJ42UkW-51e4jsSJqhRlSoQ=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy Wrocław S.A.' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNp-pcFlF93mHyrMeBt50beAHW42GfAGBFyHILd=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy Wrocław S.A.' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=EKBr_iY4sdBTE39FiTc9-A&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=0&pitch=-20&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy Wrocław S.A.' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Lotnisko Szymanów, Aeroklub Wrocławski
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrD9u1ZtHye4sZ4ixSLY7wz4QPGQwewrL35-84LBkSM0pmEJLscFXPZ6SLix5gt4AK8k0ijlXIT9M5D1b5-SCqIw1aXlOBgDlkdhzJm3wLJNS6m9ZcybXoWeY5dD5dn_8AXlO4A=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Szymanów, Aeroklub Wrocławski' AND address = 'Szymanów, 51-188 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqKxCjH2YpQIVr2lT2SEZ60P0hUleHkqf_IPYpj5IWbpjErGwk4QHOtKsVWIr25JgPXcwWkC_PHraMO8rp-8pKYG6GK_k-PfuoCM3GD1v5ytA9er2vVKgTNFJTvla6e8qeXzU6n7p1djW4x=w224-h336-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Szymanów, Aeroklub Wrocławski' AND address = 'Szymanów, 51-188 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrCSO1NypGOk8oK7iJvFo3PSQYJBUcsCqkC0vgC50vXqbfBkf_n4WRGVhNF7VoIIbS962uhhbIMOKlWHmHLDSkeZaUfb3Jm1yLznS8_ubcb1T484cxw38SZQXCpnqSI0NVv0ijc=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Szymanów, Aeroklub Wrocławski' AND address = 'Szymanów, 51-188 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no3WXT9StjSM13ypSkoZNKi8ImaMUASOC8j9dKfrGOuLMn3UVEFXCM5EgmHQizWB5xI9_piuABq6KYIBcT25_UPhXxBJJAkwssThETkt4Bthvh8ol7ITq6eBPkoDCOs-Ye2FGc=w446-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Szymanów, Aeroklub Wrocławski' AND address = 'Szymanów, 51-188 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no1PeBGZ6YjJPNCuCE4eMkygzc9rsHSJrUn6NgQwu1bfjVdrveYuvU5Kj5JTz0VbWMxIomfDueptdRwSEJK1Os688OrSf6ypxiVQF_5uubnR4zfToWhdDuxQbRzisL5xcyHWr39=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Szymanów, Aeroklub Wrocławski' AND address = 'Szymanów, 51-188 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noRwj59rkPOG7WqWigr-TVNGmEoZnHPMFPyrXF8NpJ2LYik485NUNMDuMJXmBKXC61Sg6b8zi0_HcpWQVeifhVzjSt7f5eMYjhkdaCflGmmvCewOruje7fLgJ4yo3qyJ8vRJHuX=w224-h298-k-no-pi0-ya340-ro-0-fo100', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Szymanów, Aeroklub Wrocławski' AND address = 'Szymanów, 51-188 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Aeroklub Wrocławski
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqvd9COKX4BBLKU82bilHZYYHKSDtduC7VyRpEWaVzo2gRxta4k6tNlYEzzYMZtkCjAXKWGDxHZUWVCFexOkDZl893MzQsDSOv5n37lfZTr4lf8W1Yq9xgv8NYf6NTN7_qZsFal4Q=w224-h302-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Aeroklub Wrocławski' AND address = 'Henryka Sienkiewicza 108/110, 50-348 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=PGlZsotq9gBSQtZ_9Ri5eA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=20.266787&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Aeroklub Wrocławski' AND address = 'Henryka Sienkiewicza 108/110, 50-348 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Port Lotniczy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npM1kMqE6JY9qcfmWNsT6ATBVcY6dD2Eq2wCUTm-3Z7z4G2nCibRZUfG8giEVKuBeHB_1KSLMMbH1BV1KjTy14ATG04hQ-4PZGj0GY0FqLHjFdrb55ZWTFhqY-kMPt-gI4Iz0K0nw=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy' AND address = '54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Y0vbFDmijSocqnmHN3C1YA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=16.37318&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy' AND address = '54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npyau_qDrq5YIu80UgeUTi04kLcoJ45Vlgx98eRS0xfNcgXXGM79p6vOzQq_So6meLZ8SlXsdz5jeIC_HuvsI6-j4M2X8dDwMcaDqFz1mXzIAYrZIq5Y9XsyL2GHgrLaBGtZXX__g=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy' AND address = '54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Amatorskie Lotnisko Modelarskie Wroclaw modele do max 1,9kg elektryczne zakaz latania spalinami
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no1vBOgOeZxeEw8uBn5VJsKPwgRrNSqBgUQF48Bo6ezqNE7NrkGr3bPsQm7OYQGigAg8bxPVg2Wx7M6KqobxlIbaxjjCxbWlZr2-rj74lDmc3DGQT261tuGVTf7nCBy_Y9LipgX=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Amatorskie Lotnisko Modelarskie Wroclaw modele do max 1,9kg elektryczne zakaz latania spalinami' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=XesDQ4vwluvlS7wKeBYxIQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=358.4838&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Amatorskie Lotnisko Modelarskie Wroclaw modele do max 1,9kg elektryczne zakaz latania spalinami' AND address = '50-001 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Lotniczy Dworzec Towarowy Wrocław Sp. z o.o.
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOBnoPqqStZQfAe1D2yUjvB-rbYd-XFSMMBD9R4=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotniczy Dworzec Towarowy Wrocław Sp. z o.o.' AND address = 'Władysława Zarembowicza 40, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqpWwk3I_bSILNWr4I7plL3MfdDf_iu3IP9zoe9DlPOfpXdSgn3PlwBT33KzmUbHkE7eUz5DdREm051UWsdcdbK89FuckzxfU57Q_i5vUs5OnTtYKCXeJzmA_lEDQoIWXGncjnsuLRN5Xs=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotniczy Dworzec Towarowy Wrocław Sp. z o.o.' AND address = 'Władysława Zarembowicza 40, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqJNEEwU3Rv7xl40608AgLet3Qv4OPqBrprp_f1JdH5d3kvAvJCc2sg-P_S7eBFQoadBdd-j-vqbAWZhqIV01mVygySE3Cn39jAwxlywvy-qrnP9b3D5U3B8lOCFUr16U-c4LSXug=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotniczy Dworzec Towarowy Wrocław Sp. z o.o.' AND address = 'Władysława Zarembowicza 40, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO-Tt-FQ7EQUzVET2GxxkQok4MimeZOdg8sIj_b=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotniczy Dworzec Towarowy Wrocław Sp. z o.o.' AND address = 'Władysława Zarembowicza 40, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=q7no5bHbJId78t3Hlxk77Q&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=225.5465&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Lotniczy Dworzec Towarowy Wrocław Sp. z o.o.' AND address = 'Władysława Zarembowicza 40, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: SkyTaxi Sp. z o.o.
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNPs9b3_DYPd_L8i-f9Q6N927olUCVbuwpsmqGS=w455-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'SkyTaxi Sp. z o.o.' AND address = 'Strzegomska 48a, 53-611 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nql8i_bsYyFSeMKMwoZLTSt_RfMJEovbk6rXyrNYTVj6XL7RT7NNOg6bD9RFGPAdPy7aawHYigvPEr87UqR6x7LFt6TokDII6ObExEGfbCfOzs4MpmNsxN8-GeBJLTNiF_xwpFufg=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'SkyTaxi Sp. z o.o.' AND address = 'Strzegomska 48a, 53-611 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqlI8tHRstyfroAMgaqmxH3nRTp2Ptg090PkqcpdNMscQBd98WMbArj28WiSKWo8MUW9beg709hisB3blM_k-kV-T8ym3Y5wtbb_oWSXVn7jSSE9Pn_tQrcBWKyKnwUdhgEojU=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'SkyTaxi Sp. z o.o.' AND address = 'Strzegomska 48a, 53-611 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipO4eZ1ID53t9gxswZJDht4x5bOyWXntbPReclXd=w453-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'SkyTaxi Sp. z o.o.' AND address = 'Strzegomska 48a, 53-611 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=z1TjbePUoNODLZp0JEyZCw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=358.11594&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'SkyTaxi Sp. z o.o.' AND address = 'Strzegomska 48a, 53-611 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Parking długoterminowy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr-snH4k29-38SCGg7eQjG6gPiIK1BuEHJqZDmj2nnX38op5vD7KCb8XbZ5U886VEaJamwK3huDQtcl4dAttCRW56Qj7YR0ExG8GuPqYWvu-DpzMOyyjDGevawYFM0aQGn_r5n2=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking długoterminowy' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np_OZqUF7AjMcAnWJbTtng3HhIeO20Lp5JXXfgoSqjrAzChchQ918HxdmYT2FruB1bD0yFty7AyncG15y4f5KYATYhr1znt_x9NZ4JI1BYDamu2Gw8yBhoFaCii-3NK8Xxo_kS1C7Kum_E=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking długoterminowy' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noqbI0bPk-H0pJ2O1ECaPvUdWJP-ijoCRrJwr_SmjbX7P-WkDK9LN-M5TWu-gq7YtvQtm7htxyG3ybWPX2BvfCp7T3Ub4nhgz7Qc7R2bROiSniWwOAELHaQOPgEJfltHOzEuqxq=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking długoterminowy' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4no662vrZlfOpgk1s4pyX5N4oI5qvRQTLl5vKnyPQIfEahzY3sCs-lVPpO5EdEzpZz5-Q0tdQulPwj8FzYZ-Yqv5uNo-WcDpgtUdIFA3kpK6JHivqUVg0CLHvYN_V8R1Nlr4-zzI=w397-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking długoterminowy' AND address = 'Graniczna 190, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Lotnisko Mirosławice (EPMR)
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr9gyqyr5hY5RXyslMceO0Myh4RPTViCkk0A4BWJcMaDVZP1J-yhQ37Rl-gzfzUvlri58J6F1SVj3-iBDqJnK6TNPRMNIEI4QdUZ58T32zGCs6UyjbwNgN5xEY-N0SRX0z5C-a-=w396-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Mirosławice (EPMR)' AND address = 'Aeroklub Dolnośląski, Lotnicza 14, 55-080 Mirosławice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqXD2Pobb5EwACu3s0c5Tlf4LSwwipebiCHWq8eN3WfXCFSylY6P2nlLeAAPTOJ72ILT-Rv-Zd7KGsA0h1TSGw8SXGJv24Ey4fDD0cS-g44o8-E-ZS7t9Jfdr_kd54ObTzKV9fCJRe7a_Yw=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Mirosławice (EPMR)' AND address = 'Aeroklub Dolnośląski, Lotnicza 14, 55-080 Mirosławice' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npCbfp9wRMfKXny-_IB1grUOWkEeRlmO8nl8kmZiqMqEutHaaRWsPiVFRLIOMZWAueXRO49mqDB5wzyIDOumxW__9oMC6ZYOnHHvxbD9kNzwNJVSZ7rCBxZEvu9-UD-dxR9HAJydw=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lotnisko Mirosławice (EPMR)' AND address = 'Aeroklub Dolnośląski, Lotnicza 14, 55-080 Mirosławice' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Parking pod Żyrafą
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPdt-saUbu_oQZOm0_W-Nc6p_SDrNPca5A4JnJJ=w398-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking pod Żyrafą' AND address = 'Rdestowa 22, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noD-DX974SeZvwuMMyb18Qt023ovIpfLn4SQsytqrcN9LgPEt2b9U4gehhQf7bKbzAnvQhKr4_ZwEppTIKBdKtCoVR5vlSk-Ci_lO_qN_iMvw-o_soelOsYB6uPc56tZPn4pEZ8=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking pod Żyrafą' AND address = 'Rdestowa 22, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipPJHp8kgtm_ZS16oX1afVP3e7ICk9iC5tERJjx2=w488-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking pod Żyrafą' AND address = 'Rdestowa 22, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=ZTcDI-WzzOEumUcqvueh-g&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=211.27281&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Parking pod Żyrafą' AND address = 'Rdestowa 22, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Parking Lotnisko Wrocław - Parking Strachowice
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipM6y9nzOh7CcPVl3HecXAQ7MBWw-trq6FIfP0rI=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking Lotnisko Wrocław - Parking Strachowice' AND address = 'Graniczna 189, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np1LRoRb6I_fb6AS6fDd1RBnXEWQohCU8SrJhqLcYx1_q1hxpHlv5zpvaV9PKLP2_1xS-skgdE4c1T-MbrwD1f-EAty9EJ10pxEJzfEjHd5RamxKEu6KRcnDjL6bN7gJh9xPkZhfJWdYChM=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking Lotnisko Wrocław - Parking Strachowice' AND address = 'Graniczna 189, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqc6mvLhSmPhFdae1YQY3LVE3PNEfeNunzirGqE95gPPzFxLyhX8KjdU7Z0NN3Wf5eTI1u8vWqnGk5wcpDvsqR4uoyC05FKRvdlXvCJMVB_9Lv9RY4bV4-yD8ygrmQZCkGOVcruNg=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking Lotnisko Wrocław - Parking Strachowice' AND address = 'Graniczna 189, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipNqaAMKrcNAJu9yuyEbAlKXE2XRTAB06LklqR09=w447-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking Lotnisko Wrocław - Parking Strachowice' AND address = 'Graniczna 189, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Port Lotniczy
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqGkEJ5ozgHM3lTfxI4EHXtvNMNoX14tOhVkqshWYy0Uv3LEeUBmqfzyboM_pgFKsHvP-pkDhL7IDzQ1Gtk1kJXVfIJDmyzJmcYNd435cGrtfLky0mh9BFdtlQ31uClYWhZLJo=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy' AND address = 'Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=vYvrizKPH5xx5fACS6m2QQ&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=24.546425&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Port Lotniczy' AND address = 'Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Lądowisko Dla Helikopterow
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noONEbcwp8gLoDINCd8HTQfFlawuohEdPrtDFnv6J_lvFjzhfiY1N0PnfODWUX5gs5VjRL_7AXe987QbUgn1ec9cGPplBgHXpCW87DzT7R07jCnNU5oP9U8YukpQODCrTTOQ2bn=w224-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lądowisko Dla Helikopterow' AND address = 'Weigla, Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Wroclaw Airport ul. Graniczna 190
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npXFHqy6W-Ltci6qGzdZxU_YxhT3mvrfPQb_xjDCzREp1Y4KaNJ1jhkABpU2ipztx2O1R8BaLYVKW26zt7dSqs9yeNxovLPfmrHXOAVuyr8w-qsKoNOfRVFl6xjZCLEx4IWXhVs=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Wroclaw Airport ul. Graniczna 190' AND address = 'Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_AWhiU6My-GJyZby6CXcfA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=22.395117&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Wroclaw Airport ul. Graniczna 190' AND address = 'Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Transfery
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rqIYHfifZTuqPlVV2NS3RA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=204.16989&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Transfery' AND address = 'Nowowiejska 1/21, 50-314 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=rqIYHfifZTuqPlVV2NS3RA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=204.16989&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Transfery' AND address = 'Nowowiejska 1/21, 50-314 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Parking Rondo Lotnisko Wrocław
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOztBFMoMc-KyPUVu1_ZK2v4X7JFC9jYlGlUtzE=w531-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking Rondo Lotnisko Wrocław' AND address = 'Skarżyńskiego 2, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/p/AF1QipOHOywqn61yHdGLaeSp5cyVWHqXVhjYgCVhs5fV=w603-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking Rondo Lotnisko Wrocław' AND address = 'Skarżyńskiego 2, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqDyOE2ogl5jGZ9J3H0aIvNyBaphtqzYAKZQmgPUjYIVIcxpV7jLxB5HGbKacXtBmtGu4O10N0E-YlPICNs2z_IbORb1EWcUPkx8V2OdYwkDKsfQNZRSlVbo4yAViiGG-s2Erg0=w298-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Parking Rondo Lotnisko Wrocław' AND address = 'Skarżyńskiego 2, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=BX_y247RMY7Gc_IWAOX6nw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=184.37538&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Parking Rondo Lotnisko Wrocław' AND address = 'Skarżyńskiego 2, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Lądowisko Golędzinów
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nqiC4OSvnjRVPIkxje1Dpdqoax_l0JT69TqH46dUyePz77YVoWRoavlNs3GSVh8oDeEA5fU3MVGXAaIKhH2rIJ-oqhDjVKca48ENCePB2a9Ac_S2NV3HYv0t9kmIoBRDD5Q0uan=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lądowisko Golędzinów' AND address = 'DW342 28, 55-120' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr4ziSHAd3zz8MjfNP6xEGGfbdZy6AohAADpffMZFDXUoI_6Yl532tblXq656rzlJJ9QkYLqwQeQH_1uxwby6pixIeRCd9EAXJqFvCeLd480q6XM78u-jDHyr5OnJ5EFtzKPwMj=w529-h298-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lądowisko Golędzinów' AND address = 'DW342 28, 55-120' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npsDkjEGVCqBfqvrma1GLM-DihOFRr5XQpYyZ1jZaeTcFCnRyg70d1TG4e-MHdtHq7usuMPcRBwuSmwW8_zjIGlxoG3BJCs-Od89AMulaIZLP0JNj8jbdWeOE8b46CmpcaeJHRn=w224-h398-k-no', NOW(), NOW()
FROM wcs
WHERE name = 'Lądowisko Golędzinów' AND address = 'DW342 28, 55-120' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=dV2L6kWp895hUPQnpkeYdA&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=239.22034&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Lądowisko Golędzinów' AND address = 'DW342 28, 55-120' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: 8. Baza Lotnictwa Transportowego - Komenda Obsługi Lotniska
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xXw_6mNCOCRxPDXpvmv6yw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=147.80728&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = '8. Baza Lotnictwa Transportowego - Komenda Obsługi Lotniska' AND address = 'Graniczna 13, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xXw_6mNCOCRxPDXpvmv6yw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=147.80728&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = '8. Baza Lotnictwa Transportowego - Komenda Obsługi Lotniska' AND address = 'Graniczna 13, 54-530 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;

-- Photos for WC: Heliport Lądowisko dla helikopterów
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=N2Bs6TZQ1vgSL0vW0wpwgw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=65.53205&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Heliport Lądowisko dla helikopterów' AND address = 'Generała Romualda Traugutta 118, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;
INSERT INTO wc_photos (wc_id, user_id, photo, created_at, updated_at)
SELECT id, 'cac878bb-3f77-42a7-9221-919238bfae76', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=N2Bs6TZQ1vgSL0vW0wpwgw&cb_client=maps_sv.tactile.gps&w=224&h=298&yaw=65.53205&pitch=0&thumbfov=100', NOW(), NOW()
FROM wcs
WHERE name = 'Heliport Lądowisko dla helikopterów' AND address = 'Generała Romualda Traugutta 118, 50-438 Wrocław' AND created_by = 'public@sviete.pl'
LIMIT 1;


EXCEPTION WHEN OTHERS THEN
RAISE NOTICE 'Error Name:%', SQLERRM;
RAISE NOTICE 'Error State:%', SQLSTATE;
GET STACKED DIAGNOSTICS l_context = PG_EXCEPTION_CONTEXT;
RAISE NOTICE 'ERROR:%', l_context;
END;
$$;

-- Summary: 179 WC locations processed, 0 skipped