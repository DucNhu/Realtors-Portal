import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { UserService } from 'src/app/@core/mock/Customer/user.service';
import { CategoryService } from 'src/app/@core/mock/category.service';
import { ProjectService } from 'src/app/@core/mock/project.service';
import { AuthenticationService } from 'src/app/@core/mock/Authentication.Service';
import { environment } from 'src/app/@core/models/Environment';

@Component({
  selector: 'app-edit-profile',
  templateUrl: './edit-profile.component.html',
  styleUrls: ['./edit-profile.component.css']
})
export class EditProfileComponent implements OnInit {


  InforUser;
  userEmail = this.authenticationService.currentUserValue.Infor.Email;

  UserInfor = {
    Avatar: "AvatarDefault.jpg",
    FullName: "Default",
    Email: 'email@example.com'
  }
  AvatarSrc = environment.ImageUrl + 'Customer/';
  //  Adress
  listLocation;
  listAre;
  listCity;
  listCountry;
  listDistrict;

  countryInLocation

  cityInCountry;
  istrictInCity;
  districtInCity;
  areInDistrict;

  imgsrcCategory = environment.ImageUrl + 'Categories/';
  imgsrcLocation = environment.ImageAddressUrl + 'Locations/';
  imgsrcCountry = environment.ImageAddressUrl + 'Countries/';
  imgsrcCity = environment.ImageAddressUrl + 'Cities/';
  imgsrcDistrict = environment.ImageAddressUrl + 'Districts/';
  imgsrcAre = environment.ImageAddressUrl + 'Ares/';

  // Alert variable
  alert_Text;
  alert_success = false; alert_danger = false; alert_warn = false;
  constructor(
    private FormBuilder: FormBuilder,
    private userService: UserService,
    private categoryService: CategoryService,
    private authenticationService: AuthenticationService,

    private projectService: ProjectService,
  ) { }

  ngOnInit(): void {
    this.getInforById();
    this.ValidatorForm();

    this.getsetAllAddress();
  }


  getInforById() {
    this.userService.getUserbyId(this.authenticationService.currentUserValue.Infor.ID).subscribe(
      data => {
        let contain = data;
        this.InforUser = contain;

        this.UserInfor.Avatar = this.InforUser.Avatar;
        this.UserInfor.FullName = this.InforUser.Name;
        this.UserInfor.Email = this.InforUser.Email;
        this.SetDataForEditorForm();
      }
    )
  }

  selectAvatar;
  // Function Validator Form
  formValidator: FormGroup;
  ValidatorForm() {
    this.formValidator = this.FormBuilder.group({
      Are: ['', [Validators.required]],

      City: ['', [Validators.required]],

      Country: ['', [Validators.required]],
      District: ['', [Validators.required]],
      ID: [0],
      Name: ['', [Validators.required]],
      Phone: [0, [Validators.required, Validators.min(0)]],

      Title: ['', [Validators.required, Validators.maxLength(72)]],
      Description: ['', [Validators.required]],
      NetWorkID: [0, [Validators.required]],

      Location: ['', [Validators.required]],
      Avatar: [''],
    })
  }

  SetDataForEditorForm() {
    this.formValidator.controls.Avatar.patchValue(this.InforUser.Avatar);

    this.formValidator.controls.ID.patchValue(this.InforUser.ID);
    this.formValidator.controls.Name.patchValue(this.InforUser.Name);
    this.formValidator.controls.Phone.patchValue('0' + this.InforUser.Phone);

    this.formValidator.controls.Title.patchValue(this.InforUser.Title);
    this.formValidator.controls.NetWorkID.patchValue(0);
    this.formValidator.controls.Description.patchValue(this.InforUser.Description);

    this.formValidator.controls.Location.patchValue(this.InforUser.Location);
    this.formValidator.controls.City.patchValue(this.InforUser.City);
    this.formValidator.controls.Country.patchValue(this.InforUser.Country);
    this.formValidator.controls.District.patchValue(this.InforUser.District);
    this.formValidator.controls.Are.patchValue(this.InforUser.Are);
  }

  UpgradeFile(data) {
    console.log(data);
    if (this.newImage == true) {
      if (this.upPhoto()) {
        this.userService.UpgradeInforUser(data).subscribe(
          data => {
            this.Alert_successFunction("Edit Success");
          }
        )
      }
      else {
        this.Alert_dangerFunction("Edit False");
      }
    }

    else {
      this.userService.UpgradeInforUser(data).subscribe(
        data => {
          this.Alert_successFunction("Edit Success");
        }
      )
    }

  }

  // Update Image Banner when select change
  newImage = false; dataImage;
  NewImg_name = '';
  onSelectFile(e) {
    this.newImage = true;
    this.dataImage = e.target.files.item(0);
    let dateNow = new Date();

    if (e.target.files) { // Check File true : false
      var reader = new FileReader(); // DOM
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (event: any) => {

        this.NewImg_name = dateNow.getTime() + this.dataImage.name;
        this.formValidator.controls.Avatar.patchValue(this.NewImg_name);

        this.AvatarSrc = '';
        this.UserInfor.Avatar = event.target.result;
      }
    }
  }

  upPhoto() {
    let formData: FormData = new FormData();

    try {
      formData.append('ImageFile', this.dataImage, this.NewImg_name);
      this.userService.UpdateAvatar(formData).subscribe((data) => {
      });
    }
    catch (e) {
      return false;
    }
    return true;
  }

  // END Update Image Banner when select change


  getsetAllAddress() {
    // ADDRESS
    // listLocation
    this.projectService.getAllLocationActive().subscribe(data => {
      this.listLocation = data;

    })
    // listCountry
    this.projectService.getAllCountryByLocationIDActive().subscribe(data => {
      this.listCountry = data;

    })
    // listCity
    this.projectService.getAllCityByCountryIDActive().subscribe(data => {
      this.listCity = data;
    })
    // listDistrict
    this.projectService.getAllDistrictByCityIDActive().subscribe(data => {
      this.listDistrict = data;

    })
    // listAre
    this.projectService.getAreByDistrictIDActive().subscribe(data => {
      this.listAre = data;
    })
  }





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
}
