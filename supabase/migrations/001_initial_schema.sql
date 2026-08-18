create extension if not exists pgcrypto;

create table if not exists public.candidates (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  course text not null,
  college text not null,
  roll_number text not null,
  phone text not null,
  email text not null,
  location text not null,
  preferred_role text not null,
  experience_years numeric null,
  verification_status text not null default 'pending' check (verification_status in ('pending', 'verified', 'rejected')),
  created_at timestamptz not null default now()
);
create table if not exists public.hospitals (
  id uuid primary key default gen_random_uuid(),
  hospital_name text not null,
  contact_person text not null,
  phone text not null,
  email text not null,
  location text not null,
  created_at timestamptz not null default now()
);
create table if not exists public.jobs (
  id uuid primary key default gen_random_uuid(),
  hospital_id uuid not null references public.hospitals(id) on delete cascade,
  role_title text not null,
  required_qualification text not null,
  experience_required text null,
  location text not null,
  vacancies integer not null default 1 check (vacancies > 0),
  shift text null,
  description text null,
  status text not null default 'open' check (status in ('open', 'closed')),
  created_at timestamptz not null default now()
);
create table if not exists public.applications (
  id uuid primary key default gen_random_uuid(),
  job_id uuid not null references public.jobs(id) on delete cascade,
  candidate_id uuid not null references public.candidates(id) on delete cascade,
  status text not null default 'applied' check (status in ('applied', 'shortlisted', 'rejected')),
  created_at timestamptz not null default now(),
  constraint applications_job_candidate_unique unique (job_id, candidate_id)
);

alter table public.candidates enable row level security;
alter table public.hospitals enable row level security;
alter table public.jobs enable row level security;
alter table public.applications enable row level security;

create policy "Candidates can be registered publicly" on public.candidates for insert to anon, authenticated with check (true);
create policy "Candidates can be read for demo dashboards" on public.candidates for select to anon, authenticated using (true);
create policy "Candidate verification can be updated by demo admin" on public.candidates for update to anon, authenticated using (true) with check (verification_status in ('pending', 'verified', 'rejected'));
create policy "Hospitals can be registered publicly" on public.hospitals for insert to anon, authenticated with check (true);
create policy "Hospitals can be read for demo dashboards" on public.hospitals for select to anon, authenticated using (true);
create policy "Jobs can be posted by demo hospitals" on public.jobs for insert to anon, authenticated with check (true);
create policy "Jobs can be read publicly" on public.jobs for select to anon, authenticated using (true);
create policy "Applications can be created by demo candidates" on public.applications for insert to anon, authenticated with check (true);
create policy "Applications can be read for demo dashboards" on public.applications for select to anon, authenticated using (true);
create policy "Applications can be updated by demo hospitals" on public.applications for update to anon, authenticated using (true) with check (status in ('applied', 'shortlisted', 'rejected'));
