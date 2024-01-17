insert into Permission (PermissionName, RoleID)
VALUES
    -- News related Permissions
    ('getArticle', 2),
    ('publishArticle', 3),
    ('editArticle', 3),
    ('deleteArticle', 5),

    -- Permission related Permissions
    ('getPermission', 6),
    ('updatePermission', 6),

    -- Country related Permissions
    ('getCountry', 1),
    ('addCountry', 6),
    ('editCountry', 6),
    ('deleteCountry', 6),

    -- Gender related Permissions
    ('getGender', 1),
    ('addGender', 5),
    ('editGender', 5),
    ('deleteGender', 5),

    -- Language related Permissions
    ('getLanguage', 1),
    ('addLanguage', 5),
    ('editLanguage', 5),
    ('deleteLanguage', 5),

    -- Location related Permissions
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
    ('editPersonalUser', 2),
    ('deleteUser', 5),
    ('deletePersonalUser', 2),
    ('promoteToEditor', 5),
    ('promoteToModerator', 5),
    ('promoteToAdministrator', 6),
    ('promoteToSuperAdministrator', 6),
    ('searchForUser', 4),
    ('checkExistenceOfEmailOrUsername', 1),

    -- Image related Permissions
    ('getImage', 2),
    ('addImage', 3),
    ('deleteImage', 5),
    ('searchImage', 2),

    -- Role related Permissions
    ('getRole', 5),
    ('fetchRoles', 5),

    -- Session related Permissions
    ('register', 1),
    ('login', 1),

    -- Reset related Permissions
    ('requestReset', 1),
    ('confirmReset', 1),
    ('checkReset', 1);