public class calloutExample
{

public static void CreatAccountIntegration(List<Account> accLst)
{
    if(accLst !=null && accLst.size()>0)
    {
        for (Account acc : accLst)
        {
           calloutExample.callManuOrg(acc.Name,acc.Phone, acc.Website); 
        
        }
    }


}

@future(callout=true)
public static void callManuOrg(String accName,String phoneNum, String website)
{
HttpRequest req = new HttpRequest();
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setBody('grant_type=password&client_id=3MVG9Y6d_Btp4xp7_7o9cVxZq.SRnRVB0bMKZZMJY5D3Qqy_6HjCzUah04b31MECRXD_FETJlzS2CNJp5T7z9&client_secret=3829086812572865442&username=manugne@gmail.com&password=Tcs$jul172Iux6TPfNmccBSMoXE1jR675s');

        Http http = new Http();
        HttpResponse response = http.send(req);    

        Map<String,Object> mapBody = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());

        // get the Session ID from the response from the call to oauth2/token
        String sessionId = (String)mapBody.get('access_token');
        System.debug('SessionId'+sessionId);

String endPoint = 'https://testlightningmanu-dev-ed.my.salesforce.com/services/apexrest/Account/';

    AccountJsonCls jdata=new AccountJsonCls();
jdata.name=accName;
jdata.phone=phoneNum;
jdata.website=website;
String jsonstr =JSON.serialize(jdata);

Http h2 = new Http();
   HttpRequest req1 = new HttpRequest();
   req1.setHeader('Authorization','Bearer '+sessionId);
   req1.setHeader('Content-Type','application/json');
   req1.setHeader('accept','application/json');
   req1.setBody(jsonstr);
   req1.setMethod('POST');
   req1.setEndpoint(endPoint);
   HttpResponse res1 = h2.send(req1);
   System.debug('Response'+res1);


}

}