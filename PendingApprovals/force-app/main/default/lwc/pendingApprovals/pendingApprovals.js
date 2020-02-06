/* eslint-disable no-console */
// eslint-disable-next-line no-console
import { LightningElement, wire, track } from 'lwc';

import getApprovalCount from '@salesforce/apex/AccountController2.getApprovalCount';
import getFirstName from '@salesforce/apex/AccountController2.getFirstName';


    export default class pendingApprovals extends LightningElement {
        @track approvalCount;
        @track user;
        @track plural;
        @track error;
        
        @wire(getApprovalCount)
        wiredApprovalCount({error, data}) {
            if(data){
                this.approvalCount = data;
                if(data > 1){
                    this.plural = true;
                } else {
                    this.plural = false;
                }
            } else if(error) {
                this.error = error;
            }
        }
        @wire(getFirstName)
        wiredUser({error, data}) {
            if(data){
                this.user = data;
            } else if(error) {
                this.error = error;
            }
        }

        handleClick(){
            window.open('/lightning/o/ProcessInstanceWorkitem/list')
        }
}