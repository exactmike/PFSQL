SELECT
      [ExchangeOrg]
	,[FolderClass]
      ,count([EntryId]) AS Count


  FROM [Migration].[dbo].[PublicFolder]
  group by exchangeorg,FolderClass
  ORDER by ExchangeOrg,FolderClass
