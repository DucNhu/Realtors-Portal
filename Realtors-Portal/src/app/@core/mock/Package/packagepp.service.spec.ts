import { TestBed } from '@angular/core/testing';

import { PackageppService } from './packagepp.service';

describe('PackageppService', () => {
  let service: PackageppService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(PackageppService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
