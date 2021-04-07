import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AddressComponent } from 'src/app/admin/dashboard/address/address.component';
import { CategoryControlComponent } from 'src/app/admin/dashboard/category-control/category-control.component';
import { ListCustomerComponent } from 'src/app/admin/dashboard/customer/list-customer.component';
import { PackageControllComponent } from 'src/app/admin/dashboard/package-controll/package-controll.component';
import { ProjectControllComponent } from 'src/app/admin/dashboard/project-controll/project-controll.component';
import { PackageComponent } from 'src/app/page/package/package.component';
import { AuthGuard } from '../..//@core/_helpers/auth.guard';
import { LoginComponent } from '../../@theme/login/login.component';
import { NotfoundComponent } from '../../@theme/notfound/notfound.component';
import { ProductComponent } from './controll/product/product.component';
import { SellerComponent } from './seller.component';
const routes: Routes = [
    {
        path: '', component: SellerComponent,
        children: [
            {
                path: '', component: ProductComponent
            },
            {
                path: 'product', component: ProductComponent
            },
            {
                path: 'package', component: PackageComponent
            }
        ]
    },
    {
        path: "**", component: NotfoundComponent
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule { }
