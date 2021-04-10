import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/@core/mock/Customer/user.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProjectService } from 'src/app/@core/mock/project.service';
import { environment } from 'src/app/@core/models/Environment';

@Component({
  selector: 'app-deltail-user',
  templateUrl: './deltail-user.component.html',
  styleUrls: ['./deltail-user.component.css']
})
export class DeltailUserComponent implements OnInit {

  constructor(
    private userService: UserService,
    private activatedRoute: ActivatedRoute,
    private projectService: ProjectService
  ) { }

  UserInfor;
  countProductByUser;
  imgsrc = environment.ImageUrl + "Customer/";
  ngOnInit(): void {    
    this.geUSerDetail();
    this.projectService.getCountProductByUserID(this.activatedRoute.snapshot.params['id']).subscribe( 
      data => {
        this.countProductByUser = data
      }
    )
  }

  geUSerDetail() {
    this.userService.getUserDetail(this.activatedRoute.snapshot.params['id']).subscribe(
      data => {
        this.UserInfor = data;
        console.log(this.UserInfor);

      }
    )
  }
}
