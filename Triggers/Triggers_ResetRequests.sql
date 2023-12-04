CREATE trigger AddExpirationDate
ON ResetRequests
for INSERT
as
    UPDATE ResetRequests
    SET ResetRequests.ExpirationDate = DATEADD(mi, 10, ResetRequests.CreationDate)
    FROM ResetRequests
    INNER JOIN inserted ON ResetRequests.ID = inserted.ID
go;