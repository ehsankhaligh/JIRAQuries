
    /*
        This Query Shows Not same version plugins in all JIRa instances. 
	*/

	 with CTEjirapro as ( 
    select pro.pluginname, pro.pluginversion, pro.pluginkey
    from [COSP-DV-SQLP01\PROD].[JIRA_DTECH].[dbo].[pluginversion] as pro  
    where pro.id >= 12082 --user installed plugins is greater than 12082
	AND (pro.ID != 12100  AND pro.ID != 12501)
    OR pro.id in (10900, 12700, 12200, 11501, 12400, 10607, 10306, 12001)
    OR pro.id in (10605, 10302, 12201, 10300, 10606,12601, 12801, 12802)
    OR pro.id in (10202,10601, 10203, 10204, 12800, 11201, 12202, 12203)
    OR pro.id in (10603, 12300, 12600, 10604, 12503, 12500, 10600, 11300, 12000, 10301)
    OR pro.pluginkey like 'com.atlassian.support.stp' --list of default installed plugins that are updatable 
    OR pro.pluginkey like 'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
    OR pro.pluginkey like 'com.atlassian.jira.plugins.jira-importers-plugin'
    OR pro.pluginkey like 'com.atlassian.jira.extra.jira-ical-feed'
    OR pro.pluginkey like 'com.atlassian.jira.plugins.jira-importers-github-plugin'
    OR pro.pluginkey like 'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
    OR pro.pluginkey like 'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
    OR pro.pluginkey like 'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
  
  ), 

  CTEJiraQA as (
    select QA.pluginname, QA.pluginversion, QA.pluginkey
    from [COSP-DV-SQLD01\QA].[JIRA_DTECH].[dbo].[pluginversion]  as QA
    WHERE QA.ID >= 12000 
	OR (QA.ID >= 10202 AND QA.ID <= 10204) 
	OR (QA.ID >= 10300 AND QA.ID <= 10306 AND QA.ID != 10303 AND QA.ID != 10303 AND QA.ID != 10303 AND QA.ID != 12100)
	OR (QA.ID >= 10601 AND QA.ID <= 10607  AND QA.ID != 10302)
	OR (QA.ID = 10900 OR QA.ID = 11201  OR QA.ID = 11501 OR QA.ID = 12901)
	OR QA.pluginkey like  'com.atlassian.support.stp' --list of default installed plugins that are updatable 
	OR QA.pluginkey like  'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
	OR QA.pluginkey like  'com.atlassian.jira.plugins.jira-importers-plugin'
	OR QA.pluginkey like  'com.atlassian.jira.extra.jira-ical-feed'
	OR QA.pluginkey like  'com.atlassian.jira.plugins.jira-importers-github-plugin'
	OR QA.pluginkey like  'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
	OR QA.pluginkey like  'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
	OR QA.pluginkey like  'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
  ),
  
  CTEjiraDEV as( 
     
    select DEV.pluginname, DEV.pluginversion, DEV.pluginkey  
    from [COSP-DV-SQLD01\DEV].[JIRA_DTECH].[dbo].[pluginversion] as DEV
	where DEV.ID >= 10173 --user installed plugins is greater than 10173
	AND (DEV.ID != 10203 AND DEV.ID != 10075 AND DEV.ID != 10328) 
	OR DEV.pluginkey like  'com.atlassian.support.stp' --list of default installed plugins that are updatable 
	OR DEV.pluginkey like  'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
	OR DEV.pluginkey like  'com.atlassian.jira.plugins.jira-importers-plugin'
	OR DEV.pluginkey like  'com.atlassian.jira.extra.jira-ical-feed'
	OR DEV.pluginkey like  'com.atlassian.jira.plugins.jira-importers-github-plugin'
	OR DEV.pluginkey like  'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
	OR DEV.pluginkey like  'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
	OR DEV.pluginkey like  'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
  )

select ISNULL(CONVERT(varchar(50),pro.pluginname) ,'  **NULL(NOT SAME VERSION)**') 'JIRA_Pro_Plugin_name', ISNULL(CONVERT(varchar(50),pro.pluginversion) ,'  **NULL(NOT SAME VERSION)**') 'JIRA_Pro_Plugin_version', 
       ISNULL(CONVERT(varchar(50),QA.pluginname) ,'  **NULL(NOT SAME VERSION)**') 'JIRA_QA_Plugin_version', ISNULL(CONVERT(varchar(50),QA.pluginversion) ,'  *NULL(NOT SAME VERSION)**') 'JIRA_QA_Plugins_version',
	   ISNULL(CONVERT(varchar(50),DEV.pluginname) ,'  **NULL(NOT SAME VERSION)**') 'JIRA_DEV_Plugin_version', ISNULL(CONVERT(varchar(50),DEV.pluginversion) ,'  **NULL(NOT SAME VERSION)**')  'JIRA_DEV_Plugins_version'
from CTEjirapro  as pro
left join CTEJiraQA as QA
on (pro.pluginversion = QA.pluginversion AND pro.pluginname = QA.pluginname)
left JOIN CTEjiraDEV AS DEV
on (PRO.pluginversion COLLATE DATABASE_DEFAULT = DEV.pluginversion COLLATE DATABASE_DEFAULT AND 
    PRO.pluginname COLLATE DATABASE_DEFAULT = DEV.pluginname COLLATE DATABASE_DEFAULT)
	OR (QA.pluginversion COLLATE DATABASE_DEFAULT = DEV.pluginversion COLLATE DATABASE_DEFAULT AND QA.pluginname COLLATE DATABASE_DEFAULT = DEV.pluginname COLLATE DATABASE_DEFAULT) -- QA and DEV 
order by ISNULL(CONVERT(varchar(50),pro.pluginname) ,'  **NULL(NOT SAME VERSION)**'),
         ISNULL(CONVERT(varchar(50),QA.pluginname) ,'  **NULL(NOT SAME VERSION)**'),
		 ISNULL(CONVERT(varchar(50),DEV.pluginname) ,'  **NULL(NOT SAME VERSION)**');

		