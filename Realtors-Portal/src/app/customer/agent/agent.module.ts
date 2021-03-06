import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AgentComponent } from './agent.component';
import { AppRoutingModule } from './agent-routing.module';
import { MaterialModule } from './../../admin/material/material.module';

import { HeaderComponent } from './component/header/header.component';
import { NavigationComponent } from './component/navigation/navigation.component';
import { ProductComponent } from './controll/product/product.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatTooltipModule } from '@angular/material/tooltip';
import { NgxPaginationModule } from 'ngx-pagination';
import { EditProfileComponent } from './controll/edit-profile/edit-profile.component';


@NgModule({
  declarations: [AgentComponent, HeaderComponent, NavigationComponent, ProductComponent, EditProfileComponent],
  imports: [
    CommonModule,
    AppRoutingModule,
    FormsModule, ReactiveFormsModule,
    MatTooltipModule,
    NgxPaginationModule,
    MaterialModule
  ]
})
export class AgentModule { }
