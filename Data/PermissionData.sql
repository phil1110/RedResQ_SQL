insert into Permission (PermissionName, RoleID)
VALUES
    -- News related Permissions
    ('publishArticle', 3),
    ('editArticle', 3),
    ('deleteArticle', 5),

    -- Permission related Permissions
    ('updatePermission', 6),

    -- Country related Permissions
    ('addCountry', 6),
    ('editCountry', 6),
    ('deleteCountry', 6),

    -- Gender related Permissions
    ('getGender', 1),
    ('addGender', 5),
    ('editGender', 5),
    ('deleteGender', 5),

    -- Language related Permissions
    ('addLanguage', 5),
    ('editLanguage', 5),
    ('deleteLanguage', 5),
    ('getLocation', 1),
    ('searchLocation', 1),
    ('addLocation', 1),
    ('editLocation', 5),
    ('deleteLocation', 5),

    -- User related Permissions
    ('fetchUsers', 4),
    ('getAnyUser', 4),
    ('getPersonalUser', 2),
    ('editUser', 5),
    ('deleteUser', 5),
    ('promoteToEditor', 5),
    ('promoteToModerator', 5),
    ('promoteToAdministrator', 6),
    ('promoteToSuperAdministrator', 6),
    ('searchForUser', 4),
    ('checkExistenceOfEmailOrUsername', 1),

    -- Role related Permissions
    ('getRole', 5),
    ('fetchRoles', 5);