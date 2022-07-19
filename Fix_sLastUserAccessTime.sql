/****** Script for SelectTopNRows command from SSMS  ******/
  UPDATE PFData.dbo.PFTreeWithStats
	--COUNT([EntryId]) AS Count
  SET sLastUserAccessTime = LastUserAccessTime
  FROM [PFData].[dbo].[PFTreeWithStats]
  WHERE LastUserAccessTime IS NOT NULL and sLastUserAccessTime IS NULL
