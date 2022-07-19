SELECT [EntryId]
      ,[Identity]
      ,[MapiIdentity]
      ,[Name]
      ,[ParentPath]
      ,[FolderType]
      ,[ReplicaCount]
      ,[Replicas]
      ,[HasRules]
      ,[HasModerator]
      ,[HasItems]
      ,[HasSubFolders]
      ,[FolderCount]
      ,[MailEnabled]
      ,[MailEnabledFolderCount]
      ,[HiddenFromAddressListsEnabled]
      ,[sCreationTime]
      ,[sLastAccessTime]
      ,[sLastModificationTime]
      ,[sLastUserAccessTime]
      ,[sLastUserModificationTime]
      ,[CreationTime]
      ,[DeletedItemCount]
      ,[ItemCount]
      ,[LastAccessTime]
      ,[LastModificationTime]
      ,[LastUserAccessTime]
      ,[LastUserModificationTime]
      ,[OwnerCount]
      ,[TotalDeletedItemSize]
      ,[TotalDeletedItemSizeGB]
      ,[TotalItemSize]
      ,[TotalItemSizeGB]
      ,[AgeLimit]
      ,[MaxItemSize]
      ,[IssueWarningQuota]
      ,[ProhibitPostQuota]
      ,[RetainDeletedItemsFor]
      ,[UseDatabaseAgeDefaults]
      ,[UseDatabaseQuotaDefaults]
      ,[UseDatabaseReplicationSchedule]
      ,[ReplicationSchedule]
      ,[UseDatabaseRetentionDefaults]
  FROM [dbo].[PFTreeWithStats]
  WHERE 
  ParentPath NOT IN 
  (
	SELECT [MapiIdentity]
	FROM [dbo].[PFTreeWithStats]
	WHERE 
		HasSubFolders = 1
		AND TotalItemSizeGB < 50 
		AND sLastUserAccessTime > '2019-01-01'
		AND MailEnabledFolderCount < 2
		AND ParentPath = '\'
  )
  AND HasSubFolders = 0
  AND HasItems = 1
  AND MailEnabled = 0
  AND TotalItemSizeGB < 40 
  AND sLastUserAccessTime < '2019-01-01'
  AND CreationTime < '2019-01-01'
  ORDER BY TotalItemSizeGB DESC


