SELECT products_model as id,
products_name as title,
products_description as description,
"in stock" as availability, # where below makes sure items are in stock, make a case statement using products_quantity if needed
products_quantity as inventory,
'new' as "condition", #edit if you have different conditions
products_price_sorter as price,
CONCAT('https://domain.com/store/index.php?main_page=product_info&cPath=3&products_id=', products.products_id) as link, #add your domain
CONCAT('https://domain.com/store/images/', products_image) as image_link, #add your domain
"Your Brand" as brand, #add your brand
"Media > Music & Sound Recordings" as google_product_category, #change your category
products_weight as shipping_weight
INTO OUTFILE 'public_html/products.csv' #make sure there are permissions

FROM products inner join products_description on products.products_id=products_description.products_id
where products_quantity > 0 #below tests for disabled but having enabled and zero quantity is not what you want
AND products_model <> "" #assuming you're using product models, could maybe use products_image in a pinch
AND products_status = 1 #nothing disabled
and products_price_sorter > 1 #nothing under $1