import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CountryService {


  constructor(
    private http: HttpClient
  ) { }

  getAllCountry() {
    return this.http.get(environment.apiUrl + 'Countrys')
  }

  CreateCountry(val) {
    return this.http.post(environment.apiUrl + 'Countrys', val)
  }

  UpdateAvatar(val) {
    return this.http.post(environment.apiUrl + "Countrys/savefile", val)
  }

  UpdateCountry(val) {
    return this.http.put(environment.apiUrl + 'Countrys/' + val.CountryID, val)
  }

  deleteCountry(val) {
    return this.http.delete(environment.apiUrl + 'Countrys/' + val)
  }
}
