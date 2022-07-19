/****** Script for SelectTopNRows command from SSMS  ******/
  UPDATE PFData.dbo.PFTreeWithStats
  --SELECT COUNT([EntryId]) AS Count
  SET sLastUserAccessTime = LastUserAccessTime
  FROM [PFData].[dbo].[PFTreeWithStats]
  WHERE LastAccessTime IS NOT NULL and sLastAccessTime IS NULL

  UPDATE PFData.dbo.PFTreeWithStats
  --SELECT COUNT([EntryId]) AS Count
  SET sLastUserAccessTime = LastUserAccessTime
  FROM [PFData].[dbo].[PFTreeWithStats]
  WHERE LastModificationTime IS NOT NULL and sLastModificationTime IS NULL
