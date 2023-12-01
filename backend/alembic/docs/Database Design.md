# Database Schema:

## 1. Users Table

**Table Name:** `users`

**Columns:**

- `id` (Primary Key, Integer, Auto-increment)
- `username` (String, Unique)
- `email` (String, Unique)
- `password_hash` (String)
- `created_at` (DateTime)
- `updated_at` (DateTime)

## 2. Organizations Table

**Table Name:** `organizations`

**Columns:**

- `id` (Primary Key, Integer, Auto-increment)
- `parent_org_id` (Integer, Foreign Key to organizations.id, Nullable for top-level organizations)
- `name` (String)
- `description` (Text, Nullable)

## 3. Teams Table

**Table Name:** `teams`

**Columns:**

- `id` (Primary Key, Integer, Auto-increment)
- `org_id` (Integer, Foreign Key to organizations.id)
- `name` (String)
- `description` (Text, Nullable)

## 4. UserGroups Table

**Table Name:** `user_groups`

**Columns:**

- `id` (Primary Key, Integer, Auto-increment)
- `name` (String)
- `description` (Text, Nullable)

## 5. UserGroupMembers Table

**Table Name:** `user_group_members`

**Columns:**

- `group_id` (Integer, Foreign Key to user_groups.id)
- `user_id` (Integer, Foreign Key to users.id)

## 6. Resources Table

**Table Name:** `resources`

**Columns:**

- `id` (Primary Key, Integer, Auto-increment)
- `org_id` (Integer, Foreign Key to organizations.id, Nullable)
- `team_id` (Integer, Foreign Key to teams.id, Nullable)
- `name` (String)
- `type` (String)
- `description` (Text, Nullable)

## 7. Actions Table

**Table Name:** `actions`

**Columns:**

- `id` (Primary Key, Integer, Auto-increment)
- `name` (String)
- `description` (Text, Nullable)

## 8. Policies Table

**Table Name:** `policies`

**Columns:**

- `id` (Primary Key, Integer, Auto-increment)
- `resource_id` (Integer, Foreign Key to resources.id)
- `action_id` (Integer, Foreign Key to actions.id)
- `name` (String)
- `description` (Text, Nullable)

## 9. Roles Table

**Table Name:** `roles`

**Columns:**

- `id` (Primary Key, Integer, Auto-increment)
- `name` (String)
- `description` (Text, Nullable)

## 10. RolePolicies Table

**Table Name:** `role_policies`

**Columns:**

- `role_id` (Integer, Foreign Key to roles.id)
- `policy_id` (Integer, Foreign Key to policies.id)

## 11. UserRole Table

**Table Name:** `user_roles`

**Columns:**

- `user_id` (Integer, Foreign Key to users.id)
- `role_id` (Integer, Foreign Key to roles.id)

## 12. UserGroupRoles Table

**Table Name:** `user_group_roles`

**Columns:**

- `group_id` (Integer, Foreign Key to user_groups.id)
- `role_id` (Integer, Foreign Key to roles.id)

## 13. Admins Table

**Table Name:** `admins`

**Columns:**

- `user_id` (Integer, Foreign Key to users.id)
- `org_id` (Integer, Foreign Key to organizations.id, Nullable)
- `team_id` (Integer, Foreign Key to teams.id, Nullable)
- `is_master` (Boolean, Default: False)

# Notes:

- **Organizations and Teams:** The organizations table can represent both organizations and sub-organizations. Top-level organizations have parent_org_id as NULL.
- **Resources:** Resources can be mapped to either an organization or a team.
- **Admins:** The admins table allows you to specify which users are admins at different levels (organization, team), including a master admin.
- **Policy Inheritance:** To handle policy inheritance (e.g., access to an organization grants access to its sub-organizations and teams), you'll need application logic to traverse this hierarchy.
- **Complex Queries:** Some operations, like determining a user's effective permissions, might require complex queries due to the hierarchical nature of the setup.
- **Indices and Optimization:** Be sure to index foreign keys and frequently queried columns for performance optimization.
