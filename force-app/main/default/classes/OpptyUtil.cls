public class OpptyUtil
{

public static void createoppty(Map<Id,Account> accNewMap,Map<Id,Account> accOldMap)
{
   
   if(accNewMap!=null && accNewMap.size()>0)
   {
            List<Opportunity> oppList = new List<Opportunity>();
            for (Account a : [SELECT Id,Name,Active__c FROM Account
                     WHERE Id IN :accNewMap.values() AND
                     Id NOT IN (SELECT AccountId FROM Opportunity)]) {
        // Add a default opportunity for this account
        if(Trigger.IsInsert)
        {
        oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                   StageName='Prospecting',
                                   CloseDate=System.today().addMonths(1),
                                   AccountId=a.Id)); 
        }
        
        if( Trigger.IsUpdate && accNewMap.get(a.id).Active__c != accOldMap.get(a.id).Active__c)
        {
           oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                   StageName='Prospecting',
                                   CloseDate=System.today().addMonths(2),
                                   AccountId=a.Id)); 
        
        }                         
    }
    
    if (oppList.size() > 0) {
        insert oppList;
    }
    
   }

}

}