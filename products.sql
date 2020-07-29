SELECT products_model as id,
products_name as title,
products_description as description,
"in stock" as availability,
products_quantity as inventory,
'new' as "condition",
products_price_sorter as price,
CONCAT('https://domain.com/store/index.php?main_page=product_info&cPath=3&products_id=', products.products_id) as link,
CONCAT('https://domain.com/store/images/', products_image) as image_link,
"To Live A Lie" as brand,
"Media > Music & Sound Recordings" as google_product_category,
products_weight as shipping_weight
INTO OUTFILE 'public_html/products.csv'

FROM products inner join products_description on products.products_id=products_description.products_id
where products_quantity > 0 
AND products_model <> ""
AND products_status = 1
and products_price_sorter > 1