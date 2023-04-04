({
	doSubmit : function(shahComp, shahEvent, shahHelper) {
        console.log("BEGIN  doSubmit in CompEventChild");
        var myCompEvt=shahComp.getEvent("mySampleCompEvt");
        var myAplha=shahComp.get("v.myChar");
        console.log(myAplha);
        myCompEvt.setParam("myAlphabet",myAplha);
        myCompEvt.fire();
        console.log("BEGIN  doSubmit in CompEventChild");
		
	}
})