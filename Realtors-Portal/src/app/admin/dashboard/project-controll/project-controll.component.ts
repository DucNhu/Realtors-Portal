import { Component, OnInit } from '@angular/core';
import { ProjectService } from '../../../@core/mock/project.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-project-controll',
  templateUrl: './project-controll.component.html',
  styleUrls: ['./project-controll.component.css', '../../admin.component.css']
})
export class ProjectControllComponent implements OnInit {
  // Khai bao bien
  html: '';
  listCategies = [
    {
      id: 1,
      Title: "Biệt Thự"
    },
    {
      id: 2,
      Title: "Chung cư"
    },
    {
      id: 3,
      Title: "Khách sạn"
    }
  ];
  listLevelActive = [
    {
      lvl: 0,
      Title: "Suspended",
      selected: true
    },
    {
      lvl: 1,
      Title: "Active",
      selected: false
    },
    {
      lvl: 2,
      Title: "View home",
      selected: false
    }
  ]
  DataFormProjectEdit = {
    Are: "",
    CategoryID: undefined,
    City: "",
    Country: "",
    District: "",
    ID: 10,
    ImageBannerName: "158974392_210254662.jpg",
    ImageBannerSrc: "https://localhost:44338/Images/",
    ImageFile: File,
    ImageLibID: undefined,
    Location: "",
    Price: undefined,
    ProjectName: "",
    SellerID: undefined,
    Sqft: undefined,
    Description: "",
    LevelActive: undefined,
    Title: ""
  };

  idLength;
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _ProjectService: ProjectService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getAllProject();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listProject = [];
  containData;
  getIdLength = 0;
  // Get All project
  getAllProject() {
    this._ProjectService.getAllProj().subscribe(
      data => {
        this.containData = data;
        console.log(this.listProject);

        this.containData.forEach(e => {
          this.getIdLength = e.ID;
          this.listProject.unshift(e);
        });
      }
    )
  }

  // function CreateProject:
  dataImage;
  selectedFile: File = null;
  CreateProject(data) {
    const formData = new FormData();
    formData.append('CategoryID', data.CategoryID);
    formData.append('SellerID', data.SellerID);
    formData.append('ProjectName', data.ProjectName);
    formData.append('Title', data.Title);
    formData.append('Description', data.Description);
    formData.append('Location', data.Location);
    formData.append('Country', data.Country);
    formData.append('City', data.City);
    formData.append('District', data.District);
    formData.append('Are', data.Are);
    formData.append('Price', data.Price);
    formData.append('Sqft', data.Sqft);
    formData.append('ImageFile', this.dataImage);
    formData.append('ImageLibID', data.ImageLibID);
    formData.append('ImageBannerName', data.ImageBannerName);
    formData.append('ImageBannerSrc', data.ImageBannerSrc);
    formData.append('LevelActive', data.LevelActive);

    this._ProjectService.CreateProj(formData)
      .subscribe(res => {
        data.ID = this.getIdLength++;
        this.listProject.unshift(data);
        this.resetImageArray()
      });
  }
  resetImageArray() { // because update in array
    this.listProject[length].ImageBannerSrc = '';
    this.listProject[length].ImageBannerName = ''; // reset not loop
    this.listProject[length].ImageBannerName = this.box_iconDeleleteAvatar;
    this.box_iconDeleleteAvatar = '';
  }
  // Function update Image
  box_iconDeleleteAvatar = "http://adevaes.com/wp-content/uploads/2016/11/26102015122159AMaboutus-default-banner.jpg"; // default  banner img
  upPhoto(e) { // Update image when select file
    this.dataImage = e.target.files[0];

    if (e.target.files) { // Check File true : false
      var reader = new FileReader(); // DOM
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (event: any) => {
        this.box_iconDeleleteAvatar = event.target.result;
      }
    }
  }

  afuConfig = {
    uploadAPI: {
      url: "https://example-file-upload-api"
    }
  };

