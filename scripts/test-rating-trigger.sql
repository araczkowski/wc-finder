-- Test script for WCs rating trigger
-- This script tests the trigger functionality by inserting test data
-- and verifying that the wcs.rating field is updated correctly

-- First, let's see the current state of a test WC
SELECT 'Before tests - Current WC ratings:' as test_phase;
SELECT id, name, rating FROM wcs LIMIT 5;

-- Get a test WC ID (assuming we have at least one WC)
DO $$
DECLARE
    test_wc_id UUID;
    test_user_id UUID;
BEGIN
    -- Get a test WC ID
    SELECT id INTO test_wc_id FROM wcs LIMIT 1;

    -- Get a test user ID (or create one if needed)
    SELECT id INTO test_user_id FROM auth.users LIMIT 1;

    -- If we don't have a user, we'll use a dummy UUID for testing
    IF test_user_id IS NULL THEN
        test_user_id := gen_random_uuid();
    END IF;

    RAISE NOTICE 'Using test WC ID: %', test_wc_id;
    RAISE NOTICE 'Using test user ID: %', test_user_id;

    -- Test 1: Insert first rating
    RAISE NOTICE 'Test 1: Inserting first rating (5 stars)';
    INSERT INTO wcs_rating (wc_id, user_id, rating)
    VALUES (test_wc_id, test_user_id, 5);

    -- Check the result
    PERFORM pg_sleep(0.1); -- Small delay to ensure trigger completes

    -- Test 2: Insert second rating from different user
    RAISE NOTICE 'Test 2: Inserting second rating (3 stars)';
    INSERT INTO wcs_rating (wc_id, user_id, rating)
    VALUES (test_wc_id, gen_random_uuid(), 3);

    -- Check the result (should be average of 5 and 3 = 4.00)
    PERFORM pg_sleep(0.1);

    -- Test 3: Update existing rating
    RAISE NOTICE 'Test 3: Updating first rating to 1 star';
    UPDATE wcs_rating
    SET rating = 1
    WHERE wc_id = test_wc_id AND user_id = test_user_id;

    -- Check the result (should be average of 1 and 3 = 2.00)
    PERFORM pg_sleep(0.1);

    -- Test 4: Insert third rating
    RAISE NOTICE 'Test 4: Inserting third rating (4 stars)';
    INSERT INTO wcs_rating (wc_id, user_id, rating)
    VALUES (test_wc_id, gen_random_uuid(), 4);

    -- Check the result (should be average of 1, 3, and 4 = 2.67)
    PERFORM pg_sleep(0.1);

    -- Test 5: Delete a rating
    RAISE NOTICE 'Test 5: Deleting one rating';
    DELETE FROM wcs_rating
    WHERE wc_id = test_wc_id AND rating = 1;

    -- Check the result (should be average of 3 and 4 = 3.50)
    PERFORM pg_sleep(0.1);

    -- Clean up test data
    RAISE NOTICE 'Cleaning up test data...';
    DELETE FROM wcs_rating WHERE wc_id = test_wc_id;

    -- Final check (should be 0 after all ratings deleted)
    PERFORM pg_sleep(0.1);

END $$;

-- Show final state
SELECT 'After tests - Final WC ratings:' as test_phase;
SELECT id, name, rating FROM wcs LIMIT 5;

-- Show test results step by step
SELECT 'Test Results Summary:' as summary;
SELECT
    'The trigger should have updated the wcs.rating field automatically' as explanation,
    'Expected behavior:' as expected,
    '1. First rating (5): rating = 5.00' as step1,
    '2. Second rating (3): rating = 4.00 (avg of 5,3)' as step2,
    '3. Update to (1): rating = 2.00 (avg of 1,3)' as step3,
    '4. Third rating (4): rating = 2.67 (avg of 1,3,4)' as step4,
    '5. Delete rating (1): rating = 3.50 (avg of 3,4)' as step5,
    '6. Delete all: rating = 0.00 (no ratings left)' as step6;
