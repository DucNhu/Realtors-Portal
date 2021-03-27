import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CityControllComponent } from './city-controll.component';

describe('CityControllComponent', () => {
  let component: CityControllComponent;
  let fixture: ComponentFixture<CityControllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CityControllComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CityControllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
