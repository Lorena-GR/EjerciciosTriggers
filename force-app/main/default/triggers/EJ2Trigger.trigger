trigger EJ2Trigger on Passenger__c (before insert) {
    List<Passenger__c> listNews = Trigger.new;
    List<Passenger__c> list2 = Trigger.new;
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            PassengerHelper.contactPassengerNIF(listNews);
        }
        if(Trigger.isUpdate){
            PassengerHelper.contactPassengerNIF(list2);
        }
    }
    
}