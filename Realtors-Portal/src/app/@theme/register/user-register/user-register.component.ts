import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';
import { UserService } from '../../../@core/mock/Customer/user.service';
@Component({
  selector: 'app-user-register',
  templateUrl: './user-register.component.html',
  styleUrls: ['./user-register.component.css']
})
export class UserRegisterComponent implements OnInit {
  createForm: FormGroup;
  @Output() dataUser = new EventEmitter<any>();
  isDisabled = true;
  checkInputForm = 0;
  @Input() error;
  alertSuccess
  errortextPass;
  errortextEmail;
  errortextFullName;
  
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
      "name": val.name,
      "email": val.email,
      "password": val.password,
      "indentificationNumber": "000000000000",
      "address": "Nothing",
      "phone": "0000000000",
      "avatar": "https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/133549349_1281976232160042_6231890056107915313_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=174925&_nc_ohc=iz0UXfScNF4AX_WeTKA&_nc_ht=scontent.fhan2-1.fna&oh=baa30ca55c3ef86e510aca541ac9a2f2&oe=6077C815",
      "active": 0,
      "productID": 0,
      "ppID": 0,
      "user_type": "user"
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
            break;
          }
          else {
            ++this.checkInputForm;
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
            ++this.checkInputForm;
          }
          else {
          }
          this.errortextEmail = '';
        }
        else {
          this.errortextEmail = 'Enter your email!';
        };
      } break;

      case 'pass': {
        let strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}");
        let val = this.createForm.get('password').value;
        if (val != '') {
          if (!strongRegex.test(val)) {
            this.errorpassregex = true;// Error like error in EF fw
            ++this.checkInputForm;          }
          else {
            this.errorpassregex = false;// Error like error in EF fw
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
    if(this.checkInputForm != 3) {
      return this.isDisabled = true;
    }
    else {
      return this.isDisabled = false;
    }
  }


}


