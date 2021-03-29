import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminComponent } from './admin.component';
import { ProjectControllComponent } from './dashboard/project-controll/project-controll.component';
import { NotfoundComponent } from '../@theme/notfound/notfound.component';
import { CategoryControlComponent } from './dashboard/category-control/category-control.component';
import { AddressComponent } from './dashboard/address/address.component';
import { PackageControllComponent } from './dashboard/package-controll/package-controll.component';
const routes: Routes = [
    {
        path: '', component: AdminComponent,
        children: [
            {
                path: '', component: ProjectControllComponent
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
                path: 'Packages', component: PackageControllComponent
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