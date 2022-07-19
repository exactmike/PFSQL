/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
		t.EntryId
	  ,	t.[Identity]
	  ,	t.MapiIdentity
	  ,	t.Name
	  ,	t.ParentPath
	  ,	t.FolderType
	  , t.ReplicaCount
	  , t.Replicas
	  ,	t.HasRules
	  ,	t.HasModerator
	  	  , HasItems = CASE
		 WHEN s.ItemCount = 0 THEN 0
		 ELSE 1
		 END
	  ,	t.HasSubFolders
      , c.[sCount] as FolderCount
	  , t.MailEnabled
	  , e.MailEnabledFolderCount
	  , t.HiddenFromAddressListsEnabled
	  , m.sCreationTime
	  , m.sLastAccessTime
	  , m.sLastModificationTime
	  , m.sLastUserAccessTime
	  , m.sLastUserModificationTime
	  , s.CreationTime
	  , s.DeletedItemCount
	  , s.ItemCount
	  , s.LastAccessTime
	  , s.LastModificationTime
	  , s.LastUserAccessTime
	  , s.LastUserModificationTime
	  , s.OwnerCount
	  , s.TotalDeletedItemSize
	  , s.TotalDeletedItemSizeGB
	  , s.TotalItemSize
	  , s.TotalItemSizeGB
	  ,	t.AgeLimit
	  , t.MaxItemSize
	  , t.IssueWarningQuota
	  , t.ProhibitPostQuota
	  , t.RetainDeletedItemsFor
	  , t.UseDatabaseAgeDefaults
	  , t.UseDatabaseQuotaDefaults
	  , t.UseDatabaseReplicationSchedule
	  , t.ReplicationSchedule
	  , t.UseDatabaseRetentionDefaults
  --INTO PFTreeWithStats
  FROM PFData.dbo.AllPFTreeMailEnabled e
  LEFT JOIN [PFData].[dbo].[PFTreeCountSubs] as c ON e.EntryID = c.EntryID
  LEFT JOIN PFData.dbo.pftreeMaxSubs m ON e.EntryID = m.EntryID
  LEFT JOIN PFData.dbo.PFTreeMaxStats s ON e.EntryID = s.EntryID
  LEFT JOIN PFData.dbo.PFTree t ON e.EntryID = t.EntryId
  --ORDER BY e.MailEnabledFolderCount DESC