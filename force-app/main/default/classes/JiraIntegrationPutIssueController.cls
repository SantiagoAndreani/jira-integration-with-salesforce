public with sharing class JiraIntegrationPutIssueController {

    public static void updateIssueToJira(Map<Id,Jira_Issue__c> newIdPerIssue, 
        Map<Id,Jira_Issue__c> oldIdPerIssue) {
            
            for (Jira_Issue__c eachIssue : newIdPerIssue.values()) {
                // TODO: JiraIntegrationPutIssueController
            }
        }
}