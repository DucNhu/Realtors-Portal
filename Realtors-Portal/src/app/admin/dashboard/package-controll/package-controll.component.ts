import { Component, OnInit } from '@angular/core';
import { PackageService } from '../../../@core/mock/Package/package.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../@core/models/Environment';

@Component({
  selector: 'app-package-controll',
  templateUrl: './package-controll.component.html',
  styleUrls: ['../../admin.component.css', './package-controll.component.css']
})
export class PackageControllComponent implements OnInit {
  // Khai bao bien
  idLength;
  getImageAvatarSrc = environment.ImageUrl + "Packages/";

  typeDuration;
  listTypeDuration = [
    {
      id: 1,
      title: 'Day'
    },
    {
      id: 2,
      title: 'Month'
    },
    {
      id: 3,
      title: 'Year'
    }
  ]

  DataFormPackageEdit =
    {
      "PackageID": 12,
      "PackageName": "PackageName",
      "Price": 0,
      // "PromotionPrice": 0,
      "PackageTitle": "PackageTitle",
      "PackageDesciption": "PackageDesctiption",
      // "NumberOfAds": 0,
      "Duration": 0,
      "PackageAvatar": "AvatarDefault.jpg",
      "Active": 0,
      "TypeDuration": this.listTypeDuration[0].title
    };
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _PackageService: PackageService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getAllPackage();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listPackage = [];
  containData;
  getIdLength = 0;
  // Get All project
  getAllPackage() {
    this._PackageService.getAllPackage().subscribe(
      data => {
        console.log(data);
        
        this.containData = data;
        this.containData.forEach(e => {
          this.listPackage.unshift(e);
        });

      }
    );
  }

  // function CreatePackage:
  dataImage;
  statusBtn = 'VALID';
  selectedFile: File = null;
  CreatePackage(data) {
    data.PackageID = 0;
    data.Active = data.Active == true ? 1 : 0;
    data.PackageAvatar = this.DataFormPackageEdit.PackageAvatar;
    // delete (data.TypeDuration);

    this._PackageService.CreatePackage(data)
      .subscribe(res => {
        let getIDLength = this.listPackage[0].PackageID;
        data.PackageID = getIDLength += 1;
        data.PackageAvatar = this.DefaultandNewAvatar;
        this.listPackage.unshift(data);

        this.Alert_successFunction("Created done");
      });

  }

  // Function update Image
  DefaultandNewAvatar = environment.defaultImage; // default  banner img

  // Update Image when select change
  selectImage = false;
  onSelectFile(e) {
    this.dataImage = e.target.files.item(0);
    let dateNow = new Date();

    if (e.target.files) { // Check File true : false
      var reader = new FileReader(); // DOM
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (event: any) => {
        this.DataFormPackageEdit.PackageAvatar = dateNow.getTime() + this.dataImage.name;
        this.DefaultandNewAvatar = event.target.result;

        this.selectImage = true;
      }
    }
  }


  // Function Edit Project
  UpdatePackage(data) {
    console.log(data);

    data.Active = data.Active == true ? 1 : 0;
    if (this.selectImage) {
      data.PackageAvatar = this.DataFormPackageEdit.PackageAvatar;
    }
    this._PackageService.UpdatePackage(data).subscribe(
      () => {

        this.Alert_successFunction("Update Success");
        this.EditByIdInArray(data);
      },
      error => {
        this.Alert_dangerFunction("Error Update")
      });

  }

  EditByIdInArray(val) {
    console.log(val);

    let i = -1;
    this.listPackage.forEach(element => {
      i++;

      if (element.PackageID == val.PackageID) {
        console.log(val);

        val.PackageAvatar = this.DefaultandNewAvatar;
        this.listPackage.splice(i, 1, val);
      }
    });
  }

  // function CreateEmployee:
  DeletePackage(id) {
    if (confirm("Are your ok?")) {
      this._PackageService.deletePackage(id).subscribe(
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
    this.listPackage.forEach(element => {
      i++;
      if (element.PackageID == id) {
        this.listPackage.splice(i, 1);

        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddPackageForm;
  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      this.DefaultandNewAvatar = environment.defaultImage;
      return this.isAddPackageForm = true;
    }
    else {
      this.GetDataEditorAdd(val);
      return this.isAddPackageForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      PackageID: [0, [Validators.required]],
      PackageName: ['PackageName', [Validators.required]],

      PackageTitle: ['PackageTitle'],
      Price: [0, [Validators.required]],
      // PromotionPrice: [0],

      // NumberOfAds: [0, [Validators.required]],
      Duration: [0, [Validators.required]],
      TypeDuration: [this.DataFormPackageEdit.TypeDuration],
      PackageDesciption: ['PackageDesctiption'],

      Active: [false, [Validators.required]],
    })
  }
  get PackageName() { return this.formValidator.get('PackageName') }
  GetDataEditorAdd(val) {
    console.log(val);

    if (val.PackageAvatar != null) {
      this.isSelectAvatar = true;
      this.DefaultandNewAvatar = (val.PackageAvatar.indexOf(this.getImageAvatarSrc) > -1 ? '' : this.getImageAvatarSrc) + val.PackageAvatar;
      if (val.PackageAvatar.indexOf("base64") > -1) {
        this.DefaultandNewAvatar = val.PackageAvatar;
      }
    }
    else { this.isSelectAvatar = false }
    this.formValidator.controls.PackageName.patchValue(val.PackageName);
    this.formValidator.controls.PackageID.patchValue(val.PackageID);

    this.formValidator.controls.Active.patchValue(val.Active == 0 ? false : true);
    this.formValidator.controls.Price.patchValue(val.Price);

    this.formValidator.controls.Duration.patchValue(val.Duration);
    // this.formValidator.controls.NumberOfAds.patchValue(val.NumberOfAds);

    this.formValidator.controls.PackageTitle.patchValue(val.PackageTitle);
    // this.formValidator.controls.Duration.patchValue(val.Duration);
    this.formValidator.controls.TypeDuration.patchValue(val.TypeDuration);
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
    // switch (val) {
    //   case "PackageName": console.log(this.formValidator.controls.Price);
    // }
  }
  // END checkValidForm

  // SetPackageLetterWhenEnterName(value) {
  //   this.formValidator.controls.PackageLetter.patchValue(value.substr(0, 1));
  // }

  showformAddPackage = false;
  showformAddPackageFunction() {
    this.showformAddPackage = !this.showformAddPackage;
  }

  isInputPromotionPrice = false;
  showInputPromotionPriceFunction() {
    this.isInputPromotionPrice = !this.isInputPromotionPrice;
  }

  isSelectAvatar = false;
  showSelectAvatarFunction() {
    this.isSelectAvatar = !this.isSelectAvatar;
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
