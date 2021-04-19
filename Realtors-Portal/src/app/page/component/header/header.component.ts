import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { first } from 'rxjs/operators';
import { environment } from '../../../@core/models/Environment';
import { map } from "rxjs/operators";
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { CategoryService } from 'src/app/@core/mock/category.service';
import { UserService } from 'src/app/@core/mock/Customer/user.service';

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

  containData;
  listCategory;
  ImageBanner = '';
  constructor(
    private route: ActivatedRoute,
    private authenticationService: AuthenticationService,
    private router: Router,
    private categoryService: CategoryService,
    private userService: UserService,
  ) {
    this.currentUser = this.authenticationService.currentUserValue;
  }

  ngOnInit() {
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
    this.checkLoginTrueFalse();
    if (this.checkLoginTrueFalse()) {
      this.getIdWhenLogin();
    }

    this.getAllCategory();
    this.OnpreviewImg('AvatarDefault.jpg')
    this.categoryService.getTest().subscribe(
      data => {
        
      }
    )

    this.getInforById();
  }

  InforUser; UserInfor;
  getInforById() {
    // this.UserInfor.Avatar = 'AvatarDefault.jpg'
    this.userService.getUserbyId(this.authenticationService.currentUserValue.Infor.ID).subscribe(
      data => {
        let contain = data;
        this.UserInfor = contain;

        // this.UserInfor.Avatar = this.InforUser.Avatar;
        // this.UserInfor.FullName = this.InforUser.Name;
        // this.UserInfor.Email = this.InforUser.Email;
      
      }
    )
  }
  logout() {
    this.isLogin = false;
    this.authenticationService.logout();
  }

  checkRoles = 'seller';
  checkLoginTrueFalse() {
    if (this.currentUser) {
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

  }

  data;
  id;
  getIdWhenLogin() {
    this.id = this.currentUser.Infor.id;
  }

  // Get All project
  getAllCategory() {
    this.categoryService.getCategoryActive().subscribe(
      data => {
        this.listCategory = data;
      });
  }

  // panigate ( phân trang )
  page = 1;
  count = 0;
  tableSize = 6;
  tableSizes = [3, 6, 9, 12];
  fetchPosts(): void {
    this.categoryService.getAllCategory().subscribe(
      (response) => {
        this.containData = response;

      },
      (error) => {
      }
    );
  }

  onTableDataChange(event) {
    this.page = event;
    this.fetchPosts();
  }

  onTableSizeChange(event): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.fetchPosts();
  }


  OnpreviewImg(ImgName) {
    this.ImageBanner = environment.ImageUrl + "categories/" + ImgName;
  }
}
