SELECT [EntryId]
      ,s.[Identity]
      ,[MapiIdentity]
      ,s.[Name]
      ,[ParentPath]
      ,[FolderType]
      ,[ReplicaCount]
      ,[Replicas]
      ,[HasItems]
      ,[HasSubFolders]
      ,[FolderCount]
      ,[MailEnabled]
      ,[MailEnabledFolderCount]
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
	  ,db.RpcClientAccessServer
  FROM [dbo].[PFTreeWithStats] S
  CROSS APPLY (
	SELECT TOP 1
		db.RpcClientAccessServer
	FROM dbo.PFDatabases db
	WHERE S.Replicas LIKE '%' + db.Name + '%'
  ) db
  WHERE HasSubFolders = 0 AND HasItems = 0 AND MailEnabled = 0
	AND (LastUserAccessTime IS NULL OR LastUserAccessTime < '2019-01-01')
	AND (LastUserModificationTime IS NULL OR LastUserModificationTime < '2019-01-01')
	AND CreationTime < '2019-01-01'
	--AND db.RpcClientAccessServer = ''
