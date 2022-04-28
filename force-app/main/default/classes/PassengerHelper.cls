public class PassengerHelper {
    public static Boolean validarDNI(String inputId){
        if (Pattern.matches('[0-9]{8}[A-Z]{1}', inputId)) {
            return true;
        }else{
         	return false;
        }
    }
    
    public static void contactPassengerNIF(List<Passenger__c> listNews){
        Set<String> setNIF = new Set<String>();
        for(Passenger__c pas : listNews){
            if(validarDNI(pas.ID_Card__c)){
                setNIF.add(pas.ID_Card__c);
            }else {
                pas.ID_Card__c.addError('El DNI no es correcto');
            }
        }
        if(!setNIF.isEmpty()){
            Map<String, Contact> mapContactNIF = new Map<String, Contact>();
            for(Contact con : [SELECT Id , NIF__c FROM Contact WHERE NIF__c IN : setNIF]){
                mapContactNIF.put(con.NIF__c, con);
              
            }
            for(Passenger__c pas : listNews){
                if(mapContactNIF.containsKey(pas.Id_Card__c) && pas.Contact__c == null){
                    pas.Contact__c = mapContactNIF.get(pas.Id_Card__c).Id;
                }
            }
        }
    }
}