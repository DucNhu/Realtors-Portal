import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class PackageppService {


  constructor(
    private http: HttpClient
  ) { }

  getAllPackage() {
    return this.http.get(environment.apiUrl + 'PackagePurchaseds')
  }
  getAllPackageByUserID(id) {
    return this.http.get(environment.apiUrl + `PackagePurchaseds/getPackageByUserID/user/${id}`)
  }

  getDayMaxOfMonthMaxOfYearMax(id) {
    return this.http.get(environment.apiUrl + `PackagePurchaseds/DayMaxOfMonthMaxOfYearMax/user/${id}`)
  }

  CreatePackagePP(val) {  
    console.log(environment.apiUrl + `PackagePurchaseds/PostPackagePurchased/user/${val.UserID}/${val.Duration}`);
      
    return this.http.post(environment.apiUrl + `PackagePurchaseds/PostPackagePurchased/user/${val.UserID}/${val.Duration}`, val)
  }

  // UpdateAvatar(val) {
  //   return this.http.post(environment.apiUrl + "PackagePurchaseds/savefile", val)
  // }

  UpdatePackage(val) {
    return this.http.put(environment.apiUrl + 'PackagePurchaseds/' + val.ppID, val)
  }

  deletePackage(val) {
    return this.http.delete(environment.apiUrl + 'PackagePurchaseds/' + val)
  }

}