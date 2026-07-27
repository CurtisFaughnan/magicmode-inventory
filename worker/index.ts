/** Cloudflare Worker entry point for the vinext-starter template. */
import { handleImageOptimization, DEFAULT_DEVICE_SIZES, DEFAULT_IMAGE_SIZES } from "vinext/server/image-optimization";
import handler from "vinext/server/app-router-entry";

interface Env {
  ASSETS: Fetcher;
  DB: D1Database;
  IMAGES: {
    input(stream: ReadableStream): {
      transform(options: Record<string, unknown>): {
        output(options: { format: string; quality: number }): Promise<{ response(): Response }>;
      };
    };
  };
}

interface ExecutionContext {
  waitUntil(promise: Promise<unknown>): void;
  passThroughOnException(): void;
}

// Image security config. SVG sources with .svg extension auto-skip the
// optimization endpoint on the client side (served directly, no proxy).
// To route SVGs through the optimizer (with security headers), set
// dangerouslyAllowSVG: true in next.config.js and uncomment below:
// const imageConfig: ImageConfig = { dangerouslyAllowSVG: true };

const worker = {
  async fetch(request: Request, env: Env, ctx: ExecutionContext): Promise<Response> {
    const url = new URL(request.url);

    if (url.pathname.startsWith("/api/")) return handleApi(request, env, url);

    if (url.pathname === "/_vinext/image") {
      const allowedWidths = [...DEFAULT_DEVICE_SIZES, ...DEFAULT_IMAGE_SIZES];
      return handleImageOptimization(request, {
        fetchAsset: (path) => env.ASSETS.fetch(new Request(new URL(path, request.url))),
        transformImage: async (body, { width, format, quality }) => {
          const result = await env.IMAGES.input(body).transform(width > 0 ? { width } : {}).output({ format, quality });
          return result.response();
        },
      }, allowedWidths);
    }

    return handler.fetch(request, env, ctx);
  },
};

