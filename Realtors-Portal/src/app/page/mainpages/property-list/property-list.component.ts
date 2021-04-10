import { Component, OnInit } from '@angular/core';
import { HomePageService } from 'src/app/@core/mock/Home/home-page.service';
import { environment } from 'src/app/@core/models/Environment';

@Component({
  selector: 'app-property-list',
  templateUrl: './property-list.component.html',
  styleUrls: ['./property-list.component.css']
})
export class PropertyListComponent implements OnInit {

  listProd = [];
  containData;
  getIdLength = 0;
  getImageBannerSrc = environment.ImageProductUrl + "Banner/";
  UserSrcAvatar = environment.ImageUrl + "Customer/";
  // END khai bao bien
  constructor(
    private productService: HomePageService,
  ) { }

  ngOnInit(): void {
    this.getAllProdActive();
  }

  // Get All project
  getAllProdActive() {
    this.productService.getProductActive().subscribe(
      data => {
        this.containData = data;
        console.log(this.containData);

        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          e.UserSrcAvatar = this.UserSrcAvatar;
          this.listProd.unshift(e);
        });
      }
    )
  }

}
