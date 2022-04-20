import type { PluginListenerHandle } from '@capacitor/core';

export declare type VolumeButtonPressed = { direction: 'up' | 'down' };
export declare type VolumeButtonPressedListener = ({
  direction,
}: VolumeButtonPressed) => void;

export interface CapacitorVolumeButtonsPlugin {
  /**
   * Listen for presses on the hardware volume buttons
   *
   * @since 1.0.0
   */
  addListener(
    event: 'volumeButtonPressed',
    listenerFunc: VolumeButtonPressedListener,
  ): Promise<PluginListenerHandle> & PluginListenerHandle;

  /**
   * Removes all listeners for this plugin
   *
   * @since 1.0.0
   */
  removeAllListeners(): Promise<void>;
}
