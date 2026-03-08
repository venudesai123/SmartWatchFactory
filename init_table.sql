/******* Create tables *******/

CREATE TABLE IF NOT EXISTS products (
	product_id		INT PRIMARY KEY,
	sku_id			VARCHAR(128),
	sku_name		VARCHAR(255),
	product_tmpl_id INT,
	units_per_box	INT,
	unit_weight		DOUBLE,
	cost_price		DOUBLE,
	sales_price		DOUBLE,
	active			BOOLEAN DEFAULT TRUE NOT NULL,
	purchase_ok		BOOLEAN DEFAULT TRUE NOT NULL,
	sale_ok			BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE IF NOT EXISTS vendors (
	vendor_id       INT PRIMARY KEY,
	vendor_sim_name VARCHAR(64),
	vendor_name     VARCHAR(255),
	vendor_address  VARCHAR(255),
	vendor_pincode  VARCHAR(32),
	vendor_city     VARCHAR(128),
	vendor_country  VARCHAR(128),
	active			BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE IF NOT EXISTS product_vendor_map (
	product_id      INT NOT NULL,
	vendor_id       INT NOT NULL,
	vendor_name     VARCHAR(255),   -- denormalized copy (optional)
	product_sku_id  VARCHAR(255),   -- denormalized copy (optional)
	min_qty         DOUBLE,
	delay           INT,
	
	-- Foreign keys
	CONSTRAINT fk_pvm_product
	FOREIGN KEY (product_id) REFERENCES products(product_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE,

	CONSTRAINT fk_pvm_vendor
	FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	
	CONSTRAINT pk_pvm PRIMARY KEY (product_id, vendor_id)
);
CREATE INDEX IF NOT EXISTS idx_pvm_vendor ON product_vendor_map(vendor_id);

CREATE TABLE IF NOT EXISTS work_centers (
	wc_id		INT PRIMARY KEY,
	wc_name		VARCHAR(225),
	wc_code		VARCHAR(10),
	capacity	INT,
	active		BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE IF NOT EXISTS distributors (
    partner_id           INT PRIMARY KEY,
    distributor_sim_name VARCHAR(225),
    customer_name        VARCHAR(255),
    customer_address     VARCHAR(255),
    customer_pincode     VARCHAR(32),
    customer_city        VARCHAR(128),
    customer_country     VARCHAR(128),
    active               BOOLEAN DEFAULT TRUE NOT NULL
);

/******* Delete records from the tables *******/

DELETE FROM distributors;
DELETE FROM work_centers;
DELETE FROM product_vendor_map;
DELETE FROM products;
DELETE FROM vendors;