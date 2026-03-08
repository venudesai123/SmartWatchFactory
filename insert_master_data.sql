/******* For Vendors *******/
/** INSERT (try this first) **/
INSERT INTO vendors (vendor_id, vendor_sim_name, vendor_name, vendor_address, vendor_pincode, vendor_city, vendor_country, active)
VALUES (1,'Vendor_1','Vendor One','123 Industrial Road','560001','Bangalore','India',TRUE);

INSERT INTO vendors (vendor_id, vendor_sim_name, vendor_name, vendor_address, vendor_pincode, vendor_city, vendor_country, active)
VALUES (2,'Vendor_2','Vendor Two','45 Silicon Street, Suite 12','110011','New Delhi','India',TRUE);

INSERT INTO vendors (vendor_id, vendor_sim_name, vendor_name, vendor_address, vendor_pincode, vendor_city, vendor_country, active)
VALUES (3,'Vendor_3','Vendor Three','78 High Tech Park, Block B','400001','Mumbai','India',TRUE);

/** UPDATE (run only if INSERT fails due to duplicate PK) **/
UPDATE vendors SET
  vendor_sim_name='Vendor_1', vendor_name='Vendor One', vendor_address='123 Industrial Road',
  vendor_pincode='560001', vendor_city='Bangalore', vendor_country='India', active=TRUE
WHERE vendor_id=1;

UPDATE vendors SET
  vendor_sim_name='Vendor_2', vendor_name='Vendor Two', vendor_address='45 Silicon Street, Suite 12',
  vendor_pincode='110011', vendor_city='New Delhi', vendor_country='India', active=TRUE
WHERE vendor_id=2;

UPDATE vendors SET
  vendor_sim_name='Vendor_3', vendor_name='Vendor Three', vendor_address='78 High Tech Park, Block B',
  vendor_pincode='400001', vendor_city='Mumbai', vendor_country='India', active=TRUE
WHERE vendor_id=3;
  
/******* For Products *******/
/** INSERT first **/
INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok)
VALUES (3,'BA001','Battery',1,100,0.01,6,6,TRUE,TRUE,FALSE);

INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (4,'CA001-FW','Case',4,50,0.01,4,4,TRUE,TRUE,FALSE);
INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (5,'CA001-FB','Case',4,50,0.01,4,4,TRUE,TRUE,FALSE);
INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok)
VALUES (6,'CA001-MET','Case',4,50,0.01,4,4,TRUE,TRUE,FALSE);

INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (7,'DISP001','Display',5,100,0.02,18,18,TRUE,TRUE,FALSE);

INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (8,'MC001','Microchip',6,150,0.02,12,12,TRUE,TRUE,FALSE);

INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (9,'ST001-FW','Strap',7,50,0.00,2,2,TRUE,TRUE,FALSE);
INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (10,'ST001-FB','Strap',7,50,0.00,2,2,TRUE,TRUE,FALSE);
INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (11,'ST001-MET','Strap',7,50,0.00,2,2,TRUE,TRUE,FALSE);

INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (12,'SW001-FW','SmartWatch',8,1,0.00,30.3,150,TRUE,FALSE,TRUE);
INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (13,'SW001-FB','SmartWatch',8,1,0.00,30.3,150,TRUE,FALSE,TRUE);
INSERT INTO products (product_id, sku_id, sku_name, product_tmpl_id, units_per_box, unit_weight, cost_price, sales_price, active, purchase_ok, sale_ok) 
VALUES (14,'SW001-MET','SmartWatch',8,1,0.00,30.3,150,TRUE,FALSE,TRUE);

/** UPDATE (only if INSERT fails) **/
UPDATE products SET
  sku_id='BA001', sku_name='Battery', product_tmpl_id=1,
  units_per_box=100, unit_weight=0.01, cost_price=6, sales_price=6,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=3;

UPDATE products SET
  sku_id='CA001-FW', sku_name='Case', product_tmpl_id=4,
  units_per_box=50, unit_weight=0.01, cost_price=4, sales_price=4,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=4;

UPDATE products SET
  sku_id='CA001-FB', sku_name='Case', product_tmpl_id=4,
  units_per_box=50, unit_weight=0.01, cost_price=4, sales_price=4,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=5;

UPDATE products SET
  sku_id='CA001-MET', sku_name='Case', product_tmpl_id=4,
  units_per_box=50, unit_weight=0.01, cost_price=4, sales_price=4,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=6;

