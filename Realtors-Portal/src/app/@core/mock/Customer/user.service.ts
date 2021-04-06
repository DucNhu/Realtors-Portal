import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../@core/models/Environment';
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(
    private http: HttpClient
  ) { }

  getUserbyId(id) {
    return this.http.get(environment.apiUrl + `Users/${id}`)
  }

  register(val) {
    return this.http.post(environment.apiUrl + 'Users/register', val)
  }

  //  ADMIN
  getAllUser() {
    return this.http.get(environment.apiUrl + 'Users/getUserForAdmin')
  }

  putUserForAdmin(val) {
    return this.http.put(environment.apiUrl + 'Users/putUserForAdmin', val)
  }
}
