import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    handleChangeEvent(event){
        this.template.querySelector('c-to-Child-Component').changeMessage(event.target.value);
    }
}