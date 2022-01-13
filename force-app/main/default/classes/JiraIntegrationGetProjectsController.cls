public with sharing class JiraIntegrationGetProjectsController {

    public JiraIntegrationGetProjectsController(
        ApexPages.StandardSetController stdSetController) {

            JiraIntegrationRequest.getProjectsFromJira();
    }

    public static void upsertProjects(HttpResponse response) {
        // TODO: upsertProjects
        System.debug('response');
        System.debug(response);
    }
}