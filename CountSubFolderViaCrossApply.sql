SELECT t.EntryID
, su.sCount
INTO PFTreeCountSubs
FROM PFTree AS t
CROSS APPLY (
	SELECT
	Count(a.EntryId) As sCount
	FROM PFTree AS a
	WHERE (t.EntryId = a.EntryId OR a.ParentPath LIKE (t.MapiIdentity + '%'))
) su
WHERE t.HasSubFolders = 1
--AND t.EntryId = ''