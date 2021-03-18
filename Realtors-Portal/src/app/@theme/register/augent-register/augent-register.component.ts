
import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';
import { UserService } from '../../../@core/mock/Customer/user.service';
@Component({
  selector: 'app-augent-register',
  templateUrl: './augent-register.component.html',
  styleUrls: ['./augent-register.component.css']
})
export class AugentRegisterComponent implements OnInit {
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
    this.router.navigate(['/']);
  }
  errorEmailUnique;
  register(val) {

    let data = {
      "name": val.name,
      "email": val.email,
      "password": val.password,
      "indentificationNumber": "000000000000",
      "address": "Nothing",
      "phone": "0000000000",
      "avatar": "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/81124033_981593932218384_8786497945009651712_o.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=4vafJlG5R4EAX8sh7hb&_nc_ht=scontent.fhan2-2.fna&oh=e12afd1f2d30ebf053747a5f6a954c0c&oe=607A124E",
      "active": 0,
      "productID": 0,
      "ppID": 0,
      "user_type": "agent"
    }

    for (let i = 0; i < this.listDataEmail.length; i++) {
      console.log(this.listDataEmail[i]);

      if (val.email == this.listDataEmail[i].Email) {
        this.errorEmailUnique = "Email has been used";
        console.log(this.errorEmailUnique);
        break;
      }

      else if (i == this.listDataEmail.length - 1) {
        if (val.email == this.listDataEmail[i].Email) {
          this.errorEmailUnique = "Email has been used";
          console.log(this.errorEmailUnique);
          break;
        }
        else {
          this.userService.register(data).subscribe(
            data => {
              this.listDataEmail.push(data)
              console.log(data);
              console.log("OK crate");
            },

            err => {
              this.errorEmailUnique = "Email has been used";
              console.log('HTTP Error', err)
            }

          )
        }

      }
    }
  }



  // validator form
  errorpassregex = false;
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

