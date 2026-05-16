trigger AccountTrigger on Account (before delete, after update) {
    if(Trigger.isAfter && Trigger.isDelete){
        AccountTriggerHandler.updateContactDescription(Trigger.NEW, Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isDelete){
        AccountTriggerHandler.preventDeleteWithChild(Trigger.NEW);
    }
}