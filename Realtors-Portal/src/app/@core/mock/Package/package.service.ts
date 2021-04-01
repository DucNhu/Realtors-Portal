import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class PackageService {

  constructor(
    private http: HttpClient
  ) { }

  getAllPackage() {
    return this.http.get(environment.apiUrl + 'Packages')
  }

  CreatePackage(val) {
    return this.http.post(environment.apiUrl + 'Packages', val)
  }

  UpdateAvatar(val) {
    return this.http.post(environment.apiUrl + "Packages/savefile", val)
  }

  UpdatePackage(val) {
    return this.http.put(environment.apiUrl + 'Packages/' + val.PackageID, val)
  }

  deletePackage(val) {
    return this.http.delete(environment.apiUrl + 'Packages/' + val)
  }
}