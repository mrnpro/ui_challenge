import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

void main() {
  runApp(ProviderScope(
      child: DevicePreview(
    enabled: false,
    builder: (BuildContext context) => const App(),
  )));
}
