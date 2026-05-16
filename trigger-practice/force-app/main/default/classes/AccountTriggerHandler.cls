public with sharing class AccountTriggerHandler {
    //When Account Industry changes, update all related Contacts' Description field with:
    public static void updateContactDescription(List<Account> newList, Map<Id,Account> oldMap){
        Set<Id> accIds = new Set<Id>();
        for(Account acc: newList){
            if(acc.Industry != oldMap.get(acc.Id).Industry){
                //Industry updated
                accIds.add(acc.Id);
            }
        }

        if(accIds.isEmpty()){
            return;
        }
        
        List<Contact> conList = [
            SELECT Id,Name,Description
            FROM Contact
            WHERE AccountId IN: accIds
        ];
        

        List<Contact> conToUpdate = new List<Contact>();
        for(Contact con: conList){  
                con.Description = 'Account Industry changed';
                conToUpdate.add(con);
        }
        if(!conToUpdate.isEmpty()){
            update conToUpdate;
        }
    }

    public static void preventDeleteWithChild(List<Account> accList){
        //collect the ID of all Accounts who are going to delete
        Set<Id> accId = new Set<Id>();

        for(Account acc: accList){
            accId.add(acc.Id);
        }

        List<Contact> conList = [
            SELECT id
            FROM Contact
            WHERE AccountID IN :accId
        ];
        //add the account in set who have related contacts
        Set<Id> accountsWithContact = new Set<Id>();
        for(Contact con: conList){
            accountsWithContact.add(con.AccountId);
        }

        for(Account acc: accList){
           if(accountsWithContact.contains(acc.Id)){
            acc.addError('Account with contacts can not be deleted: ');
           }
        }
    }
}