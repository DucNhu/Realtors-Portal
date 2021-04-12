import { Component, OnInit } from '@angular/core';
import { HomePageService } from 'src/app/@core/mock/Home/home-page.service';
import { environment } from 'src/app/@core/models/Environment';
import { FormGroup, FormBuilder } from '@angular/forms';
import { CategoryService } from 'src/app/@core/mock/category.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-result-by-search',
  templateUrl: './property-list.component.html',
  styleUrls: ['./property-list.component.css']
})
export class ResultBySearchBoxComponent implements OnInit {
  listProduct;
  containData;
  getIdLength = 0;
  ImageBannerSrc = environment.ImageProductUrl + "Banner/";
  UserSrcAvatar = environment.ImageUrl + "Customer/";
  // END khai bao bien
  constructor(
    private homePageService: HomePageService,
    private FormBuilder: FormBuilder,
    private categoryService: CategoryService,
    private route: Router
  ) { }

  //  VALUE OF SEARCH
  listCategory; imgsrcCategory = environment.ImageUrl + 'Categories/';
  listLocation; listCountry; listDistrict; listCity; listAre;
  imgsrcLocation = environment.ImageAddressUrl + 'Locations/';
  imgsrcCountry = environment.ImageAddressUrl + 'Countries/';
  imgsrcCity = environment.ImageAddressUrl + 'Cities/';
  imgsrcDistrict = environment.ImageAddressUrl + 'Districts/';
  imgsrcAre = environment.ImageAddressUrl + 'Ares/';

  maxSqft;
  maxPrice;
  //  END SEARCH
  countResults = 0;
  ngOnInit(): void {
    let i = 0;
    this.listProduct = this.homePageService.getValueBySearch();
    if (this.homePageService.getValueBySearch() == undefined) {
      this.route.navigate(['/']);
    }

    this.listProduct.forEach(e => {
      this.countResults = ++i;
    });

    this.ValidatorForm();

    // SEARCH
    this.getAllCategoryActive();
    this.getAddressActive();
    this.homePageService.getmaxSqft().subscribe(
      data => {
        this.maxSqft = data;
        this.formValidator.controls.sqftMax.patchValue(this.maxSqft[0].maxSqft);
      }
    )
    this.homePageService.getMaxPrice().subscribe(
      data => {
        this.maxPrice = data;
        this.formValidator.controls.priceMax.patchValue(this.maxPrice[0].maxPrice);

      }
    )
  }


  OnSearch(val) {
    let data = {
      category: val.category,
      User_type: val.User_type,
      LocationName: val.LocationName,

      CountryName: val.CountryName,
      CityName: val.CityName,
      DistrictName: val.DistrictName,

      AreName: val.AreName,

      sqftMin: val.sqftMin,
      sqftMax: val.sqftMax,

      priceMin: val.priceMin,
      priceMax: val.priceMax
    }

    this.homePageService.getProductListBySearch(data).subscribe(
      data => {

        this.homePageService.setValueBySearch(data);
        this.route.navigate(['/property-list-search-result'])

      }
    )
  }


  // Get All project
  onCaculator(data) {
    this.caculatorProduct = data;
  }

  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      category: [''],
      User_type: [''],
      LocationName: [''],

      CountryName: [''],
      CityName: [''],
      DistrictName: [''],

      AreName: [''],

      sqftMin: [0],
      sqftMax: [0],

      priceMin: [0],
      priceMax: [0]
    })
  }

  getAllCategoryActive() {
    this.categoryService.getCategoryActive().subscribe(
      data => {
        this.listCategory = data;
      }
    )
  }

  getAddressActive() {
    this.homePageService.getAllLocationsActive().subscribe(
      data => {
        this.listLocation = data;
      }
    );
    this.homePageService.getAllCountryActive().subscribe(
      data => {
        this.listCountry = data;
      }
    );
    this.homePageService.getAllCityActive().subscribe(
      data => {
        this.listCity = data;
      }
    );
    this.homePageService.getAllDistrictsActive().subscribe(
      data => {
        this.listDistrict = data;
      }
    );
    this.homePageService.getAllAresActive().subscribe(
      data => {
        this.listAre = data;
      }
    );
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
