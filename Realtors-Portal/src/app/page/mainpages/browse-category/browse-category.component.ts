import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../../../@core/mock/category.service';
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
    private categoryService: CategoryService,
  ) { }

  ngOnInit(): void {
    this.getAllCategory();
  }

  // Get All project
  getAllCategory() {
    this.categoryService.getCategoryActive().subscribe(
      data => {
        this.containData = data;
        console.log(this.containData);

        this.containData.forEach(e => {
          e.ImageBannerSrc = this.getImageBannerSrc;
          this.listCategory.unshift(e);
        });
      }
    )
  }

}
