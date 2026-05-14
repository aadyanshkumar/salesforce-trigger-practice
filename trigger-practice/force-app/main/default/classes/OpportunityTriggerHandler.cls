public with sharing class OpportunityTriggerHandler {
    // Create the new task if opportunity become Closed Won;
   public static void createTask(List<Opportunity> oppNewList, Map<Id,Opportunity> oldList){
        //List of task to be add 
        List<Task> taskToAdd = new List<Task>();
        for(Opportunity opp: oppNewList){
            if(opp.StageName == 'Closed Won' && oldList.get(opp.id).StageName != 'Closed Won'){
                Task t = new Task();
                t.Subject = 'Follow Up with customer';
                t.WhatId = opp.id;
                t.Status = 'Not Started';
                t.Priority = 'High';
                taskToAdd.add(t);

            }
        }
        if(!taskToAdd.isEmpty()){
            insert taskToAdd;
        }
   }
}