  // Function Edit Project
  UpdateProject(data) {
    const formData = new FormData();
    formData.append('ID', data.ID);
    formData.append('CategoryID', data.CategoryID);
    formData.append('SellerID', data.SellerID);
    formData.append('ProjectName', data.ProjectName);
    formData.append('Title', data.Title);
    formData.append('Description', data.Description);
    formData.append('Location', data.Location);
    formData.append('Country', data.Country);
    formData.append('City', data.City);
    formData.append('District', data.District);
    formData.append('Are', data.Are);
    formData.append('Price', data.Price);
    formData.append('Sqft', data.Sqft);
    formData.append('ImageFile', this.dataImage);
    formData.append('ImageLibID', data.ImageLibID);
    formData.append('ImageBannerName', data.ImageBannerName);
    formData.append('https://localhost:44338/', data.ImageBannerSrc);
    formData.append('LevelActive', data.LevelActive);
    this._ProjectService.UpdateProj(data.ID, formData).subscribe(
      val => {
        this.Alert_successFunction("Update Success");
        this.findIndexEdit(data)
      },
      error => {
        this.Alert_dangerFunction("Error Update")
      }
    );
  }

  findIndexEdit(val) {
    let i = -1;
    this.listProject.forEach(element => {
      i++;      
      if (element.ID == val.ID) {
        this.listProject.splice(i, 1, val);
        this.resetImageArray();
        return i;
      }
    });
  }

  // function CreateEmployee:
  DeleteEmPloyee(id) {
    if (confirm("Are your ok?")) {
      this._ProjectService.deleteProj(id).subscribe(
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
    this.listProject.forEach(element => {
      i++;
      if (element.ID == id) {
        this.listProject.splice(i, 1);
        
        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddProjectForm;
  // GetDataCheckisAddorEdit: true ? add : edit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      // this.GetDataEditorAdd(val);
      return this.isAddProjectForm = true;
    }
    else {
      this.GetDataEditorAdd(val);
      return this.isAddProjectForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      Are: ['Are', [Validators.required]],
      CategoryID: [0, [Validators.required]],
      City: ['City', [Validators.required]],

      Country: ['Country', [Validators.required]],
      District: ['District', [Validators.required]],
      ID: [0],

      ImageFile: [''],
      Location: ['Location', [Validators.required]],

      Price: [0, [Validators.required]],
      SellerID: [0],

      ProjectName: ['ProjectName', [Validators.required]],
      Sqft: [0, [Validators.required]],

      Description: ['Description', [Validators.required]],
      LevelActive: [[Validators.required]],

      Title: ['Title', [Validators.required]],
      ImageLibID: [0],
      ImageBannerName: ['ImageBannerName'],
      ImageBannerSrc: ['ImageBannerSrc'],

    })
  }
  get ProjectName() { return this.formValidator.get('ProjectName') }

  GetDataEditorAdd(val) {
    this.box_iconDeleleteAvatar = val.ImageBannerSrc + '/' + val.ImageBannerName;
    this.formValidator.controls.ProjectName.patchValue(val.ProjectName);
    this.formValidator.controls.Are.patchValue(val.Are);
    this.formValidator.controls.CategoryID.patchValue(val.CategoryID);

    this.formValidator.controls.City.patchValue(val.City);
    this.formValidator.controls.Country.patchValue(val.Country);
    this.formValidator.controls.District.patchValue(val.District);

    this.formValidator.controls.ID.patchValue(val.ID);
    this.formValidator.controls.ImageFile.patchValue(val.ImageFile);
    this.formValidator.controls.Location.patchValue(val.Location);

    this.formValidator.controls.Price.patchValue(val.Price);
    this.formValidator.controls.SellerID.patchValue(val.SellerID);
    this.formValidator.controls.Sqft.patchValue(val.Sqft);

    this.formValidator.controls.Description.patchValue(val.Description);
    this.formValidator.controls.LevelActive.patchValue(val.LevelActive);
    this.formValidator.controls.Title.patchValue(val.Title);

    this.formValidator.controls.ImageLibID.patchValue(val.ImageLibID);
    this.formValidator.controls.ImageBannerName.patchValue(val.ImageBannerName);
    this.formValidator.controls.ImageBannerSrc.patchValue(val.ImageBannerSrc);
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