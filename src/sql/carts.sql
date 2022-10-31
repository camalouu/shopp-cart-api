
create table carts (
  id uuid default uuid_generate_v4 (),
  created_at timestamp(3) not null default current_timestamp,
  updated_at timestamp(3) not null,
  user_id int foreign key references users(id),
  primary key(id)
);

insert into carts (updated_at, user_id) 
values (make_date(2022, 10, 31), '322ade4b-2728-49f3-9a63-6c45e41fe1c9');

insert into carts (updated_at, user_id) 
values (make_date(2022, 11, 1), 'ec59df3c-6043-42d7-bf31-136025593f45');

insert into carts (updated_at, user_id) 
values (make_date(2022, 11, 3), '6966802f-bb8d-4963-8a6e-dda042dbdcea');

insert into carts (updated_at, user_id) 
values (make_date(2022, 11, 5), '4aee816b-962f-43e1-bd8e-d6e3bf9413c9');

insert into carts (updated_at, user_id)
values (make_date(2022, 11, 9), '4aee816b-962f-43e1-bd8e-d6e3bf9413c9');

insert into carts (updated_at, user_id) 
values (make_date(2010, 1, 1), 'ec59df3c-6043-42d7-bf31-136025593f45');
