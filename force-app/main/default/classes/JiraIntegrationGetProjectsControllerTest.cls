@isTest
public with sharing class JiraIntegrationGetProjectsControllerTest {

    @testSetup 
    static void setup() {

        // INSERT PROJECT
        Jira_Project__c project = new Jira_Project__c(
            Name = 'Clasificado',
            Id__c = '10002',
            Key__c = 'VIS'
        );
        insert project;
    }

    // GET PROJECTS - UPSERT PROJECTS - 200
    @isTest 
    static void getProjects_upsertProjects_200() {

        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('JiraIntegrationGetProjectsControllerTest_getProjects_upsertProjects_200');
        mock.setStatusCode(200);
        mock.setStatus(Jira.OK);
        mock.setHeader(Jira.CONTENT_TYPE, Jira.APPLICATION_JSON);
        Test.setMock(HttpCalloutMock.class, mock);

        ApexPages.StandardController standardController;
        Pagereference pageReference;
        Test.startTest();
        JiraIntegrationGetProjectsController controller = 
            new JiraIntegrationGetProjectsController(standardController);
        pageReference = controller.getProjects();
        Test.stopTest();

        List<Jira_Project__c> projects = [
            SELECT Id,
                Id__c,
                Key__c,
                Name
            FROM Jira_Project__c
        ];
        Map<String,Jira_Project__c> idPerProject = new Map<String,Jira_Project__c>();
        for (Jira_Project__c eachProj : projects) {
            idPerProject.put(eachProj.Key__c, eachProj);
        }

        System.debug(pageReference);
        System.assertEquals(2, projects.size(), 
            'MUST BE SAME SIZE OF JIRA PROJECTS');
        System.assertEquals('Publicidad', idPerProject.get('ADS').Name, 
            'MUST BE SAME PROJECT NAME INSERTED');
        System.assertEquals('10001', idPerProject.get('ADS').Id__c, 
            'MUST BE SAME PROJECT ID INSERTED');
        System.assertEquals('Clasificados', idPerProject.get('VIS').Name, 
            'MUST BE SAME PROJECT NAME UPDATED');
    }
}