import { Component, OnInit } from '@angular/core';
import { CategoryService } from 'src/app/@core/mock/category.service';
import { environment } from 'src/app/@core/models/Environment';

@Component({
  selector: 'app-property-list',
  templateUrl: './property-list.component.html',
  styleUrls: ['./property-list.component.css']
})
export class PropertyListComponent implements OnInit {

  listCategory = [];
  containData;
  getIdLength = 0;
  getImageBannerSrc = environment.ImageUrl + "categories/";
  // END khai bao bien
  constructor(
    private productService: CategoryService,
  ) { }

  ngOnInit(): void {
    this.getAllCategory();
  }

  // Get All project
  getAllCategory() {
    this.productService.getCategoryActive().subscribe(
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
