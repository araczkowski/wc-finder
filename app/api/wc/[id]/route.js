import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('Missing Supabase environment variables');
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

export async function GET(request, { params }) {
  try {
    const { id } = params;

    if (!id) {
      return NextResponse.json({ error: 'WC ID is required' }, { status: 400 });
    }

    // Fetch WC data with gallery photos
    const { data: wc, error: wcError } = await supabase
      .from('wcs')
      .select('*')
      .eq('id', id)
      .single();

    if (wcError) {
      console.error('Error fetching WC:', wcError);
      if (wcError.code === 'PGRST116') {
        return NextResponse.json({ error: 'WC not found' }, { status: 404 });
      }
      return NextResponse.json(
        { error: 'Failed to fetch WC data' },
        { status: 500 }
      );
    }

    if (!wc) {
      return NextResponse.json({ error: 'WC not found' }, { status: 404 });
    }

    // Parse gallery_photos if it's a string
    if (wc.gallery_photos && typeof wc.gallery_photos === 'string') {
      try {
        wc.gallery_photos = JSON.parse(wc.gallery_photos);
      } catch (parseError) {
        console.error('Error parsing gallery_photos:', parseError);
        wc.gallery_photos = [];
      }
    }

    // Ensure gallery_photos is an array
    if (!Array.isArray(wc.gallery_photos)) {
      wc.gallery_photos = [];
    }

    return NextResponse.json(wc);
  } catch (error) {
    console.error('Unexpected error in GET /api/wc/[id]:', error);
    return NextResponse.json(
      { error: 'Internal server error' },
      { status: 500 }
    );
  }
}
