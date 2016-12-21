/*use [JIRATST]
go 
select  ID, pluginname, pluginkey, pluginversion, CREATED
from dbo.pluginversion 
order by  ID, pluginname , pluginkey, pluginversion, CREATED;
*/

--ID fiter 
use [JIRATST]
go 
select pluginname, pluginkey, pluginversion 
from dbo.pluginversion 
where ID >= 10173 --user installed plugins is greater than 10173
OR pluginkey like  'com.atlassian.support.stp' --list of default installed plugins that are updatable 
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-plugin'
OR pluginkey like  'com.atlassian.jira.extra.jira-ical-feed'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-github-plugin'
OR pluginkey like  'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
OR pluginkey like  'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
OR CREATED >= Convert(datetime, '2016-03-11')
order by pluginname, pluginkey, pluginversion;

--Date Filter 
/*(use [JIRATST]
go 
select pluginname, pluginkey, pluginversion 
from dbo.pluginversion A 
where A.CREATED >= Convert(datetime, '2016-02-05')
OR pluginkey like  'com.atlassian.support.stp' --list of default installed plugins that are updatable
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-plugin'
OR pluginkey like  'com.atlassian.jira.extra.jira-ical-feed'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-github-plugin'
OR pluginkey like  'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
OR pluginkey like  'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
order by  pluginname ASC, pluginkey, pluginversion;*/



/*
use [JIRA_DTech]
go 
select  pluginname, pluginkey, pluginversion
from dbo.pluginversion 
order by  pluginname, pluginkey, pluginversion;
*/