import { Injectable } from '@angular/core';
import { environment } from '../../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class RolesService {

  constructor(
    private http: HttpClient
  ) { }

  GetRoles() {
    return this.http.get(environment.apiUrl + `Roles`)
  }

}
