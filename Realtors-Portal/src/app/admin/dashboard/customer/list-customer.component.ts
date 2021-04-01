import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-list-customer',
  templateUrl: './list-customer.component.html',
  styleUrls: ['./list-customer.component.css']
})
export class ListCustomerComponent implements OnInit {

  constructor() { }
  listAddress = [
    'User',
    // 'country',
    // 'city',
    // 'district',
    // 'are'
  ]
  ngOnInit(): void {
  }
  selctTab = this.listAddress[0]; onselect(str: string) {
    this.selctTab = str;
  }
}
