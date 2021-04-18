import { Component, Input, OnInit } from '@angular/core';
import { AuthenticationService } from '../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  createFormtest: FormGroup;
  // @Input() isLogin:false;
  loading = false;
  submitted = false;
  returnUrl: string;
  error;
  constructor(
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService
  ) {
    if (this.authenticationService.currentUserValue) {
      this.router.navigate(['/login']);
    }


  }

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      username: ['admin@gmail.com', Validators.required],
      password: ['RealVilla123', Validators.required]
    });

    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
  }

  // convenience getter for easy access to form fields
  get f() { return this.loginForm.controls; }

  onSubmit() {
    this.submitted = true;
    // console.log(this.error);
    // stop here if form is invalid
    if (this.loginForm.invalid) {
      return;
    }

    this.loading = true;
    this.authenticationService.login(this.f.username.value, this.f.password.value + "@")
      .pipe(first())
      .subscribe(
        data => {
          if (data.Infor.Active == 1) {
            this.error = undefined;
            switch (data.Infor.User_type) {
              case 'admin':
                window.location.assign(this.returnUrl + "admin"); break;
              case 'seller':
                // this.router.navigate([this.returnUrl]);
                if (data.Infor.Phone == null) {                  
                  window.location.assign(this.returnUrl + 'profile-seller/profile-edit');
                }
                else {
                  window.location.assign(this.returnUrl);
                }
                // window.location.assign(this.returnUrl);
                break;
              case 'agent':
                // this.router.navigate([this.returnUrl]);
                // console.log(data.Infor.User_type);
                if (data.Infor.Phone == null) {
                  window.location.assign(this.returnUrl + 'profile-agent/profile-edit');
                }
                else {
                  window.location.assign(this.returnUrl);
                }
                // window.location.assign(this.returnUrl);
                break;
              default:
                window.location.assign(this.returnUrl); break;
            }
          }
          else {
            this.error = "Wait for Admin Approval, pls";
            this.loading = false;
          }
        },
        error => {
          this.error = error.error.Errors;

          this.loading = false;
        });
    this.error = undefined;
  }

}
