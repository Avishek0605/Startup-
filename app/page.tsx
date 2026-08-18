import Link from 'next/link';

export default function Home() {
  return <div className="flex min-h-[80vh] flex-col justify-center gap-10">
    <section className="max-w-2xl">
      <p className="mb-3 text-sm font-semibold uppercase tracking-wide text-accent">CareConnect</p>
      <h1 className="text-4xl font-semibold tracking-tight sm:text-5xl">A calm, minimal hiring demo for healthcare teams and candidates.</h1>
      <p className="mt-5 text-lg text-slate-600">Register as a candidate, post hospital roles, apply to open jobs, and manage verification through Supabase-backed persistence.</p>
    </section>
    <section className="grid gap-4 sm:grid-cols-2">
      <Link href="/candidate" className="card block hover:border-accent"><h2 className="text-2xl font-semibold">I'm a Candidate</h2><p className="mt-2 text-slate-600">Create a profile, browse open jobs, and track applications.</p></Link>
      <Link href="/hospital" className="card block hover:border-accent"><h2 className="text-2xl font-semibold">I'm a Hospital</h2><p className="mt-2 text-slate-600">Register your hospital, post roles, and review applicants.</p></Link>
    </section>
    <Link href="/admin" className="text-sm text-accent underline">Admin verification</Link>
  </div>;
}
