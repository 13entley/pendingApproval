public with sharing class AccountController2 {
    @AuraEnabled(cacheable=true)
    public static Integer getApprovalCount(){
        Integer myApprovals = 0;
        Id userId = UserInfo.getUserId();

        // Get all pending app requests for current user
        List<ProcessInstance> processList = [SELECT Id, (SELECT Id FROM StepsAndWorkitems WHERE ActorId =: userId AND IsPending = TRUE) FROM ProcessInstance];
        for(ProcessInstance allApproval : processList){
            myApprovals += allApproval.StepsAndWorkItems.size()
        }
        system.debug('myApprovals === ' + myApprovals);
        return myApprovals;
    }

    // return user first name
    @AuraEnabled(cacheable=true)
    public static String getFirstName(){
        return UserInfo.getFirstName();

    }
}
