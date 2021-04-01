import { Component, OnInit } from '@angular/core';
import { ProjectService } from '../../../@core/mock/project.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

import { HttpClient } from '@angular/common/http';
import { environment } from '../../../@core/models/Environment';
import { CategoryService } from 'src/app/@core/mock/category.service';

@Component({
  selector: 'app-project-controll',
  templateUrl: './project-controll.component.html',
  styleUrls: ['../../admin.component.css', './project-controll.component.css']
})

export class ProjectControllComponent implements OnInit {
  // Khai bao bien  
  getImageBannerSrc = environment.ImageProductUrl + 'banner/';

  listCategies;
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
  ];

  //  Get data from form when ...?...
  DataFormProjectEdit = {
    Are: undefined,
    CategoryID: undefined,
    City: undefined,
    Country: undefined,
    District: undefined,
    ID: 10,
    ImageBannerName: "AvatarDefault.jpg",
    ImageBannerSrc: this.getImageBannerSrc,
    ImageFile: File,
    ImageLibID: undefined,
    Location: undefined,
    Price: undefined,
    ProjectName: "",
    SellerID: undefined,
    Sqft: undefined,
    Description: "",
    LevelActive: undefined,
    Title: ""
  };
  DefaultandNewAvatar = environment.defaultImage; // default  banner img

  idLength;
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private _CategoryService: CategoryService,
    private _ProjectService: ProjectService,
    private http: HttpClient,

    // private _location: LocationService,
    // private _countryService: CountryService,
    // private _cityService: CityService,
    // private _districtService: DistrictService,
    // private _areService: AreService,
  ) { }

  ngOnInit(): void {
    this.getAllProject();
    this.ValidatorForm();

    this.getsetAllAddress(); // call function set data address
  }

  // ======== CRUD ============
  listProject = [];
  containData;
  getIdLength = 0;

  // Get All project
  getAllProject() {
    this._ProjectService.getProjectByFK().subscribe(
      data => {
        this.containData = data;
        console.log(this.listProject);

        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          this.listProject.unshift(e);
        });
      }
    );

    //  Call function get all category
    this.getsetAllCategory();
  }

  // function CreateProject:
  dataImage;
  selectedFile: File = null;
  CreateProject(data) {
    data.ID = 0;
    console.log(data);


    if (this.upPhoto()) {        // this.upPhoto(); // Insert Image
      data.ImageBannerName = this.DataFormProjectEdit.ImageBannerName;
      this._ProjectService.CreateProj(data)
        .subscribe(res => {
          this.upPhoto(); // Insert Image
          let getIDLength = this.listProject[length].ID;
          data.ID = getIDLength += 1;
          data.ImageBannerSrc = '';
          data.ImageBannerName = this.DefaultandNewAvatar;

          // dữ liệu truyền vào là id, nên lặp để tìm r gắn lại name vào mảng
          this.listLocation.forEach(e => {
            if (e.LocationID == data.Location) {
              data.LocationName = e.LocationName;
            }
          });
          this.listCountry.forEach(e => {
            if (e.CountryID == data.Country) {
              data.CountryName = e.CountryName;
            }
          });
          this.listCity.forEach(e => {
            if (e.CityID == data.City) {
              data.CityName = e.CityName;
            }
          });
          this.listDistrict.forEach(e => {
            if (e.DistrictID == data.District) {
              data.DistrictName = e.DistrictName;
            }
          });
          this.listAre.forEach(e => {
            if (e.AreID == data.Are) {
              data.AreName = e.AreName;
            }
          });

          this.listCategies.forEach(e => {
            if (e.CategoryID == data.CategoryID) {
              data.CategoryName = e.CategoryName;
            }
          });

          this.listProject.unshift(data);
          this.resetImageArray();
          this.Alert_successFunction("Create done");
          console.log(this.listProject);

        });
    }
    else {
      this.Alert_dangerFunction("Create false, try again, pls");
    }
  }


  resetImageArray() { // because update in array
    this.listProject[length].ImageBannerSrc = '';
    this.listProject[length].ImageBannerName = ''; // reset not loop
    this.listProject[length].ImageBannerName = this.DefaultandNewAvatar;
    this.DefaultandNewAvatar = '';
  }
  // Function update Image
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
        this.DataFormProjectEdit.ImageBannerName = dateNow.getTime() + this.dataImage.name;
        this.DefaultandNewAvatar = event.target.result;
      }
    }
  }


  upPhoto() {
    const formData: FormData = new FormData();

    try {
      formData.append('ImageFile', this.dataImage, this.DataFormProjectEdit.ImageBannerName);
      this._ProjectService.UpdatePhotoBanner(formData).subscribe(() => {
      });
    }
    catch (e) {
      return false;
    }
    return true;
  }


  // Function Edit Project
  upgrade = false;
  UpdateProject(data) {
    console.log(data);
    data.ImageBannerName = this.DataFormProjectEdit.ImageBannerName;
    this._ProjectService.UpdateProj(data.ID, data).subscribe(
      val => {
        if (this.newImage == true) {
          this.upPhoto();
          this.newImage = false
        }
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
    this.listProject.forEach(element => {
      i++;

      if (element.ID == val.ID) {
        this.listLocation.forEach(e => {
          if (e.LocationID == val.Location) {
            val.LocationName = e.LocationName;
          }
        });
        this.listCountry.forEach(e => {
          if (e.CountryID == val.Country) {
            val.CountryName = e.CountryName;
          }
        });
        this.listCity.forEach(e => {
          if (e.CityID == val.City) {
            val.CityName = e.CityName;
          }
        });
        this.listDistrict.forEach(e => {
          if (e.DistrictID == val.District) {
            val.DistrictName = e.DistrictName;
          }
        });
        this.listAre.forEach(e => {
          if (e.AreID == val.Are) {
            val.AreName = e.AreName;
          }
        });
        this.listCategies.forEach(e => {
          if (e.CategoryID == val.CategoryID) {
            val.CategoryName = e.CategoryName;
          }
        });

        val.ImageBannerSrc = '';
        val.ImageBannerName = this.DefaultandNewAvatar;
        this.listProject.splice(i, 1, val);
        // this.resetImageArray();
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
      this.DefaultandNewAvatar = environment.defaultImage;
      return this.isAddProjectForm = true;
    }
    else {
      this.SetDataForEditorForm(val);
      return this.isAddProjectForm = false;
    }
  }

  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      Are: [null, [Validators.required]],
      CategoryID: [0, [Validators.required]],
      City: [null, [Validators.required]],

      Country: [null, [Validators.required]],
      District: [null, [Validators.required]],
      ID: [0],

      Location: [null, [Validators.required]],

      Price: [null, [Validators.required]],
      SellerID: [0],

      ProjectName: [null, [Validators.required]],
      Sqft: [null, [Validators.required]],

      Description: [null, [Validators.required]],
      LevelActive: [null, [Validators.required]],

      Title: [null, [Validators.required]],
      ImageLibID: [null],
      ImageBannerName: ['ImageBannerName'],
      ImageFile: ['']
    })
  }

  // Du lieu test

  // END du lieu test
  get ProjectName() { return this.formValidator.get('ProjectName') }

  SetDataForEditorForm(val) {
    console.log(val);

    this.DefaultandNewAvatar = (val.ImageBannerName.indexOf(this.getImageBannerSrc) > -1 ? '' : this.getImageBannerSrc) + val.ImageBannerName;
    if (val.ImageBannerName.indexOf("base64") > -1) {
      this.DefaultandNewAvatar = val.ImageBannerName;
    }

    // this.DefaultandNewAvatar = environment.Imageurl + val.ImageBannerName;
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
    //   case "Price":
    //      console.log(this.formValidator.controls.Price);

    // }
  }
  // END checkValidForm


  // Funciton get all value in category in service
  getsetAllCategory() {
    this._CategoryService.getAllCategory().subscribe(data => {
      this.listCategies = data;
    })
  }

  // Funciton get=>set all value in  service from address folder

  // Adress
  listLocation;
  listAre;
  listCity;
  listCountry;
  listDistrict;

  getsetAllAddress() {
    // listLocation
    this._ProjectService.getAllLocationActive().subscribe(data => {
      this.listLocation = data;
    })
    // listCountry
    this._ProjectService.getAllCountryByLocationID().subscribe(data => {
      this.countryInLocation = data;      
    })
    // listCity
    this._ProjectService.getAllCityByCountryID().subscribe(data => {
      this.cityInCountry = data;
    })
    // listDistrict
    this._ProjectService.getAllDistrictByCityID().subscribe(data => {
      this.districtInCity = data;
      console.log(this.districtInCity);
      
    })
    // listAre
    this._ProjectService.getAreByDistrictID().subscribe(data => {
      this.areInDistrict = data;
    })
  }
  
    countryInLocation;
  selectByLocation() {
    let i = -1;
    this.listCountry = []; this.listCity = []; this.listDistrict = []; this.listAre = [];
    this.countryInLocation.forEach(e => {
      i++;
      if ( e.LocationID == this.formValidator.controls.Location.value ) {
        this.listCountry.push(e);        
      }      
    });
    console.log(this.listCountry);
  }

  cityInCountry;
  selectByCountry() {
    let i = -1;
    this.listCity = [];
    this.cityInCountry.forEach(e => {
      i++;
      if (e.CountryID == this.formValidator.controls.Country.value ) {
        this.listDistrict = []; this.listAre = [];
        this.listCity.push(e);        
      }      
    });
    console.log(this.listCity);
  }

  districtInCity;
  selectByCity() {
    let i = -1; 
    this.listDistrict = [];
    this.districtInCity.forEach(e => {
      i++;

      if (e.CityID == this.formValidator.controls.City.value ) {
        this.listAre = [];
        this.listDistrict.push(e);
      }      
    });
    console.log(this.listDistrict);
  }

  areInDistrict;
  selectByDistrict() {
    let i = -1;
    this.listAre = [];
    this.areInDistrict.forEach(e => {
      i++;
      console.log(e);
      console.log(this.formValidator.controls.District.value);
      if (e.DistrictID == this.formValidator.controls.District.value) {
        this.listAre.push(e);
      }
    });
    console.log(this.listAre);
  }

}

// Mục Lục

/**
 * Khai bao bien
 * CRUD
 * Form Validator
 * Set value edit form (SetDataForEditorForm)
 * Alert Success, errorr...
 * checkValidForm
 * handFileInput
 *
 * getAllCategory
 */