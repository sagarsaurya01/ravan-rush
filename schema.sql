-- Ravan Rush — Supabase schema for the live cross-device family leaderboard.
-- Run this in your Supabase project's SQL editor, then paste your project URL
-- and anon key into CONFIG at the top of index.html.

create table if not exists families (
  code       text primary key,
  name       text not null,
  created_at timestamptz not null default now()
);

create table if not exists players (
  id            text not null,                 -- anonymous device/player id
  family_code   text not null references families(code) on delete cascade,
  nickname      text not null,
  best_score    integer not null default 0,
  best_combo    integer not null default 0,
  best_accuracy integer not null default 0,
  best_time     numeric,                        -- fastest finish (seconds), null if never finished
  games         integer not null default 0,
  updated_at    timestamptz not null default now(),
  primary key (family_code, id)
);

create index if not exists players_family_idx on players (family_code);

-- This is a public family game: no logins. Allow the anon key to read/write.
-- (Scores are low-stakes; a family can always start a fresh code.)
alter table families enable row level security;
alter table players  enable row level security;

create policy "families read"  on families for select using (true);
create policy "families write" on families for insert with check (true);

create policy "players read"   on players for select using (true);
create policy "players insert" on players for insert with check (true);
create policy "players update" on players for update using (true) with check (true);
