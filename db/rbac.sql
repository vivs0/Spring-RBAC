create database rbac;
use rbac;
create table `Users`
(
	user_id varchar(255) primary key,
    full_name varchar(255),
    email_id varchar(255) unique not null,
    mobile varchar(10) unique,
    is_activated boolean,
    Country varchar(255),
    created_at timestamp not null default now(),
    modified_at timestamp not null default now()
);

create table Roles
(
	role_id varchar(10) primary key,
    role_name varchar(50),
    role_description varchar(255)
);

create table User_Roles
(
	userRoleId int primary key auto_increment,
    user_id varchar(255),
    role_id varchar(10),
    created_at timestamp not null default now(),
    modified_at timestamp not null default now(),
    created_by varchar(255),
    modified_by varchar(255),
    foreign key(user_id) references `Users`(email_id),
    foreign key(role_id) references Roles(role_id),
    foreign key(created_by) references `Users`(user_id),
    foreign key(modified_by) references `Users`(user_id)
);

insert into Roles(role_id, role_name, role_description)values('ADM','Admin',null);
insert into Roles(role_id, role_name, role_description)values('USR','Normal User',null);
insert into Roles(role_id, role_name, role_description)values('ADV','Advanced User',null);
