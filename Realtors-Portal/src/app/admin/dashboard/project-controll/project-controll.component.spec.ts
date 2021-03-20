import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectControllComponent } from './project-controll.component';

describe('ProjectControllComponent', () => {
  let component: ProjectControllComponent;
  let fixture: ComponentFixture<ProjectControllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProjectControllComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ProjectControllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
