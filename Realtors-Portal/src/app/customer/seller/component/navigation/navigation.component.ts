import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from './../../../../@core/mock/Authentication.Service';
@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit {

  constructor(
    private authenticationService: AuthenticationService
  ) { }
  UserID = 0;
  ngOnInit(): void {
    this.UserID = this.authenticationService.currentUserValue.Infor.ID
  }

}
