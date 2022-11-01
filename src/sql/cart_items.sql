
create table cart_items (
	cart_id uuid,
	product_id uuid,
	count int,
	foreign key(cart_id) references carts(id),
	foreign key(product_id) references products(id)
);

insert into cart_items (cart_id, product_id, count)
values ('687ab043-b5e7-464b-9fe7-cff0267c009e', 'bab000f8-a390-46a8-b948-e25eda3e126f', 23);

insert into cart_items (cart_id, product_id, count)
values ('687ab043-b5e7-464b-9fe7-cff0267c009e', '3414b013-8b8a-4693-8693-f6d06d188010', 98);

insert into cart_items (cart_id, product_id, count)
values ('3c7ef4f6-d392-4184-8697-2d19a1513364', '4017f637-5364-41f0-81f9-406fa0b5e683', 44);

insert into cart_items (cart_id, product_id, count)
values ('db7379d0-9410-465b-ba1b-b6f14230e8e8', '6e68b154-8f0d-4eaf-b378-80da79317687', 44);

