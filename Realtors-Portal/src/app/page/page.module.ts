import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PageComponent } from './page.component';
import { PageRoutingModule } from './page-routing.module';
import { HeaderComponent } from './component/header/header.component';
import { MaterialModule } from './../admin/material/material.module';


import { FooterComponent } from './component/footer/footer.component';
import { MainpagesComponent } from './mainpages/mainpages.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthenticationService } from '../@core/mock/Authentication.Service';
import { BannerComponent } from './mainpages/banner/banner.component';
import { NewlyListedComponent } from './mainpages/newly-listed/newly-listed.component';
import { BrowseCategoryComponent } from './mainpages/browse-category/browse-category.component';
import { DealsComponent } from './mainpages/deals/deals.component';
import { AboutusComponent } from './aboutus/aboutus.component';
import { PropertyListComponent } from './mainpages/property-list/property-list.component';
import { BuyPackageComponent } from './package/buy-package/buy-package.component';
import { DeltailUserComponent } from './deltail-user/deltail-user.component';


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
    BuyPackageComponent,
    DeltailUserComponent,
  ],
  providers: [AuthenticationService],
  imports: [
    CommonModule,
    PageRoutingModule,
    FormsModule, ReactiveFormsModule,
    MaterialModule]
})
export class PageModule { }
