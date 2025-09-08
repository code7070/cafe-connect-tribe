-- Insert 3 dummy users
INSERT INTO public.users (id, email, full_name, phone, profession, bio, profile_picture_url, location, preferences) VALUES 
(
  gen_random_uuid(),
  'john.doe@example.com',
  'John Doe',
  '+62812345678',
  'Software Developer',
  'Passionate about technology and remote work. Love working from cafes with good WiFi.',
  'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
  '{"city": "Jakarta", "lat": -6.2088, "lng": 106.8456}',
  '{"work_style": "quiet", "amenities": ["wifi", "power_outlet"], "budget": "medium"}'
),
(
  gen_random_uuid(),
  'sarah.wilson@example.com',
  'Sarah Wilson',
  '+62887654321',
  'UI/UX Designer',
  'Creative designer who enjoys collaborative workspaces. Always looking for inspiring places to work.',
  'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
  '{"city": "Bandung", "lat": -6.9175, "lng": 107.6191}',
  '{"work_style": "collaborative", "amenities": ["wifi", "natural_light"], "budget": "high"}'
),
(
  gen_random_uuid(),
  'mike.chen@example.com',
  'Mike Chen',
  '+62856789012',
  'Digital Marketer',
  'Marketing professional who loves networking while working. Prefers places with good coffee and atmosphere.',
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
  '{"city": "Surabaya", "lat": -7.2575, "lng": 112.7521}',
  '{"work_style": "social", "amenities": ["wifi", "food"], "budget": "medium"}'
);

-- Create places table for locations
CREATE TABLE public.places (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT,
  address TEXT NOT NULL,
  city VARCHAR NOT NULL,
  location JSONB NOT NULL,
  image_url VARCHAR,
  signature_menus TEXT[] DEFAULT '{}',
  amenities TEXT[] DEFAULT '{}',
  price_range VARCHAR DEFAULT 'medium',
  rating DECIMAL(2,1) DEFAULT 4.0,
  visitor_photos TEXT[] DEFAULT '{}',
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now()
);

-- Enable RLS on places table
ALTER TABLE public.places ENABLE ROW LEVEL SECURITY;

-- Create policy for places - allow everyone to read
CREATE POLICY "Everyone can view places" 
ON public.places 
FOR SELECT 
USING (true);

