package com.thiagobrez.capacitorvolumebuttons;

import android.view.KeyEvent;
import android.view.View;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "CapacitorVolumeButtons")
public class CapacitorVolumeButtonsPlugin extends Plugin {

    private CapacitorVolumeButtons implementation = new CapacitorVolumeButtons();
    public static final String VOLUME_BUTTON_PRESSED_EVENT = "volumeButtonPressed";

    @Override
    public void load() {
        getBridge()
            .getWebView()
            .setOnKeyListener(
                new View.OnKeyListener() {
                    @Override
                    public boolean onKey(View v, int keyCode, android.view.KeyEvent event) {
                        boolean isKeyUp = event.getAction() == KeyEvent.ACTION_UP;
                        JSObject ret = new JSObject();

                        if (isKeyUp) {
                            if (keyCode == KeyEvent.KEYCODE_VOLUME_UP) {
                                ret.put("direction", "up");
                                notifyListeners(VOLUME_BUTTON_PRESSED_EVENT, ret);
                                return true;
                            } else if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
                                ret.put("direction", "down");
                                notifyListeners(VOLUME_BUTTON_PRESSED_EVENT, ret);
                                return true;
                            }
                        }

                        return false;
                    }
                }
            );
    }
}
