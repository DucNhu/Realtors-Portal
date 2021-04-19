import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../@core/models/Environment';
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(
    private http: HttpClient
  ) { }

  getUserbyId(id) {
    return this.http.get(environment.apiUrl + `Users/${id}`)
  }

  UpgradeInforUser(data) {
    return this.http.put(environment.apiUrl + `Users/upgradeInforUser/id/${data.ID}`, data)
  }

  register(val) {
    return this.http.post(environment.apiUrl + 'Users/register', val)
  }


  getAllUser() {
    return this.http.get(environment.apiUrl + 'Users/getUserActive')
  }

  //  ADMIN

  getUserNotActive() {
    return this.http.get(environment.apiUrl + 'Users/getUserNotActive')
  }
  putUserForAdmin(val) {
    return this.http.put(environment.apiUrl + 'Users/putUserForAdmin', val)
  }

  SendMail(val) {
    console.log(val);
    
    return this.http.post(environment.apiUrl + 'Mail/send', val)
  }


  putAllUserActiveForAdmin(val) {
    return this.http.put(environment.apiUrl + 'Users/putAllUserActiveForAdmin', val)
  }

  putUserUpgradePackageID(id, PackageID) {
    let val = {
      UserID: id,
      PackageID: PackageID
    }
    
    return this.http.put(environment.apiUrl + `Users/putUserUpgradePackageID/user/${val.UserID}/${val.PackageID}`, val)

  }
  // User
  UpdateAvatarInDb(val) {
    return this.http.put(environment.apiUrl + 'Users/updateAvatar', val)
  }

  UpdateAvatar(val) {
    return this.http.post(environment.apiUrl + "Users/savefile", val)
  }

  GetProductByUserID(id) {
    return this.http.get(environment.apiUrl + `Users/getProductByUserID/user/${id}`)
  }

  getProductByUserIDActive(id) {
    return this.http.get(environment.apiUrl + `Users/getProductByUserIDActive/user/${id}`)
  }


  getUserDetail(id) {
    return this.http.get(environment.apiUrl + `Users/getUserDetail/user/${id}`)
  }

  getPackageByUserId(id) {
    return this.http.get(environment.apiUrl + `Users/getPackageByUserId/id/${id}`)
  }

}
