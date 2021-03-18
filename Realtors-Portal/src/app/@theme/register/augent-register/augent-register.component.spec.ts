import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AugentRegisterComponent } from './augent-register.component';

describe('AugentRegisterComponent', () => {
  let component: AugentRegisterComponent;
  let fixture: ComponentFixture<AugentRegisterComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AugentRegisterComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AugentRegisterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
