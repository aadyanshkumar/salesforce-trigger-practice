public with sharing class CaseTriggerHandler {
    public static void updateDescription(List<Case> caseList){
        Set<Id> accids = new Set<Id>();
        for(Case c: caseList){
            if(c.AccountId != null){
                accids.add(c.AccountId);
            }  
        }

        Map<Id,Account> accMap = new Map<Id,Account>(
            [SELECT Id,Name
            FROM Account
            WHERE Id IN: accIds]
        );
        


        for(Case c: caseList){
            if(accMap.containsKey(c.AccountId)){
                c.Description = accMap.get(c.AccountId).Name;
            }
        }  
    }
}