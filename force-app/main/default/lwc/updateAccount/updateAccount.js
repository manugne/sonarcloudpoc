import { LightningElement,api ,track,wire} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class UpdateAccount extends NavigationMixin(LightningElement) {
    @api recordId;
    
    handleSuccess() {
        console.log('onsuccess event recordEditForm');
      
        this.dispatchEvent(new ShowToastEvent({
            title: "SUCCESS!",
            message: "Account record has been Updated.",
           variant: "success",
        }),
   );
    }

    handleCancel(event){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
               // objectApiName: 'Account',
                actionName: 'view'
            }
        });

         }


}