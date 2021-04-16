import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/@core/mock/Customer/user.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProjectService } from 'src/app/@core/mock/project.service';
import { environment } from 'src/app/@core/models/Environment';
import { AuthenticationService } from 'src/app/@core/mock/Authentication.Service';

@Component({
  selector: 'app-deltail-user',
  templateUrl: './deltail-user.component.html',
  styleUrls: ['./deltail-user.component.css']
})
export class DeltailUserComponent implements OnInit {

  constructor(
    private userService: UserService,
    private activatedRoute: ActivatedRoute,
    private projectService: ProjectService,
    private authenticationService: AuthenticationService
  ) { }

  UserInfor;
  countProductByUser;
  countPackage = 0;
  imgsrc = environment.ImageUrl + "Customer/";
  ImageBannerSrc = environment.ImageProductUrl + "Banner/";
  listProductOfUser; TotalPrice = 0;
  listPackage;
  packageIDForUser;

  isUserTrue = false; // check co phai user do ko, dung thi se xem dc package da dag ki
  ngOnInit(): void {
    this.getUserInfor();
    this.projectService.getCountProductByUserID(this.activatedRoute.snapshot.params['id']).subscribe(
      data => {
        let contain = data;
        this.countProductByUser = contain;
      }
    )

    // Property of user 
    this.userService.getProductByUserIDActive(this.activatedRoute.snapshot.params['id']).subscribe(
      data => {
        let contain;
        contain = data;
        this.listProductOfUser = contain;
        this.TotalPrice = this.listProductOfUser[0].Price;
      }
    )

    // Package By UserID 
    if (this.authenticationService.currentUserValue) {
      if (this.authenticationService.currentUserValue.Infor.ID == this.activatedRoute.snapshot.params['id']) {
        this.userService.getPackageByUserId(this.activatedRoute.snapshot.params['id']).subscribe(
          data => {
            this.listPackage = data;

            this.packageIDForUser = this.listPackage[0].PackageID;
            console.log(this.packageIDForUser);
            this.listPackage.forEach(e => {
              ++this.countPackage;
            });
            // this.TotalPackage = this.listpackage[0].Price;
          }
        )
      }
      else if (this.authenticationService.currentUserValue.Infor.User_type == 'admin') {
        this.userService.getPackageByUserId(this.activatedRoute.snapshot.params['id']).subscribe(
          data => {
            this.listPackage = data;
            
            
            this.listPackage.forEach(e => {
              ++this.countPackage;
            });
          }
        )
      }
    }

  }

  getUserInfor() {
    this.userService.getUserDetail(this.activatedRoute.snapshot.params['id']).subscribe(
      data => {
        this.UserInfor = data;
        let idUser = this.UserInfor[0].ID;
        let IdByToken = this.authenticationService.currentUserValue.Infor.ID;
        if (idUser == IdByToken) {
          this.isUserTrue = true;
        }
        else {
          this.isUserTrue = false;
          console.log(IdByToken, idUser);
        }
      }
    )
  }

  onCaculator(data) {
    this.caculatorProduct = data;
  }


  // Caculator
  caculatorProduct = {
    "ProjectName": "Project Name edited by new form",
    "ID": 11,
    "ImageBannerName": "16180484245654-bedroom-house-for-sale-in-johor-bahru-johor (1).jpg",
    "LevelActive": 2,
    "Description": "3212",
    "Title": "Project Name",
    "Sqft": 321,
    "Price": this.TotalPrice,
    "UserID": 7,
    "Name": "Nhữ Hoàng Minh Đức",
    "Avatar": "AvatarDefault.jpg",
    "Email": "seller@gmail.com",
    "Phone": "0000000000",
    "User_type": "seller",
    "LocationName": "Location2",
    "CountryName": "Country2",
    "CityName": "City1",
    "DistrictName": "District1",
    "AreName": "Are1",
    "CategoryName": "Category1",
    "ImageBannerSrc": "https://localhost:44338/images/Products/Banner/",
    "UserSrcAvatar": "https://localhost:44338/images/Customer/"
  }


  prepaymentList = [0, 30, 40, 50];
  loanTermList = [1, 5, 15, 20];
  interestRate = 7.8;
  prepaymentSelect = 0;
  loanTermSelect = 0;

  originalFeeForOneYear = 0; // Cuoc goc tra trog 1 nam
  interestInOneYear = 0; // tien lãi in 1 year 
  total = 0;// tien trả in 1 year

  loanTerm = 0; // thoi han cho vay 
  prepayment = 0; // tien tra trc
  originalFeeForOneYearFunction() {
    this.prepayment = this.TotalPrice * (this.prepaymentSelect / 100); // tien tra trc

    this.originalFeeForOneYear = (this.TotalPrice - this.prepayment) / this.loanTermSelect;
    this.interestInOneYear = (this.TotalPrice - this.prepayment) * (this.interestRate / 100);
    this.total = (this.interestInOneYear + this.originalFeeForOneYear);

    this.originalFeeForOneYear.toFixed(2);
    this.interestInOneYear.toFixed(2);
    this.total.toFixed(2);
  }
}
