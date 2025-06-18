-- Create wc_rating table for storing ratings and comments
CREATE TABLE wc_rating (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    wc_id UUID NOT NULL REFERENCES wcs(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 10),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create unique constraint to ensure one rating per user per WC
ALTER TABLE wc_rating ADD CONSTRAINT unique_user_wc_rating UNIQUE (wc_id, user_id);

-- Create indexes for better performance
CREATE INDEX idx_wc_rating_wc_id ON wc_rating(wc_id);
CREATE INDEX idx_wc_rating_user_id ON wc_rating(user_id);
CREATE INDEX idx_wc_rating_created_at ON wc_rating(created_at);

-- Enable Row Level Security
ALTER TABLE wc_rating ENABLE ROW LEVEL SECURITY;

-- RLS Policy: Users can view all ratings
CREATE POLICY "Users can view all wc ratings" ON wc_rating
    FOR SELECT USING (true);

-- RLS Policy: Users can insert their own ratings
CREATE POLICY "Users can insert their own wc ratings" ON wc_rating
    FOR INSERT WITH CHECK (auth.uid() = user_id);

-- RLS Policy: Users can update their own ratings
CREATE POLICY "Users can update their own wc ratings" ON wc_rating
    FOR UPDATE USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- RLS Policy: Users can delete their own ratings
CREATE POLICY "Users can delete their own wc ratings" ON wc_rating
    FOR DELETE USING (auth.uid() = user_id);

-- Create function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_wc_rating_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at timestamp
CREATE TRIGGER update_wc_rating_updated_at_trigger
    BEFORE UPDATE ON wc_rating
    FOR EACH ROW
    EXECUTE FUNCTION update_wc_rating_updated_at();

-- Add comments to table and columns for documentation
COMMENT ON TABLE wc_rating IS 'Table for storing user ratings and comments for WC locations';
COMMENT ON COLUMN wc_rating.id IS 'Unique identifier for the rating';
COMMENT ON COLUMN wc_rating.wc_id IS 'Foreign key reference to the WC being rated';
COMMENT ON COLUMN wc_rating.user_id IS 'Foreign key reference to the user who created the rating';
COMMENT ON COLUMN wc_rating.rating IS 'Numeric rating from 1 to 10';
COMMENT ON COLUMN wc_rating.comment IS 'Optional text comment about the WC';
COMMENT ON COLUMN wc_rating.created_at IS 'Timestamp when the rating was created';
COMMENT ON COLUMN wc_rating.updated_at IS 'Timestamp when the rating was last updated';
