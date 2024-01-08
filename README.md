> [!IMPORTANT]  
> This repository has been merged into [@capacitor-community/volume-buttons](https://github.com/capacitor-community/volume-buttons), where is it going to be actively maintained

# capacitor-volume-buttons

Hardware volume buttons listener for Capacitor

## Install

```bash
npm install capacitor-volume-buttons
npx cap sync
```

## Quick example
```tsx
  useEffect(() => {
    const onVolumeButtonPressed = ({ direction }: VolumeButtonPressed) => {
      if (direction === 'up') {
        console.log('Volume up pressed!');
      } else {
        console.log('Volume down pressed!');
      }
    };

    CapacitorVolumeButtons.addListener('volumeButtonPressed', onVolumeButtonPressed);

    return () => {
      CapacitorVolumeButtons.removeAllListeners();
    };
  }, []);
```

## API

<docgen-index>

* [`addListener('volumeButtonPressed', ...)`](#addlistenervolumebuttonpressed)
* [`removeAllListeners()`](#removealllisteners)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### addListener('volumeButtonPressed', ...)

```typescript
addListener(event: 'volumeButtonPressed', listenerFunc: VolumeButtonPressedListener) => Promise<PluginListenerHandle> & PluginListenerHandle
```

Listen for presses on the hardware volume buttons

| Param              | Type                                                                                |
| ------------------ | ----------------------------------------------------------------------------------- |
| **`event`**        | <code>'volumeButtonPressed'</code>                                                  |
| **`listenerFunc`** | <code><a href="#volumebuttonpressedlistener">VolumeButtonPressedListener</a></code> |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt; & <a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

**Since:** 1.0.0

--------------------


### removeAllListeners()

```typescript
removeAllListeners() => Promise<void>
```

Removes all listeners for this plugin

**Since:** 1.0.0

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |


### Type Aliases


#### VolumeButtonPressedListener

<code>({ direction, }: <a href="#volumebuttonpressed">VolumeButtonPressed</a>): void</code>


#### VolumeButtonPressed

<code>{ direction: 'up' | 'down' }</code>

</docgen-api>
