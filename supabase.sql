-- Execute no SQL Editor do seu projeto Supabase.
create table if not exists public.study_data (
 user_id uuid primary key references auth.users(id) on delete cascade,
 data jsonb not null default '{}'::jsonb,
 updated_at timestamptz not null default now()
);
alter table public.study_data enable row level security;
create policy "read own study data" on public.study_data for select to authenticated using ((select auth.uid()) = user_id);
create policy "insert own study data" on public.study_data for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update own study data" on public.study_data for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
insert into storage.buckets (id,name,public,file_size_limit) values ('materiais','materiais',false,20971520) on conflict (id) do update set public=false,file_size_limit=20971520;
create policy "upload own files" on storage.objects for insert to authenticated with check (bucket_id='materiais' and (storage.foldername(name))[1]=(select auth.uid())::text);
create policy "read own files" on storage.objects for select to authenticated using (bucket_id='materiais' and (storage.foldername(name))[1]=(select auth.uid())::text);
create policy "delete own files" on storage.objects for delete to authenticated using (bucket_id='materiais' and (storage.foldername(name))[1]=(select auth.uid())::text);
