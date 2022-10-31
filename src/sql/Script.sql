drop table if exists 
carts, cart_items, products, users, orders;

create extension if not exists "uuid-ossp";

select * from carts;
select * from products;
select * from cart_items;
select * from users;

/* select all carts of a user*/
select 
c.user_id,
c.id as cart_id,
c_i.count,
p.id as product_id,
p.title,
p.price,
p.description
from cart_items c_i
join products p 
on (c_i.product_id=p.id)
join carts c
on (c.id=c_i.cart_id)
where c.user_id='ac3e2b40-8cdb-4393-a641-5a63f36f1b94';



