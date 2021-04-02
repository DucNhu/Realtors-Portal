import { TestBed } from '@angular/core/testing';

import { ImageLibService } from './image-lib.service';

describe('ImageLibService', () => {
  let service: ImageLibService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ImageLibService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
