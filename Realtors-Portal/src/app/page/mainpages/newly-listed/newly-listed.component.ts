import { Component, OnInit } from '@angular/core';
import { HomePageService } from '../../../@core/mock/Home/home-page.service';
import { environment } from '../../../@core/models/Environment';

@Component({
  selector: 'app-newly-listed',
  templateUrl: './newly-listed.component.html',
  styleUrls: ['./newly-listed.component.css']
})
export class NewlyListedComponent implements OnInit {
  listProduct = [];
  containData;
  getIdLength = 0;
  getImageBannerSrc = environment.ImageProductUrl + "Banner/";
  UserSrcAvatar = environment.ImageUrl + "Customer/";
  // END khai bao bien
  constructor(
    private homePageService: HomePageService,
  ) { }

  ngOnInit(): void {
    this.getAllProduct();
  }

  // Get All project
  getAllProduct() {
    this.homePageService.getProductViewHome().subscribe(
      data => {
        console.log(data);
        
        this.containData = data;
        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          e.UserSrcAvatar = this.UserSrcAvatar;
          this.listProduct.unshift(e);
        });
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
    console.log(this.prepayment);
    
    this.originalFeeForOneYear = (TotalPrice - this.prepayment) / this.loanTermSelect;
    this.interestInOneYear = (TotalPrice - this.prepayment) * (this.interestRate / 100);
    this.total = (this.interestInOneYear + this.originalFeeForOneYear);

    this.originalFeeForOneYear.toFixed(2);
    this.interestInOneYear.toFixed(2);
    this.total.toFixed(2);
  }
}
