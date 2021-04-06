import { Component, OnInit } from '@angular/core';
import { HomePageService } from '../../../@core/mock/Home/home-page.service';
import { environment } from '../../../@core/models/Environment';

@Component({
  selector: 'app-newly-listed',
  templateUrl: './newly-listed.component.html',
  styleUrls: ['./newly-listed.component.css']
})
export class NewlyListedComponent implements OnInit {
  listProduct = [];
  containData;
  getIdLength = 0;
  getImageBannerSrc = environment.ImageProductUrl + "Banner/";
  // END khai bao bien
  constructor(
    private homePageService: HomePageService,
  ) { }

  ngOnInit(): void {
    this.getAllProduct();
  }

  // Get All project
  getAllProduct() {
    this.homePageService.getProductViewHome().subscribe(
      data => {
        this.containData = data;

        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          this.listProduct.unshift(e);
        });
      }
    )
  }

}
