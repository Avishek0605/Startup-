export function Message({ text, kind = 'success' }: { text: string; kind?: 'success' | 'error' | 'info' }) {
  const cls = kind === 'error' ? 'border-red-200 bg-red-50 text-red-800' : kind === 'info' ? 'border-slate-200 bg-slate-50 text-slate-700' : 'border-teal-200 bg-teal-50 text-teal-800';
  return <p className={`rounded-md border px-3 py-2 text-sm ${cls}`}>{text}</p>;
}
