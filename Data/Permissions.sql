insert into Permission (PermissionName, RoleID)
VALUES
    -- Answer related Permissions
    ('getAnswer', 3),
    ('addAnswer', 3),
    ('editAnswer', 3),
    ('deleteAnswer', 5),

    -- Attempt related Permissions
    ('getResult', 2),
    ('addAttempt', 2),

    -- Auth related Permissions
    ('register', 1),
    ('login', 1),

    -- Coordinates related Permissions
    ('logCoordinates', 2),

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

    -- Hazard related Permissions
    ('getHazard', 5),
    ('addHazard', 5),
    ('editHazard', 5),
    ('deleteHazard', 6),

    -- HazardTopic related Permissions
    ('getTopics', 2),

    -- HazardType related Permission
    ('getHazardType', 5),
    ('addHazardType', 5),
    ('editHazardType', 5),
    ('deleteHazardType', 6),

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

    -- News related Permissions
    ('getArticle', 2),
    ('publishArticle', 3),
    ('editArticle', 3),
    ('deleteArticle', 5),

    -- Notification related Permissions
    ('sendNotification', 4),

    -- Permission related Permissions
    ('getPermission', 6),
    ('updatePermission', 6),

    -- Question related Permissions
    ('getQuestion', 3),
    ('addQuestion', 3),
    ('editQuestion', 3),
    ('deleteQuestion', 5),

    -- Quiz related Permissions
    ('getQuiz', 2),
    ('addQuiz', 3),
    ('editQuiz', 3),
    ('deleteQuiz', 5),

    -- QuizType related Permissions
    ('getQuizType', 2),
    ('addQuizType', 3),
    ('editQuizType', 3),
    ('deleteQuizType', 5),

    -- Reset Request related Permissions
    ('requestReset', 1),
    ('confirmReset', 1),
    ('checkReset', 1),

    -- Role related Permissions
    ('getRole', 5),
    ('fetchRoles', 5),

    -- User related Permissions
    ('fetchUsers', 4),
    ('getSpecificUser', 4),
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
    ('checkExistenceOfEmail', 1),
    ('checkExistenceOfUsername', 1);