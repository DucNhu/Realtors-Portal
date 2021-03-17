import { ExtraOptions, RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';
import {
  NbAuthComponent,
  NbLoginComponent,
  NbLogoutComponent,
  NbRegisterComponent,
  NbRequestPasswordComponent,
  NbResetPasswordComponent,
} from '@nebular/auth';
// Authentication
import { LoginComponent } from './@theme/components/authen/login/login.component';
import { AuthenComponent } from './@theme/components/authen/authen.component';


export const routes: Routes = [
  {
    path: 'admin',
    loadChildren: () => import('./admin/admin.module')
      .then(m => m.AdminModule),
  },
  {
    path: '',
    loadChildren: () => import('./page/page.module')
      .then(m => m.PageModule),
  },
  {
    path: 'auth',
    component: AuthenComponent,
    children: [
      {
        path: '',
        component: NbLoginComponent,
      },
      {
        path: 'login',
        component: LoginComponent,
      },
      {
        path: 'register',
        component: NbRegisterComponent,
      },
      {
        path: 'logout',
        component: NbLogoutComponent,
      },
      {
        path: 'request-password',
        component: NbRequestPasswordComponent,
      },
      {
        path: 'reset-password',
        component: NbResetPasswordComponent,
      },
    ],
  },

  // { path: '', redirectTo: 'pages', pathMatch: 'full' },
  { path: '**', redirectTo: 'pages' },
];

const config: ExtraOptions = {
  useHash: false,
};

@NgModule({
  imports: [RouterModule.forRoot(routes, config)],
  exports: [RouterModule],
})
export class AppRoutingModule {
}
