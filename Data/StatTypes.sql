use RedResQ
go

-- 1 for Bar
-- 2 for Pie
-- 3 for Line

INSERT INTO StatType ([name])
VALUES
    -- Access StatTypes
    ('Access_3_DailyAccessesFromLastWeek'),

    -- Quiz StatTypes
    ('Quiz_1_LeastAttempts'),
    ('Quiz_1_MostAttempts'),

    -- User StatTypes
    ('User_2_UsersByGender');