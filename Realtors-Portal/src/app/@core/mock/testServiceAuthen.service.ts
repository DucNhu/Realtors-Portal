import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../models/Environment';
@Injectable({
    providedIn: 'root'
})
export class testService {

    constructor(private http: HttpClient) { }


    // Định nghĩa Method trong service
    register(val) {
        return this.http.post(`${environment.apiUrl}Admins`, val);
    }
}
