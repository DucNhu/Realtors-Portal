import { Component, OnInit } from '@angular/core';
import { DistrictService } from '../../../../@core/mock/Address/District.service';
import { CityService } from '../../../../@core/mock/Address/City.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';

@Component({
  selector: 'app-district-controll',
  templateUrl: './district-controll.component.html',
  styleUrls: ['../../../admin.component.css','./district-controll.component.css']
})
export class DistrictControllComponent implements OnInit {
  // Khai bao bien
  listCity;
  idLength;
  getImageAvatarSrc = environment.ImageAdressurl + "Districts/";

  DataFormDistrictEdit = {
    DistrictID: 0,
    Avatar: "AvatarDefault.jpg",
    ImageBannerSrc: this.getImageAvatarSrc,
    ImageFile: File,
    DistrictName: "",
    Active: 1,
    DistrictLetter: "",
  };
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _DistrictService: DistrictService,
    private _CityService: CityService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getAllCity();
    this.getAllDistrict();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listDistrict = [];
  containData;
  getIdLength = 0;
  // Get All project
  getAllDistrict() {
    this._DistrictService.getAllDistrictByCityID().subscribe(
      data => {
        this.containData = data;
        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageAvatarSrc;
          e.DistrictLetter = e.DistrictName.substr(0, 1);
          this.listDistrict.unshift(e);
        });
        console.log(this.listDistrict);

      }
    )
  }

  // function CreateDistrict:
  dataImage;
  selectedFile: File = null;
  CreateDistrict(data) {
    data.DistrictID = 0;
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormDistrictEdit.Avatar;
    if (this.upPhoto()) {// Insert Image
      this._DistrictService.createDistrict(data)
        .subscribe(res => {
          let getIDLength = this.listDistrict[length].DistrictID;
          data.DistrictID = getIDLength += 1;
          data.ImageBannerSrc = '';
          data.Avatar = this.DefaultandNewAvatar;
          this.listCity.forEach(e => { // loop => set data City Name for District.Cityname
            if (e.CityID == data.CityID) {
              data.CityName = e.CityName;
            }
          });
          this.listDistrict.unshift(data);
          this.resetImageArray();
          this.Alert_successFunction("Created done");
        });
    }
    else {
      this.Alert_dangerFunction("Try again, pls")
    }

  }

  resetImageArray() { // because update in array
    this.listDistrict[length].ImageBannerSrc = '';
    this.listDistrict[length].Avatar = ''; // reset not loop
    this.listDistrict[length].Avatar = this.DefaultandNewAvatar;
    this.DefaultandNewAvatar = '';
  }
  // Function update Image
  DefaultandNewAvatar = environment.defaultImage; // default  banner img

  // Update Image when select change
  newImage = false;
  onSelectFile(e) {
    this.newImage = true;
    this.dataImage = e.target.files.item(0);
    console.log(this.dataImage.name);
    let dateNow = new Date();

    if (e.target.files) { // Check File true : false
      var reader = new FileReader(); // DOM
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (event: any) => {
        this.DataFormDistrictEdit.Avatar = dateNow.getTime() + this.dataImage.name;
        this.DefaultandNewAvatar = event.target.result;
      }
    }
  }
  upPhoto() {
    const formData: FormData = new FormData();
    console.log(this.dataImage);
    console.log(this.DataFormDistrictEdit.Avatar);

    try {
      formData.append('ImageFile', this.dataImage, this.DataFormDistrictEdit.Avatar);

      this._DistrictService.updateAvatar(formData).subscribe(() => {
      })
    }
    catch (e) {
      return false;
    }
    return true;
  }

  // Function Edit Project
  upgrade = false;
  UpdateDistrict(data) {
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormDistrictEdit.Avatar;
    data.CityID = parseInt(data.CityID);
    console.log(data);

    this._DistrictService.updateDistrict(data).subscribe(
      val => {
        if (this.newImage == true) {
          this.upPhoto();
          this.newImage = false
        }
        this.Alert_successFunction("Update Success");
        this.listCity.forEach(e => { // loop => set data Location Name for Country.Locationname
          if (e.CityID == data.CityID) {
            data.CityName = e.CityName;
          }
        });
        this.EditByIdInArray(data);
      },
      error => {
        this.Alert_dangerFunction("Error Update")
      }
    );
  }

  EditByIdInArray(val) {
    console.log(val);

    let i = -1;
    this.listDistrict.forEach(element => {
      i++;

      if (element.DistrictID == val.DistrictID) {
        val.ImageBannerSrc = '';
        val.Avatar = this.DefaultandNewAvatar;
        this.listDistrict.splice(i, 1, val);
        // this.resetImageArray();
      }
    });
  }

  // function CreateEmployee:
  DeleteEmPloyee(id) {
    if (confirm("Are your ok?")) {
      this._DistrictService.deleteDistrict(id).subscribe(
        data => {
          this.Alert_successFunction("Success Delete");
          this.FindIdToDelete(id);
        },
        error => {
          this.Alert_dangerFunction("Error Delete")
        });
    }
  }

  FindIdToDelete(id) {
    let i = -1;
    this.listDistrict.forEach(element => {
      i++;
      if (element.DistrictID == id) {
        this.listDistrict.splice(i, 1);

        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddDistrictForm;
  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      this.DefaultandNewAvatar = environment.defaultImage;
      return this.isAddDistrictForm = true;
    }
    else {
      this.GetDataEditorAdd(val);
      return this.isAddDistrictForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      DistrictID: [0, [Validators.required]],
      DistrictName: ['DistrictName', [Validators.required]],
      Active: [false, [Validators.required]],

      DistrictLetter: ['C', [Validators.required]],
      CityID: ['', [Validators.required]],
    })
  }
  get DistrictName() { return this.formValidator.get('DistrictName') }
  GetDataEditorAdd(val) {
    console.log(val);

    this.DefaultandNewAvatar = (val.Avatar.indexOf(this.getImageAvatarSrc) > -1 ? '' : this.getImageAvatarSrc) + val.Avatar;
    if (val.Avatar.indexOf("base64") > -1) {
      this.DefaultandNewAvatar = val.Avatar;
    }
    this.formValidator.controls.DistrictName.patchValue(val.DistrictName);
    this.formValidator.controls.DistrictID.patchValue(val.DistrictID);

    this.formValidator.controls.Active.patchValue(val.Active == 0 ? false : true);
    this.formValidator.controls.DistrictLetter.patchValue(val.DistrictName.substr(0, 1));
    this.formValidator.controls.CityID.patchValue(val.CityID);
  }



  // Alert variable
  alert_Text;
  alert_success = false; alert_danger = false;
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


  // checkValidForm
  checkValidForm(val) {
    switch (val) {
      case "Price": console.log(this.formValidator.controls.Price);

    }

  }
  // END checkValidForm

  // Funciton get all value in category in service
  getAllCity() {
    this._CityService.getAllCityByCountryID().subscribe(data => {
      this.listCity = data;
    })
  }

  SetDistrictLetterWhenEnterName(value) {
    this.formValidator.controls.DistrictLetter.patchValue(value.substr(0, 1));
  }
}

// Mục Lục

/**
 * Khai bao bien
 * CRUD
 * Form Validator
 * Set value edit form (GetDataEditorAdd)
 * Alert Success, errorr...
 * checkValidForm
 * handFileInput
 */