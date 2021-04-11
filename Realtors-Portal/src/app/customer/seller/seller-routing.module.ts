import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { SellerGuard } from 'src/app/@core/_helpers/seller.guard';
import { DeltailUserComponent } from 'src/app/page/deltail-user/deltail-user.component';

import { PackageComponent } from 'src/app/page/package/package.component';

import { NotfoundComponent } from '../../@theme/notfound/notfound.component';
import { EditProductComponent } from './controll/product/edit-product/edit-product.component';
import { ProductComponent } from './controll/product/product.component';
import { SellerComponent } from './seller.component';

const routes: Routes = [
    {
        path: '', component: SellerComponent,
        children: [
            {
                path: '', component: DeltailUserComponent
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
                path: 'product/edit/id/:id', component: EditProductComponent
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
