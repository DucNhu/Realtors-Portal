import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder } from '@angular/forms';
import { HomePageService } from 'src/app/@core/mock/Home/home-page.service';
import { environment } from 'src/app/@core/models/Environment';

@Component({
  selector: 'app-property-list',
  templateUrl: './property-list.component.html',
  styleUrls: ['./property-list.component.css']
})
export class PropertyListComponent implements OnInit {
  listProduct = [];
  containData;
  getIdLength = 0;
  ImageBannerSrc = environment.ImageProductUrl + "Banner/";
  UserSrcAvatar = environment.ImageUrl + "Customer/";
  // END khai bao bien
  constructor(
    private homePageService: HomePageService,
    private FormBuilder: FormBuilder
  ) { }

  ngOnInit(): void {
    this.getAllProduct();
    this.ValidatorForm();
  }

  // Get All project
  countResults = 0;
  getAllProduct() {
    this.homePageService.getProductActive().subscribe(
      data => {
        let i = 0;
        this.containData = data;
        this.containData.forEach(e => {
          this.countResults = ++i;
          e.UserSrcAvatar = this.UserSrcAvatar;
          this.listProduct.unshift(e);
        });
      }
    )
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

  // panigate ( phân trang )
  page = 1;
  count = 0;
  tableSize = 5;
  tableSizes = [3, 6, 9, 12];

  fetchPosts(): void {
    this.homePageService.getProductActive().subscribe(
      (response) => {
        this.containData = response;
      },
      (error) => {
        console.log(error);
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
}
