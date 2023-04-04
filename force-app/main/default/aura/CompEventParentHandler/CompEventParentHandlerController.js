({
	doHandle : function(shahComp, shahEvent, shahHelper) {
        console.log("BEGIN  doHandle in CompEventParent");
		var myChar=shahEvent.getParam("myAlphabet");
        console.log(myChar);
        
        if(myChar=="A")
        {
           var myRes=shahComp.set("v.myResult","A for Apple"); 
        }
        
        else if(myChar=="Z")
        {
          var myRes=shahComp.set("v.myResult","Z for Zebra");  
        }
        console.log("End  doHandle in CompEventParent");
	}
})