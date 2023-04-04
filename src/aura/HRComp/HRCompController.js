({
	doHandle : function(shahComp, shahEvent, shahHelper) {
		console.log("BEGIN of doHandle in HRComp");
        var myCode=shahEvent.getParam("myCode");
        if(myCode=="A")
        {    
        	shahComp.set("v.myResult","APPROVED");
        }
         console.log("Got the Data:::"+myCode);
        console.log("END of doHandle in HRComp");	
	}
})