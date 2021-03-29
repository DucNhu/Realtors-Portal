import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PackageControllComponent } from './package-controll.component';

describe('PackageControllComponent', () => {
  let component: PackageControllComponent;
  let fixture: ComponentFixture<PackageControllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PackageControllComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PackageControllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
