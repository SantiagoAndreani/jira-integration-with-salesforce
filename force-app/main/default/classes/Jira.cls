public with sharing class Jira {

    // ENDPOINTS
    public static final String GET_PROJECTS = 'Get_Projects';
    // https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-projects/#api-rest-api-3-project-search-get
    public static final String GET_ISSUES = 'Get_Issues';
    public static final String PUT_ISSUE = 'Put_Issue';
    public static final String GET_SPRINTS = 'Get_Sprints';
    public static final String GET_EPICS = 'Get_Epics';
    // CREDENTIALS
    public static final String CREDENTIALS = 'Credentials';
    // HEADERS
    public static final String ACCEPT = 'Accept';
    public static final String CONTENT_TYPE = 'Content-Type';
    public static final String AUTHORIZATION = 'Authorization';
    public static final String APPLICATION_JSON = 'application/json';
    // FRONT RESPONSE
    public static final String STATUS_CODE = 'statusCode';
    public static final String STATUS = 'status';
    public static final String OK = 'OK';
    public static final String ERROR ='ERROR';
    public static final String DATA = 'data';
}
