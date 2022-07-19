SELECT t.EntryID
--, su.sCount This ended up counting all replicas, not unique folders.
, su.sCreationTime
, su.sLastAccessTime
, su.sLastModificationTime
, su.sLastUserAccessTime
, su.sLastUserModificationTime
--INTO PFTreeMaxSubs
FROM PFTree AS t
CROSS APPLY (
	SELECT
	Count(a.EntryId) As sCount
	, MAX(s.LastAccessTime) AS sLastAccessTime
	, MAX(s.LastUserAccessTime) AS sLastUserAccessTime
	, MAX(s.LastModificationTime) AS sLastModificationTime
	, MAX(s.LastUserModificationTime) AS sLastUserModificationTime
	, MAX(s.CreationTime) AS sCreationTime
	FROM PFStats s
	JOIN PFTree a ON a.EntryId = s.EntryId
	WHERE (t.EntryId = a.EntryId OR a.ParentPath LIKE (t.MapiIdentity + '%'))
) su
WHERE t.HasSubFolders = 1
--AND t.EntryId = ''