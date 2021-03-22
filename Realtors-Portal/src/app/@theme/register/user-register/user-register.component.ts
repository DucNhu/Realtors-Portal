import { Component, OnInit } from '@angular/core';
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
  create = true;
  createForm: FormGroup;

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
      name: ['', Validators.required],
      email: ['', Validators.required],
      password: ['', Validators.required],
    })

    this.checkEmailUnique();
  }

  listDataEmail = [];
  checkEmailUnique() {
    this.userService.getAllEmailUser().subscribe(
      data => {
        for (const key in data) {
          if (Object.prototype.hasOwnProperty.call(data, key)) {
            const element = data[key];
            this.listDataEmail.push(element)
          }
        }
        console.log(this.listDataEmail);

      }
    )
  }
  onsubmit(val) {
    console.log(val);
    this.register(val);
  }
  error;
  alertSuccess
  register(val) {

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
      "user_type": "admin"
    }

    // if (this.listDataEmail.length > 0) {
    //   for (let i = 0; i < this.listDataEmail.length; i++) {
    //     console.log(this.listDataEmail[i]);

    //     if (val.email == this.listDataEmail[i].Email) {
    //       this.errorEmailUnique = "Email has been used";
    //       console.log(this.errorEmailUnique);
    //       break;
    //     }

    //     else if (i == this.listDataEmail.length - 1) {
    //       if (val.email == this.listDataEmail[i].Email) {
    //         this.errorEmailUnique = "Email has been used";
    //         console.log(this.errorEmailUnique);
    //         break;
    //       }
    //       else {
    //         this.userService.register(data).subscribe(
    //           data => {
    //             this.listDataEmail.push(data)
    //             console.log(data);
    //             console.log("OK crate");
    //           },

    //           err => {
    //             this.errorEmailUnique = "Email has been used";
    //             console.log('HTTP Error', err)
    //           }

    //         )
    //       }

    //     }
    //   }
    // }

    // else if (this.listDataEmail.length == 0) {      
      this.userService.register(data).subscribe(
        data => {
          this.error = '';
          this.alertSuccess = '';
        },

        err => {
          this.error = err.error.Errors;
          console.log('HTTP Error', err.error.Errors)
        }

      )
    // }    
  }



  // validator form
  errorpassregex=false;
  validatorPass(val) {
    var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])");

    if (!strongRegex.test(val)) {
      this.errorpassregex = true;
    }
    else {
      this.errorpassregex = false;

    }
  }
}
