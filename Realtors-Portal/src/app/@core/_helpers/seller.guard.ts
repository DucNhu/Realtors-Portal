import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthenticationService } from '../mock/Authentication.Service';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class SellerGuard implements CanActivate {
  constructor(
    private router: Router,

    private authenticationService: AuthenticationService) {}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    const currentUser = this.authenticationService.currentUserValue;
    if (currentUser) {
      if (currentUser.Infor.User_type == 'seller') {
        return true;
      }
      else {
        this.router.navigate(['/']);

        return false;
      }
    }
    else {
      this.router.navigate(['/login'], { queryParams: { returnUrl: state.url } });
      return false;
    }
  }

}
