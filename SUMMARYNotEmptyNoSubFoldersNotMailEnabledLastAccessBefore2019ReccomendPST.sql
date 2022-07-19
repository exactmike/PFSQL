SELECT 
	--MapiIdentity
	SUBSTRING(MapiIdentity,0,(CHARINDEX('\',MAPiIdentity,2))) AS TopFolderPath
	,Count(EntryID) As FolderCount
      ,SUM([ItemCount]) AS TotalItemCount
      ,SUM([TotalItemSizeGB]) AS TotalItemSizeGB

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
  GROUP BY SUBSTRING(MapiIdentity,0,(CHARINDEX('\',MAPiIdentity,2)))
  WITH Rollup
  ORDER BY TotalItemSizeGB DESC

	

