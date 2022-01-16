public with sharing class JiraIntegrationGetIssuesController {

    // CONSTRUCTOR PAGE GET ISSUES
    public JiraIntegrationGetIssuesController(
        ApexPages.StandardSetController stdSetController) {
            // TODO: get issues contructor not redirect
    }

    // GET ISSUES FROM JIRA BY PROJECT
    public static void getIssues() {
        // FIXME: hardcode project name
        JiraIntegrationRequest.getIssuesFromJira('ADS');
    }

    // UPSERT ISSUES FROM JIRA
    public static void upsertIssues(HttpResponse response) {

        // TODO: upsertIssues
    }
}