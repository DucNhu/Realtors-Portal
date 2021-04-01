import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../@core/models/Environment';
@Injectable({
  providedIn: 'root'
})
export class SellerService {

  constructor(private http: HttpClient) { } register(val) {
    return this.http.post(environment.apiUrl + 'Sellers/register', val)
  }
}
