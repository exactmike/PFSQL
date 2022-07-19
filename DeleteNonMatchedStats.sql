/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT
  --    s.[EntryId]
  DELETE
  FROM [PFData].[dbo].[PFStats] --as s
  WHERE EntryId NOT IN
  (SELECT EntryId FROM PFTree)
