/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Count([EntryId]) FolderCount
, SUM(TotalItemSizeGB)
  FROM [PFData].[dbo].[PFTreeWithStats]