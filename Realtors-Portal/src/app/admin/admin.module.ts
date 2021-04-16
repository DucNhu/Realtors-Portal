import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminComponent } from './admin.component';
import { AdminRoutingModule } from './admin-routing.module';
import { BehaviorSubject, Observable } from 'rxjs';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AngularFileUploaderModule } from "angular-file-uploader";
import { MaterialModule } from './material/material.module';
import { ChartsModule } from "@rinminase/ng-charts";

import { NavigationComponent } from './component/navigation/navigation.component';
import { ProjectControllComponent } from './dashboard/project-controll/project-controll.component';
import { HeaderComponent } from './component/header/header.component';
import { CategoryControlComponent } from './dashboard/category-control/category-control.component';
import { LocationControllComponent } from './dashboard/address/location-controll/location-controll.component';
import { CountryControllComponent } from './dashboard/address/country-controll/country-controll.component';
import { CityControllComponent } from './dashboard/address/city-controll/city-controll.component';
import { DistrictControllComponent } from './dashboard/address/district-controll/district-controll.component';
import { AreControllComponent } from './dashboard/address/are-controll/are-controll.component';
import { AddressComponent } from './dashboard/address/address.component';
import { PackageControllComponent } from './dashboard/package-controll/package-controll.component';
import { CustomerComponent } from './dashboard/customer/customer/customer.component';
import { ListCustomerComponent } from './dashboard/customer/list-customer.component';
import { DashboardComponent } from './dashboard/dashboard/dashboard.component';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [AdminComponent, NavigationComponent, ProjectControllComponent, HeaderComponent, CategoryControlComponent, LocationControllComponent, CountryControllComponent, CityControllComponent, DistrictControllComponent, AreControllComponent, AddressComponent, PackageControllComponent, CustomerComponent, ListCustomerComponent, DashboardComponent],
  imports: [
    CommonModule,
    AdminRoutingModule,
    FormsModule, ReactiveFormsModule,
    AngularFileUploaderModule,
    MaterialModule,
    NgxPaginationModule,
    ChartsModule
  ]
})
export class AdminModule {

}
