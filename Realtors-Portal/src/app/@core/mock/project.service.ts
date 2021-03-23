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

  CreateProj(val) {
    // const test = {
    //   "ID": 0,
    //   "CategoryID": 0,
    //   "SellerID": 0,
    //   "ProjectName": "null",
    //   "Title": "null",
    //   "Description": "null",
    //   "Location": "null",
    //   "Country": "null",
    //   "City": "null",
    //   "District": "null",
    //   "Are": "null",
    //   "Price": 0,
    //   "Sqft": 0,
    //   "ImageLibID": 0,
    //   "ImageFile": null,
    //   "ImageBannerName": "null",
    //   "ImageBannerSrc": "null",
    //   "LevelActive": 0
    // }
    console.log(val);
    
    return this.http.post(environment.apiUrl + 'projects', val)
  }

  // UpdatePhotoBanner(val: any) {
  //   console.log(val);

  //   return this.http.post(environment.apiUrl + "projects/savefile", val)
  // }

  UpdateProj(id, val) {        
    return this.http.put(environment.apiUrl + 'projects/' + id, val)
  }

  deleteProj(val) {
    return this.http.delete(environment.apiUrl + 'projects/' + val)
  }
}