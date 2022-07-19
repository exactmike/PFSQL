/****** Script for SelectTopNRows command from SSMS  ******/
  UPDATE PFData.dbo.PFTreeWithStats
  --SELECT COUNT([EntryId]) AS Count
  SET sLastUserModificationTime = LastUserModificationTime
  FROM [PFData].[dbo].[PFTreeWithStats]
  WHERE LastUserModificationTime IS NOT NULL and sLastUserModificationTime IS NULL
