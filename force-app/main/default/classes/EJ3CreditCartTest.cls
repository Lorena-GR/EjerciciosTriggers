@isTest
public class EJ3CreditCartTest {
    @isTest
    public static void testInsert(){
        Account acc = new Account(Name = 'Test');
        insert acc;
        Contact con = new Contact(FirstName='Test', LastName='1', NIF__c='73429409T', Premium__c = true, Account = acc);
        insert con;
        Credit_Card__c credit = new Credit_Card__c(Card_Number__c = '1234567887654321', Card__c = 'Credit', Card_Type__c = 'Visa Clasic',
                                                Contact__c = con.Id, Expiration_Month__c = 12, Expiration_Year__c = 2023);

        insert credit;
        List<Credit_Card__c> listCre = [SELECT Contact__c FROM Credit_Card__c WHERE Contact__c =: con.Id];
        List<Opportunity> listOpp = [SELECT Name FROM Opportunity WHERE Name =: con.LastName];
        System.assertEquals(con.LastName, listOpp.get(0).Name);

    }
}