import { LightningElement,wire } from 'lwc';
import callNewsPoint from "@salesforce/apex/ArticleDataController.callNewsPoint";
export default class NewsLWC extends LightningElement {

    @wire(callNewsPoint)
  newsarticles;

}