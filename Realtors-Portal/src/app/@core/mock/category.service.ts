import { Injectable } from '@angular/core';
import { environment } from '../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(
    private http: HttpClient
  ) { }

  getAllCategory() {
    return this.http.get(environment.apiUrl + 'Categories')
  }

  CreateCategory(val) {
    return this.http.post(environment.apiUrl + 'Categories', val)
  }

  UpdateAvatar(val) {
    return this.http.post(environment.apiUrl + "Categories/savefile", val)
  }

  UpdateCategory(val) {    
    return this.http.put(environment.apiUrl + 'Categories/' + val.CategoryID, val)
  }

  deleteCategory(val) {
    return this.http.delete(environment.apiUrl + 'Categories/' + val)
  }
}
