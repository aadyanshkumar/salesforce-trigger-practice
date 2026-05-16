@isTest
public with sharing class TestClass {

    @isTest
    public static void testCase(){
        List<Account> accList = new List<Account>();
        List<Case> caseList = new List<Case>();

        for(Integer i = 1; i<=10; i++){
            Account acc = new Account(
                Name = 'Test'+i
            );
            accList.add(acc);
        }
        insert accList;

        for(Integer i = 1; i<=10; i++){
            Case c = new Case(
                AccountId = accList[i].id,
                CaseStatus = 'Test'+i,
                CaseOrigin = 'Temperary'
            );
            caseList.add(c);
        }

        Test.startTest();
        insert caseList;
        Test.stopTest();
        
    }
   
    @isTest
    static void testOpportunity(){
        //make data
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i = 1; i<=10; i++){
                Opportunity opp = new Opportunity(
                Name = 'Test'+i,
                StageName = 'Prospecting',
                CloseDate = Date.today()
            );

            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }

        Test.startTest();
        update oppList;
        Test.stopTest();

    }
}