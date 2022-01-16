// delete projects
List<Jira_Project__c> jp = [select id from jira_project__c];
delete jp;