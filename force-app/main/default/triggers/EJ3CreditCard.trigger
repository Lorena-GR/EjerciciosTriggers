trigger EJ3CreditCard on Credit_Card__c (before insert) {
    List<Credit_Card__c> listNews = Trigger.new;
    if(trigger.isBefore){
        if(trigger.isInsert){
            CreditCardHelper.premium(listNews);
        }
    }
}