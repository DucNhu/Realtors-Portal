import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';
import { SellerService } from '../../../@core/mock/Customer/seller.service';
@Component({
  selector: 'app-seller-register',
  templateUrl: './seller-register.component.html'
})
export class SellerRegisterComponent implements OnInit {
  createForm: FormGroup;
  @Output() dataUser = new EventEmitter<any>();
  @Input() error;

  isDisabled = true;
  alertSuccess;

  errortextPass;
  errortextEmail;
  errortextFullName;

  validPass = false;
  validEmailFullName = false;
  validEmail = false;

  constructor(
    private _sellerService: SellerService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService
  ) { }


  ngOnInit(): void {
    // createForm
    this.createForm = this.formBuilder.group({
      fullName: [''],
      email: [''],
      password: [''],
    })
  }
  get pass() { return this.createForm.get('password') }
  onsubmit(val) {
    let data = {
      "name": val.fullName,
      "email": val.email,
      "password": val.password,
      "indentificationNumber": "000000000000",
      "address": "Nothing",
      "phone": "0000000000",
      "avatar": "AvatarDefault.jpg",
      "active": 0,
      "productID": 0,
      "ppID": 0,
      "Title": "null",
      "Description": "null",
      "NetWorkID": "null",
      "Location": "null",
      "Country": "null",
      "City": "null",
      "District": "null",
      "Are": "null",
      "user_type": "seller"
    }
    this.dataUser.emit(data);
    // this.register(val);
  }





  // validator form alert
  errorpassregex = false;
  validator(type) {
    switch (type) {

      case 'fullName': {
        let strongRegex = new RegExp("^[0-9]*$");
        let val = this.createForm.get('fullName').value;
        if (val != '') {
          if (strongRegex.test(val)) {
            this.errortextFullName = 'Full name cannot contain special characters and numbers';
            this.validEmailFullName = false;
            break;
          }
          else {
            this.validEmailFullName = true;
          }
          this.errortextFullName = '';
        }
        else {
          this.validEmailFullName = false;
          this.errortextFullName = 'Enter your full name!';
        };
      } break;

      case 'email': {
        let strongRegex = new RegExp("^[a-zA-Z][a-zA-Z0-9_\.]{3,32}@[a-zA-Z0-9]{2,}(\.[a-z]{2,4}){1,2}$");
        let val = this.createForm.get('email').value;
        if (val != '') {
          if (!strongRegex.test(val)) {
            this.validEmail = false;
          }
          else {
            this.validEmail = true;
          }
          this.errortextEmail = '';
        }
        else {
          this.validEmail = false;
          this.errortextEmail = 'Enter your email!';
        };
      } break;

      case 'pass': {
        let strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{6,}");
        let val = this.createForm.get('password').value;
        if (val != '') {
          if (!strongRegex.test(val)) {
            this.errorpassregex = true;// Error like error in EF fw
            this.validPass = false;
          }
          else {
            this.errorpassregex = false;// Error like error in EF fw
            this.validPass = true;
          }
          this.errortextPass = '';
        }
        else {
          this.validPass = false;
          this.errortextPass = 'Enter your password!';
        };

      } break;
      default: console.log('Default'); break;
    }
  }

  DisabledFunciton() { // button False
    if (this.validEmailFullName == true &&
      this.validEmail == true &&
      this.validPass == true) {

      return this.isDisabled = false;
    }
    else {
      return this.isDisabled = true;
    }
  }
}


