import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SellerComponent } from './seller.component';
import { AppRoutingModule } from './seller-routing.module';



@NgModule({
  declarations: [SellerComponent],
  imports: [
    CommonModule,
    AppRoutingModule
  ]
})
export class SellerModule { }
