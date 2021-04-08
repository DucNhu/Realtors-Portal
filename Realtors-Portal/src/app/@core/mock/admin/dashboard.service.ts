import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {


  constructor(
    private http: HttpClient
  ) { }

  countaccActiveNotAd() {
    return this.http.get(environment.apiUrl + 'Admins/getDataDashBoard-accActiveNotAd')
  }
  countaccAgentActive() {
    return this.http.get(environment.apiUrl + 'Admins/getDataDashBoard-accAgentActive')
  }
  countaccSellerActive() {
    return this.http.get(environment.apiUrl + 'Admins/getDataDashBoard-accSellerActive')
  }
  countProductActive() {
    return this.http.get(environment.apiUrl + 'Admins/getDataDashBoard-countProductActive')
  }

  countpackagePurchased() {
    return this.http.get(environment.apiUrl + 'Admins/getDataDashBoard-packagePurchased')
  }
  
}
 