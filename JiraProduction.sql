use [master]
go
--user installed plugins is greater than 
select [        Id], [Pluginname], [pluginkey], [version], [CREATED] from dbo.JIRA
where [        Id] >= 12083 
OR [        Id]  in (10900, 12700, 12200, 11501, 12400, 10607, 10306, 12001, 10061)
OR [        Id]  in (10605, 10302, 12201, 10300, 10606,12601, 12801, 12802)
OR [        Id] in (10202,10601, 10203, 10204, 12800, 11201, 12202, 12203, 12501)
OR [        Id] in (10603, 12300, 12600, 10604, 12503, 12500, 10600, 11300, 12000, 10301)
OR pluginkey like  'com.atlassian.support.stp' --list of default installed plugins that are updatable 
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-redmine-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-plugin'
OR pluginkey like  'com.atlassian.jira.extra.jira-ical-feed'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-github-plugin'
OR pluginkey like  'com.atlassian.labs.hipchat.hipchat-for-jira-plugin'
OR pluginkey like  'com.atlassian.jira.plugins.jira-importers-bitbucket-plugin'
OR pluginkey like  'com.atlassian.upm.atlassian-universal-plugin-manager-plugin'
order by [Pluginname] ASC;