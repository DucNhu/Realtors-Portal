import { Component, OnInit } from '@angular/core';
import { DashboardService } from './../../../@core/mock/admin/dashboard.service';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  constructor(
    private dashboardService: DashboardService
  ) { }

  ngOnInit(): void {
    this.getAllDataDashBoard();
  }

  objData = {
    countaccActiveNotAd: {},
    countaccAgentActive: {},
    countProductActive: {},
    countaccSellerActive: {},
    countpackagePurchased: {}
  };
  getAllDataDashBoard() {
    let obs = this.dashboardService;
    
    obs.countaccActiveNotAd().subscribe(
      data => {        
        this.objData.countaccActiveNotAd = data;
      }
    )
    obs.countaccAgentActive().subscribe(
      data => {
        this.objData.countaccAgentActive = data;
      }
    )
    obs.countProductActive().subscribe(
      data => {
        this.objData.countProductActive = data;
      }
    )
    obs.countaccSellerActive().subscribe(
      data => {
        this.objData.countaccSellerActive = data;
      }
    )
    obs.countpackagePurchased().subscribe(
      data => {
        this.objData.countpackagePurchased = data;
      }
    )

    console.log(this.objData);
    
  }
}
