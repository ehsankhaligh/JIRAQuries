use [JIRA]
go 
select id, pluginname, pluginkey, pluginversion, CREATED
from dbo.pluginversion 
WHERE ID >= 12000 
OR (ID >= 10202 AND ID <= 10204) 
OR (ID >= 10300 AND ID <= 10306 AND ID != 10303 AND ID != 10303 AND ID != 10303 AND ID != 12100)
OR (ID >= 10601 AND ID <= 10607  AND ID != 10302)
OR (ID = 10900 OR ID = 11201  OR ID = 11501 OR ID = 12901)
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


select * from dbo.pluginversion;