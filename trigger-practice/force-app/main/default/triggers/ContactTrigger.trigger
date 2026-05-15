trigger ContactTrigger on Contact (after insert, after delete) {
    
    if(Trigger.isInsert && Trigger.isAfter){
        //ContactTriggerHandler.updateDescription(Trigger.New);
        ContactTriggerHandler.updateDescription(Trigger.New);
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
         ContactTriggerHandler.updateDescription(Trigger.Old);
    }
}