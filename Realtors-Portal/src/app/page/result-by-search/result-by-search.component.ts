import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HomePageService } from 'src/app/@core/mock/Home/home-page.service';
import { environment } from 'src/app/@core/models/Environment';

@Component({
  selector: 'app-result-by-search',
  templateUrl: './result-by-search.component.html',
  styleUrls: ['./result-by-search.component.css']
})
export class ResultBySearchComponent implements OnInit {

  constructor(
    private homePageService: HomePageService,
    private activatedRoute: ActivatedRoute
  ) { }

  listProductByCategory;
  getImageBannerSrc = environment.ImageProductUrl + "Banner/";
  UserSrcAvatar = environment.ImageUrl + "Customer/";
  ngOnInit(): void {
    this.homePageService.getProductListByCategory(this.activatedRoute.snapshot.paramMap.get("category")).subscribe(
      data => {
        this.listProductByCategory = data;
        this.countResultFunction(this.listProductByCategory)
      }
    )

  }


  countResult = 0;
  countResultFunction(arr) {
    let i = 0;
    arr.forEach(e => {
      this.countResult = ++i;
    });
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
    this.total = (this.interestInOneYear + this.originalFeeForOneYear);

    this.originalFeeForOneYear.toFixed(2);
    this.interestInOneYear.toFixed(2);
    this.total.toFixed(2);
  }
}