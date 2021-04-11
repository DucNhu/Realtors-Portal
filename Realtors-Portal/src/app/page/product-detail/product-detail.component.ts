import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { UserService } from 'src/app/@core/mock/Customer/user.service';
import { HomePageService } from 'src/app/@core/mock/Home/home-page.service';
import { environment } from 'src/app/@core/models/Environment';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.css']
})
export class ProductDetailComponent implements OnInit {

  constructor(
    private homePageService: HomePageService,
    private ActivatedRoute: ActivatedRoute,
    private userService: UserService
  ) { }
  ImageUserSrc = environment.ImageUrl + "Customer/";
  ImageBannerSrc = environment.ImageProductUrl + "Banner/";
  ImageFeatureSrc = environment.ImageProductUrl + "ImageLibs/";
  InforProduct;
 
  listImageFeature;
  ngOnInit(): void {
    console.log(this.ActivatedRoute.snapshot.paramMap.get("id"));
    
    
    this.homePageService.getProductDetail(this.ActivatedRoute.snapshot.paramMap.get("id")).subscribe(
      data => {
        this.InforProduct = data;
        console.log(this.InforProduct);
        
      }
    )

    this.homePageService.getImageFeatureByProductID(this.ActivatedRoute.snapshot.paramMap.get("id")).subscribe(
      data => {
        this.listImageFeature = data;
      }
    )
  }

}
