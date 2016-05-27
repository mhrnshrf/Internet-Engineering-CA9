drop table cust_roles if exists;
drop table symbols if exists;
drop table requests if exists;
drop table has_share if exists;
drop table transactions if exists;
drop table customers if exists;
drop table customer if exists;
drop table roles if exists;

create table customers (
    code integer not null,
    id integer not null,
    pass varchar(100) not null,
    cash integer not null,
    name varchar(100) not null,
    family varchar(100) not null,
    email varchar(100) not null,
    primary key (id)
);

create table symbols (
    name varchar(100) not null,
    primary key (name)
);

create table has_share (
    id integer not null,
    name varchar(100) not null,
    share_count integer default 0,
    primary key (id, name),
);

create table requests (
    id integer not null,
    name varchar(100) not null,
    req_id integer not null,
    status varchar(100) not null,
    req_value integer default 0,
    req_count integer default 0,
    req_time timestamp,
    req_type varchar(100) not null,
    req_pro varchar(100) not null,
    cust_id integer not null,

    primary key (req_id),
);

create table transactions (
    req_id1 integer not null,
    req_id2 integer not null,
    trans_time timestamp not null,

    primary key (req_id1, req_id2),
);

create table cust_roles (
    id integer not null,
    user_role varchar(100) not null,
    primary key (id, user_role),
    constraint custs_id_fk foreign key(id) references customers(id)
);

create table roles (
   user_role varchar(100) not null,
   primary key(user_role)
);


insert into customers values (1, 1, '1', 0, 'Farshad', 'Fallah', 'farfallah@ymail.com');
insert into cust_roles values(1, 'admin');

insert into roles values('admin');
insert into roles values('member');
insert into roles values('owner');
insert into roles values('officer');
