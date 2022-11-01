
create table products (
	id uuid default uuid_generate_v4 (),
	title text,
	description text,
	price int,
	primary key(id)
);

insert into products (title, description, price)
values ('Apple Macbook Air M2', 'Apple Macbook Air M2', 1200);
insert into products (title, description, price)
values ('Lenovo L340 gaming', 'Good price for gaming laptop', 1300);
insert into products (title, description, price)
values ('Apple Macbook Pro 14', 'MacBook Pro with the incredibly powerful M1 Pro or M1 Max chip', 1500);
insert into products (title, description, price)
values ('Dell XPS 13', 'Dell XPS 13 is a Windows 10 laptop with a 13.30-inch display.', 1200); 
