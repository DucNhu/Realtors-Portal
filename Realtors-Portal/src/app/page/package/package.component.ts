import { Component, OnInit } from '@angular/core';
import { HomePageService } from './../../@core/mock/Home/home-page.service';
import { PackageppService } from './../../@core/mock/Package/packagepp.service';
import { AuthenticationService } from './../../@core/mock/Authentication.Service';
import { UserService } from 'src/app/@core/mock/Customer/user.service';

@Component({
  selector: 'app-package',
  templateUrl: './package.component.html',
  styleUrls: ['./package.component.css']
})
export class PackageComponent implements OnInit {
  listPackage;

  constructor(
    private packageService: HomePageService,
    private packagePP: PackageppService,
    private authen: AuthenticationService,
    private userService: UserService
  ) { }

  idUser = this.authen.currentUserValue.Infor.ID;
  packageIDForUser = 0;
  ngOnInit(): void {
    // paypal.Buttons().render('#paypal-button-container');
    this.getPackageActiveAndInforUser();
       
  }

  contain;
  getPackageActiveAndInforUser() {
    this.packageService.getPackageActive().subscribe(
      data => {
        this.listPackage = data;
        this.listPackage.forEach(e => {
          paypal.Buttons({
            style: {
              color: 'blue'
            }, createOrder: (data, actions) => {
              // This function sets up the details of the transaction, including the amount and line item details.
              return actions.order.create({
                purchase_units: [{
                  amount: {
                    value: e.Price
                  }
                }]
              });
            },
            onApprove: (data, actions) =>  {
              // This function captures the funds from the transaction.
              
              return actions.order.capture().then((details) =>  {
                // This function shows a transaction success message to your buyer.
                let PackagePurchased = {
                  ppID: 0,
                  PackageID: e.PackageID,
                  UserID: this.idUser,
                  StartDate: this.StartTime,
                  EndDate: `${this.NowTime.getFullYear()}-${this.NowTime.getMonth()}-${this.NowTime.getDate() + e.Duration}`
                }

                this.packagePP.CreatePackage(PackagePurchased).subscribe(
                  data => {
                  }
                );
                // upgrade packadeID in User table
                this.userService.putUserUpgradePackageID(this.idUser, e.PackageID).subscribe(
                  data => {
                    alert(`Thank ${details.payer.name.given_name} for supporting the site, you have ${e.Duration} days free`);
                    window.location.reload();
                  }
                );
                
              });
            }
            // })
          }).render('#paypal-button-container' + e.PackageID);

        });
        // this.createPayApp()
      }
    )
    this.userService.getUserbyId(this.idUser).subscribe(
      data => {
        this.contain = data;
        this.packageIDForUser = this.contain.PackageID
      }
    )
  }
  NowTime = new Date();
  StartTime = `${this.NowTime.getFullYear()}-${this.NowTime.getMonth()}-${this.NowTime.getDate()}`


  

  OnBuyPackageTest(e) {
    console.log(e);
    
  }
  
  //  Update packagePP
  UpPackagePP(val) {
    this.packagePP.UpdatePackage(val).subscribe(
      data => {
        console.log("OK ok ok");

      }
    )
  }

  
}
