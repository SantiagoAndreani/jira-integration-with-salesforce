public with sharing class JiraIssueTriggerHandler {
    
    // CONTEXT VARIABLES
    Map<Id,Jira_Issue__c> newIdPerIssue = (Map<Id,Jira_Issue__c>) Trigger.newMap;
    Map<Id,Jira_Issue__c> oldIdPerIssue = (Map<Id,Jira_Issue__c>) Trigger.oldMap;

    public void run () {

        switch on Trigger.operationType {
            
            when BEFORE_INSERT {
                System.debug('before insert issue');
            }
            when AFTER_INSERT {
                System.debug('after insert issue');
            }
            when BEFORE_UPDATE {
                System.debug('before update issue');
            }
            when AFTER_UPDATE {
                System.debug('after update issue');
                JiraIntegrationPutIssueController.updateIssueToJira(newIdPerIssue, oldIdPerIssue);
            }
            when BEFORE_DELETE {
                System.debug('before delete issue');
            }
        }
    }
}