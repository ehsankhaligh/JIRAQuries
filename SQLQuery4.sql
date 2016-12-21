--PRO
use [JIRA_AWSDevTeam]
go

select pluginname, pluginkey, pluginversion 
from dbo.pluginversion
where pluginname like 'JIRA Agile Marketing Plugin'
/*
where id >= 12082 --user installed plugins is greater than 12082
OR id in (10900, 12700, 12200, 11501, 12400, 10607, 10306, 12001, 10061)
OR id in (10605, 10302, 12201, 10300, 10606,12601, 12801, 12802)
OR id in (10202,10601, 10203, 10204, 12800, 11201, 12202, 12203, 12501)
OR id in (10603, 12300, 12600, 10604, 12503, 12500, 10600, 11300, 12000, 10301)
OR pluginkey like 'com.atlassian.support.stp' --list of default installed plugins that are updatable 
OR pluginkey like 'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
OR pluginkey like 'com.atlassian.jira.plugins.jira-importers-plugin'
OR pluginkey like 'com.atlassian.jira.extra.jira-ical-feed'
OR pluginkey like 'com.atlassian.jira.plugins.jira-importers-github-plugin'
OR pluginkey like 'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
OR pluginkey like 'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
OR pluginkey like 'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
order by pluginname ASC;
*/
--Dev
select id, pluginname, pluginkey, pluginversion 
from [cosp-dv-sqld01\DEV].[JIRA_DTECH].[dbo].[pluginversion] 
where pluginkey like 'com.atlassian.jira.plugin.system.c%'

/*where ID >= 10173 
AND ID != 10203 and ID != 10202 --JIRA Agile
OR pluginkey like  'com.pyxis.greenhopper.jira'
OR pluginkey like  'com.atlassian.support.stp' --list of default installed plugins that are updatable 
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-plugin'
OR pluginkey like  'com.atlassian.jira.extra.jira-ical-feed'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-github-plugin'
OR pluginkey like  'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
OR pluginkey like  'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
--OR CREATED >= Convert(datetime, '2016-03-11')
order by pluginname ASC*/
--QA
select id, pluginname 'QA', pluginkey, pluginversion, CREATED
from [cosp-dv-shsql05\QA2012].[JIRA].[dbo].[pluginversion] 
where pluginname like 'Outlook To JIRA'
/*WHERE ID >= 12000 
--OR ID != 10305 --JIRA Agile 
OR (ID >= 10202 AND ID <= 10204) 
OR (ID >= 10300 AND ID <= 10306  AND ID != 10303 AND ID != 10303 AND ID != 10303 AND ID != 12100) --10305 is JIRA Agile
OR (ID >= 10601 AND ID <= 10607  AND ID != 10302)
OR (ID = 10900 OR ID = 11201  OR ID = 11501 OR ID = 12901)
--OR pluginkey like  'com.pyxis.greenhopper.jira'
OR pluginkey like  'com.atlassian.support.stp' --list of default installed plugins that are updatable 
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-plugin'
OR pluginkey like  'com.atlassian.jira.extra.jira-ical-feed'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-github-plugin'
OR pluginkey like  'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
OR pluginkey like  'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
--OR CREATED >= Convert(datetime, '2016-03-16')--shows the list of installed plugins after 3/16/16
order by  pluginname ASC;
*/

