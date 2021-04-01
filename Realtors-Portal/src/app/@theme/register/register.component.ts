import { Component, OnInit, Input } from '@angular/core';
import { AuthenticationService } from '../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';

import { UserService } from '../../@core/mock/Customer/user.service';
import { SellerService } from '../../@core/mock/Customer/seller.service';
import { AdminService } from '../../@core/mock/Customer/admin.service';
import { AgentService } from '../../@core/mock/Customer/agent.service';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  create = true;
  createForm: FormGroup;

  constructor(
    private agentService: AgentService,
    private sellerService: SellerService,
    private adminService: AdminService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService
  ) { }

  ngOnInit(): void {
    // createFormt
    this.createForm = this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', Validators.required],
      password: ['', Validators.required],
      passCon: ['', Validators.required]
    })
  }
  checkValid() {
    if (
      (this.createForm.controls.name.value && this.createForm.controls.email.value) &&
      (this.createForm.controls.password.value != '' || this.createForm.controls.passCon.value != '') &&
      (this.createForm.controls.password.value == this.createForm.controls.passCon.value)
    ) {
      this.create = false;
    }
    else {
      this.create = true;
    }
  }
  onsubmit(val) {
    this.register(val);
  }
  error = '';
  alertSuccess
  register(val) {
    console.log(val);

    switch (val.user_type) {
      case 'agent':
        this.agentService.register(val).subscribe(
          data => {
            this.error = '';
            this.alertSuccess = '';
            this.router.navigate(['/Home']);
          },

          err => {
            this.error = err.error.Errors;
          }
        ); break;
      case 'seller':
        this.sellerService.register(val).subscribe(
          data => {
            this.error = '';
            this.alertSuccess = '';
            this.router.navigate(['/Home']);
          },

          err => {
            this.error = err.error.Errors;
          }
        ); break;
      case 'admin':
        this.sellerService.register(val).subscribe(
          data => {
            this.error = '';
            this.alertSuccess = '';
            this.router.navigate(['/Home']);
          },

          err => {
            this.error = err.error.Errors;
          }
        );
        break;
      default: this.sellerService.register(val).subscribe(
        data => {
          this.error = '';
          this.alertSuccess = '';
          this.router.navigate(['/Home']);
        },

        err => {
          this.error = err.error.Errors;
        }
      ); break;
    }

  }
}
