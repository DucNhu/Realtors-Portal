import { Component, OnInit } from '@angular/core';
import { ProjectService } from '../../../../@core/mock/project.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { TooltipPosition } from '@angular/material/tooltip';
import { ActivatedRoute, Router } from '@angular/router';

import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../@core/models/Environment';

import { CategoryService } from 'src/app/@core/mock/category.service';
import { ImageLibService } from 'src/app/@core/mock/product/image-lib.service';

import { AuthenticationService } from '../../../../@core/mock/Authentication.Service';
import { UserService } from 'src/app/@core/mock/Customer/user.service';
import { PackageppService } from 'src/app/@core/mock/Package/packagepp.service';
import { HomePageService } from 'src/app/@core/mock/Home/home-page.service';
@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['../../../../admin/admin.component.css', './product.component.css']
})
export class ProductComponent implements OnInit {
  // Khai bao bien
  getImageBannerSrc = environment.ImageProductUrl + 'banner/';
  imgsrcLocation = environment.ImageAddressUrl + 'Locations/';
  imgsrcCountry = environment.ImageAddressUrl + 'Countries/';
  imgsrcCity = environment.ImageAddressUrl + 'Cities/';
  imgsrcDistrict = environment.ImageAddressUrl + 'Districts/';
  imgsrcAre = environment.ImageAddressUrl + 'Ares/';

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
    UserID: undefined,
    Sqft: undefined,
    Description: "",
    LevelActive: undefined,
    Title: ""
  };
  DefaultandNewAvatar = environment.defaultImage; // default  banner img

  idLength;
  checkBuyPackage = false;
  checkEndTimePackage;
  // END khai bao bien
  constructor(
    private FormBuilder: FormBuilder,
    private categoryService: CategoryService,
    private imageLibService: ImageLibService,
    private projectService: ProjectService,
    private userService: UserService,
    private http: HttpClient,
    private authenticationService: AuthenticationService,
    private packageppService: PackageppService,
    private ActivatedRoute: ActivatedRoute,
    private homePageService: HomePageService
  ) { }

  ngOnInit(): void {
    this.getAllProjectandInforByID(this.authenticationService.currentUserValue.Infor.ID);

    this.ValidatorForm();

    this.getsetAllAddress(); // call function set data address
    this.homePageService.getMaxPrice().subscribe(
      data => {
        let ArrmaxSqftmaxPrice = data;
        this.maxPrice = ArrmaxSqftmaxPrice[0].maxPrice;
      }
    )
  }

  // ======== CRUD ============
  listProject = [];
  InforUser;
  containData;
  getIDByProductLast = 0;
  returnUrl = this.ActivatedRoute.snapshot.queryParams['returnUrl'] || '/';
  // Get All project
  getAllProjectandInforByID(id) {
    this.userService.GetProductByUserID(id).subscribe(
      data => {
        this.containData = data;
        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          this.listProject.unshift(e);
        });
        this.getIDByProductLast = this.listProject[length].ID;
      }
    );

    this.userService.getUserbyId(this.authenticationService.currentUserValue.Infor.ID).subscribe(
      data => {
        this.InforUser = data;

        if (this.InforUser.PackageID > 0) { // x??c ??jnh mua g??i ch??a
          this.checkBuyPackage = true;

          // x??c ??jnh g??i ???? c??n h???n ko ( check end time == now time ? block : ok )
          this.packageppService.getDayMaxOfMonthMaxOfYearMax(this.authenticationService.currentUserValue.Infor.ID).subscribe(
            data => {
              this.checkEndTimePackage = data;
              if (
                this.checkEndTimePackage[0].YearMax == new Date().getFullYear() &&
                this.checkEndTimePackage[0].MonthMaxOfYearMax == new Date().getMonth() + 1 &&
                this.checkEndTimePackage[0].DayMaxOfMonthMaxOfYearMax == new Date().getDate()
              ) {
                this.checkBuyPackage = false
              }
            }
          )
        }


      }
    )
    //  Call function get all category
    this.getsetAllCategory();
  }

  // function CreateProject:
  dataImage;
  selectedFile: File = null;
  disabled = false;
  firstCreate = false;
  CreateProject(data) {
    console.log(data);

    this.disabled = true;
    data.ID = 0;
    data.UserID = this.authenticationService.currentUserValue.Infor.ID;

    if (this.upPhoto() && this.upPhotoImageFeature()) {        // this.upPhoto(); // Insert Image
      console.log(data);
      data.ImageBannerName = this.DataFormProjectEdit.ImageBannerName;
      this.listDistrict.forEach(e => {
        if (e.DistrictName == data.District) {
          data.District = e.DistrictID;
        }
      });
      this.listAre.forEach(e => {
        if (e.AreName == data.Are) {
          data.Are = e.AreID;
        }
      });

      // let getIDLast = this.listProject[length].ID;
      let getIDLast = 0; // Id d??g cho m???ng, khi n?? ch??a t???p proudct t?? k set ??c id, n??n ph???i set id b???ng 0
      try { getIDLast = this.listProject[length].ID; this.firstCreate = false } catch { getIDLast = 0; this.firstCreate = true; }
      // let getIDImageLibLast = this.listImageFeature[length].ID;
      let getIDImageLibLast = 0;
      try { getIDImageLibLast = this.listImageFeature[length].ID; } catch { getIDImageLibLast = 0; }
      this.projectService.CreateProj(data)
        .subscribe(res => {
          this.upPhoto(); // Insert Image

          // Insert Image in table ImageLib trog sql
          let idlastofProduct = this.getIDByProductLast;
          this.ArrayCRDFeature.forEach(e => {

            let dataImageLib = {
              "imageLibID": 0,
              "productID": idlastofProduct += 1,
              "name": e.NameinSert,
            }

            this.imageLibService.CreateProj(dataImageLib).subscribe(data => {
            });

            idlastofProduct = getIDLast; // return channh + don
          });

          data.ID = getIDLast += 1;
          data.ImageBannerSrc = '';
          data.ImageBannerName = this.DefaultandNewAvatar;

          // d??? li???u truy???n v??o l?? id, n??n l???p ????? t??m r g???n l???i name v??o m???ng
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

          this.Alert_successFunction("Create done");

          getIDLast++;
          getIDImageLibLast++;

          if (this.firstCreate) {
            if (this.upPhotoImageFeature()) {
              window.location.reload();
            }
          }
        });
      this.isAddProjectForm = false;
      this.disabled = false;
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
      this.projectService.UpdatePhotoBanner(formData).subscribe(() => {
      });
    }
    catch (e) {
      return false;
    }
    return true;
  }

  // END Update Image Banner when select change

  // Update Image Feature when select change

  ArrayAvatarFeature = []; // Ch???a d??? li???u img qua c??c l???n select
  DataFeature;
  ArrayCRDFeature = [];
  ArrayUpdateFeature = []; // chua gia tri khi them moi 1 obj

  onSelectFileFeature(e) {
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

  checkInsertImgFeture = false;
  upPhotoImageFeature() { // insert img vao o cung ( /products/imglibs/ )
    let formData: FormData = new FormData();

    try {

      for (let i = 0; i < this.ArrayAvatarFeature.length; i++) {

        formData.append('ImageFile', this.ArrayAvatarFeature[i], this.ArrayCRDFeature[i].NameinSert);
        this.imageLibService.PostPhotoFeature(formData).subscribe(() => {
          this.ArrayAvatarFeature = [];
        });
      }
      this.checkInsertImgFeture = true;
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

      if (e.NameinSert == data.NameinSert) {
        this.ArrayCRDFeature.splice(i, 1);
      }
    })


  }
  // END Update Image Feature when select change



  // Function Edit Project
  upgrade = false;
  UpdateProject(data) {
    data.ImageBannerName = this.DataFormProjectEdit.ImageBannerName;
    this.projectService.UpdateProj(data.ID, data).subscribe(
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
      this.projectService.deleteProj(id).subscribe(
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
  Showdialog(bl) {
    if (bl) {
      return this.isAddProjectForm = true;
    }
    else {
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

      Price: [null, [Validators.required, Validators.min(0)]],
      UserID: [0],

      ProjectName: [null, [Validators.required]],
      Sqft: [null, [Validators.required, Validators.min(0)]],

      Description: [null, [Validators.required]],
      LevelActive: [null, [Validators.required]],

      Title: [null, [Validators.required]],
      ImageBannerName: ['ImageBannerName'],
      // ImageFile: ['']
    })
  }

  // Du lieu test

  // END du lieu test
  get ProjectName() { return this.formValidator.get('ProjectName') }



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


  ListProduct_search = [];
  maxPrice = 0;
  listCategory; imgsrcCategory = environment.ImageUrl + 'Categories/';


  SearchByAddress(data) {
    this.ListProduct_search = [];// reset chanh + don
    this.listProject.forEach(e => {
      if (
        e.CategoryName.indexOf(data) > -1 ||
        e.LocationName.indexOf(data) > -1 ||
        e.CountryName.indexOf(data) > -1 ||
        e.CityName.indexOf(data) > -1 ||
        e.DistrictName.indexOf(data) > -1 ||
        e.AreName.indexOf(data) > -1 ||
        e.Price >= data ||
        e.ProjectName.indexOf(data) > -1
      ) {
        this.ListProduct_search.push(e)
      }

    })

  }




  // checkValidForm
  checkValidForm(val) {
    switch (val) {
      case "Price":
         console.log(this.formValidator.controls.Price);

    }
  }
  // END checkValidForm


  // Funciton get all value in category in service
  getsetAllCategory() {
    this.categoryService.getCategoryActive().subscribe(data => {
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
  districtInCity;

  listImageFeature;
  // areInDistrict

  getsetAllAddress() {
    // ADDRESS
    // listLocation
    this.projectService.getAllLocationActive().subscribe(data => {
      this.listLocation = data;

    })
    // listCountry
    this.projectService.getAllCountryByLocationIDActive().subscribe(data => {
      this.countryInLocation = data;

    })
    // listCity
    this.projectService.getAllCityByCountryIDActive().subscribe(data => {
      this.cityInCountry = data;
    })
    // listDistrict
    this.projectService.getAllDistrictByCityIDActive().subscribe(data => {
      this.districtInCity = data;

    })
    // listAre
    this.projectService.getAreByDistrictIDActive().subscribe(data => {
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

  selectByCity() {
    this.listDistrict = [];
    this.districtInCity.forEach(e => {

      if (e.CityID == this.formValidator.controls.City.value) {
        this.listAre = [];
        this.listDistrict.push(e);
      }
      else {

      }
    });
  }

  areInDistrict;
  selectByDistrict() {
    console.log(this.formValidator.controls.District.value);
    this.listAre = [];
    console.log(this.areInDistrict);
    
    this.areInDistrict.forEach(e => {
      if (e.DistrictID == this.formValidator.controls.District.value) {
        this.listAre.push(e);
      }
    });
  }

  // panigate ( ph??n trang )
  page = 1;
  count = 0;
  tableSize = 5;
  tableSizes = [3, 6, 9, 12];

  fetchPosts(): void {
    this.userService.GetProductByUserID(this.authenticationService.currentUserValue.Infor.ID).subscribe(
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

// M???c L???c

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
