import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';
import { UserService } from '../../../@core/mock/Customer/user.service';
@Component({
  selector: 'app-seller-register',
  templateUrl: './seller-register.component.html'
})
export class SellerRegisterComponent implements OnInit {
  createForm: FormGroup;
  @Output() dataSeller = new EventEmitter<any>();
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
      "password": val.password,
      "indentificationNumber": "000000000000",
      "address": "Nothing",
      "phone": "0000000000",
      "avatar": "https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/133549349_1281976232160042_6231890056107915313_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=174925&_nc_ohc=iz0UXfScNF4AX_WeTKA&_nc_ht=scontent.fhan2-1.fna&oh=baa30ca55c3ef86e510aca541ac9a2f2&oe=6077C815",
      "active": 0,
      "productID": 0,
      "ppID": 0,
      "user_type": "seller"
    }
    this.dataSeller.emit(data);
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
          this.errortextFullName = 'Enter your full name!';
        };
      } break;

      case 'email': {
        let strongRegex = new RegExp("^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$");
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


