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
  // https://localhost:44338/api/HomePage/getProductActive

  getProductActive(){
    return this.http.get(environment.apiUrl + 'HomePage/getProductActive')
  }

}
