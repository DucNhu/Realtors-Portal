import { Component, OnInit } from '@angular/core';
import { DashboardService } from 'src/app/@core/mock/admin/dashboard.service';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {
  countaccActiveNotAd;
  countProductActive; 
  countAccSellerActive;
  countAccAgentActive; countProductSold

  listAccAgentActive;
  listAccSellerActive;

  obs = this.dashboardService;
  constructor(private dashboardService: DashboardService) { }

  ngOnInit(): void {
    this.getAllDataDashBoard();
  }

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
          console.log(e);

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
          this.countProductSold = e.countProductSold;          
        });
      }
    )

  }
}
