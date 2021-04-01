import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../../../@core/mock/category.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../@core/models/Environment';

@Component({
  selector: 'app-category-control',
  templateUrl: './category-control.component.html',
  styleUrls: ['./category-control.component.css', '../../admin.component.css']
})
export class CategoryControlComponent implements OnInit {
  // Khai bao bien
  idLength;
  getImageBannerSrc = environment.ImageUrl + "/categories/";


  DataFormCategoryEdit = {
    CategoryID: 0,
    Avatar: "Avatar",
    ImageBannerSrc: this.getImageBannerSrc ,
    ImageFile: File,
    CategoryName: "",
    Active: 1,
    CategoryTitle: "",
  };
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _CategoryService: CategoryService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getAllCategory();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listCategory = [];
  containData;
  getIdLength = 0;
  // Get All project
  getAllCategory() {
    this._CategoryService.getAllCategory().subscribe(
      data => {
        this.containData = data;
        console.log(this.listCategory);

        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          this.listCategory.unshift(e);
        });
      }
    )
  }

  // function CreateCategory:
  dataImage;
  selectedFile: File = null;
  CreateCategory(data) {
    data.CategoryID = 0;
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormCategoryEdit.Avatar;
    this._CategoryService.CreateCategory(data)
      .subscribe(res => {
        this.upPhoto(); // Insert Image
        data.CategoryID = this.listCategory[length].CategoryID += 1;
        data.ImageBannerSrc = '';
        data.Avatar = this.DefaultandNewAvatar;
        this.listCategory.unshift(data);
        this.resetImageArray();
        this.Alert_successFunction("Created done");
      });
  }
  resetImageArray() { // because update in array
    this.listCategory[length].ImageBannerSrc = '';
    this.listCategory[length].Avatar = ''; // reset not loop
    this.listCategory[length].Avatar = this.DefaultandNewAvatar;
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
        this.DataFormCategoryEdit.Avatar = dateNow.getTime() + this.dataImage.name;
        this.DefaultandNewAvatar = event.target.result;
      }
    }
  }
  upPhoto() {
    const formData: FormData = new FormData();

    formData.append('ImageFile', this.dataImage, this.DataFormCategoryEdit.Avatar);

    this._CategoryService.UpdateAvatar(formData).subscribe(() => {
      // console.log(data);
      // this.myInfor.Avatar = data
    })
  }

  // Function Edit Project
  upgrade = false;
  UpdateCategory(data) {
    data.Active = data.Active == true ? 1 : 0;
    data.Avatar = this.DataFormCategoryEdit.Avatar;
    console.log(data);
    
    this._CategoryService.UpdateCategory(data).subscribe(
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
    this.listCategory.forEach(element => {
      i++;

      if (element.CategoryID == val.CategoryID) {
        val.ImageBannerSrc = '';
        val.Avatar = this.DefaultandNewAvatar;
        this.listCategory.splice(i, 1, val);
        // this.resetImageArray();
      }
    });
  }

  // function CreateEmployee:
  DeleteEmPloyee(id) {
    if (confirm("Are your ok?")) {
      this._CategoryService.deleteCategory(id).subscribe(
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
    this.listCategory.forEach(element => {
      i++;
      if (element.CategoryID == id) {
        this.listCategory.splice(i, 1);

        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddCategoryForm;
  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      // this.GetDataEditorAdd(val);
      return this.isAddCategoryForm = true;
    }
    else {
      console.log(val);

      this.GetDataEditorAdd(val);
      return this.isAddCategoryForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      CategoryID: [0, [Validators.required]],
      CategoryName: ['ProjectName', [Validators.required]],
      Active: [false, [Validators.required]],

      CategoryTitle: ['CategoryTitle', [Validators.required]],

      Avatar: ['Avatar'],
    })
  }
  get CategoryName() { return this.formValidator.get('CategoryName') }

  GetDataEditorAdd(val) {
    console.log(val);
    
    this.DefaultandNewAvatar = this.getImageBannerSrc + val.Avatar;
    this.formValidator.controls.CategoryName.patchValue(val.CategoryName);
    this.formValidator.controls.CategoryID.patchValue(val.CategoryID);
    console.log(val);
    
    this.formValidator.controls.Active.patchValue(val.Active == 0 ? false : true);
    this.formValidator.controls.CategoryTitle.patchValue(val.CategoryTitle);

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