# Ehealthcare
1.Create Eclipse Dynamic Web Project with this name "Ehealthcare_Final"
2.Replace my src and web content with your project content.
3.Open mysql and run my sql coomands given below.
4.Run index.html..

////Sql Commands
CREATE DATABASE full;

use full;

CREATE TABLE Doctor (
    ID int NOT NULL,
    Name varchar(255),
    Email varchar(255),
    password varchar(255),
    specialist varchar(255),
    phone varchar(255),
    Address varchar(255),
    PRIMARY KEY (ID)
);

CREATE TABLE Patient (
    ID int NOT NULL,
    Name varchar(255),
    Email varchar(255),
    password varchar(255),
    phone varchar(255),
    Status varchar(255),
    disease varchar(255),
    info varchar(255),
    PRIMARY KEY (ID)
);

CREATE TABLE appointment (
    DoctorID int,
    PatientID int,
    Disease varchar(255),    
    Time varchar(255),
    Date varchar(255),
    Medicines varchar(255),
    bill int,
    billStatus varchar(255)
);

CREATE TABLE chat (
    sendid int,
    recid int,
    msg varchar(255)
);


