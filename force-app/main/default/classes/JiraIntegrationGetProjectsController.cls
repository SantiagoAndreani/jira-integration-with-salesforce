public with sharing class JiraIntegrationGetProjectsController {

    // CONSTRUCTOR PAGE GET PROJECTS
    public JiraIntegrationGetProjectsController(
        ApexPages.StandardSetController stdSetController) {
            
    }

    // GET PROJECTS FROM JIRA
    public static void getProjects() {
        JiraIntegrationRequest.getProjectsFromJira();
    }

    // UPSERT PROJECTS
    public static void upsertProjects(HttpResponse response) {

        JiraGetProjectsResponse res = (JiraGetProjectsResponse)
            JSON.deserialize(response.getBody(), JiraGetProjectsResponse.class);

        // TODO: check if exists
            
        List<Jira_Project__c> projects = new List<Jira_Project__c>();    
        for (JiraGetProjectsResponse.Project eachResProj : res.values) {
            Jira_Project__c project = new Jira_Project__c(
                Id__c = eachResProj.id,
                Key__c = eachResProj.key,
                Name = eachResProj.name
            );
            projects.add(project);
        }
        if (!projects.isEmpty()) {
            insert projects;
        }
    }
}