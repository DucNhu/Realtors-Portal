import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { AuthenticationService } from '../@core/mock/Authentication.Service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-page',
  templateUrl: './page.component.html',
  styleUrls: ['./page.component.css']
})
export class PageComponent implements OnInit {

  @Output() checklogin: EventEmitter<boolean> = new EventEmitter();

  constructor(
  ) {
  }

  ngOnInit() {
  }

}


