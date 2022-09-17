SELECT dbo.PublicFolder.Name, dbo.PublicFolder.[Identity], dbo.PublicFolderStatistics.ItemCount, dbo.PublicFolder.HasSubfolders, dbo.PublicFolder.ExchangeOrg, dbo.PublicFolder.EntryId, dbo.PublicFolderStatistics.LastModificationTime, dbo.PublicFolderStatistics.CreationTime
FROM  dbo.PublicFolder INNER JOIN
         dbo.PublicFolderStatistics ON dbo.PublicFolder.EntryId = dbo.PublicFolderStatistics.EntryId
WHERE (dbo.PublicFolderStatistics.ItemCount = 0) AND (dbo.PublicFolder.HasSubfolders = 0)