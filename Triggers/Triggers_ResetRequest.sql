CREATE trigger AddExpirationDate
ON ResetRequest
for INSERT
as
    UPDATE ResetRequest
    SET ResetRequest.ExpirationDate = DATEADD(mi, 10, ResetRequest.CreationDate)
    FROM ResetRequest
    INNER JOIN inserted ON ResetRequest.ID = inserted.ID
go;