--this query produces a list of security principals with access to the folder and related subfolders for a given set of top level folders.
--the set of top level folders is the same as 'TopLevelRecommendPST.sql' produces

SELECT
su.MapiIdentity
,pm.TrusteePrimarySMTPAddress
,pm.TrusteeRecipientTypeDetails
,pm.TrusteeObjectGUID
,pm.TrusteeIdentity
,pm.AccessRights
FROM dbo.pftree su LEFT JOIN dbo.PFPerms pm ON su.EntryId = pm.TargetEntryID
RIGHT JOIN (
SELECT MapiIdentity
  FROM [dbo].[PFTreeWithStats]
  WHERE
  HasSubFolders = 1
  AND TotalItemSizeGB < 50
  AND (sLastUserAccessTime < '2019-01-01' OR sLastUserAccessTime IS NULL)
  AND CreationTime < '2019-01-01'
  AND MailEnabledFolderCount < 2
  AND ParentPath = '\'
) pa ON su.ParentPath LIKE pa.MapiIdentity + '%' OR su.MapiIdentity = pa.MapiIdentity
WHERE
(pm.AccessRights <> 'None' AND pm.TrusteeObjectGUID IS NOT NULL) AND
(pm.TrusteeObjectGUID <> '')
ORDER BY su.MapiIdentity
