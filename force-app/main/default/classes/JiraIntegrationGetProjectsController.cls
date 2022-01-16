public with sharing class JiraIntegrationGetProjectsController {

    // CONSTRUCTOR
    public JiraIntegrationGetProjectsController(
        ApexPages.StandardSetController stdSetController) {
            // TODO: constructor get projects not redirect
    }

    // GET PROJECTS
    public static Map<String,Object> getProjects() {
        return JiraIntegrationRequest.getProjectsFromJira();
    }

    // UPSERT PROJECTS
    public static Map<String,Object> upsertProjects(HttpResponse httpResponse) {

        Map<String,Object> response = new Map<String,Object>();
        JiraGetProjectsResponse responseProjects = (JiraGetProjectsResponse)
            JSON.deserialize(httpResponse.getBody(), JiraGetProjectsResponse.class);

        // TODO: check if exists
            
        List<Jira_Project__c> projects = new List<Jira_Project__c>();    
        for (JiraGetProjectsResponse.Project eachResProj : responseProjects.values) {
            Jira_Project__c project = new Jira_Project__c(
                Id__c = eachResProj.id,
                Key__c = eachResProj.key,
                Name = eachResProj.name
            );
            projects.add(project);
        }
        if (!projects.isEmpty()) {
            try {
                insert projects;
                response.put(Jira.STATUS_CODE, 200);
                response.put(Jira.MSG, Jira.OK);
            }
            catch (Exception ex) {
                response.put(Jira.STATUS_CODE, 500);
                response.put(Jira.MSG, ex.getMessage());
                System.debug(LoggingLevel.ERROR, ex.getMessage());
            }
        }
        else {
            response.put(Jira.STATUS_CODE, 404);
            response.put(Jira.MSG, 'No Projects returned');
        }
        return response;
    }
}