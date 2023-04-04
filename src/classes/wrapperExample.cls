public class wrapperExample{
    
    //Wrapper collection declared to hold both object values
    public List<innerWrapper> wrapAccountList {get; set;}
    
    public wrapperExample(){
        if(wrapAccountList == null) {
            wrapAccountList = new List<innerWrapper>();
            for(Account a: [select Id, Name,BillingState, Website, Phone from Account limit 10]) {
                
                List<Contact> child = [select Id, Name from Contact where AccountId = :a.Id];
                
                wrapAccountList.add(new innerWrapper(a,child));
            }
        }
    }
    
    // This wrapper class contains both the salesforce standard object Account and contact
    public class innerWrapper{
        
        public Account acc {get; set;}
        public List<Contact> con {get; set;}
        
        public innerWrapper(Account a, List<Contact> c) {
            acc = a;
            con = c;
            
        }
    }
}