# webf_websocket

W3C compact WebSocket API support.


## Installation

First, add webf_websocket as a dependency in your pubspec.yaml file.

Second, add the following code before calling runApp():

```dart
import 'package:webf_websocket/webf_websocket.dart';
void main() {
  WebFWebSocket.initialize();
  runApp(MyApp());
}
```

## Example

```javascript
let ws = new WebSocket('ws://127.0.0.1:8399');
ws.onopen = () => {
    ws.send('helloworld');
};
ws.onmessage = (event) => {
    console.log(event);
}
```

## Contribute

convert javascript code to quickjs bytecode:

```bash
webf qjsc --dart --pluginName webf_websocket ./lib/websocket.js ./lib/websocket_qjsc.dart
```