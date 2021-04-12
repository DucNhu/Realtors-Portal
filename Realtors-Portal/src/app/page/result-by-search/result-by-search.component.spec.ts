import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResultBySearchComponent } from './result-by-search.component';

describe('ResultBySearchComponent', () => {
  let component: ResultBySearchComponent;
  let fixture: ComponentFixture<ResultBySearchComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ResultBySearchComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ResultBySearchComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
