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
  error: string;
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
      password: ['Ducnhu2k1!', Validators.required]
    });

    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
  }

  // convenience getter for easy access to form fields
  get f() { return this.loginForm.controls; }

  onSubmit() {
    this.submitted = true;

    // stop here if form is invalid
    if (this.loginForm.invalid) {
      return;
    }

    this.loading = true;
    this.authenticationService.login(this.f.username.value, this.f.password.value)
      .pipe(first())
      .subscribe(
        data => {
          
          switch (data.Infor.User_type) {
            case 'admin':
               this.router.navigate([this.returnUrl + "admin"]);  break;
            case 'user': 
              // this.router.navigate([this.returnUrl]); 
              window.location.assign(this.returnUrl);
              break;
            default:              
               this.router.navigate([this.returnUrl]); break;
          }
        },
        error => {
          this.error = error;
          this.loading = false;
        });
  }

}