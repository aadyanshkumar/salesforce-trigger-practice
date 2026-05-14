trigger OpportunityTrigger on Opportunity (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTriggerHandler.createTask(Trigger.NEW, Trigger.oldMap);
    }
}