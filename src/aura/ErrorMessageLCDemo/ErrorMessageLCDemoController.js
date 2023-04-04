({    
    //Handle Lead Save
    handleLeadSave : function(component, event, helper) {
        var objLead = component.get("v.objLead");
        var action = component.get("c.createLead");
        action.setParams({
            objLead : objLead
        });
        action.setCallback(this,function(a){
            var state = a.getState();
            if(state === "SUCCESS"){
                //alert('Record is Created Successfully');
               var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Success',
            message: 'This is a success message',
            duration:' 5000',
            key: 'info_alt',
            type: 'success',
            mode: 'pester'
        });
        toastEvent.fire();
            } else if(state === "ERROR"){
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        //alert(errors[0].message);
                        
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title : 'Error',
                            message:errors[0].message,
                            duration:' 5000',
                            key: 'info_alt',
                            type: 'error',
                            mode: 'pester'
                        });
                        toastEvent.fire();
                        
                    }
                }
            }else if (status === "INCOMPLETE") {
                alert('No response from server or client is offline.');
            }
        });       
        $A.enqueueAction(action);
    }
})