import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DistrictControllComponent } from './district-controll.component';

describe('DistrictControllComponent', () => {
  let component: DistrictControllComponent;
  let fixture: ComponentFixture<DistrictControllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DistrictControllComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DistrictControllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
