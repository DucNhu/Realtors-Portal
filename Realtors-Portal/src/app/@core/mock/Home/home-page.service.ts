import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class HomePageService {

  constructor(
    private http: HttpClient
  ) { }

  getCategoryActive() {
    return this.http.get(environment.apiUrl + 'HomePage/getCategoryActive')
  }

  getProductViewHome() {
    return this.http.get(environment.apiUrl + 'HomePage/getProductViewHome')
  }

 
  
  // Get package active
  getPackageActive() {
    return this.http.get(environment.apiUrl + 'HomePage/getPackageActive')
  }

  getProductActive(){
    return this.http.get(environment.apiUrl + 'HomePage/getProductActive')
  }

  getProductDetail(id) {
    return this.http.get(environment.apiUrl + `HomePage/getProductDetail/id/${id}`)
  }

  getImageFeatureByProductID(id) {    
    return this.http.get(environment.apiUrl + `HomePage/getImageFeatureByProductID/id/${id}`)
  }


  // Get By Search active
  dataBySearchBox;
  getProductListBySearch(data) {
    console.log(`HomePage/getDataByAdvancedSearch?category=${data.category}&User_type=${data.User_type}&LocationName=${data.LocationName}&CountryName=${data.CountryName}&CityName=${data.CityName}&DistrictName=${data.DistrictName}&AreName=${data.AreName}&sqftMin=${data.sqftMin}&sqftMax=${data.sqftMax}&priceMin=${data.priceMin}&priceMax=${data.priceMax}`);
    return this.http.get(environment.apiUrl + `HomePage/getDataByAdvancedSearch?category=${data.category}&User_type=${data.User_type}&LocationName=${data.LocationName}&CountryName=${data.CountryName}&CityName=${data.CityName}&DistrictName=${data.DistrictName}&AreName=${data.AreName}&sqftMin=${data.sqftMin}&sqftMax=${data.sqftMax}&priceMin=${data.priceMin}&priceMax=${data.priceMax}`)
  }

  setValueBySearch(data) {
    
    this.dataBySearchBox = data;
    console.log(this.dataBySearchBox);
    this.getValueBySearch()
  }
  getValueBySearch() {
    console.log(this.dataBySearchBox);
      
      return this.dataBySearchBox;
  }

  getProductListByCategory(category) {
    return this.http.get(environment.apiUrl + `HomePage/getDataByCategory/${category}`)
  }


  // Address
  getAllLocationsActive() {
    return this.http.get(environment.apiUrl + 'Locations/getLocationActive')
  }

  getAllCountryActive() {
    return this.http.get(environment.apiUrl + 'Countries/getCountryByLocationIDActive')
  }

  getAllCityActive() {
    return this.http.get(environment.apiUrl + 'Cities/getCountryByCountryIDActive')
  }
  
  getAllDistrictsActive() {
    return this.http.get(environment.apiUrl + 'Districts/getDistrictByCityIDActive')
  }

  getAllAresActive() {
    return this.http.get(environment.apiUrl + 'Are/getAreByDistrictIDActive')
  }


  // Price
  getMaxPrice() {
    return this.http.get(environment.apiUrl + 'HomePage/maxPirce')
  }
  getmaxSqft() {
    return this.http.get(environment.apiUrl + 'HomePage/maxSqft')
  }
}

/**
 * 
 * Get Category, product
 * Get by search
 * Get Address
 * Get Price
 */
