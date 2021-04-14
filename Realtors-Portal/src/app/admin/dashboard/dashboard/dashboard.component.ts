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
  countProductActive;
  listAccSellerActive;
  countpackagePurchase;

  countAccSellerActive;
  countAccAgentActive;
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
        this.countaccActiveNotAd = data;
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
        this.countProductActive = data;
      }
    )

    this.obs.countpackagePurchased().subscribe(
      data => {
        // this.countpackagePurchased = data;
      }
    )


    }

  chartOptions = {
    responsive: true,
  };
  chartLabels = ['Seller', 'Agent'];
  chartColors = [{
    backgroundColor: ['#93a8ac', '#fff'],
    borderColor: ['#424b54', '#424b54']
  }];
  chartLegend = true;
  chartPlugins = [];





}
