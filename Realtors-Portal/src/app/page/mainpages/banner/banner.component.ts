import { Component, OnInit } from '@angular/core';
import { environment } from 'src/app/@core/models/Environment';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { CategoryService } from './../../../@core/mock/category.service';
import { HomePageService } from './../../../@core/mock/Home/home-page.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Route } from '@angular/compiler/src/core';

@Component({
  selector: 'app-banner',
  templateUrl: './banner.component.html',
  styleUrls: ['./banner.component.css']
})
export class BannerComponent implements OnInit {

  listCategory; imgsrcCategory = environment.ImageUrl + 'Categories/';
  listLocation; listCountry; listDistrict; listCity; listAre;
  imgsrcLocation = environment.ImageAddressUrl + 'Locations/';
  imgsrcCountry = environment.ImageAddressUrl + 'Countries/';
  imgsrcCity = environment.ImageAddressUrl + 'Cities/';
  imgsrcDistrict = environment.ImageAddressUrl + 'Districts/';
  imgsrcAre = environment.ImageAddressUrl + 'Ares/';

  ArrmaxSqft; maxSqft = 0;
  ArrmaxSqftmaxPrice; maxPrice = 0;
  constructor(
    private categoryService: CategoryService,
    private homePageService: HomePageService,
    private FormBuilder: FormBuilder,
    private activatedRoute: ActivatedRoute,
    private route: Router
  ) { }

  ngOnInit(): void {
    this.getAllCategoryActive();
    this.getAddressActive();
    this.homePageService.getmaxSqft().subscribe(
      data => {
        this.ArrmaxSqft = data;
        this.maxSqft = this.ArrmaxSqft[0].maxSqft;
        this.formValidator.controls.sqftMax.patchValue(this.maxSqft);
      }
    )
    this.homePageService.getMaxPrice().subscribe(
      data => {
        this.ArrmaxSqftmaxPrice = data;
        this.maxPrice = this.ArrmaxSqftmaxPrice[0].maxPrice
        this.formValidator.controls.priceMax.patchValue(this.maxPrice);

      }
    )
    this.ValidatorForm();
  }

  // Function Validator Form
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

  setFullData = false;
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
}
