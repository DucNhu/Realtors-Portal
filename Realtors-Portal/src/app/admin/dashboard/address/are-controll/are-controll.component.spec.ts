import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AreControllComponent } from './are-controll.component';

describe('AreControllComponent', () => {
  let component: AreControllComponent;
  let fixture: ComponentFixture<AreControllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AreControllComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AreControllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
