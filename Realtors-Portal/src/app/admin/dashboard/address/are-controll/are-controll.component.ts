import { Component, OnInit } from '@angular/core';
import { AreService } from '../../../../@core/mock/Address/Are.service';
import { DistrictService } from '../../../../@core/mock/Address/District.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';
import {ThemePalette} from '@angular/material/core';

@Component({
  selector: 'app-are-controll',
  templateUrl: './are-controll.component.html',
  styleUrls: ['../../../admin.component.css', './are-controll.component.css']
})
export class AreControllComponent implements OnInit {
  // matterial
  color: ThemePalette = 'accent';
  checked = false;
  disabled = false;
  // enfd material


  // Khai bao bien
  listDistrict;
  idLength;
  getImageAvatarSrc = environment.ImageAddressUrl + "Ares/";

  DataFormAreEdit = {
    AreID: 0,
    Avatar: "AvatarDefault.jpg",
    ImageBannerSrc: this.getImageAvatarSrc,
    ImageFile: File,
    AreName: "",
    Active: 1,
    AreLetter: "",
  };
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _AreService: AreService,
    private _DistrictService: DistrictService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getAllDistrict();
    this.getAllAre();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listAre = [];
  containData;
  getIdLength = 0;
  // Get All project
  getAllAre() {
    this._AreService.getAreByDistrictID().subscribe(
      data => {
        this.containData = data;
        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageAvatarSrc;
          e.AreLetter = e.AreName.substr(0, 1);
          this.listAre.unshift(e);
        });
        console.log(this.listAre);

      }
    )
  }

  // function CreateAre:
  dataImage;
  selectedFile: File = null;
  CreateAre(data) {
    data.AreID = 0;
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormAreEdit.Avatar;
    if (this.upPhoto()) {// Insert Image
      this._AreService.createAre(data)
        .subscribe(res => {
          let getIDLength = 0;
          try { getIDLength = this.listAre[length].AreID;
           } catch { getIDLength = 0; }
          data.AreID = getIDLength += 1;
          data.ImageBannerSrc = '';
          data.Avatar = this.DefaultandNewAvatar;
          this.listDistrict.forEach(e => { // loop => set data District Name for Are.Districtname
            if (e.DistrictID == data.DistrictID) {
              data.DistrictName = e.DistrictName;
            }
          });
          this.listAre.unshift(data);
          this.resetImageArray();
          this.Alert_successFunction("Created done");
        });
    }
    else {
      this.Alert_dangerFunction("Try again, pls")
    }

  }

  resetImageArray() { // because update in array
    this.listAre[length].ImageBannerSrc = '';
    this.listAre[length].Avatar = ''; // reset not loop
    this.listAre[length].Avatar = this.DefaultandNewAvatar;
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
        this.DataFormAreEdit.Avatar = dateNow.getTime() + this.dataImage.name;
        this.DefaultandNewAvatar = event.target.result;
      }
    }
  }
  upPhoto() {
    const formData: FormData = new FormData();
    console.log(this.dataImage);
    console.log(this.DataFormAreEdit.Avatar);

    try {
      formData.append('ImageFile', this.dataImage, this.DataFormAreEdit.Avatar);

      this._AreService.updateAvatar(formData).subscribe(() => {
      })
    }
    catch (e) {
      return false;
    }
    return true;
  }

  // Function Edit Project
  upgrade = false;
  UpdateAre(data) {
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormAreEdit.Avatar;
    data.DistrictID = parseInt(data.DistrictID);
    console.log(data);

    this._AreService.updateAre(data).subscribe(
      val => {
        if (this.newImage == true) {
          this.upPhoto();
          this.newImage = false
        }
        this.Alert_successFunction("Update Success");
        this.listDistrict.forEach(e => { // loop => set data Location Name for Country.Locationname
          if (e.DistrictID == data.DistrictID) {
            data.DistrictName = e.DistrictName;
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
    this.listAre.forEach(element => {
      i++;

      if (element.AreID == val.AreID) {
        val.ImageBannerSrc = '';
        val.Avatar = this.DefaultandNewAvatar;
        this.listAre.splice(i, 1, val);
        // this.resetImageArray();
      }
    });
  }

  // function CreateEmployee:
  DeleteEmPloyee(id) {
    if (confirm("Are you ok?")) {
      this._AreService.deleteAre(id).subscribe(
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
    this.listAre.forEach(element => {
      i++;
      if (element.AreID == id) {
        this.listAre.splice(i, 1);

        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddAreForm;
  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      this.DefaultandNewAvatar = environment.defaultImage;
      return this.isAddAreForm = true;
    }
    else {
      this.GetDataEditorAdd(val);
      return this.isAddAreForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      AreID: [0, [Validators.required]],
      AreName: ['AreName', [Validators.required]],
      Active: [false, [Validators.required]],

      AreLetter: ['A', [Validators.required]],
      DistrictID: ['', [Validators.required]],
    })
  }
  get AreName() { return this.formValidator.get('AreName') }
  GetDataEditorAdd(val) {
    console.log(val);

    this.DefaultandNewAvatar = (val.Avatar.indexOf(this.getImageAvatarSrc) > -1 ? '' : this.getImageAvatarSrc) + val.Avatar;
    if (val.Avatar.indexOf("base64") > -1) {
      this.DefaultandNewAvatar = val.Avatar;
    }
    this.formValidator.controls.AreName.patchValue(val.AreName);
    this.formValidator.controls.AreID.patchValue(val.AreID);

    this.formValidator.controls.Active.patchValue(val.Active == 0 ? false : true);
    this.formValidator.controls.AreLetter.patchValue(val.AreName.substr(0, 1));
    this.formValidator.controls.DistrictID.patchValue(val.DistrictID);
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
  getAllDistrict() {
    this._DistrictService.getAllDistrictByCityID().subscribe(data => {
      this.listDistrict = data;
      console.log(data);

    })
  }

  SetAreLetterWhenEnterName(value) {
    this.formValidator.controls.AreLetter.patchValue(value.substr(0, 1));
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
