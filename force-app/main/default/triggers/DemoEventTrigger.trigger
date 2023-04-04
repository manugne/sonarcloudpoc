trigger DemoEventTrigger on Demo_Event__e (after insert) {

List<Demo_Event__e> DemoEventList=new List<Demo_Event__e>();
Map<String,String> AccNumberNameMap=new Map<String,String>();
for(Demo_Event__e event:Trigger.New)
{
    //if(event.Account_Number__c!='')
    //{
        AccNumberNameMap.put(event.Account_Number__c,event.Account_Name__c);
    //}
}

if( AccNumberNameMap!=null &&   AccNumberNameMap.size()>0)
{

List<Account> accLst=new List<Account>();

for(Account acc:[Select Name,AccountNumber from Account Where AccountNumber IN:AccNumberNameMap.Keyset()])
{
 acc.Name= AccNumberNameMap.get(acc.AccountNumber);
 accLst.add(acc);
}

update accLst;


}

}