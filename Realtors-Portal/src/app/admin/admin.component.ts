import { Component, OnInit } from '@angular/core';
import { User } from '../@core/models/User';
import { Role } from '../@core/models/Role';

import { BehaviorSubject, Observable } from 'rxjs';
import { AuthenticationService } from '../@core/mock/Authentication.Service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
  private currentUserSubject: BehaviorSubject<User>;
  currentUser: User;

  constructor(
    private authenticationService: AuthenticationService,
    private router: Router
  ) {
    this.authenticationService.currentUser.subscribe(x => this.currentUser = x);
  }

  ngOnInit(): void {
  }
  get isAdmin() {
    return this.currentUser && this.currentUser.role === Role.Admin;
  }
  logout() {
    this.authenticationService.logout();
    this.router.navigate(['/']);
  }
}
