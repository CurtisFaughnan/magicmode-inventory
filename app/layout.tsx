import type { Metadata } from "next";
import "./globals.css";
import "./brand.css";
export const metadata: Metadata={title:"MagicMode Inventory",description:"Receive, use, and track production materials from the company BOM.",openGraph:{title:"MagicMode Inventory",description:"Know what you have. Build with confidence.",images:[{url:"/og.png",width:1672,height:941,alt:"MagicMode Inventory dashboard preview"}]},twitter:{card:"summary_large_image",title:"MagicMode Inventory",description:"Know what you have. Build with confidence.",images:["/og.png"]}};
export default function RootLayout({children}:{children:React.ReactNode}){return <html lang="en"><body>{children}</body></html>}
