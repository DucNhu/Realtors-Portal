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
  NowTime = new Date();
  StartTime = `${this.NowTime.getFullYear()}-${this.NowTime.getMonth() + 1}-${this.NowTime.getDate()}`


  contain;
  getPackageActiveAndInforUser() {
    this.packageService.getPackageActive().subscribe(
      data => {
        this.listPackage = data;        
        this.listPackage.forEach(e => {
          console.log(e);
          
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
                  UserID: this.idUser,
                  Duration: e.Duration
                }

                this.packagePP.CreatePackagePP(PackagePurchased).subscribe(
                  data => {
                  }
                );
                // upgrade packadeID in User table
                this.userService.putUserUpgradePackageID(this.idUser, e.PackageID).subscribe(
                  data => {
                    alert(`Thank ${details.payer.name.given_name} for supporting the site, you have ${e.Duration} days free`);
                    // window.location.reload();
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

   // panigate ( phân trang )
  //  page = 1;
  //  count = 0;
  //  tableSize = 8;
  //  tableSizes = [3, 6, 9, 12];

  //  fetchPosts(): void {
  //    this.packageService.getPackageActive().subscribe(
  //      (response) => {
  //        this.contain = response;
  //      },
  //      (error) => {
  //        console.log(error);
  //      }
  //    );
  //  }

  //  onTableDataChange(event) {
  //    this.page = event;
  //    this.fetchPosts();
  //  }

  //  onTableSizeChange(event): void {
  //    this.tableSize = event.target.value;
  //    this.page = 1;
  //    this.fetchPosts();
  //  }

}
