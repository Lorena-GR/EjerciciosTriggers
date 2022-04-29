public with sharing class CreditCardHelper {
    public static void premium(List<Credit_Card__c> listNews){
        Set<Id> setId = new Set<Id>();
        for(Credit_Card__c cre : listNews){  
            setId.add(cre.Contact__c);
        }
        User accentureUser = [SELECT LastName FROM User WHERE LastName = 'Accenture TEST' LIMIT 1];
        Map<Id, Contact> mapContact = new Map<Id, Contact>([SELECT Id, Premium__c, OwnerId, AccountId, LastName, FirstName 
                        FROM Contact WHERE Id IN : setId]);
		List<Opportunity> listOpp = new List<Opportunity>();
        

        for(Credit_Card__c c : listNews){
            if(c.OwnerId != accentureUser.Id){
                Contact contacto = mapContact.get(c.Contact__c);
                if(contacto.Premium__c == true){
                    Integer month = Integer.valueOf(c.Expiration_Month__c);
                    Integer year = Integer.valueOf(c.Expiration_Year__c);
                    Date closeDate = Date.newInstance(year, month, 1);
                    if(contacto.FirstName == null){
                        Opportunity opp = new Opportunity(CloseDate = closeDate, StageName = 'Not started', AccountId = contacto.AccountId,
                            Name = contacto.LastName);
                        listOpp.add(opp); 
                    }else{
                        Opportunity opp = new Opportunity(CloseDate = closeDate, StageName = 'Not started', AccountId = contacto.AccountId,
                            Name = contacto.LastName +', ' + contacto.FirstName);
                        listOpp.add(opp);
                    }
                     
                }  
            }            
        }

        insert listOpp;
    }
}