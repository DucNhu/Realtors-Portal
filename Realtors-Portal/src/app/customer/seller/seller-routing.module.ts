import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../..//@core/_helpers/auth.guard';
import { LoginComponent } from '../../@theme/login/login.component';
import { NotfoundComponent } from '../../@theme/notfound/notfound.component';
import { SellerComponent } from './seller.component';
const routes: Routes = [
    // {
    //     canActivate: [AuthGuard],
    //     path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
    // },
    {
        path: '', component: SellerComponent
    },
    // {
    //     path: 'Customer', loadChildren: () => import('./customer/customer.module').then(m => m.CustomerModule)
    // },
    {
        path: "**", component: NotfoundComponent
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule { }
