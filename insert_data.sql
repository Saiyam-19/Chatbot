-- Input data into organizations table
INSERT INTO organizations (id,name) VALUES (1,'Organization 1');
INSERT INTO organizations (id,name) VALUES (2,'Organization 2');
INSERT INTO organizations (id,name) VALUES (3,'Organization 3');
INSERT INTO organizations (id,name) VALUES (4,'Organization 4');
INSERT INTO organizations (id,name) VALUES (5,'Organization 5');

-- Input data into members table
INSERT INTO members (id,username, email, password) VALUES (1,'User 1', 'user1@example.com', 'password1');
INSERT INTO members (id,username, email, password) VALUES (2,'User 2', 'user2@example.com', 'password2');
INSERT INTO members (id,username, email, password) VALUES (3,'User 3', 'user3@example.com', 'password3');
INSERT INTO members (id,username, email, password) VALUES (4,'User 4', 'user4@example.com', 'password4');
INSERT INTO members (id,username, email, password) VALUES (5,'User 5', 'user5@example.com', 'password5');
INSERT INTO members (id,username, email, password) VALUES (6,'User 6', 'user6@example.com', 'password6');
INSERT INTO members (id,username, email, password) VALUES (7,'User 7', 'user7@example.com', 'password7');
INSERT INTO members (id,username, email, password) VALUES (8,'User 8', 'user8@example.com', 'password8');
INSERT INTO members (id,username, email, password) VALUES (9,'User 9', 'user9@example.com', 'password9');

-- Input data into organization members table
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (1, 1, 'organization_head');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (1, 2, 'member');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (1, 4, 'member');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (2, 3, 'organization_head');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (2, 5, 'member');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (2, 8, 'member');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (2, 7, 'member');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (3, 5, 'organization_head');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (3, 6, 'member');
INSERT INTO organization_members (organization_id, member_id, organization_member_role) VALUES (3, 3, 'member');

-- Input data into plans table
INSERT INTO plans (id,name, duration) VALUES (1,'Plan 1', 60);
INSERT INTO plans (id,name, duration) VALUES (2,'Plan 2', 1095);


-- Input data into organization plans table
INSERT INTO organization_plans (organization_id, plan_id) VALUES (1, 1);
INSERT INTO organization_plans (organization_id, plan_id) VALUES (2, 2);
INSERT INTO organization_plans (organization_id, plan_id) VALUES (3, 1);
INSERT INTO organization_plans (organization_id, plan_id) VALUES (4, 2);
INSERT INTO organization_plans (organization_id, plan_id) VALUES (5, 2);

-- Input data into channels table
INSERT INTO channels (id,channel_type, name) VALUES (1,'preosnal', 'Channel 1');
INSERT INTO channels (id,channel_type, name) VALUES (2,'preosnal', 'Channel 2');
INSERT INTO channels (id,channel_type, name) VALUES (3,'group', 'Channel 3');
INSERT INTO channels (id,channel_type, name) VALUES (4,'group', 'Channel 4');
INSERT INTO channels (id,channel_type, name) VALUES (5,'group', 'Channel 5');
INSERT INTO channels (id,channel_type, name) VALUES (6,'group', 'Channel 6');
INSERT INTO channels (id,channel_type, name) VALUES (7,'preosnal', 'Channel 7');
INSERT INTO channels (id,channel_type, name) VALUES (8,'preosnal', 'Channel 8');

-- Input data into channel members table
INSERT INTO channel_members (channel_id, member_id, status) VALUES (1, 1, 'active');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (2, 2, 'inactive');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (3, 3, 'inactive');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (4, 4, 'active');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (5, 5, 'inactive');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (4, 9, 'active');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (4, 7, 'inactive');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (5, 8, 'inactive');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (3, 6, 'active');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (2, 5, 'inactive');
INSERT INTO channel_members (channel_id, member_id, status) VALUES (1, 4, 'inactive');

-- Input data into messages table
INSERT INTO messages (channel_id, member_id, message) VALUES (1, 1, 'Hello world');
INSERT INTO messages (channel_id, member_id, message) VALUES (1, 4, 'Hi!');
INSERT INTO messages (channel_id, member_id, message) VALUES (4, 9, 'Hello world');
INSERT INTO messages (channel_id, member_id, message) VALUES (4, 9, 'Hello!');
INSERT INTO messages (channel_id, member_id, message) VALUES (2, 2, 'How are you?');
INSERT INTO messages (channel_id, member_id, message) VALUES (3, 3, 'Nice to meet you');
INSERT INTO messages (channel_id, member_id, message) VALUES (4, 4, 'What are you up to?');
INSERT INTO messages (channel_id, member_id, message) VALUES (5, 5, 'Have a good day!');

-- Input data into message read table
INSERT INTO message_read (message_id, member_id, is_read) VALUES (1, 1, true);
INSERT INTO message_read (message_id, member_id, is_read) VALUES (2, 2, true);
INSERT INTO message_read (message_id, member_id, is_read) VALUES (3, 3, false);
INSERT INTO message_read (message_id, member_id, is_read) VALUES (4, 4, true);
INSERT INTO message_read (message_id, member_id, is_read) VALUES (5, 5, false);