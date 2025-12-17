\copy olist_orders FROM 'C:/data/olist/olist_orders_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy olist_order_items FROM 'C:/data/olist/olist_order_items_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy olist_order_payments FROM 'C:/data/olist/olist_order_payments_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy olist_customers FROM 'C:/data/olist/olist_customers_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy olist_products FROM 'C:/data/olist/olist_products_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy olist_sellers FROM 'C:/data/olist/olist_sellers_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy product_category_name_translation FROM 'C:/data/olist/product_category_name_translation.csv' WITH (FORMAT csv, HEADER true);
