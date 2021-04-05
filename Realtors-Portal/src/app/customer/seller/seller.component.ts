import { Component, OnInit } from '@angular/core';
import { UserService } from '../../@core/mock/Customer/user.service';
import { AuthenticationService } from './../../@core/mock/Authentication.Service';

@Component({
  selector: 'app-seller',
  templateUrl: './seller.component.html',
  styleUrls: ['./seller.component.css']
})
export class SellerComponent implements OnInit {
  currentUser;
  constructor(
    private userService: UserService,
    private authenticationService: AuthenticationService

  ) {
    this.currentUser = this.authenticationService.currentUserValue;
  }
  id;
  ngOnInit(): void {
    this.getDataUser(this.currentUser.Infor.id);
  }
  data;
  getDataUser(id) {
    this.userService.getUserbyId(id).subscribe(data => {
      this.data = data;
      console.log(data);
    });
  }
}
