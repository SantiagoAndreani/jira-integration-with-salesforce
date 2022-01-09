trigger JiraIssueTrigger on Jira_Issue__c (
  before insert,
  after insert,
  before update,
  after update,
  before delete,
  after delete,
  after undelete) {

    new JiraIssueTriggerHandler().run();
}