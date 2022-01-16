public with sharing class JiraIntegrationRequest {

    // GET PROJECTS
    public static Map<String,Object> getProjectsFromJira() {

        Map<String,Jira_Integration__mdt> namePerJiraMdt = 
            getJiraIntegrationMedatadata(Jira.GET_PROJECTS);
        HttpRequest request = setRequest(namePerJiraMdt.get(Jira.CREDENTIALS));
        Jira_Integration__mdt mdt = namePerJiraMdt.get(Jira.GET_PROJECTS);
        request.setMethod(mdt.Method__c);
        request.setEndpoint(request.getEndpoint() + mdt.Endpoint__c);
        return makeRequest(request, Jira.GET_PROJECTS);
    }

    // GET ISSUES
    public static void getIssuesFromJira(String project) {

        Map<String,Jira_Integration__mdt> namePerJiraMdt = 
            getJiraIntegrationMedatadata(Jira.GET_ISSUES);
        HttpRequest request = setRequest(namePerJiraMdt.get(Jira.CREDENTIALS));
        Jira_Integration__mdt mdt = namePerJiraMdt.get(Jira.GET_ISSUES);
        request.setMethod(mdt.Method__c);
        request.setEndpoint(request.getEndpoint() + mdt.Endpoint__c + project);
        makeRequest(request, Jira.GET_ISSUES);
    }

    // PUT ISSUE
    public static void putIssueToJira(String id, String body) {

        Map<String,Jira_Integration__mdt> namePerJiraMdt = getJiraIntegrationMedatadata(Jira.PUT_ISSUE);
        HttpRequest request = setRequest(namePerJiraMdt.get(Jira.CREDENTIALS));
        Jira_Integration__mdt mdt = namePerJiraMdt.get(Jira.PUT_ISSUE);
        request.setMethod(mdt.Method__c);
        request.setEndpoint(request.getEndpoint() + mdt.Endpoint__c + id);
        request.setBody(body);
        makeRequest(request, Jira.PUT_ISSUE);
    }

    // SET REQUEST
    public static HttpRequest setRequest(Jira_Integration__mdt credentials) {

        String TOKEN = credentials.Token__c;
        String EMAIL = credentials.Email__c;
        String URL = credentials.Url__c;
        HttpRequest request = new HttpRequest();
        request.setHeader(Jira.ACCEPT, Jira.APPLICATION_JSON);
        request.setHeader(Jira.CONTENT_TYPE, Jira.APPLICATION_JSON);
        request.setHeader(Jira.AUTHORIZATION, getAuthorization(EMAIL, TOKEN));
        request.setEndpoint(URL);
        return request;
    }

    // MAKE REQUEST
    public static Map<String,Object> makeRequest(HttpRequest request, String TYPE) {

        Http http = new Http();
        HttpResponse response = http.send(request);
        Integer statusCode = response.getStatusCode();
        String status = response.getStatus();
        // 200 
        if (statusCode == 200 && status == Jira.OK) {
            // PROJECT
            if (Jira.GET_PROJECTS == TYPE) {
                return JiraIntegrationGetProjectsController.upsertProjects(response);
            }
            // SPRINTS
            if (Jira.GET_SPRINTS == TYPE) {
                // TODO: GET_SPRINTS
                // JiraIntegrationGetSprintsController.upsertSprints(response);
            }
            // EPICS
            if (Jira.GET_EPICS == TYPE) {
                // TODO: GET_EPICS
                // JiraIntegrationGetEpicsController.upsertEpics(response);
            }
            // ISSUES
            if (Jira.GET_ISSUES == TYPE) {
                // JiraIntegrationGetIssuesController.upsertIssues(response);
            }
            if (Jira.PUT_ISSUE == TYPE) {
                // TODO: PUT_ISSUE
            }
            else {
                System.debug(LoggingLevel.WARN, TYPE + ' not defined');
                System.debug(LoggingLevel.WARN, statusCode + ': ' + status);
                System.debug(LoggingLevel.WARN, response.getBody());
            }
        }
        // TODO: other status codes
        else {

        }
        return null;
    }

    // GET AUTHORIZATION
    public static String getAuthorization(String email, String token) {
        return 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(email + ':' + token));
    }

    // GET JIRA MDT
    public static Map<String,Jira_Integration__mdt> getJiraIntegrationMedatadata(String nameMdt) {
        
        List<Jira_Integration__mdt> jiraMdt = [
            SELECT Id, 
                DeveloperName, 
                Label, 
                Token__c, 
                Url__c,
                Email__c,
                Endpoint__c,
                Method__c 
            FROM Jira_Integration__mdt
            WHERE DeveloperName =: Jira.CREDENTIALS
            OR DeveloperName =: nameMdt
        ];
        Map<String,Jira_Integration__mdt> namePerJiraMdt = new Map<String,Jira_Integration__mdt>();
        for (Jira_Integration__mdt eachMdt : jiraMdt) {
            namePerJiraMdt.put(eachMdt.DeveloperName, eachMdt);
        }
        return namePerJiraMdt;
    }
}