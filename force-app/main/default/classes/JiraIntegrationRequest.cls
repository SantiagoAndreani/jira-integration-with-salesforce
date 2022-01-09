public with sharing class JiraIntegrationRequest {

    public static final String GET = 'GET';
    public static final String ACCEPT = 'Accept';
    public static final String CONTENT_TYPE = 'Content-Type';
    public static final String APPLICATION_JSON = 'application/json';

    public static void getIssues() {

        List<Jira_Integration__mdt> jiraCredentials = getJiraIntegrationMedatada();
        String TOKEN = jiraCredentials[0].Token__c;
        String URL = jiraCredentials[0].Url__c;
        String APPLICATION_JSON = 'application/json';

        HttpRequest request = new HttpRequest();
        request.setMethod(GET);
        request.setEndpoint(URL +'/issue/ADS-5');
        request.setHeader(ACCEPT, APPLICATION_JSON);
        request.setHeader(CONTENT_TYPE, APPLICATION_JSON);

        System.debug('request');
        System.debug(request);

        Http http = new Http();
        HttpResponse response = http.send(request);

        System.debug('response');
        System.debug(response);
    }

    public static List<Jira_Integration__mdt> getJiraIntegrationMedatada() {
        return [
            SELECT Id, 
                DeveloperName, 
                Label, 
                Token__c, 
                Url__c 
            FROM Jira_Integration__mdt
            LIMIT 1
        ];
    }
}