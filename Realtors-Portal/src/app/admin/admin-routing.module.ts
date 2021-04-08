import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminComponent } from './admin.component';
import { ProjectControllComponent } from './dashboard/project-controll/project-controll.component';
import { NotfoundComponent } from '../@theme/notfound/notfound.component';
import { CategoryControlComponent } from './dashboard/category-control/category-control.component';
import { AddressComponent } from './dashboard/address/address.component';
import { PackageControllComponent } from './dashboard/package-controll/package-controll.component';
import { CustomerComponent } from './dashboard/customer/customer/customer.component';
import { ListCustomerComponent } from './dashboard/customer/list-customer.component';
import { DashboardComponent } from './dashboard/dashboard/dashboard.component';
const routes: Routes = [
    {
        path: '', component: AdminComponent,
        children: [
            {
                path: '', component: ProjectControllComponent
            },
            {
                path: 'dashboard', component: DashboardComponent
            },
            {
                path: 'product', component: ProjectControllComponent
            },
            {
                path: 'category', component: CategoryControlComponent
            },
            {
                path: 'address', component: AddressComponent
            },
            {
                path: 'packages', component: PackageControllComponent
            },
            {
                path: 'customer', component: ListCustomerComponent
            }
        ]
    },
    {
        path: '**', component: NotfoundComponent
    }
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class AdminRoutingModule { }