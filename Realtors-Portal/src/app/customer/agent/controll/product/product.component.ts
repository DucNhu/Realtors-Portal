import { Component, OnInit } from '@angular/core';
import { ProjectService } from '../../../../@core/mock/project.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';

import { CategoryService } from 'src/app/@core/mock/category.service';
import { ImageLibService } from 'src/app/@core/mock/product/image-lib.service';

import { AuthenticationService } from '../../../../@core/mock/Authentication.Service';
import { UserService } from 'src/app/@core/mock/Customer/user.service';
@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./../../../../admin/admin.component.css', './product.component.css']
})
export class ProductComponent implements OnInit {

  // Khai bao bien  
  getImageBannerSrc = environment.ImageProductUrl + 'banner/';

  listCategies;
  listLevelActive = [
    {
      lvl: 0,
      Title: "sold",
      selected: true
    },
    {
      lvl: 1,
      Title: "Active",
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
    private imageLibService: ImageLibService,
    private _ProjectService: ProjectService,
    private userService: UserService,
    private http: HttpClient,
    private authenticationService: AuthenticationService
  ) { }

  ngOnInit(): void {
    this.getAllProjectByID(this.authenticationService.currentUserValue.Infor.ID);
    this.ValidatorForm();

    this.getsetAllAddress(); // call function set data address
  }

  // ======== CRUD ============
  listProject = [];
  containData;
  getIDLast = 0;

  // Get All project
  getAllProjectByID(id) {
    this.userService.GetProductByUserID(id).subscribe(
      data => {
        this.containData = data;
        console.log(data);
        
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
    data.UserID = this.authenticationService.currentUserValue.Infor.ID;

    if (this.upPhoto() && this.upPhotoImageFeature) {        // this.upPhoto(); // Insert Image
      data.ImageBannerName = this.DataFormProjectEdit.ImageBannerName;
      // let getIDLast = this.listProject[length].ID;
      let getIDLast = 0;
      try { getIDLast = this.listProject[length].ID; } catch { getIDLast = 0; }
      // let getIDImageLibLast = this.listImageFeature[length].ID;
      let getIDImageLibLast = 0;
      try { getIDImageLibLast = this.listImageFeature[length].ID; } catch { getIDImageLibLast = 0; }
      this._ProjectService.CreateProj(data)
        .subscribe(res => {
          this.upPhoto(); // Insert Image

          // Insert Image in table ImageLib trog sql
          this.ArrayCRDFeature.forEach(e => {

            let dataImageLib = {
              "imageLibID": 0,
              "productID": getIDLast += 1,
              "name": e.NameinSert,
            }
            this.imageLibService.CreateProj(dataImageLib).subscribe(data => {
            })
          });
          data.ID = getIDLast += 1;
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
          getIDLast++;
          getIDImageLibLast++;

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
  // Update Image Banner when select change
  newImage = false;
  onSelectFile(e) {
    this.newImage = true;
    this.dataImage = e.target.files.item(0);
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
    let formData: FormData = new FormData();

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

  // END Update Image Banner when select change

  // Update Image Feature when select change

  ArrayAvatarFeature = []; // Chứa dữ liệu img qua các lần select
  DataFeature;
  ArrayCRDFeature = [];
  ArrayUpdateFeature = []; // chua gia tri khi them moi 1 obj

  onSelectFileFeature(e) {
    this.newImage = true;
    this.DataFeature = e.target.files.item(0);
    let dateNow = new Date();

    if (e.target.files) { // Check File true : false

      // for(let i = 0; i < File.length; i++) {
      var reader = new FileReader(); // DOM
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (event: any) => {
        this.ArrayAvatarFeature.push(e.target.files.item(0));
        this.ArrayCRDFeature.push({ Name: event.target.result, url: '', NameinSert: dateNow.getTime() + this.DataFeature.name });

        // }
      }
    }
  }
  // insertImgFeatureInArray() {
  //   this.ArrayCRDFeature
  // }
  upPhotoImageFeature() { // insert img vao o cung ( /products/imglibs/ )
    let formData: FormData = new FormData();

    try {

      for (let i = 0; i < this.ArrayAvatarFeature.length; i++) {

        formData.append('ImageFile', this.ArrayAvatarFeature[i], this.ArrayCRDFeature[i].NameinSert);
        this.imageLibService.PostPhotoFeature(formData).subscribe(() => {
          this.Alert_successFunction("Add image success");
          this.ArrayAvatarFeature = [];
        });
      }
    }
    catch (e) {
      console.error(e);

      return false;
    }
    return true;
  }

  deleteAnfeature(data) {
    let i = -1;
    this.ArrayCRDFeature.forEach(e => {
      i++;
      if (e.ImageLibID == data.ImageLibID) {
        this.ArrayCRDFeature.splice(i, 1);
      }
    })
  }
  // END Update Image Feature when select change

  // Function Edit Project
  upgrade = false;
  UpdateProject(data) {
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
      this.ArrayCRDFeature = [];  // return list image feature when create new product
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
      UserID: [0],

      ProjectName: [null, [Validators.required]],
      Sqft: [null, [Validators.required]],

      Description: [null, [Validators.required]],
      LevelActive: [null, [Validators.required]],

      Title: [null, [Validators.required]],
      ImageBannerName: ['ImageBannerName'],
      ImageFile: ['']
    })
  }

  // Du lieu test

  // END du lieu test
  get ProjectName() { return this.formValidator.get('ProjectName') }

  SetDataForEditorForm(val) {
    this.DefaultandNewAvatar = (val.ImageBannerName.indexOf(this.getImageBannerSrc) > -1 ? '' : this.getImageBannerSrc) + val.ImageBannerName;
    if (val.ImageBannerName.indexOf("base64") > -1) {
      this.DefaultandNewAvatar = val.ImageBannerName;
    }

    this.ArrayCRDFeature = []; // return 0 array
    this.listImageFeature.forEach(e => {
      if (e.ProductID == val.ID) {
        e.url = environment.ImageProductUrl + 'ImageLibs/';
        this.ArrayCRDFeature.push(e);
      }
    });

    // this.ArrayCRDFeature = this.listImageFeature;

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

    this.formValidator.controls.ImageBannerName.patchValue(val.ImageBannerName);

    // set lai gia tri address:
    this.selectByLocation();

    this.selectByCountry();
    this.selectByDistrict();

    this.selectByCity();
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

  listImageFeature;
  // areInDistrict
  getsetAllAddress() {
    // imageLib
    this.imageLibService.getImageLibByProductID().subscribe(data => {
      this.listImageFeature = data;
    })

    // ADDRESS
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
      if (e.LocationID == this.formValidator.controls.Location.value) {
        this.listCountry.push(e);
      }
    });
  }

  cityInCountry;
  selectByCountry() {
    let i = -1;
    this.listCity = [];
    this.cityInCountry.forEach(e => {
      i++;
      if (e.CountryID == this.formValidator.controls.Country.value) {
        this.listDistrict = []; this.listAre = [];
        this.listCity.push(e);
      }
    });
  }

  districtInCity;
  selectByCity() {
    let i = -1;
    this.listDistrict = [];
    this.districtInCity.forEach(e => {
      i++;

      if (e.CityID == this.formValidator.controls.City.value) {
        this.listAre = [];
        this.listDistrict.push(e);
      }
    });
  }

  areInDistrict;
  selectByDistrict() {
    let i = -1;
    this.listAre = [];
    this.areInDistrict.forEach(e => {
      i++;
      if (e.DistrictID == this.formValidator.controls.District.value) {
        this.listAre.push(e);
      }
    });
  }

}

// Mục Lục

/**
 * Khai bao bien
 * CRUD
 * Form Validator
 * Update Image Banner 179
 * Update Image feature
 * Set value edit form (SetDataForEditorForm)
 * Alert Success, errorr...
 * checkValidForm
 * handFileInput
 *
 * getAllCategory
 */