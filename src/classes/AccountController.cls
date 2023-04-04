public with sharing class AccountController { 
 
    @AuraEnabled( cacheable = true ) 
    public static List< Account > fetchAccounts() { 
     
        return [ SELECT Id, Name, Industry FROM Account LIMIT 10 ]; 
         
    } 

    @auraEnabled
    public static String updateAccounts( List < Account > accList ){

        try {

            update accList;
            return 'Successfully Updated';

        } catch( DmlException e ) {

            return e.getMessage();

        }

    }
     
}