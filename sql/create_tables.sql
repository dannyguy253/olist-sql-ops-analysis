CREATE TABLE olist_orders (
  order_id text PRIMARY KEY,
  customer_id text,
  order_status text,
  order_purchase_timestamp timestamp,
  order_approved_at timestamp,
  order_delivered_carrier_date timestamp,
  order_delivered_customer_date timestamp,
  order_estimated_delivery_date timestamp
);

CREATE TABLE olist_order_items (
  order_id text,
  order_item_id int,
  product_id text,
  seller_id text,
  shipping_limit_date timestamp,
  price numeric,
  freight_value numeric
);

CREATE TABLE olist_order_payments (
  order_id text,
  payment_sequential int,
  payment_type text,
  payment_installments int,
  payment_value numeric
);

CREATE TABLE olist_customers (
  customer_id text PRIMARY KEY,
  customer_unique_id text,
  customer_zip_code_prefix text,
  customer_city text,
  customer_state text
);

CREATE TABLE olist_products (
  product_id text PRIMARY KEY,
  product_category_name text,
  product_name_lenght int,
  product_description_lenght int,
  product_photos_qty int,
  product_weight_g int,
  product_length_cm int,
  product_height_cm int,
  product_width_cm int
);

CREATE TABLE olist_sellers (
  seller_id text PRIMARY KEY,
  seller_zip_code_prefix text,
  seller_city text,
  seller_state text
);

CREATE TABLE product_category_name_translation (
  product_category_name text PRIMARY KEY,
  product_category_name_english text
);




-- DROP TABLE IF EXISTS
--   olist_order_items,
--   olist_order_payments,
--   olist_orders,
--   olist_customers,
--   olist_products,
--   olist_sellers,
--   product_category_name_translation
-- CASCADE;
