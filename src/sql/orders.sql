
create table orders (
	id uuid default uuid_generate (),
	user_id uuid,
	cart_id uuid,
	payment json,
	delivery json,
	comments text,
	status text,
	total int,
	foreign key(user_id) references users(id),
	foreign key(cart_id) references carts(id)
)
