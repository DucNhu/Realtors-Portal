import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AgentComponent } from './agent.component';
import { AppRoutingModule } from './agent-routing.module';
import { HeaderComponent } from './component/header/header.component';
import { NavigationComponent } from './component/navigation/navigation.component';
import { ProductComponent } from './controll/product/product.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [AgentComponent, HeaderComponent, NavigationComponent, ProductComponent],
  imports: [
    CommonModule,
    AppRoutingModule,
    FormsModule, ReactiveFormsModule
  ]
})
export class AgentModule { }
