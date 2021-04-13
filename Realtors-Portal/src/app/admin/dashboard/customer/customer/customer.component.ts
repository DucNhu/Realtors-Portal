import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';

import { UserService } from '../../../../@core/mock/Customer/user.service';
import { RolesService } from '../../../../@core/mock/Customer/role/roles.service';
import { AdminService } from 'src/app/@core/mock/Customer/admin.service';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['../../../admin.component.css', './customer.component.css']
})
export class CustomerComponent implements OnInit {

  // Khai bao bien
  idLength;
  getImageBannerSrc = environment.ImageUrl + "Customer/";

  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private userService: UserService,
    private adminService: AdminService,
    private http: HttpClient,
    private rolesService: RolesService
  ) { }

  ngOnInit(): void {
    this.getAllUser();
    this.getRoles();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listSeller = [];
  ListRoles;
  containData;
  getIdLength = 0;
  // Get All project
  getAllUser() {
    this.adminService.getAllUser().subscribe(
      data => {
        this.containData = data;
        console.log(data);
        
        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          this.listSeller.unshift(e);
        });
      }
    )
  }

  getRoles() {
    this.rolesService.GetRoles().subscribe(data => {
      this.ListRoles = data;
    })
  }

  // function CreateUser:
  dataImage;
  selectedFile: File = null;

  resetImageArray() { // because update in array
    this.listSeller[length].ImageBannerSrc = '';
    this.listSeller[length].Avatar = ''; // reset not loop
    this.listSeller[length].Avatar = this.DefaultandNewAvatar;
    this.DefaultandNewAvatar = '';
  }
  // Function update Image
  DefaultandNewAvatar = "http://adevaes.com/wp-content/uploads/2016/11/26102015122159AMaboutus-default-banner.jpg"; // default  banner img

  // Update Image when select change

  // Function Edit Project
  upgrade = false;
  UpdateUser(data) {
    data.Active = data.Active == true ? 1 : 0;
    this.userService.putUserForAdmin(data).subscribe(
      val => {
        this.Alert_successFunction("Update Success");
        this.EditByIdInArray(data);
      },
      error => {
        this.Alert_dangerFunction("Error Update")
      }
    );
  }

  ActiveAllAccout() {
    let data = undefined;
    this.userService.putAllUserActiveForAdmin(data).subscribe(
      val => {
        this.Alert_successFunction("Update Success");
        let i = -1;
        this.listSeller.forEach(element => {
          i++;
          element.Active = 1;
          this.listSeller.splice(i, 1, element);
          // this.resetImageArray();
        });
      },
      error => {
        this.Alert_dangerFunction("Error Update")
      }
    );
  }

  EditByIdInArray(val) {
    let i = -1;
    this.listSeller.forEach(element => {
      i++;

      if (element.ID == val.ID) {
        element.Active = val.Active;
        element.User_type = val.User_type;
        this.listSeller.splice(i, 1, element);
        // this.resetImageArray();
      }
    });
  }

  // ======== END CRUD ============

  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      // this.GetDataEditorAdd(val);
    }
    else {
      this.GetDataEditorAdd(val);
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      ID: [0, [Validators.required]],
      User_type: ['seller', [Validators.required]],
      Active: [0, [Validators.required]],
    })
  }
  get UserName() { return this.formValidator.get('UserName') }

  GetDataEditorAdd(val) {
    this.formValidator.controls.User_type.patchValue(val.User_type);
    this.formValidator.controls.ID.patchValue(val.ID);

    this.formValidator.controls.Active.patchValue(val.Active == 0 ? false : true);
  }


  // Alert variable
  alert_Text;
  alert_success = false; alert_danger = false; alert_warn = false;
  // Function show alert

  AlertFunction(success) {
    if (success) {
      setTimeout(() => {
        this.alert_success = !this.alert_success;
      }, 800);
    }

    else {
      setTimeout(() => {
        this.alert_danger = !this.alert_danger;
      }, 2000);
    }
  }
  Alert_successFunction(value) {
    this.alert_Text = value;
    this.alert_success = true;
    // call function set alert_success = true  
    this.AlertFunction(true);
  }
  Alert_dangerFunction(value) {
    this.alert_Text = value;
    this.alert_danger = true;

    // call function set alert_danger = true  
    this.AlertFunction(false);
  }

  // END Function show alert

  // handFileInput
  // imageBannertoUpload: File = null;
  // handFileInput(file: FileList) {
  //   this.imageBannertoUpload = file.item(0)    
  // }
  // END handFileInput
}

// Mục Lục

/**
 * Khai bao bien
 * CRUD
 * Form Validator
 * Set value edit form (GetDataEditorAdd)
 * Alert Success, errorr...
 * handFileInput
 */