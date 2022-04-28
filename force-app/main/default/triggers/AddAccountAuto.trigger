trigger AddAccountAuto on Flight_Bookings__c (before insert) {
    
    public void putAccount(List<Flight_Bookings__c> listNews){
        Set<Id> setContactId = new Set<Id>();
        for(Flight_Bookings__c inFlightBooking : listNews){
            setContactId.add(inFlightBooking.Contact__c);
        }
        List<Contact> listContact = [SELECT Id, name, Account.Id
                                    FROM Contact WHERE Id IN : setContactId];
        Map<Id, Contact> mapContactIds = new Map<Id,Contact>
            ([SELECT Id, name, Account.Id FROM Contact WHERE Id IN : setContactId]);
        for(Contact inContact : listContact){
            mapContactIds.put(inContact.Id, inContact);
        }
        
        for(Flight_Bookings__c inFlightBooking : listNews){
            if(mapContactIds.containsKey(inFlightBooking.Contact__c) && inFlightBooking.Account__c == null){
                inFlightBooking.Account__c = mapContactIds.get(inFlightBooking.Contact__c).AccountId;
            }
        }
    }
    
    public void modifyAccount(List<Flight_Bookings__c> olds, Map<Id, Flight_Bookings__c> news){
        for(Flight_Bookings__c inFlightBooking : olds){
            if(inFlightBooking.Origin__c != news.get(inFlightBooking.Id).Origin__c 
               || inFlightBooking.Destination__c != news.get(inFlightBooking.Id).Destination__c){
                   news.get(inFlightBooking.Id).Modified__c = true;
               }
        }
    }
}