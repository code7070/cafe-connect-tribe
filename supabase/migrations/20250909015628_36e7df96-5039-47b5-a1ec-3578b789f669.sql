-- Fix security issue: Add RLS policies for user_history table
-- Enable Row Level Security on user_history table
ALTER TABLE public.user_history ENABLE ROW LEVEL SECURITY;

-- Allow users to view only their own history
CREATE POLICY "Users can view their own history" 
ON public.user_history 
FOR SELECT 
USING (auth.uid() = user_id);

-- Allow users to insert their own history records
CREATE POLICY "Users can insert their own history" 
ON public.user_history 
FOR INSERT 
WITH CHECK (auth.uid() = user_id);

-- Allow users to update their own history records
CREATE POLICY "Users can update their own history" 
ON public.user_history 
FOR UPDATE 
USING (auth.uid() = user_id);

-- Allow users to delete their own history records
CREATE POLICY "Users can delete their own history" 
ON public.user_history 
FOR DELETE 
USING (auth.uid() = user_id);