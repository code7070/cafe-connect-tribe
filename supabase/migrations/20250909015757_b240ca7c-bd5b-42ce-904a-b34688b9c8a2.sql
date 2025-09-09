-- Fix remaining RLS policy issues for other tables

-- Add RLS policies for events table
CREATE POLICY "Users can view all events" 
ON public.events 
FOR SELECT 
USING (true);

CREATE POLICY "Users can create events" 
ON public.events 
FOR INSERT 
WITH CHECK (auth.uid() = creator_id);

CREATE POLICY "Creators can update their events" 
ON public.events 
FOR UPDATE 
USING (auth.uid() = creator_id);

CREATE POLICY "Creators can delete their events" 
ON public.events 
FOR DELETE 
USING (auth.uid() = creator_id);

-- Add RLS policies for event_participants table
CREATE POLICY "Users can view participants of events they joined or created" 
ON public.event_participants 
FOR SELECT 
USING (
  auth.uid() = user_id OR 
  EXISTS (
    SELECT 1 FROM public.events 
    WHERE events.id = event_participants.event_id 
    AND events.creator_id = auth.uid()
  )
);

CREATE POLICY "Users can join events" 
ON public.event_participants 
FOR INSERT 
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their participation" 
ON public.event_participants 
FOR UPDATE 
USING (auth.uid() = user_id);

CREATE POLICY "Users can leave events" 
ON public.event_participants 
FOR DELETE 
USING (auth.uid() = user_id);

-- Add RLS policies for messages table
CREATE POLICY "Event participants can view messages" 
ON public.messages 
FOR SELECT 
USING (
  EXISTS (
    SELECT 1 FROM public.event_participants 
    WHERE event_participants.event_id = messages.event_id 
    AND event_participants.user_id = auth.uid()
  ) OR
  EXISTS (
    SELECT 1 FROM public.events 
    WHERE events.id = messages.event_id 
    AND events.creator_id = auth.uid()
  )
);

CREATE POLICY "Event participants can send messages" 
ON public.messages 
FOR INSERT 
WITH CHECK (
  auth.uid() = user_id AND
  (EXISTS (
    SELECT 1 FROM public.event_participants 
    WHERE event_participants.event_id = messages.event_id 
    AND event_participants.user_id = auth.uid()
  ) OR
  EXISTS (
    SELECT 1 FROM public.events 
    WHERE events.id = messages.event_id 
    AND events.creator_id = auth.uid()
  ))
);

CREATE POLICY "Users can update their own messages" 
ON public.messages 
FOR UPDATE 
USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own messages" 
ON public.messages 
FOR DELETE 
USING (auth.uid() = user_id);

-- Add RLS policies for users table
CREATE POLICY "Users can view all user profiles" 
ON public.users 
FOR SELECT 
USING (true);

CREATE POLICY "Users can update their own profile" 
ON public.users 
FOR UPDATE 
USING (auth.uid() = id);

CREATE POLICY "Users can insert their own profile" 
ON public.users 
FOR INSERT 
WITH CHECK (auth.uid() = id);