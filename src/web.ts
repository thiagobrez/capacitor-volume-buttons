import type { ListenerCallback, PluginListenerHandle } from '@capacitor/core';
import { WebPlugin, Capacitor } from '@capacitor/core';

import type { CapacitorVolumeButtonsPlugin } from './definitions';

export class CapacitorVolumeButtonsWeb
  extends WebPlugin
  implements CapacitorVolumeButtonsPlugin {
  private platform = Capacitor.getPlatform();

  addListener(
    eventName: string,
    listenerFunc: ListenerCallback,
  ): Promise<PluginListenerHandle> & PluginListenerHandle {
    if (this.platform === 'ios') {
      return super.addListener(eventName, listenerFunc);
    } else if (this.platform === 'android') {
      return super.addListener(eventName, listenerFunc);
    } else {
      console.log('CapacitorVolumeButtons is not supported on web');
      return super.addListener(eventName, listenerFunc);
    }
  }
}
