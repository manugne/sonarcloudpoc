public class DemoClass
{

    public static void recordResult()
    {
        Map<String,Account> mapQuery=new Map<String,Account>([Select Id, Name,AnnualRevenue from Account Where CreatedDate=LAST_N_DAYS:30]);
        Set<String> setQuery=mapQuery.Keyset();
        List<Account> lstQuery=mapQuery.values();

        System.debug('Test result List:'+mapQuery);
        System.debug('Test result Set:'+ setQuery);
        System.debug('Test result Map:'+lstQuery);
    
    }

}