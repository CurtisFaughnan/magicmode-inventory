"use client";

import { useEffect, useMemo, useState } from "react";

type Item={id:number;partNumber:string;name:string;category:string;qtyNeeded:number;qtyOnHand:number;unit:string;isOptional:boolean};
type Draft={quantity:string;included:boolean};

export default function ChairRequirements({items,onSaved}:{items:Item[];onSaved:()=>Promise<void>}){
  const [drafts,setDrafts]=useState<Record<number,Draft>>({});
  const [search,setSearch]=useState("");
  const [saving,setSaving]=useState(false);
  const [message,setMessage]=useState("");
  const reset=()=>setDrafts(Object.fromEntries(items.map(i=>[i.id,{quantity:String(i.qtyNeeded),included:!i.isOptional&&i.qtyNeeded>0}])));
  useEffect(reset,[items]);
  const shown=useMemo(()=>{const q=search.trim().toLowerCase();return items.filter(i=>!q||[i.name,i.partNumber,i.category].some(v=>(v||"").toLowerCase().includes(q))).sort((a,b)=>Number(Boolean(drafts[b.id]?.included))-Number(Boolean(drafts[a.id]?.included))||a.name.localeCompare(b.name));},[items,drafts,search]);
  const changed=items.filter(i=>{const d=drafts[i.id];return d&&(Number(d.quantity)!==i.qtyNeeded||d.included===i.isOptional);});
  const included=items.filter(i=>drafts[i.id]?.included&&Number(drafts[i.id]?.quantity)>0).length;
  function update(id:number,next:Partial<Draft>){setDrafts(current=>({...current,[id]:{...current[id],...next}}));setMessage("");}
  async function save(){const updates=items.map(i=>({id:i.id,quantity:Number(drafts[i.id]?.quantity),included:Boolean(drafts[i.id]?.included)}));if(updates.some(x=>!Number.isFinite(x.quantity)||x.quantity<0)){setMessage("Enter zero or a positive quantity for every part.");return;}setSaving(true);setMessage("");const response=await fetch("/api/bom-requirements",{method:"PUT",headers:{"content-type":"application/json"},body:JSON.stringify({updates})});const data=await response.json();if(response.ok){setMessage("Chair requirements saved. Inventory calculations now use this BOM.");await onSaved();}else setMessage(data.error||"Chair requirements could not be saved.");setSaving(false);}
  return <section className="requirements-workspace">
    <div className="requirements-head"><div><p className="eyebrow">CURRENT CHAIR BOM</p><h2>Chair Requirements</h2><p>Change what one chair needs today. This controls build readiness, chair cost, purchasing, Chair Tracker, and New Chair deductions.</p></div><button className="primary" disabled={saving||!changed.length} onClick={save}>{saving?"Saving…":`Save changes${changed.length?` (${changed.length})`:""}`}</button></div>
    <div className="requirements-summary"><article><span>Included parts</span><strong>{included}</strong><small>used in the current chair</small></article><article><span>Excluded parts</span><strong>{items.length-included}</strong><small>kept in inventory but not consumed</small></article><article><span>Unsaved changes</span><strong>{changed.length}</strong><small>review before building</small></article></div>
    <div className="requirements-note"><strong>Important:</strong> Batteries remain excluded from the New Chair deduction even if listed as required. Set a quantity to zero or switch off “Required” to remove another part from today’s chair.</div>
    {message&&<p className={message.includes("saved")?"requirements-success":"file-error"}>{message}</p>}
    <div className="requirements-toolbar"><input aria-label="Search chair requirements" placeholder="Search parts, numbers, or types…" value={search} onChange={e=>setSearch(e.target.value)}/><button className="ghost" onClick={reset}>Discard changes</button></div>
    <div className="table-wrap"><table className="requirements-table"><thead><tr><th>Required</th><th>Part</th><th>Type</th><th>Quantity for one chair</th><th>On hand</th><th>Coverage</th></tr></thead><tbody>{shown.map(item=>{const draft=drafts[item.id]||{quantity:String(item.qtyNeeded),included:!item.isOptional},qty=Math.max(0,Number(draft.quantity)||0),coverage=draft.included&&qty>0?Math.floor(item.qtyOnHand/qty):null;return <tr key={item.id} className={draft.included&&qty>0?"":"requirement-off"}><td><label className="requirement-toggle"><input type="checkbox" checked={draft.included} onChange={e=>update(item.id,{included:e.target.checked})}/><span>{draft.included?"Yes":"No"}</span></label></td><td><strong>{item.name}</strong><small>{item.partNumber||"No part number"}</small></td><td>{item.category}</td><td><div className="requirement-quantity"><input aria-label={`${item.name} quantity per chair`} min="0" step="any" type="number" value={draft.quantity} onChange={e=>update(item.id,{quantity:e.target.value,included:Number(e.target.value)>0?draft.included:false})}/><span>{item.unit}</span></div></td><td><strong>{item.qtyOnHand}</strong> {item.unit}</td><td>{coverage===null?"Not included":`${coverage} chair${coverage===1?"":"s"}`}</td></tr>})}</tbody></table></div>
  </section>;
}
