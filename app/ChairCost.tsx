"use client";

import { useEffect, useMemo, useState } from "react";

type Item={id:number;partNumber:string;name:string;description:string;category:string;qtyNeeded:number;qtyOnHand:number;unitCost:number|null;unit:string;supplier:string;leadTime:string;bomLevel:number|null;notes:string;purchaseUrl:string};
const money=new Intl.NumberFormat("en-US",{style:"currency",currency:"USD"});

export default function ChairCost({items,onClose,onSaved}:{items:Item[];onClose:()=>void;onSaved:()=>Promise<void>}){
  const chairItems=useMemo(()=>items.filter(i=>i.category.toLowerCase()!=="battery"&&!i.name.toLowerCase().includes("battery")),[items]);
  const [drafts,setDrafts]=useState<Record<number,string>>({});
  const [saving,setSaving]=useState<number|null>(null);
  const [error,setError]=useState("");
  const [sortBy,setSortBy]=useState<"unit"|"line">("line");
  const [sortDirection,setSortDirection]=useState<"asc"|"desc">("desc");
  useEffect(()=>{setDrafts(Object.fromEntries(chairItems.map(i=>[i.id,i.unitCost===null?"":String(i.unitCost)])));},[chairItems]);
  const total=chairItems.reduce((sum,item)=>sum+(item.unitCost===null?0:item.qtyNeeded*item.unitCost),0);
  const missing=chairItems.filter(i=>i.unitCost===null).length;
  const sortedItems=useMemo(()=>[...chairItems].sort((a,b)=>{
    if(a.unitCost===null&&b.unitCost!==null)return 1;
    if(a.unitCost!==null&&b.unitCost===null)return -1;
    if(a.unitCost===null&&b.unitCost===null)return a.name.localeCompare(b.name);
    const aPrice=sortBy==="unit"?a.unitCost:a.unitCost*a.qtyNeeded;
    const bPrice=sortBy==="unit"?b.unitCost:b.unitCost*b.qtyNeeded;
    return sortDirection==="asc"?aPrice-bPrice:bPrice-aPrice;
  }),[chairItems,sortBy,sortDirection]);
  async function save(item:Item){
    const raw=drafts[item.id]??"";const unitCost=raw===""?null:Number(raw);
    if(unitCost!==null&&(!Number.isFinite(unitCost)||unitCost<0)){setError("Enter a valid non-negative price.");return;}
    setSaving(item.id);setError("");
    const r=await fetch(`/api/items/${item.id}`,{method:"PUT",headers:{"content-type":"application/json"},body:JSON.stringify({...item,unitCost})});
    const data=await r.json();if(!r.ok)setError(data.error||"The price could not be saved.");else await onSaved();setSaving(null);
  }
  return <div className="overlay" onMouseDown={e=>e.target===e.currentTarget&&onClose()}>
    <section className="modal cost-modal">
      <button type="button" className="close" onClick={onClose}>×</button><p className="eyebrow">CHAIR COST BREAKDOWN</p>
      <div className="cost-head"><div><h2>{money.format(total)}</h2><p className="muted">Known material cost for one chair</p></div><div><strong>{missing}</strong><small>prices still blank</small></div></div>
      {missing>0&&<p className="cost-warning">The total is incomplete until all blank unit prices are filled in.</p>}{error&&<p className="file-error">{error}</p>}
      <div className="cost-sort"><span>Sort parts by</span><button className={sortBy==="unit"?"active":""} onClick={()=>setSortBy("unit")}>Individual unit price</button><button className={sortBy==="line"?"active":""} onClick={()=>setSortBy("line")}>Cost needed per chair</button><button className="direction" onClick={()=>setSortDirection(sortDirection==="desc"?"asc":"desc")}>{sortDirection==="desc"?"Highest first ↓":"Lowest first ↑"}</button></div>
      <div className="cost-table"><table><thead><tr><th>Part</th><th>Per chair</th><th>Unit price</th><th>Cost per chair</th><th></th></tr></thead><tbody>{sortedItems.map(item=><tr key={item.id}><td><strong>{item.name}</strong><small>{item.partNumber||"No part number"}</small></td><td>{item.qtyNeeded} {item.unit}</td><td><div className="price-input"><span>$</span><input aria-label={`${item.name} unit price`} min="0" step="0.01" type="number" placeholder="Blank" value={drafts[item.id]??""} onChange={e=>setDrafts({...drafts,[item.id]:e.target.value})}/></div></td><td>{item.unitCost===null?"—":money.format(item.qtyNeeded*item.unitCost)}</td><td><button className="ghost" disabled={saving===item.id} onClick={()=>save(item)}>{saving===item.id?"Saving…":"Save"}</button></td></tr>)}</tbody></table></div>
      <p className="battery-note">Battery cost is excluded because New Chair does not consume batteries.</p>
    </section>
  </div>;
}
