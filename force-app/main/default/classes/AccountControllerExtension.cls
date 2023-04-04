public class AccountControllerExtension {
    Account acct;
    //the controller extension constructor
    public AccountControllerExtension(ApexPages.StandardController controller) {
             this.acct = (Account) controller.getRecord();
    }
       public List<Opportunity> getChildOpps() {
        return [Select Name, Amount, CloseDate, StageName
        From Opportunity
        Where AccountId =:acct.Id
        and (IsWon = true or IsClosed = false)];
     }
}