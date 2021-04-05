import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { first } from 'rxjs/operators';

import { map } from "rxjs/operators";
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';

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
    private router: Router,
  ) {
    this.currentUser = this.authenticationService.currentUserValue;
  }

  ngOnInit() {
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
    // this.checkLoginTrueFalse();
    if (this.checkLoginTrueFalse()) {
      this.getIdWhenLogin();
    }
    
  }
  logout() {
    this.isLogin = false;
    this.authenticationService.logout();
  }

  checkLoginTrueFalse() {
    if (this.currentUser) { // check token ? login register : logout
      this.isLogin = true;
      return true;
    }
    else {
      this.isLogin = false;
      return false;
    };
  }

  data;
  id;
  getIdWhenLogin() {
    // this.route.paramMap.pipe(
    //   map((param: ParamMap) => {
    //     // @ts-ignore

    //     return param.params.id;
    //   })
    // ).subscribe(id => {
    //   this.userService.getUserbyId(id).subscribe(data => {
    //     this.data = data;
    //   });
    // });
    this.id = this.currentUser.Infor.id;
  }
}
