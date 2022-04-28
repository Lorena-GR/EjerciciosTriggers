@isTest
public class EJ2TriggerTest {
    @isTest
    public static void testInsert(){
        Contact con = new Contact(FirstName='Test', LastName='1', NIF__c='73429409T');
        insert con;
        Account acc = new Account(Name= 'SALES');
        insert acc;
        DateTime depDate = Date.today().addDays(2);
        Flight_Bookings__c fb = new Flight_Bookings__c(Origin__c='Madrid', Destination__c='Bruselas', Class__c='Tourist',
                                                  Departure_Date__c=depDate, Contact__c = con.Id, Account__c = acc.Id);
        insert fb;
        Passenger__c pas = new Passenger__c(ID_Card__c='73429409T', Age__c = 22, Name='Pepe', Flight_Bookings__c=fb.Id);
        System.debug(pas);
        insert pas;
        List<Passenger__c> listPass = [SELECT ID_Card__c FROM Passenger__c WHERE ID_Card__c =: con.NIF__c];
        System.assertEquals(con.NIF__c, listPass[0].ID_Card__c);

    }
    @isTest
    public static void testBreak(){
        Contact con = new Contact(FirstName='Test', LastName='1', NIF__c='73429409T');
        insert con;
        Account acc = new Account(Name= 'SALES');
        insert acc;
        DateTime depDate = Date.today().addDays(2);
        Flight_Bookings__c fb = new Flight_Bookings__c(Origin__c='Madrid', Destination__c='Bruselas', Class__c='Tourist',
                                                  Departure_Date__c=depDate, Contact__c = con.Id, Account__c = acc.Id);
        insert fb;
        Passenger__c pas = new Passenger__c(ID_Card__c='734294R', Age__c = 22, Name='Pepe', Flight_Bookings__c=fb.Id);
        System.debug(pas);
        insert pas;
        List<Passenger__c> listPass = [SELECT ID_Card__c FROM Passenger__c WHERE ID_Card__c =: con.NIF__c];
        System.assertNotEquals(con.NIF__c, listPass[0].ID_Card__c);
       

    }
    @isTest
    public static void testUpdate(){
        Contact con = new Contact(FirstName='Test', LastName='1', NIF__c='73429409T');
        insert con;
        Account acc = new Account(Name= 'SALES');
        insert acc;
        DateTime depDate2 = Date.today().addDays(2);
        Flight_Bookings__c fb = new Flight_Bookings__c(Origin__c='Madrid', Destination__c='Bruselas', Class__c='Tourist',
                                                  Departure_Date__c=depDate2, Contact__c = con.Id, Account__c = acc.Id);
        insert fb;
        Passenger__c pas = new Passenger__c(ID_Card__c='73429409T', Age__c = 22, Name='Pepe', Flight_Bookings__c = fb.Id);
        insert pas;

        con.NIF__c = '73429410R';
        update con;
        pas.ID_Card__c = '73429410R';
        update pas;
        List<Passenger__c> listPass = [SELECT ID_Card__c FROM Passenger__c WHERE ID_Card__c =: con.NIF__c];
        System.assertEquals(con.NIF__c, listPass[0].ID_Card__c);

    }
}