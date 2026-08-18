# CareConnect

CareConnect is a minimal two-sided healthcare recruitment demo built with Next.js App Router, React, TypeScript, Tailwind CSS, and Supabase.

## Features

- Candidate signup with persisted profile data and pending verification status.
- Candidate dashboard lookup by email or phone.
- Open job browsing with role and location filters.
- Duplicate-safe job applications using a database uniqueness constraint.
- Hospital signup and dashboard lookup by email or phone.
- Hospital job posting and applicant review.
- Applicant status updates for shortlisted or rejected candidates.
- Simple admin verification page for pending candidates.

## Supabase setup

1. Create a new Supabase project.
2. Open the SQL editor in Supabase.
3. Run the migration in `supabase/migrations/001_initial_schema.sql`.
4. Copy the project URL and anon public key from Project Settings → API.

The migration enables Row Level Security on all tables and adds explicit permissive demo policies for public select/insert/update flows. These policies are intentionally easy to tighten when full authentication is added.

## Environment variables

Copy `.env.example` to `.env.local`:

```bash
cp .env.example .env.local
```

Fill in:

```bash
NEXT_PUBLIC_SUPABASE_URL=your-supabase-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
NEXT_PUBLIC_ADMIN_DEMO_PASSWORD=change-me
```

`NEXT_PUBLIC_ADMIN_DEMO_PASSWORD` is a lightweight client-side gate for the demo admin page, not production security.

## Run locally

```bash
npm install
npm run dev
```

Open http://localhost:3000.

## Build

```bash
npm run build
```

## Deploy to Vercel

1. Push this repository to GitHub.
2. Import it in Vercel as a Next.js project.
3. Add the same environment variables in Vercel Project Settings.
4. Deploy.

No server-specific configuration is required.
