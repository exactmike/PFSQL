SELECT t.EntryID
	, MAX(s.LastAccessTime) AS sLastAccessTime
	, MAX(s.LastUserAccessTime) AS sLastUserAccessTime
	, MAX(s.LastModificationTime) AS sLastModificationTime
	, MAX(s.LastUserModificationTime) AS sLastUserModificationTime
	, MAX(s.CreationTime) AS sCreationTime
FROM PFTree AS t
JOIN PFTree AS a
	ON (a.ParentPath LIKE (t.MapiIdentity + '%') OR 
		a.EntryId = t.EntryId) 
	JOIN PFStats AS s
		ON a.EntryID = s.EntryID
WHERE t.HasSubFolders = 1 
--AND t.EntryId = '000000001A447390AA6611CD9BC800AA002FC45A0300003A38A4DC7E624E9708DADD53DCE2C7000000042E660000'
GROUP BY t.EntryId