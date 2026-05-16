public with sharing class CaseTriggerHandler {
    public static void updateDescription(List<Case> caseList){
        //When Case is created, copy Account Name into Case Description.
        Set<Id> accIds = new Set<Id>();
        for(Case c: caseList){
            if(c.AccountId != null){
                accIds.add(c.AccountId);
            }
        }
        
        if(accIds.isEmpty()){
            return;
        }

        // store related account into map
        Map<Id,Account> accMap = new Map<Id,Account>([
            SELECT Id,Name
            FROM Account
            WHERE Id IN: accIds
        ]);

        for(Case c: caseList){
            c.Description = accMap.containsKey(c.AccountId).Name;
        }
    }
}