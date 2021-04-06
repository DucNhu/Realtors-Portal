import { Component, OnInit } from '@angular/core';
import { LocationService } from '../../../../@core/mock/Address/location.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';

@Component({
  selector: 'app-location-controll',
  templateUrl: './location-controll.component.html',
  styleUrls: ['./location-controll.component.css', '../../../admin.component.css']
})
export class LocationControllComponent implements OnInit {
  // Khai bao bien
  idLength;
  getImageAvatarSrc = environment.ImageAddressUrl + "locations/";

  DataFormLocationEdit = {
    LocationID: 0,
    Avatar: "AvatarDefault.jpg",
    ImageBannerSrc: this.getImageAvatarSrc,
    ImageFile: File,
    LocationName: "",
    Active: 1,
    LocationLetter: "",
  };
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _LocationService: LocationService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getAllLocation();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listLocation = [];
  containData;
  getIdLength = 0;
  // Get All project
  getAllLocation() {
    this._LocationService.getAllLocation().subscribe(
      data => {
        this.containData = data;
        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageAvatarSrc;
          e.LocationLetter = e.LocationName.substr(0, 1);
          this.listLocation.unshift(e);
        });
      }
    );
  }

  // function CreateLocation:
  dataImage;
  statusBtn = 'VALID';
  selectedFile: File = null;
  CreateLocation(data) {    
    data.LocationID = 0;
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormLocationEdit.Avatar;

    if (this.upPhoto()) {        // this.upPhoto(); // Insert Image
      this._LocationService.CreateLocation(data)
        .subscribe(res => {

          let getIDLength = 0;
          try { getIDLength = this.listLocation[length].listLocation; } catch { getIDLength = 0; }

          data.LocationID = getIDLength += 1;
          data.ImageBannerSrc = '';
          data.Avatar = this.DefaultandNewAvatar;
          this.listLocation.unshift(data);

          this.Alert_successFunction("Created done");
        });
    }
    else {
      this.Alert_dangerFunction("Create false, try again, pls");
    }


  }

  // Function update Image
  DefaultandNewAvatar = environment.defaultImage; // default  banner img

  // Update Image when select change
  onSelectFile(e) {
    this.dataImage = e.target.files.item(0);
    let dateNow = new Date();

    if (e.target.files) { // Check File true : false
      var reader = new FileReader(); // DOM
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (event: any) => {
        this.DataFormLocationEdit.Avatar = dateNow.getTime() + this.dataImage.name;
        this.DefaultandNewAvatar = event.target.result;
      }
    }
  }
  upPhoto() {
    const formData: FormData = new FormData();

    try {
      formData.append('ImageFile', this.dataImage, this.DataFormLocationEdit.Avatar);
      this._LocationService.UpdateAvatar(formData).subscribe(() => {
      });
    }
    catch (e) {
      return false;
    }
    return true;
  }

  // Function Edit Project
  UpdateLocation(data) {
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormLocationEdit.Avatar;

    this._LocationService.UpdateLocation(data).subscribe(
      () => {
        this.upPhoto();
        this.Alert_successFunction("Update Success");
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
    this.listLocation.forEach(element => {
      i++;

      if (element.LocationID == val.LocationID) {
        console.log(val);
        console.log(this.DefaultandNewAvatar);

        val.ImageBannerSrc = '';
        val.Avatar = this.DefaultandNewAvatar;
        this.listLocation.splice(i, 1, val);
      }
    });
  }

  // function CreateEmployee:
  DeleteEmPloyee(id) {
    if (confirm("Are your ok?")) {
      this._LocationService.deleteLocation(id).subscribe(
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
    this.listLocation.forEach(element => {
      i++;
      if (element.LocationID == id) {
        this.listLocation.splice(i, 1);

        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddLocationForm;
  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      this.DefaultandNewAvatar = environment.defaultImage;
      return this.isAddLocationForm = true;
    }
    else {
      console.log(val);

      this.GetDataEditorAdd(val);
      return this.isAddLocationForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      LocationID: [0, [Validators.required]],
      LocationName: ['LocationName', [Validators.required]],
      Active: [false, [Validators.required]],

      LocationLetter: ['L', [Validators.required]],
    })
  }
  get LocationName() { return this.formValidator.get('LocationName') }
  GetDataEditorAdd(val) {

    this.DefaultandNewAvatar = (val.Avatar.indexOf(this.getImageAvatarSrc) > -1 ? '' : this.getImageAvatarSrc) + val.Avatar;
     if (val.Avatar.indexOf("base64") > -1) {
      this.DefaultandNewAvatar = val.Avatar;
    }
    this.formValidator.controls.LocationName.patchValue(val.LocationName);
    this.formValidator.controls.LocationID.patchValue(val.LocationID);

    this.formValidator.controls.Active.patchValue(val.Active == 0 ? false : true);
    this.formValidator.controls.LocationLetter.patchValue(val.LocationName.substr(0, 1));

    // this.formValidator.controls.Avatar.patchValue(val.Avatar);
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


  // checkValidForm
  checkValidForm(val) {
    switch (val) {
      case "Price": console.log(this.formValidator.controls.Price);

    }
  }
  // END checkValidForm

  SetLocationLetterWhenEnterName(value) {
    this.formValidator.controls.LocationLetter.patchValue(value.substr(0, 1));
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