import { Component, OnInit } from '@angular/core';
import { DashboardService } from './../../../@core/mock/admin/dashboard.service';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  chartData; // Seller / Agent

  countaccActiveNotAd;
  listAccAgentActive;
  listAccSellerActive;
  countProductActive; countProductSold;

  
  countpackagePurchased;



  countAccSellerActive;
  countAccAgentActive;

  // Chart Category, count product by Category
  listNameCategoryAndCountProductByThisCategory;
  listNameCategoryAndCountProductByThisCategory_Name = [];
  listNameCategoryAndCountProductByThisCategory_Count = [];
  listNameCategoryAndCountProductByThisCategory_BgList;
  listNameCategoryAndCountProductByThisCategory_Bg = [];
// Chart Category, count product by Category
  NamePackageAndCountPackagePurchased;
  listNamePackageAndCountPackagePurchased_Name = [];
  listNamePackageAndCountPackagePurchased_Count = [];
  listNamePackageAndCountPackagePurchased_BgList;
  listNamePackageAndCountPackagePurchased_Bg = [];
  // Chart Category, count product by Category
  NamePackageAndPriceByThisPackage;
  listNamePackageAndPriceByThisPackage_Name = [];
  listNamePackageAndPriceByThisPackage_TotalPrice = [];
  listNamePackageAndPriceByThisPackage_BgList;
  listNamePackageAndPriceByThisPackage_Bg = [];

  TotalPrice = 0;
  constructor(
    private dashboardService: DashboardService
  ) { }

  ngOnInit(): void {
    this.getAllDataDashBoard();
  }
  obs = this.dashboardService;

  getAllDataDashBoard() {

    this.obs.countaccActiveNotAd().subscribe(
      data => {
        let contain;
        contain = data;
        contain.forEach(e => {
          this.countaccActiveNotAd = e.accActiveNotAd
        });
      }
    )
    this.obs.countaccSellerActive().subscribe(
      data => {
        this.listAccSellerActive = data;
        this.listAccSellerActive.forEach(element => {
          this.countAccSellerActive = element.accSellerActive;
        });
      }
    )

    // Agent
    this.obs.countaccAgentActive().subscribe(
      data => {
        this.listAccAgentActive = data;
        this.listAccAgentActive.forEach(element => {
          this.countAccAgentActive = element.accAgentActive;
        });
      }
    )
    this.obs.countProductActive().subscribe(
      data => {
        let contain;
        contain = data;
        contain.forEach(e => {
          
          this.countProductActive = e.countProductActive
        });
      }
    )
    //  countProduct sold
    this.obs.countProductSold().subscribe(
      data => {
        let contain;
        contain = data;
        contain.forEach(e => {

          this.countProductSold = e.countProductSold
        });
      }
    )

    this.obs.countpackagePurchased().subscribe(
      data => {
        let contain; contain = data;     
        contain.forEach(e => {
          console.log(e);
          
          this.countpackagePurchased = e.PackagePurchased
        });
      }
    )

    // NameCategory And Count Product By This Category ( Show count category, Name of this category)
    this.obs.NameCategoryAndCountProductByThisCategory().subscribe(
      data => {
        this.listNameCategoryAndCountProductByThisCategory = data;
        console.log(this.listNameCategoryAndCountProductByThisCategory);
        
        this.listNameCategoryAndCountProductByThisCategory.forEach(e => {
          console.log(e);
          
          this.listNameCategoryAndCountProductByThisCategory_Bg.push('#' + Math.floor(Math.random() * 16777215).toString(16))
          this.listNameCategoryAndCountProductByThisCategory_BgList = [{ backgroundColor: this.listNameCategoryAndCountProductByThisCategory_Bg}]; // random bg
          this.listNameCategoryAndCountProductByThisCategory_Name.push(e.categoryCount);
          this.listNameCategoryAndCountProductByThisCategory_Count.push(e.productCount);
        });
      }
    )

    // Name Package && count PackagePurchased ( xem package nào bán nhiều hơn package nào)
    this.obs.NamePackageAndCountPackagePurchased().subscribe(
      data => {
        this.NamePackageAndCountPackagePurchased = data;
        
        this.NamePackageAndCountPackagePurchased.forEach(e => { 
          
          this.listNamePackageAndCountPackagePurchased_Bg.push('#' + Math.floor(Math.random() * 16777215).toString(16))
          this.listNamePackageAndCountPackagePurchased_BgList = [{ backgroundColor: this.listNamePackageAndCountPackagePurchased_Bg }]; // random bg
          this.listNamePackageAndCountPackagePurchased_Name.push(e.PackageName);
          this.listNamePackageAndCountPackagePurchased_Count.push(e.CountPackagePurchased);


          this.listNamePackageAndPriceByThisPackage_TotalPrice.push((e.CountPackagePurchased * e.Price));
          
          this.TotalPrice = e.CountPackagePurchased * e.Price + this.TotalPrice;
        });
      }
    )
  }

  chartOptions = {
    responsive: false,
  };
  chartLabels = ['Seller', 'Agent'];

  chartColors = [{
    backgroundColor: ['#93a8ac', '#fff'],
    borderColor: ['#424b54', '#424b54']
  }];
  chartLegend = true;
  chartPlugins = [];





}
