public with sharing class AccountController { 
 //Hello Manu
 //Hello manu1
    @AuraEnabled( cacheable = true ) 
    public static List< Account > fetchAccounts() { 
     
        return [ SELECT Id, Name, Industry FROM Account LIMIT 10 ]; 
         
    } 

    @auraEnabled
    public static String updateAccounts( List < Account > accList ){
     //Hello Ankit
     //Hello Manu
        try {

            update accList;
            return 'Successfully Updated';

        } catch( DmlException e ) {

            return e.getMessage();

        }

    }
     
}
