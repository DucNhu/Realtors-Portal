import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { first } from 'rxjs/operators';
import { environment } from '../../../@core/models/Environment';
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
  imgSrc = environment.ImageUrl + 'Customer/';
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

  checkRoles = 'seller';
  checkLoginTrueFalse() {
    if (this.currentUser.Infor.User_type != "admin") { // check token ? login register : logout
      if (this.currentUser.Infor.User_type == 'agent') {
        this.checkRoles = 'agent';
        this.isLogin = true;
        return true;
      }
      else {
        this.checkRoles = 'seller';
        this.isLogin = true;
        
        return true;
      }

      
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
