public with sharing class JiraIntegrationGetIssuesController {

    public JiraIntegrationGetIssuesController(
        ApexPages.StandardSetController stdSetController) {

            // FIXME: hardcode project name
            JiraIntegrationRequest.getIssuesFromJira('ADS');
    }

    public static void upsertIssues(HttpResponse response) {

        // TODO: upsertIssues
    }
}