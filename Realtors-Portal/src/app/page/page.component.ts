import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { first } from 'rxjs/operators';


import { AuthenticationService } from '../@core/mock/Authentication.Service';
import { Router } from '@angular/router';

import { User } from '../@core/models/User';
@Component({
  selector: 'app-page',
  templateUrl: './page.component.html',
  styleUrls: ['./page.component.css']
})
export class PageComponent implements OnInit {

  @Output() checklogin: EventEmitter<boolean> = new EventEmitter();
  currentUser: any;
  isLogin = false;
  count = 0;
  constructor(
    private authenticationService: AuthenticationService,
    private router: Router
  ) {

    this.currentUser = this.authenticationService.currentUserValue;
  }

  ngOnInit() {
    // this.authenticationService.setUser();
  }
  logout() {
    this.authenticationService.setUser();
    // this.isLogin = false;
    this.authenticationService.logout();
    this.router.navigate(['/login']);

    this.checklogin.emit(false)
  }


}


