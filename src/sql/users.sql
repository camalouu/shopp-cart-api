
create table users (
	id uuid default uuid_generate_v4 () primary key,
	name text,
	email text,
	password text
);

insert into users (name, email, password)
values('zafar', 'camalouu@gmail.com', 'pass1234');
insert into users (name, email, password)
values('Frodo', 'frodo_beggins@gmail.com', 'ring1234');
insert into users (name, email, password)
values('Bilbo', 'bilbo_the_hobbit@gmail.com', 'wwwf34');
insert into users (name, email, password)
values('Sirius Black', 'Azkaban123@gmail.com', 'wolfie4');
insert into users (name, email, password, id)
values('Arthur Pendragon', 'camelot324@gmail.com', 'a1a2a34a', 'ac3e2b40-8cdb-4393-a641-5a63f36f1b94');
