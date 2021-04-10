import { Injectable } from '@angular/core';
import { environment } from '../../../@core/models/Environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ImageLibService {

  constructor(
    private http: HttpClient
  ) { }

  getAllProj() {
    return this.http.get(environment.apiUrl + 'ImageLibs')
  }

  getImageLibByProductID(id) {
    return this.http.get(environment.apiUrl + `ImageLibs/getImageLibByProductID/${id}`)
  }

  CreateProj(val) {
    return this.http.post(environment.apiUrl + 'ImageLibs', val)
  }

  PostPhotoFeature(val) {
    return this.http.post(environment.apiUrl + "ImageLibs/savefile", val)
  }

  UpdateProj(id, val) {
    return this.http.put(environment.apiUrl + 'ImageLibs/' + id, val)
  }

  deleteProj(val) {
    return this.http.delete(environment.apiUrl + 'ImageLibs/' + val)
  }
}
