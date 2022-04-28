trigger EJ3CreditCard on Credit_Card__c (after insert) {
    List<Credit_Card__c> listNews = Trigger.new;
    if(trigger.isAfter){
        if(trigger.isInsert){
            CreditCardHelper.premium(listNews);
        }
    }
}