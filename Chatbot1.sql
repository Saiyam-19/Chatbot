-- Create table for organizations
CREATE TABLE organizations (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

-- Create table for members
CREATE TABLE members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

-- Create table for organization_members to handle many-to-many relationship
CREATE TABLE organization_members (
    organization_id INT REFERENCES organizations(id),
    member_id INT REFERENCES members(id),
    PRIMARY KEY (organization_id, member_id)
);

-- Create table for plans
CREATE TABLE plans (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    created_at TIMESTAMP NOT NULL
);

-- Create table for organization_plan to handle one-to-many relationship
CREATE TABLE organization_plan (
    organization_id INT REFERENCES organizations(id),
    plan_id INT REFERENCES plans(id),
    PRIMARY KEY (organization_id, plan_id)
);

-- Create table for messages
CREATE TABLE messages (
    id INT PRIMARY KEY,
    organization_id INT REFERENCES organizations(id),
    member_id INT REFERENCES members(id),
    message TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    expires_at TIMESTAMP NOT NULL
);

-- Create indexes on foreign keys
CREATE INDEX idx_organization_members_organization_id ON organization_members(organization_id);
CREATE INDEX idx_organization_members_member_id ON organization_members(member_id);
CREATE INDEX idx_organization_plan_organization_id ON organization_plan(organization_id);
CREATE INDEX idx_organization_plan_plan_id ON organization_plan(plan_id);
CREATE INDEX idx_messages_organization_id ON messages(organization_id);
CREATE INDEX idx_messages_member_id ON messages(member_id);



ALTER TABLE organization_members ADD CONSTRAINT fk_organization_members_organization_id FOREIGN KEY (organization_id) REFERENCES organizations(id);
ALTER TABLE organization_members ADD CONSTRAINT fk_organization_members_member_id FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE organization_plan ADD CONSTRAINT fk_organization_plan_organization_id FOREIGN KEY (organization_id) REFERENCES organizations(id);
ALTER TABLE organization_plan ADD CONSTRAINT fk_organization_plan_plan_id FOREIGN KEY (plan_id) REFERENCES plans


----Inserting data into organization table
INSERT INTO organizations (id,name,created_at) 
VALUES(1,'Juanita Gantley','6/3/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(2,'Egor Towriss','8/3/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(3,'Jodie Pirazzi','12/5/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(4,'Lurline Martel','8/24/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(5,'Teddy Brandin','1/23/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(6,'Jethro Sawney','3/12/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(7,'Magdaia Elder','6/24/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(8,'Curtice Filipchikov','9/6/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(9,'Penelope Emmer','8/30/2022');
INSERT INTO organizations (id,name,created_at) 
VALUES(10,'Mikol Duguid','8/17/2022');

---Inserting data into member table

insert into members (id, name, email, created_at) values (1, 'Xenia Kenaway', 'xkenaway0@miibeian.gov.cn', '2/1/2022');
insert into members (id, name, email, created_at) values (2, 'Maureene Dight', 'mdight1@salon.com', '8/30/2022');
insert into members (id, name, email, created_at) values (3, 'Donni Jirus', 'djirus2@hao123.com', '11/30/2022');
insert into members (id, name, email, created_at) values (4, 'Thornton Bernholt', 'tbernholt3@engadget.com', '5/19/2022');
insert into members (id, name, email, created_at) values (5, 'Grata McWilliam', 'gmcwilliam4@sciencedaily.com', '10/2/2022');
insert into members (id, name, email, created_at) values (6, 'Traci Smardon', 'tsmardon5@oracle.com', '2/22/2022');
insert into members (id, name, email, created_at) values (7, 'Doll Plaistowe', 'dplaistowe6@w3.org', '3/6/2022');
insert into members (id, name, email, created_at) values (8, 'Betsey Collicott', 'bcollicott7@ted.com', '3/24/2022');
insert into members (id, name, email, created_at) values (9, 'Karia Jays', 'kjays8@java.com', '7/8/2022');
insert into members (id, name, email, created_at) values (10, 'Arnie Delucia', 'adelucia9@weibo.com', '5/16/2022');
