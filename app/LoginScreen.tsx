"use client";
import { useEffect, useState } from "react";

type User={id:number;name:string};
export default function LoginScreen({onLogin}:{onLogin:(user:User)=>void}){
  const [users,setUsers]=useState<User[]>([]);const [userId,setUserId]=useState("");const [password,setPassword]=useState("");const [error,setError]=useState("");const [busy,setBusy]=useState(false);
  useEffect(()=>{fetch("/api/auth/users").then(r=>r.json()).then(setUsers).catch(()=>setError("Could not load employee names."));},[]);
  async function submit(e:React.FormEvent){e.preventDefault();setBusy(true);setError("");const r=await fetch("/api/auth/login",{method:"POST",headers:{"content-type":"application/json"},body:JSON.stringify({userId:Number(userId),password})});const data=await r.json();if(r.ok)onLogin(data.user);else setError(data.error||"Sign in failed.");setBusy(false);}
  return <main className="login-page"><form className="login-card" onSubmit={submit}><img src="/magicmode-logo.png" alt="MagicMode"/><p className="eyebrow">INVENTORY CONTROL</p><h1>Welcome back.</h1><p>Select your name and enter the shared company password.</p>{error&&<div className="login-error">{error}</div>}<label>Your name<select required value={userId} onChange={e=>setUserId(e.target.value)}><option value="" disabled>Select employee…</option>{users.map(user=><option key={user.id} value={user.id}>{user.name}</option>)}</select></label><label>Shared password<input required type="password" autoComplete="current-password" value={password} onChange={e=>setPassword(e.target.value)}/></label><button className="primary" disabled={busy}>{busy?"Signing in…":"Sign in"}</button><small>This computer will remember the selected employee for 30 days.</small></form></main>;
}
