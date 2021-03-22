import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminComponent } from './admin.component';
import { AdminRoutingModule } from './admin-routing.module';
import { BehaviorSubject, Observable } from 'rxjs';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AngularFileUploaderModule } from "angular-file-uploader";

import { NavigationComponent } from './component/navigation/navigation.component';
import { ProjectControllComponent } from './dashboard/project-controll/project-controll.component';
import { HeaderComponent } from './component/header/header.component';
@NgModule({
  declarations: [AdminComponent, NavigationComponent, ProjectControllComponent, HeaderComponent],
  imports: [
    CommonModule,
    AdminRoutingModule,
    FormsModule, ReactiveFormsModule,
    AngularFileUploaderModule
  ]
})
export class AdminModule { 

}
