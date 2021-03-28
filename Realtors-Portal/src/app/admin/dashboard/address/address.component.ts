import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-address',
  templateUrl: './address.component.html',
  styleUrls: ['./address.component.css']
})
export class AddressComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  listAddress = [
    'location',
    'country',
    'city',
    'district',
    'are'
  ]

  selctTab = this.listAddress[0];

  onselect(str: string) {
    this.selctTab = str;
  }
}
