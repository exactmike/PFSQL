--this query produces a list of top level public folders that we recommend moving into a PST Archive (per top level folder)
--critera includes
	--folder and subfolders together contain less than 50GB data
	--last used\created BEFORE 2019
	--only one mail enabled folder in the top level folder and subfolders


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
  HasSubFolders = 1
  AND TotalItemSizeGB < 50 
  AND (sLastUserAccessTime < '2019-01-01' OR sLastUserAccessTime IS NULL)
  AND CreationTime < '2019-01-01'
  AND MailEnabledFolderCount < 2
  AND ParentPath = '\'
  
  ORDER BY [Identity]
	

