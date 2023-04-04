({
	doFire : function(shahComp, shahEvent, shahHelper) {
        console.log("BEGIN of doFire in AppEventFiringComp");
        var shahAppEvt=$A.get("e.c:shahAppEvent");
        var myCode=shahComp.get("v.myCode");
        console.log("User Entered:: "+myCode);
        shahAppEvt.setParams({"myCode":myCode});
        shahAppEvt.fire();
        console.log("END of doFire in AppEventFiringComp");
		
	}
})