-- Row counts
SELECT COUNT(*) AS orders   FROM olist_orders;
SELECT COUNT(*) AS items    FROM olist_order_items;
SELECT COUNT(*) AS payments FROM olist_order_payments;
SELECT COUNT(*) AS customers FROM olist_customers;
SELECT COUNT(*) AS products  FROM olist_products;
SELECT COUNT(*) AS sellers   FROM olist_sellers;

-- Add Performance Indexes
CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON olist_orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_items_order_id     ON olist_order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_items_product_id   ON olist_order_items(product_id);
CREATE INDEX IF NOT EXISTS idx_items_seller_id    ON olist_order_items(seller_id);
CREATE INDEX IF NOT EXISTS idx_payments_order_id  ON olist_order_payments(order_id);


-- create "clean join" view
CREATE OR REPLACE VIEW v_order_level AS
WITH item_totals AS (
  SELECT
    order_id,
    SUM(price) AS gmv,
    SUM(freight_value) AS freight
  FROM olist_order_items
  GROUP BY 1
),
payment_totals AS (
  SELECT
    order_id,
    SUM(payment_value) AS total_paid
  FROM olist_order_payments
  GROUP BY 1
)
SELECT
  o.order_id,
  o.customer_id,
  o.order_status,
  o.order_purchase_timestamp,
  o.order_delivered_customer_date,
  o.order_estimated_delivery_date,
  it.gmv,
  it.freight,
  pt.total_paid
FROM olist_orders o
LEFT JOIN item_totals it USING (order_id)
LEFT JOIN payment_totals pt USING (order_id);


-- Orders by Month
SELECT
  DATE_TRUNC('month', order_purchase_timestamp)::date AS month,
  COUNT(*) AS orders
FROM olist_orders
GROUP BY 1
ORDER BY 1;

-- GMV by month
SELECT
  DATE_TRUNC('month', order_purchase_timestamp)::date AS month,
  SUM(gmv) AS gmv
FROM v_order_level
GROUP BY 1
ORDER BY 1;

-- Average Order Value
SELECT
  DATE_TRUNC('month', order_purchase_timestamp)::date AS month,
  SUM(gmv) / NULLIF(COUNT(order_id), 0) AS aov
FROM v_order_level
GROUP BY 1
ORDER BY 1;


-- Orders by status
SELECT order_status, COUNT(*) AS orders
FROM olist_orders
GROUP BY 1
ORDER BY 2 DESC;

-- Top states by orders
SELECT
  c.customer_state,
  COUNT(DISTINCT o.order_id) AS orders
FROM olist_orders o
JOIN olist_customers c ON c.customer_id = o.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


-- Write down insights (so far we have 5 insights)




