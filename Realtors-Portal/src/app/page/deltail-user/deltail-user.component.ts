import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/@core/mock/Customer/user.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProjectService } from 'src/app/@core/mock/project.service';
import { environment } from 'src/app/@core/models/Environment';

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

  ) { }

  UserInfor;
  countProductByUser;
  imgsrc = environment.ImageUrl + "Customer/";
  ImageBannerSrc = environment.ImageProductUrl + "Banner/";
  listProductOfUser;
  ngOnInit(): void {    
    this.geUSerDetail();
    this.projectService.getCountProductByUserID(this.activatedRoute.snapshot.params['id']).subscribe( 
      data => {
        this.countProductByUser = data
      }
    )

    // Property Others 
    this.userService.getProductByUserIDActive(this.activatedRoute.snapshot.params['id']).subscribe(
      data => {
        this.listProductOfUser = data; 
        console.log(this.listProductOfUser);
               
      }
    )
  }

  geUSerDetail() {
    this.userService.getUserDetail(this.activatedRoute.snapshot.params['id']).subscribe(
      data => {
        this.UserInfor = data;
        console.log(this.UserInfor);

      }
    )
  }

  onCaculator(data) {
    this.caculatorProduct = data;
    console.log(data);

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
    "Price": 1,
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
  // TotalPrice = 0;
  originalFeeForOneYearFunction(TotalPrice) {
    this.prepayment = TotalPrice * (this.prepaymentSelect / 100); // tien tra trc

    this.originalFeeForOneYear = (TotalPrice - this.prepayment) / this.loanTermSelect;
    this.interestInOneYear = (TotalPrice - this.prepayment) * (this.interestRate / 100);
    this.total = (this.interestInOneYear + this.originalFeeForOneYear)
  }
}
