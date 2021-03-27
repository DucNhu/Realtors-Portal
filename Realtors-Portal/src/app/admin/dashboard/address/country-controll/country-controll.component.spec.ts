import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CountryControllComponent } from './country-controll.component';

describe('CountryControllComponent', () => {
  let component: CountryControllComponent;
  let fixture: ComponentFixture<CountryControllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CountryControllComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CountryControllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
