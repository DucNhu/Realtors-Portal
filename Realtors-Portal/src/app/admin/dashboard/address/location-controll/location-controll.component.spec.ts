import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LocationControllComponent } from './location-controll.component';

describe('LocationControllComponent', () => {
  let component: LocationControllComponent;
  let fixture: ComponentFixture<LocationControllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LocationControllComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LocationControllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
