import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeltailUserComponent } from './deltail-user.component';

describe('DeltailUserComponent', () => {
  let component: DeltailUserComponent;
  let fixture: ComponentFixture<DeltailUserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeltailUserComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeltailUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
