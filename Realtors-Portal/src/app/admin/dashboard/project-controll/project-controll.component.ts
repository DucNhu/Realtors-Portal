import { Component, OnInit } from '@angular/core';
import { ProjectService } from '../../../@core/mock/project.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgForm } from '@angular/forms';

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
      title: "category 1"
    },
    {
      id: 2,
      title: "category 2"
    },
    {
      id: 3,
      title: "category 3"
    }
  ];
  listLevelActive = [
    {
      lvl: 0,
      title: "Suspended"
    },
    {
      lvl: 1,
      title: "Active"
    },
    {
      lvl: 2,
      title: "View home"
    }
  ]
  DataFormProjectEdit = {
    are: "",
    categoryID: undefined,
    city: "",
    country: "",
    district: "",
    id: 0,
    imageBannerName: "158974392_210254662.jpg",
    imageBannerSrc: "https://localhost:44338/Images/",
    imageFile: File,
    imageLibID: undefined,
    location: "",
    price: undefined,
    projectName: "",
    sellerID: undefined,
    sqft: undefined,
    description: "",
    levelActive: undefined,
    title: ""
  };

  idLength;
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _ProjectService: ProjectService
  ) { }

  ngOnInit(): void {
    this.getAllProject();
    this.ValidatorForm();
  }

  // ======== CRUD ============
  listProject = [];
  containData;
  // Get All project
  getAllProject() {
    this._ProjectService.getAllProj().subscribe(
      data => {
        this.containData = data;
        console.log(this.listProject);

        this.containData.forEach(e => {
          this.listProject.unshift(e);
        });
      }
    )
  }

  // function CreateProject:
  dataImage;
  CreateProject(val) {
    // val.id = ++this.idLength; // set id tự tăg    
    // str => int
    console.log(val);
    
    val.categoryID = parseInt(val.categoryID);
    val.sellerID = parseInt(val.sellerID);
    val.levelActive = parseInt(val.levelActive);
    // Create imge
    // const formData: FormData = new FormData();
    // formData.append('imageFile', this.dataImage, this.dataImage.name);
    // this._ProjectService.UpdatePhotoBanner(this.dataImage).subscribe(data => {
    //   console.log(data);
    // })
    this._ProjectService.CreateProj(val).subscribe(
      data => {
        this.listProject.unshift(val);
        this.Alert_successFunction("Create Success");
      },
      error => {
        // val.id = --this.idLength; // set id tự tăg
        this.Alert_dangerFunction("Error Create")
      }
    )
  }
  // Function update Image
  upPhoto(event) {
    this.dataImage = event.target.files[0];
  }

  // Function Edit Project
  UpdateProject(val) {
    this._ProjectService.UpdateProj(val).subscribe(
      data => {
        this.Alert_successFunction("Update Success");
        this.findIndexEdit(val)
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
      if (element.id == val.id) {
        this.listProject.splice(i, 1, val)
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
      console.log(element);
      
      if (element.ID == id) {
        this.listProject.splice(i, 1)
        return i;
      }
    });
  }
  // ======== END CRUD ============

  isAddProjectForm;
  // GetDataCheckisAddorEdit
  GetDataCheckisAddorEdit(bl, val) {
    if (bl) {
      this.GetDataEditorAdd(val);
      return this.isAddProjectForm = false;
    }
    else {
      this.GetDataEditorAdd(val);
      return this.isAddProjectForm = true;
    }

  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      are: [''],
      categoryID: [0],
      city: [''],

      country: [''],
      district: [''],
      id: [0],

      imageFile: [''],
      location: [''],

      price: [''],
      projectName: [''],
      sellerID: [''],

      sqft: [''],

      description: [''],
      levelActive: [''],

      title: [''],
      imageLibID: [''],
      imageBannerName: [''],
      imageBannerSrc: [''],

    })
  }
  get projectName() { return this.formValidator.get('projectName') }
  // get price() { return this.formValidator.get('price') }

  GetDataEditorAdd(val) {
    // this.formValidator.controls.id.patchValue(val.id);

    // this.formValidator.controls.email.patchValue(val.email);
    // this.formValidator.controls.address.patchValue(val.address);
    // this.formValidator.controls.fullName.patchValue(val.fullName);

    // this.formValidator.controls.skill.patchValue(val.skill);
    // this.formValidator.controls.project.patchValue(val.project);
    // this.formValidator.controls.birthday.patchValue(val.birthday);

    // this.formValidator.controls.fileAvatar.patchValue(val.fileAvatar);
    // this.formValidator.controls.phone.patchValue(val.phone);
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
      case "price": console.log(this.formValidator.controls.price);

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