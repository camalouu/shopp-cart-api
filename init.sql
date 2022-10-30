drop table if exists cart, cart_items;

create table cart (
  id uuid default uuid_generate_v4 (),
  created_at timestamp(3) not null default current_timestamp,
  updated_at timestamp(3) not null,
  primary key(id)
);

create table cart_items (
	cart_id uuid,
	product_id uuid,
	count int,
	foreign key(cart_id) references cart(id)
);

create extension if not exists "uuid-ossp";

insert into cart (updated_at) values (make_date(2022, 10, 31));
insert into cart (updated_at) values (make_date(2022, 11, 1));
insert into cart (updated_at) values (make_date(2022, 11, 3));
insert into cart (updated_at) values (make_date(2022, 11, 5));
insert into cart (updated_at) values (make_date(2022, 11, 9));


insert into cart_items (cart_id, product_id, count)
values ('7247db20-3046-4e33-b8a4-5f5922b9070a', uuid_generate_v4(), 100);

insert into cart_items (cart_id, product_id, count)
values ('7302d179-790d-4eaf-bf9a-c26ad9c409df', uuid_generate_v4(), 190);

select * from cart;

select * from cart_items
inner join cart 
on cart_items.cart_id=cart.id;
