import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { AngularFileUploaderModule } from "angular-file-uploader";

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './@theme/login/login.component';
import { RegisterComponent } from './@theme/register/register.component';
import { NotfoundComponent } from './@theme/notfound/notfound.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UserRegisterComponent } from './@theme/register/user-register/user-register.component';
import { AugentRegisterComponent } from './@theme/register/augent-register/augent-register.component';
import { SellerRegisterComponent } from './@theme/register/seller-register/seller-register.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    NotfoundComponent,
    UserRegisterComponent,
    AugentRegisterComponent,
    SellerRegisterComponent,
  ], 
  imports: [
    BrowserModule, HttpClientModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    AngularFileUploaderModule,
    BrowserAnimationsModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
