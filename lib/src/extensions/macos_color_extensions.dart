import 'dart:ui';

import 'package:macos_ui/macos_ui.dart';

extension MacosColorExtension on Color {
  MacosColor? toMacosColor() => MacosColor(value);
}
