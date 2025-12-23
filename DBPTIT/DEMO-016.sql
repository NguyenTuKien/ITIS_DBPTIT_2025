alter table Orders 
modify order_id int not null AUTO_INCREMENT primary key,
modify customer_name VARCHAR(100) not null,
modify order_date date,
modify status enum('PENDING', 'PAID', 'SHIPPED', 'CANCELLED') not null default 'PENDING',
modify total_amount decimal(10,2),
add payment_method enum('CASH', 'CARD', 'TRANSFER') not null default 'CASH'