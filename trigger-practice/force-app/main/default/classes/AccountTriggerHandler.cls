public with sharing class AccountTriggerHandler {
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