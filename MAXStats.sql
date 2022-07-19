SELECT t.EntryID
	, MAX(LastAccessTime) AS LastAccessTime
	, MAX(LastUserAccessTime) AS LastUserAccessTime
	, MAX(LastModificationTime) AS LastModificationTime
	, MAX(LastUserModificationTime) AS LastUserModificationTime
	, MAX(OwnerCount) AS OwnerCount
	, MAX(CreationTime) AS CreationTime
	, MAX(ItemCount) AS ItemCount
	, MAX(DeletedItemCount) AS DeletedItemCount
	, MAX(TotalItemSize) AS TotalItemSize
	, MAX(TotalItemSizeGB) AS TotalItemSizeGB
	, MAX(TotalDeletedItemSize) AS TotalDeletedItemSize
	, MAX(TotalDeletedItemSizeGB) AS TotalDeletedItemSizeGB
INTO PFTreeMaxStats
FROM PFStats s JOIN PFTree t ON s.EntryId = t.EntryId
GROUP BY t.EntryID
--Order BY LastUserAccessTime DESC
