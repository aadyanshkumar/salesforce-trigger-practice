@isTest
public with sharing class TestClass {
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