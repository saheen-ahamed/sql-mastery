-- drop users;
-- drop projects;
-- drop project_user;

-- create table users(
--     user_id number,
--     username varchar(50 char),
--     constraint users_pk primary key (user_id));
    
-- create table projects(
--     project_id number,
--     project_name varchar(50 char),
--     creator number,
--     constraint project_pk primary key (project_id),
--     constraint project_user_fk foreign key (creator) references users (user_id)
--     on delete cascade);

-- COMPOSITE PRIMARY KEY

-- create table project_user(
--     user_id not null references users (user_id),
--     project_id not null references projects (project_id),
--     constraint project_user_pk primary key (user_id, project_id));

-- INSERT

-- insert into users (user_id, username) values (1, 'Saheen');
-- insert into users (user_id, username) values (2, 'Kumar');

-- MULTIPLE INSERTS

-- insert all
--     into users (user_id, username) values (3, 'Khan')
--     into users (user_id, username) values (4, 'Kamal')
--     select 1 from dual;


-- insert into projects (project_id, project_name, creator) values (1, 'pygame', 1);

-- insert into project_user (user_id, project_id) values (1, 1);

-- INDEXES

-- create index project_creator_idx on projects (creator);
-- drop index project_creator_idx;

-- UPDATE
-- update users
-- set username= 'Kumar'
-- where username = 'Ahamed';

select * from users;
