import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../@core/mock/Authentication.Service';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';
import { UserService } from '../../@core/mock/Customer/user.service';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
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
    console.log(val);
    this.register(val);
    this.router.navigate(['/']);
    
  }

  register(val) {
    delete val.passCon;
    this.userService.register(val).subscribe(
      data => {
        console.log("OK");
        
      }
    )
  }
}
