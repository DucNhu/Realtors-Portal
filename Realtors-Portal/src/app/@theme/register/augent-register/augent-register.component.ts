

import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';
import { UserService } from '../../../@core/mock/Customer/user.service';
@Component({
  selector: 'app-augent-register',
  templateUrl: './augent-register.component.html'
})
export class AugentRegisterComponent implements OnInit {
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
    private userService: UserService,
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
      "password": val.password + '@',
      "indentificationNumber": "000000000000",
      "address": "Nothing",
      "phone": null,
      "avatar": "AvatarDefault.jpg",
      "active": 0,
      "productID": 0,
      "ppID": 0,
      "Title": "Compony Agent",
      "Description": "What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.",
      "NetWorkID": 0,
      "Location": "null",
      "Country": "null",
      "City": "null",
      "District": "null",
      "Are": "null",
      "user_type": "agent"
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
        let strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{3,}");
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
          this.errortextPass = 'Enter your password!';
        };

      } break;
      default: console.log('Default'); break;
    }
  }

  DisabledFunciton() { // button check disable    
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




