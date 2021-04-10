import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { AuthenticationService } from '../../../@core/mock/Authentication.Service';
import { Router } from '@angular/router';
import { environment } from '../../../@core/models/Environment';
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  constructor(
    private authenticationService: AuthenticationService,
    private router: Router
  ) { }

  infor
  ngOnInit(): void {
    this.infor = this.authenticationService.currentUserValue.Infor;
    this.infor.src = environment.ImageUrl + 'Customer/';
  }

  logout() {
    this.authenticationService.logout();
    this.router.navigate(['/']);
  }

  @Output() showOrHidden = new EventEmitter<boolean>();
  isShow = true;
  showorHiddenNav() {
    this.showOrHidden.emit(!this.isShow);    
    this.isShow = !this.isShow;
  }
}