UPDATE products SET
  sku_id='DISP001', sku_name='Display', product_tmpl_id=5,
  units_per_box=100, unit_weight=0.02, cost_price=18, sales_price=18,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=7;

UPDATE products SET
  sku_id='MC001', sku_name='Microchip', product_tmpl_id=6,
  units_per_box=150, unit_weight=0.02, cost_price=12, sales_price=12,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=8;

UPDATE products SET
  sku_id='ST001-FW', sku_name='Strap', product_tmpl_id=7,
  units_per_box=50, unit_weight=0.00, cost_price=2, sales_price=2,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=9;

UPDATE products SET
  sku_id='ST001-FB', sku_name='Strap', product_tmpl_id=7,
  units_per_box=50, unit_weight=0.00, cost_price=2, sales_price=2,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=10;

UPDATE products SET
  sku_id='ST001-MET', sku_name='Strap', product_tmpl_id=7,
  units_per_box=50, unit_weight=0.00, cost_price=2, sales_price=2,
  active=TRUE, purchase_ok=TRUE, sale_ok=FALSE
WHERE product_id=11;

UPDATE products SET
  sku_id='SW001-FW', sku_name='SmartWatch', product_tmpl_id=8,
  units_per_box=1, unit_weight=0.00, cost_price=30.3, sales_price=150,
  active=TRUE, purchase_ok=FALSE, sale_ok=TRUE
WHERE product_id=12;

UPDATE products SET
  sku_id='SW001-FB', sku_name='SmartWatch', product_tmpl_id=8,
  units_per_box=1, unit_weight=0.00, cost_price=30.3, sales_price=150,
  active=TRUE, purchase_ok=FALSE, sale_ok=TRUE
WHERE product_id=13;

UPDATE products SET
  sku_id='SW001-MET', sku_name='SmartWatch', product_tmpl_id=8,
  units_per_box=1, unit_weight=0.00, cost_price=30.3, sales_price=150,
  active=TRUE, purchase_ok=FALSE, sale_ok=TRUE
WHERE product_id=14;

/******* for Product Vendor Map *******/
/** INSERT first **/
INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay)
VALUES (7,1,'Vendor One','DISP001',500.0,12);

INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay)
VALUES (3,1,'Vendor One','BA001',500.0,9);
INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay) 
VALUES (8,2,'Vendor Two','MC001',600.0,18);

INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay) 
VALUES (4,3,'Vendor Three','CA001-FW',200.0,7);
INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay) 
VALUES (5,3,'Vendor Three','CA001-FB',200.0,7);
INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay) 
VALUES (6,3,'Vendor Three','CA001-MET',200.0,7);

INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay) 
VALUES (9,3,'Vendor Three','ST001-FW',200.0,6);
INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay) 
VALUES (10,3,'Vendor Three','ST001-FB',200.0,6);
INSERT INTO product_vendor_map (product_id, vendor_id, vendor_name, product_sku_id, min_qty, delay) 
VALUES (11,3,'Vendor Three','ST001-MET',200.0,6);

/** UPDATE if INSERT fails **/
UPDATE product_vendor_map SET vendor_name='Vendor One', product_sku_id='DISP001', min_qty=500.0, delay=12
WHERE product_id=7 AND vendor_id=1;

UPDATE product_vendor_map SET vendor_name='Vendor One', product_sku_id='BA001', min_qty=500.0, delay=9
WHERE product_id=3 AND vendor_id=1;

UPDATE product_vendor_map SET vendor_name='Vendor Two', product_sku_id='MC001', min_qty=600.0, delay=18
WHERE product_id=8 AND vendor_id=2;

UPDATE product_vendor_map SET vendor_name='Vendor Three', product_sku_id='CA001-FW', min_qty=200.0, delay=7
WHERE product_id=4 AND vendor_id=3;

UPDATE product_vendor_map SET vendor_name='Vendor Three', product_sku_id='CA001-FB', min_qty=200.0, delay=7
WHERE product_id=5 AND vendor_id=3;

UPDATE product_vendor_map SET vendor_name='Vendor Three', product_sku_id='CA001-MET', min_qty=200.0, delay=7
WHERE product_id=6 AND vendor_id=3;

