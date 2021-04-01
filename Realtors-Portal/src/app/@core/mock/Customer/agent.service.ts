import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../@core/models/Environment';
@Injectable({
  providedIn: 'root'
})
export class AgentService {
  constructor(
    private http: HttpClient
  ) { }

  getAllEmailUser() {
    return this.http.get(environment.apiUrl + 'Agents')
  }
  register(val) {
    return this.http.post(environment.apiUrl + 'Agents/register', val)
  }
}
