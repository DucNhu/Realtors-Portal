import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../@core/models/Environment';
@Injectable({
  providedIn: 'root'
})
export class AdminService {
  constructor(
    private http: HttpClient
  ) { }

  getAllEmailUser() {
    return this.http.get(environment.apiUrl + 'Admins')
  }

  getAllUser() {
    return this.http.get(environment.apiUrl + 'Users/getUserInAdmin')
  }

  register(val) {
    return this.http.post(environment.apiUrl + 'Admins/register', val)
  }

  putLevelActiveProduct(val) {    
    return this.http.put(environment.apiUrl + `Admins/LevelActiveProduct/productID/${val.ProductID}/LevelActive/${val.LevelActive}`, val.LevelActive)
  }
}
