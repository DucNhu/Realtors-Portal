import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SellerComponent } from './seller.component';
import { AppRoutingModule } from './seller-routing.module';
import { HeaderComponent } from './component/header/header.component';
import { NavigationComponent } from './component/navigation/navigation.component';
import { ProductComponent } from './controll/product/product.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatTooltipModule } from '@angular/material/tooltip';
import { EditProductComponent } from './controll/product/edit-product/edit-product.component';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [
    SellerComponent,
    HeaderComponent,
    NavigationComponent,
    ProductComponent,
    EditProductComponent
  ],
  imports: [
    CommonModule,
    AppRoutingModule,
    FormsModule, ReactiveFormsModule,
    MatTooltipModule,
    NgxPaginationModule
  ]
})
export class SellerModule { }
