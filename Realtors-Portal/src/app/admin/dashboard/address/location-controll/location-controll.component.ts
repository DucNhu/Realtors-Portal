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
  getImageAvatarSrc = environment.ImageAdressurl + "locations/";

  DataFormLocationEdit = {
    LocationID: 0,
    Avatar: "Avatar",
    ImageBannerSrc: this.getImageAvatarSrc,
    ImageFile: File,
    LocationName: "",
    active: 1,
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
        console.log(this.listLocation);

        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageAvatarSrc;
          this.listLocation.unshift(e);
        });
      }
    )
  }

  // function CreateLocation:
  dataImage;
  selectedFile: File = null;
  CreateLocation(data) {
    data.LocationID = 0;
    data.active = data.active == true ? 1 : 0;
    data.Avatar = this.DataFormLocationEdit.Avatar;
    this._LocationService.CreateLocation(data)
      .subscribe(res => {
        this.upPhoto(); // Insert Image
        data.LocationID = this.listLocation[length].LocationID += 1;
        data.ImageBannerSrc = '';
        data.Avatar = this.DefaultandNewAvatar;
        this.listLocation.unshift(data);
        this.resetImageArray();
        this.Alert_successFunction("Created done");
      });
  }
  resetImageArray() { // because update in array
    this.listLocation[length].ImageBannerSrc = '';
    this.listLocation[length].Avatar = ''; // reset not loop
    this.listLocation[length].Avatar = this.DefaultandNewAvatar;
    this.DefaultandNewAvatar = '';
  }
  // Function update Image
  DefaultandNewAvatar = "http://adevaes.com/wp-content/uploads/2016/11/26102015122159AMaboutus-default-banner.jpg"; // default  banner img

  // Update Image when select change
  myInfor;
  onSelectFile(e) {
    this.dataImage = e.target.files.item(0);
    console.log(this.dataImage.name);
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

    formData.append('ImageFile', this.dataImage, this.DataFormLocationEdit.Avatar);

    this._LocationService.UpdateAvatar(formData).subscribe(() => {
      // console.log(data);
      // this.myInfor.Avatar = data
    })
  }

  // Function Edit Project
  upgrade = false;
  UpdateLocation(data) {
    data.active = data.active == true ? 1 : 0;
    data.Avatar = this.DataFormLocationEdit.Avatar;
    console.log(data);

    this._LocationService.UpdateLocation(data).subscribe(
      val => {
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
        val.ImageBannerSrc = '';
        val.Avatar = this.DefaultandNewAvatar;
        this.listLocation.splice(i, 1, val);
        // this.resetImageArray();
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
      // this.GetDataEditorAdd(val);
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
      active: [false, [Validators.required]],

      LocationLetter: ['A', [Validators.required]],

      Avatar: ['Avatar'],
    })
  }
  get LocationName() { return this.formValidator.get('LocationName') }
  GetDataEditorAdd(val) {

    this.DefaultandNewAvatar = this.getImageAvatarSrc + val.Avatar;
    this.formValidator.controls.LocationName.patchValue(val.LocationName);
    this.formValidator.controls.LocationID.patchValue(val.LocationID);

    this.formValidator.controls.active.patchValue(val.active == 0 ? false : true);
    this.formValidator.controls.LocationLetter.patchValue(val.LocationLetter);

    this.formValidator.controls.Avatar.patchValue(val.Avatar);
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
    else if (success == 0) {
      setTimeout(() => {
        this.alert_warn = !this.alert_warn;
      }, 1000);
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
  Alert_warnFunction(value) {
    this.alert_Text = value;
    this.alert_warn = true;

    // call function set alert_warn = 0
    this.AlertFunction(0);
  }
  // END Function show alert


  // checkValidForm
  checkValidForm(val) {
    switch (val) {
      case "Price": console.log(this.formValidator.controls.Price);

    }
  }
  // END checkValidForm


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
 * checkValidForm
 * handFileInput
 */