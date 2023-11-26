-- Adding a login to the database with a username and password to be used for the User
USE [master]
GO
CREATE LOGIN [api] WITH PASSWORD=N'password', DEFAULT_DATABASE=[RedResQ], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO;

-- Create the User with all needed permissions using the created Login
USE [RedResQ]
GO
CREATE USER [api] FOR LOGIN [api] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [RedResQ]
GO
ALTER ROLE [db_datareader] ADD MEMBER [api]
GO
USE [RedResQ]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [api]
GO
use [RedResQ]
GO
GRANT UPDATE ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT ALTER ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT EXECUTE ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT SELECT ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT VIEW DEFINITION ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT INSERT ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT DELETE ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT CREATE SEQUENCE ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT CONTROL ON SCHEMA::[dbo] TO [api]
GO
use [RedResQ]
GO
GRANT REFERENCES ON SCHEMA::[dbo] TO [api]
GO;
