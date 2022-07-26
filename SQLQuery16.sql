/****** Script for SelectTopNRows command from SSMS  ******/
Select SUM(L.TotalItemSizeGB) FROM
(
		SELECT TOP (100000) [EntryId]
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
	  FROM [PFData].[dbo].[PFTreeWithStats]
	  WHERE HasSubFolders = 0
	  AND HasItems = 1
	  AND LastUserAccessTime < '2019-01-01'
	  AND ParentPath <> '\'
	  ORDER BY TotalItemSizeGB DESC
 ) AS L
