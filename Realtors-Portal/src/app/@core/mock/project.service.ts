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
    return this.http.get(environment.apiUrl + 'projects')
  }

  getProjectByFK() {
    return this.http.get(environment.apiUrl + 'projects/getProjectByFK')
  }

  CreateProj(val) {
    return this.http.post(environment.apiUrl + 'projects', val)
  }

  UpdatePhotoBanner(val) {
    return this.http.post(environment.apiUrl + "projects/savefile", val)
  }

  UpdateProj(id, val) {
    return this.http.put(environment.apiUrl + 'projects/' + id, val)
  }

  deleteProj(val) {
    return this.http.delete(environment.apiUrl + 'projects/' + val)
  }



  //  Address
  getAllLocation() {
    return this.http.get(environment.apiUrl + 'Locations')
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
