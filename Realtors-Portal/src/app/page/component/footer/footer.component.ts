import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/@core/mock/Authentication.Service';
import { UserService } from 'src/app/@core/mock/Customer/user.service';
import { HomePageService } from '../../../@core/mock/Home/home-page.service';
import { environment } from '../../../@core/models/Environment';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent implements OnInit {
  listCategory = [];
  containData;
  getIdLength = 0;
  getImageBannerSrc = environment.ImageUrl + "categories/";

  currentUser;
  isLogin = false;
  // END khai bao bien
  constructor(
    private homePageService: HomePageService,
    private authenticationService: AuthenticationService,
    private userService: UserService
  ) {
    this.currentUser = this.authenticationService.currentUserValue;
  }

  ngOnInit(): void {
    this.getAllCategory();

    this.checkLoginTrueFalse();
  }

  // Get All project
  getAllCategory() {
    this.homePageService.getCategoryActive().subscribe(
      data => {
        this.containData = data;

        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          this.listCategory.unshift(e);
        });
      }
    )
  }


  isBuyPackage = false;
  UserInfor;
  checkLoginTrueFalse() {
    if (this.currentUser) { // check token ? login register : logout
      // if (this.currentUser.Infor.User_type) {
      // this.isLogin = true;
      this.userService.getUserbyId(this.currentUser.Infor.ID).subscribe(
        data => {
          this.UserInfor = data; console.log(this.UserInfor);
          if (this.UserInfor.PackageID > 0) {
            this.isBuyPackage = true;
            console.log(this.UserInfor);
          }
          else {
            console.log("LOL");

            this.isBuyPackage = false;
          }
        }
      )
      console.log(this.isBuyPackage);
      
      // }
      // else { }
      // this.isLogin = true;
    }

    else {
      this.isLogin = false;
    };
  }
}
