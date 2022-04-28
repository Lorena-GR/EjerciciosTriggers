public class CreditCardHelper {
    public static void premium(List<Credit_Card__c> listNews){
        Set<Id> setId = new Set<Id>();
        for(Credit_Card__c cre : listNews){
            if(cre.Owner.LastName != 'Accenture TEST'){
                setId.add(cre.Contact__c);
            }
        }
        
        Map<Id, Contact> mapContact = new Map<Id, Contact>([SELECT Id, Premium__c, OwnerId FROM Contact WHERE Premium__c = true]);
        Map<Id, List<Credit_Card__c>> mapCre = new Map<Id, List<Credit_Card__c>>();
		
        
        for(Credit_Card__c c : listNews){
            Integer month = Integer.valueOf(c.Expiration_Month__c);
            Integer year = Integer.valueOf(c.Expiration_Year__c);
            Date closeDate = Date.newInstance(year, month, 1);
            
        }
    }
}