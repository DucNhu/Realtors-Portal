import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from '../@theme/login/login.component';
import { RegisterComponent } from '../@theme/register/register.component';
import { MainpagesComponent } from './mainpages/mainpages.component';
import { PageComponent } from './page.component';
import { PropertyListComponent } from './mainpages/property-list/property-list.component';
import { PackageComponent } from './package/package.component';
import { ProductDetailComponent } from './product-detail/product-detail.component';
import { DeltailUserComponent } from './deltail-user/deltail-user.component';
import { ResultBySearchComponent } from './result-by-search/result-by-search.component';
import { ResultBySearchBoxComponent } from './mainpages/property-list/result-by-search.component';
import { ListCustomerComponent } from '../admin/dashboard/customer/list-customer.component';
import { ListUserComponent } from './list-user/list-user.component';
import { AboutComponent } from './about/about.component';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { FaqsComponent } from './faqs/faqs.component';
const routes: Routes = [
    {

        path: '',
        component: PageComponent,
        children: [
            {
                path: '', component: MainpagesComponent
            },
            {
                path: 'property-list', component: PropertyListComponent,
            },
            {
                path: 'property-list-search-result', component: ResultBySearchBoxComponent,
            },
            {
                path: 'property-list/property-detail/id/:id', component: ProductDetailComponent,
            },
            {
                path: 'property-detail/id/:id', component: ProductDetailComponent,
            },
            {
                path: 'user-detail/id/:id', component: DeltailUserComponent,
            },
            {
                path: 'category/:category', component: ResultBySearchComponent,
            },
            {
                path: 'user-list', component: ListUserComponent,
            },

            {
                path: 'login', component: LoginComponent
            },
            {
                path: 'register', component: RegisterComponent
            },
            {
                path: 'package', component: PackageComponent
            },
            {
                path: 'aboutUs', component: AboutComponent
            },
            {
                path: 'contactUs', component: ContactUsComponent
            },
            {
                path: 'faqs', component: FaqsComponent
            },
        ]

    }
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class PageRoutingModule { }
