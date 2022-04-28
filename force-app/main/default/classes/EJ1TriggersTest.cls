@isTest
public class EJ1TriggersTest {
	@isTest
    public static void testInsert(){
        Account acc = new Account(Name='Account for test');
        insert acc;
        Contact cont = new Contact(FirstName='Name', LastName='Test',
                                  AccountId = acc.Id);
        insert cont;
        DateTime depDate = Date.today().addDays(2);
        Flight_Bookings__c fb = new Flight_Bookings__c(Origin__c='Madrid', Destination__c='Bruselas', Class__c='Tourist',
                                                  Departure_Date__c=depDate, Contact__c = cont.Id);
        insert fb;
        List<Flight_Bookings__c> listFlightBooking = [SELECT Account__c FROM Flight_Bookings__c WHERE id =: fb.Id];
        System.assertEquals(cont.AccountId, listFlightBooking[0].Account__c);
    }
    @isTest
    public static void testModify(){
        Account acc = new Account(Name='Account for test 2');
        insert acc;
        Contact cont = new Contact(FirstName='Name', LastName='Test Two',
                                  AccountId = acc.Id);
        insert cont;
        DateTime depDate = DateTime.newInstance(DateTime.now().getTime()).addDays(2);
        Flight_Bookings__c fb = new Flight_Bookings__c(Origin__c='Madrid', Destination__c='Bruselas', Class__c='Tourist',
                                                  Departure_Date__c=depDate, Contact__c = cont.Id, Account__c = acc.Id);
        insert fb;
        
        fb.Destination__c = 'Paris';
        update fb;
        List<Flight_Bookings__c> listFlightBooking = [SELECT Modified__c FROM Flight_Bookings__c WHERE id =: fb.Id];
        System.assertEquals(true, listFlightBooking[0].Modified__c);
    }
}