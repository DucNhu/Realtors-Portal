import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from '../@theme/login/login.component';
import { RegisterComponent } from '../@theme/register/register.component';
import { MainpagesComponent } from './mainpages/mainpages.component';
import { PageComponent } from './page.component';
import { PropertyListComponent } from './mainpages/property-list/property-list.component';
import { ProductDetailComponent } from './component/product-detail/product-detail.component';
const routes: Routes = [
    {

        path: '',
        component: PageComponent,
        children: [
        {
            path: '', component: MainpagesComponent
        },
        {
          path: 'product-detail', component: ProductDetailComponent,
        },
        {
          path: 'property-list', component: PropertyListComponent,
        },
        {
            path: 'login', component: LoginComponent
        },
        {
            path: 'register', component: RegisterComponent
        }
        ]

    }
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class PageRoutingModule { }