const seed=[
 ["","Jetson Orin AGX","Compute",1,2,1999.99,"pcs","Amazon/Nvidia","",1,"Edge Compute"],["CU31 CXLCC BX H03R1","See3 Cam without enclosure","Top Camera",1,3,249,"cameras","e-con Systems","2 months",1,""],["CU31 CHLCC H03R1","See3 Cam with enclosure","Side Cameras and rear",3,4,289,"cameras","e-con Systems","2 months",1,""],["DSL392B-NIR-F 2.0 / DSL392B-650-F 2.0","Camera Top Lens","Camera Lens",1,15,99,"lenses","Sunex","2 days",2,""],["","Camera Rear Housing","3d print",1,0,null,"pcs","SunPe","",1,""],["CLA020-PC","Camera Lens Mount","M12 Lens Mount, 20mm Spacing, 10mm Height",1,29,4.5,"pcs","CommonLands","2 days",2,""],["","Camera Side Housing","3d print",2,0,null,"pcs","SunPe","",1,""],["D51601","R-NET Development Kit","3pc component set",1,40,133.9,"pcs","Curtiss-Wright","2 months",2,""],["P77978","R-NET JSM Bulkhead Retaining Clip","u-clip",1,95,1.61,"pcs","Curtiss-Wright","1 month",3,""],["P78039","R-Net Rebus Panel Mount Connector","surface plug",1,0,5.15,"pcs","Curtiss-Wright","",3,""],["","PCB Fab board","Software Board",1,3,40,"boards","PCB Unlimited","2 weeks",1,""],["","Display screen","Touch Screen Display",1,16,54.68,"screens","Crystal Displays","4 weeks",1,""],["","Display Connector","HDMI to Displayport",1,0,7.99,"pcs","Benfei","",2,""],["","Display Power Cable","USB-A to micro-usb",1,10,null,"pcs","","",2,""],["","USB C to USB C Cable","1.6 FT, Right Angle 20Gbps Data Transfer",2,23,null,"pcs","Amazon","",3,""],["","Power cable (RNET-Jetson)","",1,0,null,"pcs","","",3,""],["","USB C to USB A 20Gbps Data Cable","4FT, For Boom Camera",1,5,null,"pcs","","",3,""],["","USB-C to 4-Port USB-C","3.2 Gen2 Ports Hub",1,2,null,"pcs","Amazon","",3,""],["","Jetson Housing (2 pc.)","3d print",1,0,1512,"pcs","SunPe","",1,""],["","Camera Boom","3d print",1,1,null,"pcs","SunPe","",1,""],["","Speaker","",1,25,null,"speakers","Amazon/Honkyob","",1,""],["91290A012","Side Camera Screws","M2 x 0.4mm, 5mm Socket Head",8,181,null,"screws","McMaster-Carr","2 days",3,""],["91290A320","Mounting Screws","M6 x 1mm, 15mm Socket Head",8,170,null,"screws","McMaster-Carr","2 days",3,""],["96887A121","Low-Strength Steel Square Nut","M6 x 1mm Thread",8,216,null,"nuts","McMaster-Carr","2 days",3,""],["9031A112","Nylon-Insert Locknut","M4 x 0.7mm Thread",4,0,null,"nuts","McMaster-Carr","2 days",3,""],["95893A179","Thread-Forming Screws For Plastic","M2.5 x 8mm",4,91,null,"screws","McMaster-Carr","2 days",3,""],["99461A941","Phillips Thread-Forming Screws","M3, 8mm Long",4,0,null,"screws","McMaster-Carr","2 days",3,""],["","Battery","Batteries for Chair",2,2,299.99,"batteries","","",null,""]
];
async function initialize(db:D1Database){await db.batch([db.prepare("CREATE TABLE IF NOT EXISTS items (id INTEGER PRIMARY KEY AUTOINCREMENT, part_number TEXT NOT NULL, name TEXT NOT NULL, description TEXT NOT NULL, qty_needed REAL NOT NULL, qty_on_hand REAL NOT NULL, unit_cost REAL, unit TEXT NOT NULL, supplier TEXT NOT NULL, lead_time TEXT NOT NULL, bom_level INTEGER, notes TEXT NOT NULL)"),db.prepare("CREATE TABLE IF NOT EXISTS transactions (id INTEGER PRIMARY KEY AUTOINCREMENT, item_id INTEGER NOT NULL, kind TEXT NOT NULL, quantity REAL NOT NULL, reference TEXT NOT NULL, note TEXT NOT NULL, created_at TEXT NOT NULL)"),db.prepare("CREATE INDEX IF NOT EXISTS transactions_item_idx ON transactions(item_id)")]);const c=await db.prepare("SELECT COUNT(*) c FROM items").first<{c:number}>();if(!c?.c){for(const x of seed)await db.prepare("INSERT INTO items(part_number,name,description,qty_needed,qty_on_hand,unit_cost,unit,supplier,lead_time,bom_level,notes) VALUES(?,?,?,?,?,?,?,?,?,?,?)").bind(...x).run();}}
const json=(data:unknown,status=200)=>new Response(JSON.stringify(data),{status,headers:{"content-type":"application/json"}});
async function handleApi(request:Request,env:Env,url:URL){await initialize(env.DB);
 if(url.pathname==="/api/items"&&request.method==="GET"){const r=await env.DB.prepare("SELECT id,part_number partNumber,name,description,qty_needed qtyNeeded,qty_on_hand qtyOnHand,unit_cost unitCost,unit,supplier,lead_time leadTime,bom_level bomLevel,notes FROM items ORDER BY name").all();return json(r.results);}
 if(url.pathname==="/api/transactions"&&request.method==="GET"){const r=await env.DB.prepare("SELECT t.id,t.item_id itemId,i.name itemName,t.kind,t.quantity,t.reference,t.note,t.created_at createdAt FROM transactions t JOIN items i ON i.id=t.item_id ORDER BY t.id DESC LIMIT 200").all();return json(r.results);}
 if(url.pathname==="/api/transactions"&&request.method==="POST"){const b=await request.json() as {itemId:number;kind:string;quantity:number;reference?:string;note?:string};if(!b.itemId||!["receive","use","adjust"].includes(b.kind)||!Number.isFinite(b.quantity)||b.quantity<0)return json({error:"Invalid transaction"},400);const item=await env.DB.prepare("SELECT qty_on_hand q FROM items WHERE id=?").bind(b.itemId).first<{q:number}>();if(!item)return json({error:"Item not found"},404);const next=b.kind==="receive"?item.q+b.quantity:b.kind==="use"?item.q-b.quantity:b.quantity;if(next<0)return json({error:"Not enough stock"},409);await env.DB.batch([env.DB.prepare("UPDATE items SET qty_on_hand=? WHERE id=?").bind(next,b.itemId),env.DB.prepare("INSERT INTO transactions(item_id,kind,quantity,reference,note,created_at) VALUES(?,?,?,?,?,?)").bind(b.itemId,b.kind,b.quantity,b.reference||"",b.note||"",new Date().toISOString())]);return json({ok:true,qtyOnHand:next},201);}
 if(url.pathname==="/api/new-chair"&&request.method==="POST"){const rows=(await env.DB.prepare("SELECT id,name,qty_needed needed,qty_on_hand available FROM items WHERE qty_needed>0 ORDER BY id").all<{id:number;name:string;needed:number;available:number}>()).results;const short=rows.filter(i=>i.available<i.needed);if(short.length)return json({error:`Cannot build a chair. Short on: ${short.map(i=>i.name).join(", ")}`},409);const now=new Date().toISOString();const ref=`New Chair • ${now}`;const statements=[];for(const i of rows){statements.push(env.DB.prepare("UPDATE items SET qty_on_hand=qty_on_hand-? WHERE id=?").bind(i.needed,i.id));statements.push(env.DB.prepare("INSERT INTO transactions(item_id,kind,quantity,reference,note,created_at) VALUES(?,?,?,?,?,?)").bind(i.id,"use",i.needed,ref,"One complete chair build",now));}await env.DB.batch(statements);return json({ok:true,itemsUsed:rows.length},201);}
 if(url.pathname==="/api/undo"&&request.method==="POST"){const last=await env.DB.prepare("SELECT id,item_id itemId,kind,quantity,reference FROM transactions ORDER BY id DESC LIMIT 1").first<{id:number;itemId:number;kind:string;quantity:number;reference:string}>();if(!last)return json({error:"There is no inventory action to undo."},404);if(last.kind==="adjust")return json({error:"Stock corrections cannot be undone; enter a new correction instead."},409);const group=last.reference.startsWith("New Chair •")?(await env.DB.prepare("SELECT id,item_id itemId,kind,quantity FROM transactions WHERE reference=? ORDER BY id").bind(last.reference).all<{id:number;itemId:number;kind:string;quantity:number}>()).results:[last];const statements=[];for(const t of group){const delta=t.kind==="receive"?-t.quantity:t.quantity;statements.push(env.DB.prepare("UPDATE items SET qty_on_hand=qty_on_hand+? WHERE id=?").bind(delta,t.itemId));statements.push(env.DB.prepare("DELETE FROM transactions WHERE id=?").bind(t.id));}await env.DB.batch(statements);return json({ok:true,message:group.length>1?"The latest new-chair build was undone.":"The latest inventory action was undone."});}
 return json({error:"Not found"},404);
}

export default worker;
