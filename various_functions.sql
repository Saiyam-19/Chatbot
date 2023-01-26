-- Write a query to fetch the chat of any two people
SELECT m.message, m.created_at, m.is_starred, mem.username
FROM messages m
JOIN members mem ON m.member_id = mem.id
WHERE (m.member_id = {user1_id} OR m.member_id = {user2_id})
AND m.channel_id = {channel_id}
ORDER BY m.created_at;

-- Write a query to fetch all the unread messages and user data who posted those messages in a channel
SELECT m.id, m.message, m.created_at, mem.username FROM messages m JOIN members mem ON m.member_id = mem.id JOIN message_read mr ON m.id = mr.message_id WHERE mr.is_read = false AND mr.member_id = 3 AND m.channel_id = 3 ORDER BY m.created_at;

-- Write a query to fetch all active and inactive members in a channel
SELECT mem.username, cm.status
FROM channel_members cm
JOIN members mem ON cm.member_id = mem.id
WHERE cm.channel_id = {channel_id}
ORDER BY cm.status;

-- Write a query to delete or add any member from an organization
-- To delete a member from an organization
DELETE FROM organization_members
WHERE organization_id = {organization_id}
AND member_id = {member_id};

-- To add a member to an organization
INSERT INTO organization_members (organization_id, member_id, role)
VALUES ({organization_id}, {member_id}, 'member');

-- Write a query that will search for users and messages like slack does.
SELECT m.id, m.message, m.created_at, mem.username
FROM messages m
JOIN members mem ON m.member_id = mem.id
WHERE (mem.username ILIKE '%{search_text}%' OR m.message ILIKE '%{search_text}%')
AND m.channel_id = {channel_id}
ORDER BY m.created_at;

-- Write a query to star messages
UPDATE messages
SET is_starred = true
WHERE id = {message_id};

-- Write a query to get most active people in an organization
SELECT mem.username, COUNT(m.id) as message_count
FROM messages m
JOIN members mem ON m.member_id = mem.id
WHERE m.channel_id IN (
  SELECT id
  FROM channels
  WHERE organization_id = {organization_id}
)
GROUP BY mem.username
ORDER BY message_count DESC
LIMIT {n};
