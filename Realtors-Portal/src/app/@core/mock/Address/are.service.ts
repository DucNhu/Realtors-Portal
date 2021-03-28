import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AreService {

  constructor(
    private http: HttpClient
  ) { }

  getAllAre() {
    return this.http.get(environment.apiUrl + 'Are')
  }
  getAreByDistrictID() {
    return this.http.get(environment.apiUrl + 'Are/getAreByDistrictID')
  }
  createAre(val) {
    return this.http.post(environment.apiUrl + 'Are', val)
  }

  updateAvatar(val) {
    return this.http.post(environment.apiUrl + "Are/savefile", val)
  }

  updateAre(val) {
    return this.http.put(environment.apiUrl + 'Are/' + val.AreID, val)
  }

  deleteAre(val) {
    return this.http.delete(environment.apiUrl + 'Are/' + val)
  }
}