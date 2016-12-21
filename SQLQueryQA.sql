/*use [JIRA]
go 
select ID, pluginname, pluginkey, pluginversion, CREATED 
from dbo.pluginversion
order by ID asc;
*/

use [JIRA]
go 
select pluginname, pluginkey, pluginversion
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
OR CREATED >= Convert(datetime, '2016-03-16')--shows the list of installed plugins after 3/16/16
order by  pluginname ASC;
 
/*select ID, pluginname, pluginkey, pluginversion, CREATED 
from dbo.pluginversion
where pluginname like 'Automation%'
OR	pluginname like 'Blitz Actions'
OR 	pluginname like 'Database Custom Field'
OR 	pluginname like 'Email This Issue Plugin'
OR 	pluginname like 'JIRA Agile'
OR 	pluginname like 'JIRA Automation Plugin'
OR  pluginname like 'JIRA Automation SPI'
OR  pluginname like 'JJupin'
OR  pluginname like 'katl-commons'
OR  pluginname like 'Kepler Custom Fields'
OR 	pluginname like 'System Plugin: Tempo Accounts'
OR 	pluginname like 'System Plugin: Tempo Core'
OR 	pluginname like 'System Plugin: Tempo Planning API'
OR 	pluginname like 'System Plugin: Tempo Teams'
OR 	pluginname like 'Tempo Planner'
OR 	pluginname like 'Tempo Timesheets'
OR 	pluginname like 'User Group Picker PRO'
OR 	pluginname like 'Warden'*/



/*select pluginname, pluginkey, pluginversion 
from dbo.pluginversion A 
where A.CREATED >= Convert(datetime, '2016-02-05')
*/
/*use [JIRA]
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
order by pluginname, pluginkey, pluginversion;
*/

/*use [JIRATST]
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
