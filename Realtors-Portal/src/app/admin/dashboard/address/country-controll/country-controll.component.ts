import { Component, OnInit } from '@angular/core';
import { CountryService } from '../../../../@core/mock/Address/Country.service';
import { LocationService } from '../../../../@core/mock/Address/location.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';

@Component({
  selector: 'app-country-controll',
  templateUrl: './country-controll.component.html',
  styleUrls: ['./country-controll.component.css', '../../../admin.component.css']
})
export class CountryControllComponent implements OnInit {
  // Khai bao bien
  listLocation;
  idLength;
  getImageAvatarSrc = environment.ImageAddressUrl + "Countries/";

  DataFormCountryEdit = {
    CountryID: 0,
    Avatar: "AvatarDefault.jpg",
    ImageBannerSrc: this.getImageAvatarSrc,
    ImageFile: File,
    CountryName: "",
    Active: 1,
    CountryLetter: "",
  };
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _CountryService: CountryService,
    private _LocationService: LocationService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getAllLocation();
    this.getAllCountry();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listCountry = [];
  containData;
  getIdLength = 0;
  // Get All project
  getAllCountry() {
    this._CountryService.getAllCountryByLocationID().subscribe(
      data => {
        this.containData = data;
        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageAvatarSrc;
          e.CountryLetter = e.CountryName.substr(0, 1);
          this.listCountry.unshift(e);
        });
        // console.log(this.listCountry);

      }
    )
  }

  // function CreateCountry:
  dataImage;
  selectedFile: File = null;
  CreateCountry(data) {
    data.CountryID = 0;
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormCountryEdit.Avatar;
    if (this.upPhoto()) {// Insert Image
      this._CountryService.CreateCountry(data)
        .subscribe(res => {
          let getIDLength = 0;
          try { getIDLength = this.listCountry[length].listCountry; } catch { getIDLength = 0; }

          data.CountryID = getIDLength += 1;
          data.ImageBannerSrc = '';
          data.Avatar = this.DefaultandNewAvatar;
          this.listLocation.forEach(e => { // loop => set data Location Name for Country.Locationname
            if (e.LocationID == data.LocationID) {
              data.LocationName = e.LocationName;
            }
          });
          this.listCountry.unshift(data);
          this.resetImageArray();
          this.Alert_successFunction("Created done");
        });
    }
    else {
      this.Alert_dangerFunction("Select Image, pls")
    }

  }

  resetImageArray() { // because update in array
    this.listCountry[length].ImageBannerSrc = '';
    this.listCountry[length].Avatar = ''; // reset not loop
    this.listCountry[length].Avatar = this.DefaultandNewAvatar;
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
        this.DataFormCountryEdit.Avatar = dateNow.getTime() + this.dataImage.name;
        this.DefaultandNewAvatar = event.target.result;
      }
    }
  }
  upPhoto() {
    const formData: FormData = new FormData();
    // console.log(this.dataImage);
    // console.log(this.DataFormCountryEdit.Avatar);

    try{
      formData.append('ImageFile', this.dataImage, this.DataFormCountryEdit.Avatar);

      this._CountryService.UpdateAvatar(formData).subscribe(() => {
      })
    }
    catch(e) {
      return false;
    }
    return true;
  }

  // Function Edit Project
  upgrade = false;
  UpdateCountry(data) {
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormCountryEdit.Avatar;
    data.LocationID = parseInt(data.LocationID);
    // console.log(data);

    this._CountryService.UpdateCountry(data).subscribe(
      val => {
        if (this.newImage == true) {
          this.upPhoto();
          this.newImage = false
        }
        this.Alert_successFunction("Update Success");
        this.listLocation.forEach(e => { // loop => set data Location Name for Country.Locationname
          if (e.LocationID == data.LocationID) {
            data.LocationName = e.LocationName;
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
    this.listCountry.forEach(element => {
      i++;

      if (element.CountryID == val.CountryID) {
        val.ImageBannerSrc = '';
        val.Avatar = this.DefaultandNewAvatar;
        this.listCountry.splice(i, 1, val);
        // this.resetImageArray();
      }
    });
  }

  // function CreateEmployee:
  DeleteEmPloyee(id) {
    if (confirm("Are you ok?")) {
      this._CountryService.deleteCountry(id).subscribe(
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
    this.listCountry.forEach(element => {
      i++;
      if (element.CountryID == id) {
        this.listCountry.splice(i, 1);

        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddCountryForm;
  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      this.DefaultandNewAvatar = environment.defaultImage;
      return this.isAddCountryForm = true;
    }
    else {
      this.GetDataEditorAdd(val);
      return this.isAddCountryForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      CountryID: [0, [Validators.required]],
      CountryName: ['CountryName', [Validators.required]],
      Active: [false, [Validators.required]],

      CountryLetter: ['a', [Validators.required]],
      LocationID: ['', [Validators.required]],
    })
  }
  get CountryName() { return this.formValidator.get('CountryName') }
  GetDataEditorAdd(val) {
    // console.log(val);

    this.DefaultandNewAvatar = (val.Avatar.indexOf(this.getImageAvatarSrc) > -1 ? '' : this.getImageAvatarSrc) + val.Avatar;
    if (val.Avatar.indexOf("base64") > -1) {
      this.DefaultandNewAvatar = val.Avatar;
    }
    this.formValidator.controls.CountryName.patchValue(val.CountryName);
    this.formValidator.controls.CountryID.patchValue(val.CountryID);

    this.formValidator.controls.Active.patchValue(val.Active == 0 ? false : true);
    this.formValidator.controls.CountryLetter.patchValue(val.CountryName.substr(0, 1));
    this.formValidator.controls.LocationID.patchValue(val.LocationID);
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
  getAllLocation() {
    this._LocationService.getAllLocation().subscribe(data => {
      this.listLocation = data;
    })
  }

  SetCountryLetterWhenEnterName(value) {
    this.formValidator.controls.CountryLetter.patchValue(value.substr(0, 1));
  }

   // panigate ( phân trang )
   page = 1;
   count = 0;
   tableSize = 5;
   tableSizes = [3, 6, 9, 12];

   fetchPosts(): void {
     this._CountryService.getAllCountryByLocationID().subscribe(
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

// Mục Lục

/**
 * Khai bao bien
 * CRUD
 * Form Validator
 * Set value edit form (GetDataEditorAdd)
 * Alert Success, errorr...
 * checkValidForm
 * getAllLocation
 * SetCountryLetterWhenEnterName
 */
