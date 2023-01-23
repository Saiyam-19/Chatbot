CREATE TABLE organizations (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Members table
CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Organization members table
CREATE TYPE roles as ENUM('organization_head', 'member');
CREATE TABLE organization_members (
  organization_id INT REFERENCES organizations(id),
  member_id INT REFERENCES members(id),
  organization_member_role roles ,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);
-- Plans table
CREATE TABLE plans (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  duration INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Organization plans table
CREATE TABLE organization_plans (
  organization_id INT REFERENCES organizations(id),
  plan_id INT REFERENCES plans(id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Channels table
CREATE TYPE channel_type as ENUM('Personal', 'Group');
CREATE TABLE channels (
  id SERIAL PRIMARY KEY,
  channel_type channel_type;
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);
-- Organization_Channel
CREATE TABLE organization_channel(
    channel_id INT REFERENCES channels(id),
    organization_id INT REFERENCES organizations(id),
);
-- Channel members table
CREATE TYPE statuses as ENUM('active', 'inactive');
CREATE TABLE channel_members (
  channel_id INT REFERENCES channels(id),
  member_id INT REFERENCES members(id),
  status statuses,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Messages table
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  channel_id INT REFERENCES channels(id),
  member_id INT REFERENCES members(id),
  message TEXT NOT NULL,
  is_starred BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Message read table
CREATE TABLE message_read (
  message_id INT REFERENCES messages(id),
  member_id INT REFERENCES members(id),
  is_read BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Indexes for plans table
CREATE INDEX plans_name_idx ON plans (name);

-- Constraints for organization plans table
ALTER TABLE organization_plans ADD CONSTRAINT organization_plan_unique UNIQUE (organization_id, plan_id);

-- Indexes for channels table
CREATE INDEX channels_name_idx ON channels (name);
CREATE INDEX channels_organization_id_idx ON channels (organization_id);

-- Indexes for organization_channels able
CREATE INDEX channels_id_idx ON channels (id);
CREATE INDEX organization_id_idx ON organizations (id);

-- Constraints for channel members table
ALTER TABLE channel_members ADD CONSTRAINT channel_member_unique UNIQUE (channel_id, member_id);

-- Indexes for messages table
CREATE INDEX messages_channel_id_idx ON messages (channel_id);
CREATE INDEX messages_member_id_idx ON messages (member_id);

-- Constraints for message read table
ALTER TABLE message_read ADD CONSTRAINT message_read_unique UNIQUE (message_id, member_id);
ALTER TABLE message_read ADD CHECK (is_read IN (true, false));








-- create new table for organization_channel 
-- add channel type attribute in channerls table
-- plan table only 2 entry
-- organization_plan would have plan id as 1 or 2
