import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DeltailUserComponent } from 'src/app/page/deltail-user/deltail-user.component';
import { PackageComponent } from 'src/app/page/package/package.component';
import { AuthGuard } from '../..//@core/_helpers/auth.guard';
import { LoginComponent } from '../../@theme/login/login.component';
import { NotfoundComponent } from '../../@theme/notfound/notfound.component';
import { EditProductComponent } from '../seller/controll/product/edit-product/edit-product.component';
import { AgentComponent } from './agent.component';
import { ProductComponent } from './../seller/controll/product/product.component';
import { ProductDetailComponent } from 'src/app/page/product-detail/product-detail.component';
import { EditProfileComponent } from '../seller/controll/profile/edit-profile/edit-profile.component';
const routes: Routes = [
    {
        path: '', component: AgentComponent,
        children: [
            {
                path: '', component: ProductComponent
            },
            {
                path: 'product', component: ProductComponent
            },
            {
                path: 'package', component: PackageComponent
            },
            {
                path: 'detail/id/:id', component: DeltailUserComponent
            },
            {
                path: 'product/product-edit/id/:id', component: EditProductComponent
            },
            {
                path: 'product-edit/id/:id', component: EditProductComponent
            },
            {
                path: 'profile-edit', component: EditProfileComponent
            },
            {
                path: 'property-detail/id/:id', component: ProductDetailComponent,
            },
            {
                path: 'product/property-detail/id/:id', component: ProductDetailComponent,
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
