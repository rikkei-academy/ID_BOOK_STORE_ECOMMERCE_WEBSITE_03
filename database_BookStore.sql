         use bookstore;
create table Books (
    bookId int primary key auto_increment,
    bookName nvarchar(100),
    image text,
    title text,
    author nvarchar(50),
    years int,
    quantity int,
    price float,
    ediitonLanguage nvarchar(100),
    publisher nvarchar(100),
    sale int,
    bookFormat nvarchar(100),
    bookStatus bit,
    categoryId int,
    orderDetailId int,
    foreign key (categoryId) references category(categoryId),
    foreign key (orderDetailId) references orderDetail(orderDetailId)

);
create table User (
                       userId int primary key auto_increment,
                       userName nvarchar(100),
                       firstName nvarchar(50),
                       lastName nvarchar(50),
                       userPassword text,
                       email nvarchar(50),
                       phone nvarchar(20),
                       address nvarchar(200),
                       city nvarchar(100),
                       postCode int,
                       state nvarchar(50),
                       userStatus bit
);
create table category(
    categoryId int primary key auto_increment,
    categoryName nvarchar(100),
    categoryStatus bit
);

create table comment(
    commentId int primary key auto_increment,
    content text,
    userId int,
    booksId int,
    foreign key (userId) references user(userId),
    foreign key (booksId) references books(bookId)
);
create table orders(
    orderId int primary key auto_increment,
    total float,
    created datetime,
    userId int,
    foreign key (userId) references user(userId)
);
create table orderDetail(
    orderDetailId int primary key  auto_increment,
    price float,
    quantity int,
    totalDetail float,
    orderId int,
    foreign key (orderId) references orders(orderId)
);
create table star(
    starId int primary key auto_increment,
    starChoose int,
    userId int,
    booksId int,
    foreign key (userId) references user(userId),
    foreign key (booksId) references books(bookId)
);
create table tag(
    tagId int primary key auto_increment
);
create table tagBooks(
    tagId int,
    booksId int,
    foreign key (tagId) references tag(tagId),
    foreign key (booksId) references books(bookId)
);
create table wishlist(
        wishlistId int primary key auto_increment,
        userId int,
        booksId int,
        foreign key (userId) references user(userId),
        foreign key (booksId) references books(bookId)
);

