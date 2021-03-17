import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewlyListedComponent } from './newly-listed.component';

describe('NewlyListedComponent', () => {
  let component: NewlyListedComponent;
  let fixture: ComponentFixture<NewlyListedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewlyListedComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewlyListedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
