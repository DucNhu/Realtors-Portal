import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { first } from 'rxjs/operators';

import { User } from '../../../@core/models/User';
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  @Output() checklogin: EventEmitter<boolean> = new EventEmitter();
  currentUser: any;
  @Input() isLogin = false;
  returnUrl: string;
  constructor(
    private route: ActivatedRoute,
    private authenticationService: AuthenticationService,
    private router: Router
  ) {

    this.currentUser = this.authenticationService.currentUserValue;
  }

  ngOnInit() {
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';


    if (this.currentUser) {
      if (this.currentUser.Infor.User_type != 'admin') {
        this.isLogin = true;
      }
    }
    else {
      this.isLogin = false;
    };
  }
  logout() {
    this.isLogin = false;
    this.authenticationService.logout();
  }
}
