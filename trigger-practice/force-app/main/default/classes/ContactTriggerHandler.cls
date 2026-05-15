public with sharing class ContactTriggerHandler {
    public static void copyAccountIndustryToContact(List<Contact> conList){
        Set<Id> accIds = new Set<Id>();
        //add account id into the set
        for(Contact con: conList){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }

        List<Contact> conListToAdd = [
            SELECT Id,Description,Account.Industry
            FROM Contact WHERE AccountId IN: accIds
        ];

        for(Contact con: conListToAdd){
            con.Description = con.Account.Industry;
        }

    }
    public static void updateDescription(List<Contact> conList){
       Set<Id> accIds = new Set<Id>();

        for(Contact con : conList){

            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }

        List<Account> accList = [
            SELECT Id,
                   Name,
                   Description,
                   (
                       SELECT Id
                       FROM Contacts
                   )
            FROM Account
            WHERE Id IN :accIds
        ];

        List<Account> updateAccList = new List<Account>();

        for(Account acc : accList){

            Integer totalContacts = acc.Contacts.size();

            acc.Description =
                'Total Contacts : ' + totalContacts;

            updateAccList.add(acc);
        }

        if(!updateAccList.isEmpty()){
            update updateAccList;
        }
    }
}