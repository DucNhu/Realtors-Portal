import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../@core/models/Environment';

import { UserService } from '../../@core/mock/Customer/user.service';
import { RolesService } from '../../@core/mock/Customer/role/roles.service';

@Component({
  selector: 'app-list-user',
  templateUrl: './list-user.component.html',
  styleUrls: ['./list-user.component.css']
})
export class ListUserComponent implements OnInit {

  // Khai bao bien
  idLength;
  getImageAvatarSrc = environment.ImageUrl + "Customer/";

  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private userService: UserService,
    private http: HttpClient,
    private rolesService: RolesService
  ) { }

  ngOnInit(): void {
    this.getAllUser();
  }

  // ======== CRUD ============
  listSeller = [];
  ListRoles;
  containData;
  getIdLength = 0;
  resultCount = 0;
  // Get All project
  getAllUser() {
    this.userService.getAllUser().subscribe(
      data => {
        this.containData = data;
        
        let i =0;
        this.containData.forEach(e => {
          this.resultCount = ++i;
          e.ImageAvatarSrc = this.getImageAvatarSrc;
          this.listSeller.unshift(e);
        });
      }
    )
  }


   // panigate ( phân trang )
   page = 1;
   count = 0;
   tableSize = 5;
   tableSizes = [3, 6, 9, 12];

   fetchPosts(): void {
     this.userService.getAllUser().subscribe(
       (response) => {
         this.containData = response;
       },
       (error) => {
         console.log(error);
       }
     );
   }

   onTableDataChange(event) {
     this.page = event;
     this.fetchPosts();
   }

   onTableSizeChange(event): void {
     this.tableSize = event.target.value;
     this.page = 1;
     this.fetchPosts();
   }
}
