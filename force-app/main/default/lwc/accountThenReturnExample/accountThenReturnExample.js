import { LightningElement, track, wire } from 'lwc'; 
import fetchAccounts from '@salesforce/apex/AccountController.fetchAccounts';
import updateAccounts from '@salesforce/apex/AccountController.updateAccounts';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
 
const columns = [   
    { label: 'Name', fieldName: 'Name', editable : true }, 
    { label: 'Industry', fieldName: 'Industry' },
];

export default class LightningDataTableLWC extends NavigationMixin( LightningElement ) {
     
    @track accounts; 
    @track error; 
    @track columns = columns; 
 
    @wire( fetchAccounts )
    wiredFetchAccounts( value ) {
       
        if ( value.data ) {
           
            this.accounts = value.data;
         } else if ( value.error ) {
           
            this.error = value.error;

        }
       
    }

    handleSave(event) {

        var saveDraftValues = event.detail.draftValues;
        var checkBool = true;

        for ( var i = 0; i < saveDraftValues.length; i++ ) {
        
            if ( saveDraftValues[i].Name == 'Test' ) {

                const evt = new ShowToastEvent({
                    message: 'Account Name cannot be Test',
                    variant: 'error',
                });
                this.dispatchEvent( evt );
                checkBool = false;
                break;

            }
           
        }

        if ( checkBool == true ) {

            updateAccounts( { 'accList' : saveDraftValues } )   
            .then(result => { 
 
                console.log( 'Result is ' + result );
                if ( result === 'Successfully Updated') {

                    const evt = new ShowToastEvent({
                        message: 'Account(s) updated Successfully',
                        variant: 'success',
                    });
                    this.dispatchEvent( evt );
										location.reload();

                } else {
                   
                    const evt = new ShowToastEvent({
                        message: 'Account(s) update failed due to ' + result,
                        variant: 'error',
                    });
                    this.dispatchEvent( evt );

                }
 
            }) 
            .catch(error => { 
 
                const evt = new ShowToastEvent({
                    message: 'Account(s) update failed',
                    variant: 'error',
                });
                this.dispatchEvent( evt );
 
            }); 
            //location.reload();

        }

    }

}