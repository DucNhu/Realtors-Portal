import { Injectable } from '@angular/core';
import { environment } from '../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ProjectService {

  constructor(
    private http: HttpClient
  ) { }

  getAllProj() {
    return this.http.get(environment.apiUrl + 'products')
  }

  getProjectByFK() {
    return this.http.get(environment.apiUrl + 'products/getProjectByFK')
  }

  CreateProj(val) {
    return this.http.post(environment.apiUrl + 'products', val)
  }

  UpdatePhotoBanner(val) {
    return this.http.post(environment.apiUrl + "products/savefile", val)
  }

  UpdateProj(id, val) {
    return this.http.put(environment.apiUrl + 'products/' + id, val)
  }

  deleteProj(val) {
    return this.http.delete(environment.apiUrl + 'products/' + val)
  }



  //  Address
  getAllLocationActive() {
    return this.http.get(environment.apiUrl + 'Locations/getLocationActive')
  }
  getAllCountryByLocationID() {
    return this.http.get(environment.apiUrl + 'Countries/getCountryByLocationID')
  }
  getAllCityByCountryID() {
    return this.http.get(environment.apiUrl + 'Cities/getCountryByCountryID')
  }
  getAreByDistrictID() {
    return this.http.get(environment.apiUrl + 'Are/getAreByDistrictID')
  }
  getAllDistrictByCityID() {
    return this.http.get(environment.apiUrl + 'Districts/getDistrictByCityID')
  }
}
