trigger EJ1Triggers on Flight_Bookings__c (before insert, before update) {
    List<Flight_Bookings__c> listFlights = Trigger.new;
    Map<Id, Flight_Bookings__c> mapFlights = Trigger.newmap;
    List<Flight_Bookings__c> oldList = Trigger.old;
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            FlightBookingsHelper.putAccount(listFlights);
        }
        if(Trigger.isUpdate){
            FlightBookingsHelper.modifyAccount(oldList, mapFlights);
        }
    }
}