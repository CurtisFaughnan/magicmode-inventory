"use client";
import { useEffect, useMemo, useState } from "react";

type Entry={id:number;oldPrice:number|null;newPrice:number|null;reason:string;changedBy:string;createdAt:string};
const money=new Intl.NumberFormat("en-US",{style:"currency",currency:"USD"});
export default function PriceHistory({item,onClose}:{item:{id:number;name:string};onClose:()=>void}){
  const [entries,setEntries]=useState<Entry[]>([]);const [loading,setLoading]=useState(true);
  useEffect(()=>{fetch(`/api/items/${item.id}/price-history`).then(r=>r.json()).then(setEntries).finally(()=>setLoading(false));},[item.id]);
  const points=useMemo(()=>entries.filter(e=>e.newPrice!==null),[entries]);
  const coords=useMemo(()=>{if(!points.length)return "";const values=points.map(p=>Number(p.newPrice));const min=Math.min(...values),max=Math.max(...values),range=max-min||1;return points.map((p,index)=>`${30+(index/Math.max(1,points.length-1))*640},${205-((Number(p.newPrice)-min)/range)*165}`).join(" ");},[points]);
  return <div className="history-panel"><div className="history-head"><div><p className="eyebrow">PRICE OVER TIME</p><h3>{item.name}</h3></div><button className="ghost" onClick={onClose}>Back to costs</button></div>{loading?<div className="empty">Loading price history…</div>:<><div className="price-chart">{points.length?<svg viewBox="0 0 700 235" role="img" aria-label={`Price history graph for ${item.name}`}><line x1="30" y1="205" x2="670" y2="205"/><polyline points={coords}/>{points.map((point,index)=>{const [x,y]=coords.split(" ")[index].split(",");return <circle key={point.id} cx={x} cy={y} r="5"><title>{money.format(Number(point.newPrice))} on {new Date(point.createdAt).toLocaleDateString()}</title></circle>})}</svg>:<div className="empty">No recorded prices yet.</div>}</div><div className="history-list">{[...entries].reverse().map(entry=><article key={entry.id}><div><strong>{entry.newPrice===null?"Price cleared":money.format(entry.newPrice)}</strong><span>{entry.oldPrice===null?"No previous price":`from ${money.format(entry.oldPrice)}`}</span></div><p>{entry.reason}</p><small>{entry.changedBy} · {new Date(entry.createdAt).toLocaleString()}</small></article>)}</div></>}</div>;
}
