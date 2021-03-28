import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CityService {


  constructor(
    private http: HttpClient
  ) { }

  getAllCity() {
    return this.http.get(environment.apiUrl + 'Cities')
  }
  getAllCityByCountryID() {
    return this.http.get(environment.apiUrl + 'Cities/getCountryByCountryID')
  }
  CreateCity(val) {
    return this.http.post(environment.apiUrl + 'Cities', val)
  }

  UpdateAvatar(val) {
    return this.http.post(environment.apiUrl + "Cities/savefile", val)
  }

  UpdateCity(val) {
    return this.http.put(environment.apiUrl + 'Cities/' + val.CityID, val)
  }

  deleteCity(val) {
    return this.http.delete(environment.apiUrl + 'Cities/' + val)
  }
}
