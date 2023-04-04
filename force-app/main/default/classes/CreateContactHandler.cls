public class CreateContactHandler
{
    @InvocableMethod
    public static void createContacts(List<Account> accList)
    {
        List<Contact> conList=new List<Contact>();
        for(Account a:accList)
        {
            Contact con=new Contact();
            con.AccountId=a.Id;
            con.LastName=a.Name;
            conList.add(con);
        }
        
        try
        {
            if(conList.size()>0)
            insert conList;
        }
        
        catch(Exception e)
        {
        
        }
    
    }

}