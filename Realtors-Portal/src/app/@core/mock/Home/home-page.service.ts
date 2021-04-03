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
}
