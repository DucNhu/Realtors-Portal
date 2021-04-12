import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';

import { AuthenticationService } from 'src/app/@core/mock/Authentication.Service';
import { UserService } from '../../../../@core/mock/Customer/user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  // Khai bao bien
  idLength;
  getImageBannerSrc = environment.ImageUrl + "Customer/";
  // ======== CRUD ============
  infor;
  ListRoles;
  containData;
  getIdLength = 0;
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private userService: UserService,
    private http: HttpClient,
    private authenticationService: AuthenticationService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.infor = this.authenticationService.currentUserValue.Infor;
    this.infor.src = environment.ImageUrl + 'Customer/';
  }
  
  
  // Update Image when select change
  dataImage; Avatar;
  onSelectFile(e) {
    this.dataImage = e.target.files.item(0);
    let dateNow = new Date();

    if (e.target.files) { // Check File true : false
      var reader = new FileReader(); // DOM
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (event: any) => {
        this.Avatar = dateNow.getTime() + this.dataImage.name;
      }
    }
  }
  upPhoto() {
    let idAndNameImage = {
      ID: this.authenticationService.currentUserValue.Infor.ID,
      Avatar: this.Avatar
    }
    const formData: FormData = new FormData();

    try {
      formData.append('ImageFile', this.dataImage, this.Avatar);
      this.userService.UpdateAvatar(formData).subscribe(() => {
        this.userService.UpdateAvatarInDb(idAndNameImage).subscribe(() => {})
      });
    }
    catch (e) {
      return false;
    }
    return true;
  }

  logout() {
    this.authenticationService.logout();
    // this.router.navigate(['/']);
    window.location.assign('/');
  }

  show = false;
  isShow() {
    this.show = !this.show;
  }
}