UPDATE product_vendor_map SET vendor_name='Vendor Three', product_sku_id='ST001-FW', min_qty=200.0, delay=6
WHERE product_id=9 AND vendor_id=3;

UPDATE product_vendor_map SET vendor_name='Vendor Three', product_sku_id='ST001-FB', min_qty=200.0, delay=6
WHERE product_id=10 AND vendor_id=3;

UPDATE product_vendor_map SET vendor_name='Vendor Three', product_sku_id='ST001-MET', min_qty=200.0, delay=6
WHERE product_id=11 AND vendor_id=3;

/******* For Work Centers *******/
/** INSERT first **/
INSERT INTO work_centers (wc_id, wc_name, wc_code, capacity, active) VALUES (1,'Assembly','ASM',1,TRUE);
INSERT INTO work_centers (wc_id, wc_name, wc_code, capacity, active) VALUES (2,'Software Integration','SI',1,TRUE);
INSERT INTO work_centers (wc_id, wc_name, wc_code, capacity, active) VALUES (3,'Quality Check Software Integration','QC1',1,TRUE);
INSERT INTO work_centers (wc_id, wc_name, wc_code, capacity, active) VALUES (4,'Rework Software Integration','RW1',1,TRUE);
INSERT INTO work_centers (wc_id, wc_name, wc_code, capacity, active) VALUES (5,'Quality Check Cosmetic','QC2',1,TRUE);
INSERT INTO work_centers (wc_id, wc_name, wc_code, capacity, active) VALUES (6,'Rework Cosmetic','RW2',1,TRUE);
INSERT INTO work_centers (wc_id, wc_name, wc_code, capacity, active) VALUES (7,'Packaging','PK',1,TRUE);

/** UPDATE if INSERT fails **/
UPDATE work_centers SET wc_name='Assembly', wc_code='ASM', capacity=1, active=TRUE WHERE wc_id=1;
UPDATE work_centers SET wc_name='Software Integration', wc_code='SI', capacity=1, active=TRUE WHERE wc_id=2;
UPDATE work_centers SET wc_name='Quality Check Software Integration', wc_code='QC1', capacity=1, active=TRUE WHERE wc_id=3;
UPDATE work_centers SET wc_name='Rework Software Integration', wc_code='RW1', capacity=1, active=TRUE WHERE wc_id=4;
UPDATE work_centers SET wc_name='Quality Check Cosmetic', wc_code='QC2', capacity=1, active=TRUE WHERE wc_id=5;
UPDATE work_centers SET wc_name='Rework Cosmetic', wc_code='RW2', capacity=1, active=TRUE WHERE wc_id=6;
UPDATE work_centers SET wc_name='Packaging', wc_code='PK', capacity=1, active=TRUE WHERE wc_id=7;

/******* For Distributors *******/
/** INSERT first **/
INSERT INTO distributors (partner_id, distributor_sim_name, customer_name, customer_address, customer_pincode, customer_city, customer_country, active)
VALUES (1,'Dist_1','Distributor One','Umfassungsweg 11','39106','Magdeburg','Germany',TRUE);

INSERT INTO distributors (partner_id, distributor_sim_name, customer_name, customer_address, customer_pincode, customer_city, customer_country, active)
VALUES (2,'Dist_2','Distributor Two','Schifferstraße 18','39106','Magdeburg','Germany',TRUE);

INSERT INTO distributors (partner_id, distributor_sim_name, customer_name, customer_address, customer_pincode, customer_city, customer_country, active)
VALUES (3,'Dist_3','Distributor Three','Ernst-Lehmann-Strasse 2','39106','Magdeburg','Germany',TRUE);

/** UPDATE if INSERT fails **/
UPDATE distributors SET distributor_sim_name='Dist_1', customer_name='Distributor One', customer_address='Umfassungsweg 11',
  customer_pincode='39106', customer_city='Magdeburg', customer_country='Germany', active=TRUE
WHERE partner_id=1;

UPDATE distributors SET distributor_sim_name='Dist_2', customer_name='Distributor Two', customer_address='Schifferstraße 18',
  customer_pincode='39106', customer_city='Magdeburg', customer_country='Germany', active=TRUE
WHERE partner_id=2;

UPDATE distributors SET distributor_sim_name='Dist_3', customer_name='Distributor Three', customer_address='Ernst-Lehmann-Strasse 2',
  customer_pincode='39106', customer_city='Magdeburg', customer_country='Germany', active=TRUE
WHERE partner_id=3;
