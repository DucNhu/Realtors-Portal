import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PageComponent } from './page.component';
import { PageRoutingModule } from './page-routing.module';
import { HeaderComponent } from './component/header/header.component';
import { MaterialModule } from './../admin/material/material.module';
// import {} 

import { FooterComponent } from './component/footer/footer.component';
import { MainpagesComponent } from './mainpages/mainpages.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthenticationService } from '../@core/mock/Authentication.Service';
import { BannerComponent } from './mainpages/banner/banner.component';
import { NewlyListedComponent } from './mainpages/newly-listed/newly-listed.component';
import { BrowseCategoryComponent } from './mainpages/browse-category/browse-category.component';
import { DealsComponent } from './mainpages/deals/deals.component';
import { AboutusComponent } from './aboutUs/aboutus/aboutus.component';
import { PropertyListComponent } from './mainpages/property-list/property-list.component';

import { DeltailUserComponent } from './deltail-user/deltail-user.component';
import { ProductDetailComponent } from './product-detail/product-detail.component';
import { ResultBySearchComponent } from './result-by-search/result-by-search.component';
import { ResultBySearchBoxComponent } from './mainpages/property-list/result-by-search.component';
import { ListUserComponent } from './list-user/list-user.component';

import { NgxPaginationModule } from "ngx-pagination";
import { AboutComponent } from './about/about.component';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { FaqsComponent } from './faqs/faqs.component';
@NgModule({
  declarations: [
    PageComponent,
    HeaderComponent,
    FooterComponent,
    MainpagesComponent,
    BannerComponent,
    NewlyListedComponent,
    BrowseCategoryComponent,
    DealsComponent,
    AboutusComponent,
    PropertyListComponent,

    DeltailUserComponent,
    ProductDetailComponent,
    ResultBySearchComponent,
    ResultBySearchBoxComponent,
    ListUserComponent,
    AboutComponent,
    ContactUsComponent,
    FaqsComponent
  ],
  providers: [AuthenticationService],
  imports: [
    CommonModule,
    PageRoutingModule,
    FormsModule, ReactiveFormsModule,
    MaterialModule, NgxPaginationModule]
})
export class PageModule { }
