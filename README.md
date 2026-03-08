# SmartWatchFactory (AnyLogic + Odoo 16) — Smartwatch Modular Manufacturing Simulation

This repository contains an **AnyLogic simulation model** of a **smartwatch factory** with end-to-end flows (inbound raw materials → storage → production → QC/rework → packaging → finished goods warehouse → customer order fulfillment) and **live integration with Odoo 16 ERP** via **XML-RPC / JSON-RPC**.

The model is designed for a thesis / research context to evaluate **inventory policies** (ROP, Periodic Review, JIT-style pull), operational KPIs, and ERP-simulation synchronization.

---

## What’s inside

### Simulation scope
- **Product family:** Smartwatch variants (e.g., MET / FW / FB)
- **Raw materials (RM):** Display, Battery, Microchip, Case, Strap
- **Inbound:** Vendors deliver RM in boxes → unloading docks → QC → RM storage slotting → stowing
- **Manufacturing:** Assembly → Software Integration → QC → Rework (if needed) → QC2 → Packaging
- **Finished Goods (FG):** Trays (batching), FG storage slotting, staging
- **Outbound:** Customer orders → pick planning → packing → staging → outbound docks → shipping

### ERP integration (Odoo 16)
- Create/confirm ERP objects from simulation:
  - Purchase Orders (PO) for RM
  - Manufacturing Orders (MO) / Work Orders (WO)
  - Sales Orders (SO) / deliveries (depending on configuration)
- Pull master data (products, partners, BOM, etc.) and keep a consistent simulation ↔ ERP view of inventory/moves.
- Uses custom logic and helper services to map simulation events to Odoo transactions.

---

## Project structure (high level)

- **`SmartWatchFactory.alp`**
  - Main AnyLogic model file (open in AnyLogic)
- **Additional Java classes**
  - `services/`
    - `BootstrapService` — orchestrates model initialization
    - `LayoutInitService` — workers, node references, routing setup
    - `MasterDataService` — DB + master data initialization
    - `SlottingService` — RM/FG slot creation & slotting rules
    - `SlottingInitService` — initializes shared slot maps/state
    - `InventorySeedService` — initial inventory loading/targets
    - `PickPlanningService` — FG pick plan building for customer orders
    - `ProcurementPolicyService` — ROP/PR/JIT policy logic
    - `DiagnosticsService` — periodic checks (overfill, invariants)
    - `KpisService` — KPI counters and datasets
  - `odoo/`
    - `OdooUtils`, `OdooSession`, `OdooGateway`, `Odoo*Gateway`
    - `OdooMrpGateway`, `OdooPurchaseGateway`, `OdooSalesGateway`
  - `domain/` (POJOs / state objects)
    - `RmSlot`, `FgSlot`, `Tray`, `MotherBox`, `PurchaseOrderSim`, etc.
  - `util/`
    - `Logger`, `DateTimeUtil`, other helpers
  - `enums/`
    - `PRODUCT_TYPE`, `FG_SKU`, `RESOURCE_TYPE`, etc.

---

## Requirements

### Software
- **AnyLogic PLE 8.9.x** (model developed and tested on Ubuntu)
- **Java** (bundled with AnyLogic, or system JDK depending on your setup)
- Optional (for integration):
  - **Odoo 16** running locally or on another machine in the same network
  - PostgreSQL (for Odoo)
  - Custom Odoo addon(s) (if your model expects ERP extensions)

<!-- ### Network
- If Odoo is on another laptop: ensure port **8069** is reachable.
- If using firewall (`ufw`), allow the Odoo port:
  - `sudo ufw allow 8069/tcp` -->

---

## Quick start

### 1) Open and run in AnyLogic
1. Open **AnyLogic**
2. `File → Open...` → select `SmartWatchFactory.alp`
3. Open the main experiment (e.g., Simulation / Experiment)
4. Click **Run**

### 2) Run with Odoo integration (optional)
1. Start Odoo 16 and confirm it’s accessible (example):
   - `http://localhost:8069` or `http://<odoo-host-ip>:8069`
2. In the simulation UI/config parameters:
   - Set Odoo host URL
   - Set DB name, username, password
   - Enable “Use Odoo Live” (if your UI has this toggle)
3. Run the experiment and monitor logs.

> Tip: use a dedicated Odoo database for simulation runs to keep the ERP clean.

---

## Bootstrap lifecycle

Initialization is orchestrated by `BootstrapService`:

1. Configure logging (`Logger`)
2. Initialize layout and workers (`LayoutInitService`)
3. Load database + master data (`MasterDataService`)
4. Initialize slotting state (`SlottingInitService.initSlotMaps()`)
5. Build RM + FG slots (`SlottingService.initRmSlots()`, `initFgSlots()`)
6. Load/seed initial inventory (`InventorySeedService`)
7. Initialize procurement defaults/policy (`ProcurementPolicyService`)

Then `operationalScheduler()` starts the periodic events:
- Dispatch loop
- Procurement review loop
- Outbound truck dispatcher/poller
- Diagnostics (e.g., `checkOverfillSku`)
- Optional periodic Odoo master sync

---

## Inventory policies supported

- **ROP (Reorder Point)**: order when on-hand + on-order falls below threshold
- **Periodic Review (R,S)**: review every fixed interval, order-up-to target
- **JIT-style Pull**: replenishment driven by consumption signals with safety buffers

> Policy selection is typically controlled by UI/config variables in `Main`.

---

<!-- ## Box sizes (RM packaging)

Configured in the model (used for inbound planning and stowing):

- Display: **1 box = 100 units**
- Battery: **1 box = 100 units**
- Microchip: **1 box = 150 units**
- Case: **1 box = 50 units**
- Strap: **1 box = 50 units** 

--- -->

## KPIs tracked (examples)

Depending on experiment settings, the model can track:
- Service level / fill rate
- Order cycle time / throughput time
- WIP levels per stage
- RM and FG inventory on-hand + on-order
- Utilization of key resources (pickers, stowers, workstations)
- Late orders, backorders, stockouts
- Rework and scrap rates

KPI datasets are collected via `KpisService`.

---

## Logging

Logging is centralized via `Logger`:
- Sink can be **AnyLogic console** or **STDOUT**
- Log level and color mode are configurable via `Constants`

---

## Known notes / best practices

- Always initialize slot maps before slot creation:
  - `SlottingInitService.initSlotMaps()` must run before `SlottingInitService.initRmSlots/initFgSlots`.
- When running multiple experiments or resets, ensure bootstrap runs each time to avoid stale state.
- If Odoo objects “don’t appear”, verify:
  - credentials
  - database name
  - network reachability
  - Odoo server logs (XML-RPC endpoints)

---

<!-- ## How to cite / thesis context

This simulation is built for research on:
- inventory optimization in modular manufacturing
- ERP–simulation integration
- policy comparison under synthetic demand and lead time assumptions

(Insert your thesis title / university info here if you want.)

---

## Contributing

This is primarily a research/thesis project. If you want to contribute:
1. Fork the repo
2. Create a feature branch
3. Submit a PR with a clear description and test notes (screenshots/logs)

---

## License

Add your preferred license here (e.g., MIT, Apache-2.0, or “All rights reserved” for thesis work).

---

## Contact

- Author: `<Your Name>`
- GitHub: `<Your GitHub>`
- University / Project: `<Optional>`-->