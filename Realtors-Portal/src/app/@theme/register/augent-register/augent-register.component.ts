
import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
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
  @Output() DataForm = new EventEmitter<any>();
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
      "user_type": "agent"
    }
    this.DataForm.emit(data);
    // this.register(val);
  }
  @Input() errorEmailUnique;
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

