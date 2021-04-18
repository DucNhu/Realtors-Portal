import { Component, OnInit } from '@angular/core';
import { CityService } from '../../../../@core/mock/Address/City.service';
import { CountryService } from '../../../../@core/mock/Address/Country.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';

@Component({
  selector: 'app-city-controll',
  templateUrl: './city-controll.component.html',
  styleUrls: ['../../../admin.component.css','./city-controll.component.css']
})
export class CityControllComponent implements OnInit {
  // Khai bao bien
  listCountry;
  idLength;
  getImageAvatarSrc = environment.ImageAddressUrl + "Cities/";

  DataFormCityEdit = {
    CityID: 0,
    Avatar: "AvatarDefault.jpg",
    ImageBannerSrc: this.getImageAvatarSrc,
    ImageFile: File,
    CityName: "",
    Active: 1,
    CityLetter: "",
  };
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _CityService: CityService,
    private _CountryService: CountryService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getAllCountry();
    this.getAllCity();
    this.ValidatorForm();
    // this.getAllCityByCountryID();
  }

  // ======== CRUD ============
  listCity = [];
  containData;
  getIdLength = 0;
  // Get All project
  getAllCity() {
    this._CityService.getAllCityByCountryID().subscribe(
      data => {
        this.containData = data;
        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageAvatarSrc;
          e.CityLetter = e.CityName.substr(0, 1);
          this.listCity.unshift(e);
        });
        // console.log(this.listCity);

      }
    )
  }

  // function CreateCity:
  dataImage;
  selectedFile: File = null;
  CreateCity(data) {
    data.CityID = 0;
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormCityEdit.Avatar;
    if (this.upPhoto()) {// Insert Image
      this._CityService.CreateCity(data)
        .subscribe(res => {
          let getIDLength = 0;
          try { getIDLength = this.listCity[length].CityID; } catch { getIDLength = 0;}

          data.CityID = getIDLength += 1;
          data.ImageBannerSrc = '';
          data.Avatar = this.DefaultandNewAvatar;
          this.listCountry.forEach(e => { // loop => set data Country Name for City.Countryname
            if (e.CountryID == data.CountryID) {
              data.CountryName = e.CountryName;
            }
          });
          this.listCity.unshift(data);
          this.resetImageArray();
          this.Alert_successFunction("Created done");
        });
    }
    else {
      this.Alert_dangerFunction("Select Image, pls")
    }

  }

  resetImageArray() { // because update in array
    this.listCity[length].ImageBannerSrc = '';
    this.listCity[length].Avatar = ''; // reset not loop
    this.listCity[length].Avatar = this.DefaultandNewAvatar;
    this.DefaultandNewAvatar = '';
  }
  // Function update Image
  DefaultandNewAvatar = environment.defaultImage; // default  banner img

  // Update Image when select change
  newImage = false;
  onSelectFile(e) {
    this.newImage = true;
    this.dataImage = e.target.files.item(0);
    // console.log(this.dataImage.name);
    let dateNow = new Date();

    if (e.target.files) { // Check File true : false
      var reader = new FileReader(); // DOM
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (event: any) => {
        this.DataFormCityEdit.Avatar = dateNow.getTime() + this.dataImage.name;
        this.DefaultandNewAvatar = event.target.result;
      }
    }
  }
  upPhoto() {
    const formData: FormData = new FormData();
    // console.log(this.dataImage);
    // console.log(this.DataFormCityEdit.Avatar);

    try {
      formData.append('ImageFile', this.dataImage, this.DataFormCityEdit.Avatar);

      this._CityService.UpdateAvatar(formData).subscribe(() => {
      })
    }
    catch (e) {
      return false;
    }
    return true;
  }

  // Function Edit Project
  upgrade = false;
  UpdateCity(data) {
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormCityEdit.Avatar;
    data.CountryID = parseInt(data.CountryID);
    // console.log(data);

    this._CityService.UpdateCity(data).subscribe(
      val => {
        if (this.newImage == true) {
          this.upPhoto();
          this.newImage = false
        }
        this.Alert_successFunction("Update Success");
        this.listCountry.forEach(e => { // loop => set data Location Name for Country.Locationname
          if (e.CountryID == data.CountryID) {
            data.CountryName = e.CountryName;
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
    // console.log(val);

    let i = -1;
    this.listCity.forEach(element => {
      i++;

      if (element.CityID == val.CityID) {
        val.ImageBannerSrc = '';
        val.Avatar = this.DefaultandNewAvatar;
        this.listCity.splice(i, 1, val);
        // this.resetImageArray();
      }
    });
  }

  // function CreateEmployee:
  DeleteEmPloyee(id) {
    if (confirm("Are you ok?")) {
      this._CityService.deleteCity(id).subscribe(
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
    this.listCity.forEach(element => {
      i++;
      if (element.CityID == id) {
        this.listCity.splice(i, 1);

        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddCityForm;
  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      this.DefaultandNewAvatar = environment.defaultImage;
      return this.isAddCityForm = true;
    }
    else {
      this.GetDataEditorAdd(val);
      return this.isAddCityForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      CityID: [0, [Validators.required]],
      CityName: ['CityName', [Validators.required]],
      Active: [false, [Validators.required]],

      CityLetter: ['C', [Validators.required]],
      CountryID: ['', [Validators.required]],
    })
  }
  get CityName() { return this.formValidator.get('CityName') }
  GetDataEditorAdd(val) {
    // console.log(val);

    this.DefaultandNewAvatar = (val.Avatar.indexOf(this.getImageAvatarSrc) > -1 ? '' : this.getImageAvatarSrc) + val.Avatar;
    if (val.Avatar.indexOf("base64") > -1) {
      this.DefaultandNewAvatar = val.Avatar;
    }
    this.formValidator.controls.CityName.patchValue(val.CityName);
    this.formValidator.controls.CityID.patchValue(val.CityID);

    this.formValidator.controls.Active.patchValue(val.Active == 0 ? false : true);
    this.formValidator.controls.CityLetter.patchValue(val.CityName.substr(0, 1));
    this.formValidator.controls.CountryID.patchValue(val.CountryID);
  }

  SetCityLetterWhenEnterName(value) {
    this.formValidator.controls.CityLetter.patchValue(value.substr(0, 1));
  }

  // Alert variable
  alert_Text;
  alert_success = false; alert_danger = false;
  // Function show alert

  AlertFunction(success) {
    if (success) {
      setTimeout(() => {
        this.alert_success = !this.alert_success;
      }, 2000);
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
  getAllCountry() {
    this._CountryService.getAllCountryByLocationID().subscribe(data => {
      this.listCountry = data;
    })
  }


  // panigate ( phân trang )
  page = 1;
  count = 0;
  tableSize = 5;
  tableSizes = [3, 6, 9, 12];

  fetchPosts(): void {
    this._CityService.getAllCityByCountryID().subscribe(
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
