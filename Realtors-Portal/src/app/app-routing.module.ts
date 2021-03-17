import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './@core/_helpers/auth.guard';
import { LoginComponent } from './@theme/login/login.component';
import { NotfoundComponent } from './@theme/notfound/notfound.component';
const routes: Routes = [
  {
    canActivate: [AuthGuard],
    path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
  },
  {
    path: '', loadChildren: () => import('./page/page.module').then(m => m.PageModule)
  },
  
  // {
  //   path: "", component: NotfoundComponent
  // }
  {
    path: "**", component: NotfoundComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
