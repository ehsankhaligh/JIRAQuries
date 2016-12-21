select pro.pluginname, pro.pluginversion, QA.pluginname, QA.pluginversion, DEV.pluginname, DEV.pluginversion 
from dbo.pluginversion as pro 
Full JOIN [cosp-dv-sqld01\dev].[JIRA_DTECH].[dbo].[pluginversion] as DEV
on PRO.pluginkey COLLATE DATABASE_DEFAULT = DEV.PLUGINKEY COLLATE DATABASE_DEFAULT
FULL JOIN [cosp-dv-shsql05\QA2012].[JIRA].[dbo].[pluginversion] as QA 
on pro.pluginkey = QA.pluginkey
where pro.id >= 12082
OR pro.id in (10900, 12700, 12200, 11501, 12400, 10607, 10306, 12001, 10061)
OR pro.id in (10605, 10302, 12201, 10300, 10606,12601, 12801, 12802)
OR pro.id in (10202,10601, 10203, 10204, 12800, 11201, 12202, 12203, 12501)
OR pro.id in (10603, 12300, 12600, 10604, 12503, 12500, 10600, 11300, 12000, 10301)
OR pro.pluginkey like 'com.atlassian.support.stp' --list of default installed plugins that are updatable 
OR pro.pluginkey like 'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
OR pro.pluginkey like 'com.atlassian.jira.plugins.jira-importers-plugin'
OR pro.pluginkey like 'com.atlassian.jira.extra.jira-ical-feed'
OR pro.pluginkey like 'com.atlassian.jira.plugins.jira-importers-github-plugin'
OR pro.pluginkey like 'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
OR pro.pluginkey like 'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
OR pro.pluginkey like 'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
OR QA.ID >= 12000 
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
OR DEV.ID >= 10173 --user installed plugins is greater than 10173
OR DEV.pluginkey like  'com.atlassian.support.stp' --list of default installed plugins that are updatable 
OR DEV.pluginkey like  'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
OR DEV.pluginkey like  'com.atlassian.jira.plugins.jira-importers-plugin'
OR DEV.pluginkey like  'com.atlassian.jira.extra.jira-ical-feed'
OR DEV.pluginkey like  'com.atlassian.jira.plugins.jira-importers-github-plugin'
OR DEV.pluginkey like  'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
OR DEV.pluginkey like  'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
OR DEV.pluginkey like  'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'