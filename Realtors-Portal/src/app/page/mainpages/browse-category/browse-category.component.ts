import { Component, OnInit } from '@angular/core';
import { HomePageService } from '../../../@core/mock/Home/home-page.service';
import { environment } from '../../../@core/models/Environment';

@Component({
  selector: 'app-browse-category',
  templateUrl: './browse-category.component.html',
  styleUrls: ['./browse-category.component.css']
})
export class BrowseCategoryComponent implements OnInit {
  listCategory = [];
  containData;
  getIdLength = 0;
  getImageBannerSrc = environment.ImageUrl + "categories/";
  // END khai bao bien
  constructor(
    private homePageService: HomePageService,
  ) { }

  ngOnInit(): void {
    this.getAllCategory();
  }

  // Get All project
  getAllCategory() {
    this.homePageService.getCategoryActive().subscribe(
      data => {
        this.containData = data;

        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          this.listCategory.unshift(e);
        });
      }
    )
  }

}
