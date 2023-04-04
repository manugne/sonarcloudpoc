trigger CaseChange on Case (after update) {
Message_Event__e evt1=new Message_Event__e();
evt1.Description__c='Hello Platform Event 1';
EventBus.Publish(evt1);

Message_Event__e evt2=new Message_Event__e();
evt2.Description__c='Hello Platform Event 2';
EventBus.Publish(evt2);


System.debug('TestCasetrigger>>>');

 

}