export function Field({ label, children }: { label: string; children: React.ReactNode }) {
  return <div className="space-y-1"><label>{label}</label>{children}</div>;
}
