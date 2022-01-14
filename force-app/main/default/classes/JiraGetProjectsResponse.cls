public with sharing class JiraGetProjectsResponse {

    public Long startAt;
	public Long total;
	public Boolean isLast;
    public List<Project> values;

    public class Project {

        public String id;
        public String key;
        public String name;
    }
}