-- Insert 20 dummy places
INSERT INTO public.places (name, description, address, city, location, image_url, signature_menus, amenities, price_range, rating, visitor_photos) VALUES 
('Kopi Kenangan', 'Cozy coffee shop with great ambiance for remote work', 'Jl. Sudirman No. 123, Jakarta', 'Jakarta', '{"lat": -6.2088, "lng": 106.8456}', 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=400', '{"Kopi Susu Gula Aren", "Americano", "Croissant"}', '{"wifi", "power_outlet", "ac", "quiet_zone"}', 'medium', 4.5, '{"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50"}'),

('The Coffee Bean', 'Premium coffee experience with comfortable seating', 'Jl. Thamrin No. 45, Jakarta', 'Jakarta', '{"lat": -6.1944, "lng": 106.8229}', 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=400', '{"Cappuccino", "Latte Art", "Tiramisu"}', '{"wifi", "power_outlet", "meeting_room", "printer"}', 'high', 4.7, '{"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50"}'),

('Starbucks Reserve', 'Upscale Starbucks with premium coffee selections', 'Jl. Kemang Raya No. 78, Jakarta', 'Jakarta', '{"lat": -6.2615, "lng": 106.8106}', 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=400', '{"Reserve Blend", "Cold Brew", "Nitro Coffee"}', '{"wifi", "power_outlet", "ac", "mushola"}', 'high', 4.6, '{"https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50"}'),

('Warung Kopi Klotok', 'Traditional Indonesian coffee house', 'Jl. Malioboro No. 156, Yogyakarta', 'Yogyakarta', '{"lat": -7.7956, "lng": 110.3695}', 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400', '{"Kopi Tubruk", "Gudeg", "Teh Jahe"}', '{"wifi", "traditional_seating", "outdoor_area"}', 'low', 4.2, '{"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50"}'),

('Anomali Coffee', 'Specialty coffee with local Indonesian beans', 'Jl. Let. Jend. S. Parman No. 28, Jakarta', 'Jakarta', '{"lat": -6.1754, "lng": 106.7922}', 'https://images.unsplash.com/photo-1493857671505-72967e2e2760?w=400', '{"Single Origin", "V60 Pour Over", "Affogato"}', '{"wifi", "power_outlet", "ac", "quiet_zone", "mushola"}', 'medium', 4.4, '{"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50", "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50"}'),

('Filosofi Kopi', 'Artisan coffee with philosophical approach', 'Jl. Dago No. 89, Bandung', 'Bandung', '{"lat": -6.9175, "lng": 107.6191}', 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=400', '{"Kopi Filosofi", "Manual Brew", "Klepon Latte"}', '{"wifi", "power_outlet", "book_corner", "natural_light"}', 'medium', 4.8, '{"https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50"}'),

('Tuku Coffee', 'Minimalist coffee shop with quality focus', 'Jl. Braga No. 112, Bandung', 'Bandung', '{"lat": -6.9147, "lng": 107.6098}', 'https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=400', '{"Iced Coffee", "Matcha Latte", "Croffle"}', '{"wifi", "power_outlet", "ac", "instagrammable"}', 'medium', 4.5, '{"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50"}'),

('Excelso', 'Popular chain with consistent quality', 'Jl. Raya Darmo No. 65, Surabaya', 'Surabaya', '{"lat": -7.2575, "lng": 112.7521}', 'https://images.unsplash.com/photo-1521017432531-fbd92d768814?w=400', '{"Avocado Coffee", "Chocolate Frappe", "Club Sandwich"}', '{"wifi", "power_outlet", "ac", "meeting_room"}', 'medium', 4.3, '{"https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50"}'),

('Janji Jiwa', 'Local coffee chain with affordable prices', 'Jl. Ahmad Yani No. 234, Surabaya', 'Surabaya', '{"lat": -7.2456, "lng": 112.7378}', 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400', '{"Kopi Susu Tetangga", "Es Kopi Susu", "Roti Bakar"}', '{"wifi", "drive_thru", "outdoor_seating"}', 'low', 4.1, '{"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50"}'),

('Kedai Kopi Kulo', 'Traditional meets modern coffee experience', 'Jl. Gajah Mada No. 67, Yogyakarta', 'Yogyakarta', '{"lat": -7.7997, "lng": 110.3587}', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400', '{"Kopi Kulo", "Es Kopi Susu Kulo", "Pisang Bakar"}', '{"wifi", "traditional_music", "mushola", "parking"}', 'low', 4.0, '{"https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50"}'),

('Blue Bottle Coffee', 'Premium specialty coffee from California', 'Jl. Senopati No. 12, Jakarta', 'Jakarta', '{"lat": -6.2297, "lng": 106.8175}', 'https://images.unsplash.com/photo-1478145787956-f6f12c59624d?w=400', '{"New Orleans Iced Coffee", "Gibraltar", "Single Origin Pour Over"}', '{"wifi", "power_outlet", "premium_seating", "natural_light"}', 'high', 4.9, '{"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50", "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=50"}'),

('Common Grounds', 'Community-focused coffee space', 'Jl. Cihampelas No. 88, Bandung', 'Bandung', '{"lat": -6.8957, "lng": 107.6089}', 'https://images.unsplash.com/photo-1453614512568-c4024d13c247?w=400', '{"House Blend", "Oat Milk Latte", "Acai Bowl"}', '{"wifi", "power_outlet", "community_board", "events_space"}', 'medium', 4.4, '{"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50"}'),

('Kopi Tiam', 'Singapore-style coffee house', 'Jl. HR Rasuna Said No. 45, Jakarta', 'Jakarta', '{"lat": -6.2215, "lng": 106.8452}', 'https://images.unsplash.com/photo-1511920170033-f8396924c348?w=400', '{"Kopi C", "Teh Tarik", "Kaya Toast"}', '{"wifi", "halal_food", "mushola", "family_friendly"}', 'medium', 4.2, '{"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50"}'),

('Escape Coffee', 'Urban escape with industrial design', 'Jl. Veteran No. 123, Malang', 'Malang', '{"lat": -7.9666, "lng": 112.6326}', 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=400', '{"Escape Blend", "Cold Drip", "Truffle Pasta"}', '{"wifi", "power_outlet", "ac", "rooftop_seating"}', 'medium', 4.3, '{"https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50"}'),

('Fore Coffee', 'Tech-forward coffee chain', 'Jl. Diponegoro No. 78, Semarang', 'Semarang', '{"lat": -6.9667, "lng": 110.4167}', 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=400', '{"Aren Latte", "Americano", "Matcha Latte"}', '{"wifi", "app_ordering", "power_outlet", "fast_service"}', 'medium', 4.2, '{"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50"}'),

('Tanamera Coffee', 'Heritage coffee with local touch', 'Jl. Asia Afrika No. 90, Bandung', 'Bandung', '{"lat": -6.9214, "lng": 107.6076}', 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=400', '{"Tanamera Blend", "Iced Coconut Coffee", "Lemper"}', '{"wifi", "heritage_ambiance", "mushola", "art_gallery"}', 'medium', 4.5, '{"https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50"}'),

('Coffee Smith', 'Artisan coffee with local roastery', 'Jl. Raya Seminyak No. 34, Bali', 'Bali', '{"lat": -8.6905, "lng": 115.1729}', 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400', '{"Bali Kintamani", "Coconut Latte", "Nasi Campur"}', '{"wifi", "power_outlet", "ocean_view", "surfboard_storage"}', 'high', 4.7, '{"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50", "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50"}'),

('Warung Kopi Blandongan', 'Local favorite with authentic taste', 'Jl. Pahlawan No. 56, Semarang', 'Semarang', '{"lat": -6.9833, "lng": 110.4089}', 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=400', '{"Kopi Joss", "Wedang Ronde", "Gudeg"}', '{"wifi", "traditional_seating", "live_music", "outdoor_area"}', 'low', 4.1, '{"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50"}'),

('Blacklisted Coffee', 'Edgy coffee shop with unique atmosphere', 'Jl. Monkey Forest Road No. 12, Bali', 'Bali', '{"lat": -8.5095, "lng": 115.2625}', 'https://images.unsplash.com/photo-1493857671505-72967e2e2760?w=400', '{"Black Coffee", "Dirty Chai", "Avocado Toast"}', '{"wifi", "power_outlet", "vintage_decor", "vinyl_music"}', 'medium', 4.6, '{"https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50", "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50", "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=50"}'),

('Revolver Espresso', 'Motorcycle-themed coffee shop', 'Jl. Raya Kuta No. 88, Bali', 'Bali', '{"lat": -8.7167, "lng": 115.1681}', 'https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=400', '{"Espresso Shot", "Flat White", "Breakfast Burrito"}', '{"wifi", "power_outlet", "bike_parking", "mechanic_corner"}', 'medium', 4.4, '{"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50"}');

-- Create trigger for updating timestamps
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SET search_path = public;

CREATE TRIGGER update_places_updated_at
    BEFORE UPDATE ON public.places
    FOR EACH ROW
    EXECUTE FUNCTION public.update_updated_at_column();