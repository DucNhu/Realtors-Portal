import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LocationService {

  constructor(
    private http: HttpClient
  ) { }

  getAllLocation() {
    return this.http.get(environment.apiUrl + 'Locations')
  }

  CreateLocation(val) {
    return this.http.post(environment.apiUrl + 'Locations', val)
  }

  UpdateAvatar(val) {
    return this.http.post(environment.apiUrl + "Locations/savefile", val)
  }

  UpdateLocation(val) {
    return this.http.put(environment.apiUrl + 'Locations/' + val.LocationID, val)
  }

  deleteLocation(val) {
    return this.http.delete(environment.apiUrl + 'Locations/' + val)
  }
}
