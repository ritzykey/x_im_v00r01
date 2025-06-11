-- Create a favorites table that links users to stories
create table public.favorites (
    id uuid default uuid_generate_v4() primary key,
    user_id uuid references auth.users(id) on delete cascade,
    story_id uuid references public.stories(id) on delete cascade,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null,
    unique(user_id, story_id)
);

-- Set up Row Level Security (RLS)
alter table public.favorites enable row level security;

-- Create policies
create policy "Users can view their own favorites"
  on public.favorites for select
  using (auth.uid() = user_id);

create policy "Users can insert their own favorites"
  on public.favorites for insert
  with check (auth.uid() = user_id);

create policy "Users can delete their own favorites"
  on public.favorites for delete
  using (auth.uid() = user_id);

-- Create functions to handle favorite status
create or replace function is_favorite(story_id uuid)
returns boolean as $$
begin
  return exists(
    select 1 from public.favorites
    where favorites.story_id = $1
    and favorites.user_id = auth.uid()
  );
end;
$$ language plpgsql security definer;

create or replace function favorite_story(story_id uuid)
returns json as $$
declare
  story_exists boolean;
  is_fav boolean;
begin
  -- Check if story exists
  select exists(
    select 1 from public.stories where id = story_id
  ) into story_exists;
  
  if not story_exists then
    return json_build_object(
      'success', false,
      'message', 'Story not found'
    );
  end if;
  
  -- Check if already favorited
  select exists(
    select 1 from public.favorites
    where favorites.story_id = story_id
    and favorites.user_id = auth.uid()
  ) into is_fav;
  
  if is_fav then
    -- Remove from favorites
    delete from public.favorites
    where user_id = auth.uid()
    and story_id = story_id;
    
    return json_build_object(
      'success', true,
      'favorited', false
    );
  else
    -- Add to favorites
    insert into public.favorites (user_id, story_id)
    values (auth.uid(), story_id);
    
    return json_build_object(
      'success', true,
      'favorited', true
    );
  end if;
end;
$$ language plpgsql security definer;
