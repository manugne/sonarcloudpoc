({
	doHandle : function(shahComp, shahEvent, shahHelper) {
		console.log("BEGIN of doHandle in TeacherComp");
        var myCode=shahEvent.getParam("myCode");
        if(myCode=="A")
        {    
        	shahComp.set("v.myResult","ABSENT");
        }
        console.log("Got the Data:::"+myCode);
        console.log("END of doHandle in TeacherComp");	
	}
})