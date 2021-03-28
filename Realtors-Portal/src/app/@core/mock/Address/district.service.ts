import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class DistrictService {


  constructor(
    private http: HttpClient
  ) { }

  getAllDistrict() {
    return this.http.get(environment.apiUrl + 'Districts')
  }
  getAllDistrictByCityID() {
    return this.http.get(environment.apiUrl + 'Districts/getDistrictByCityID')
  }
  createDistrict(val) {
    return this.http.post(environment.apiUrl + 'Districts', val)
  }

  updateAvatar(val) {
    return this.http.post(environment.apiUrl + "Districts/savefile", val)
  }

  updateDistrict(val) {
    return this.http.put(environment.apiUrl + 'Districts/' + val.DistrictID, val)
  }

  deleteDistrict(val) {
    return this.http.delete(environment.apiUrl + 'Districts/' + val)
  }
}
