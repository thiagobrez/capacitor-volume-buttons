import { registerPlugin } from '@capacitor/core';

import type { CapacitorVolumeButtonsPlugin } from './definitions';

const CapacitorVolumeButtons = registerPlugin<CapacitorVolumeButtonsPlugin>(
  'CapacitorVolumeButtons',
  {
    web: () => import('./web').then(m => new m.CapacitorVolumeButtonsWeb()),
  },
);

export * from './definitions';
export { CapacitorVolumeButtons };
