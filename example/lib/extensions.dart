import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/flutter_extended_platform_widgets.dart';

extension WidgetExt on Widget {
  Widget maxWidth(double maxWidth) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: this,
    );
  }

  Widget get center => Center(child: this);
}

extension DisplayPlatformTarget on TargetPlatform {
  String get text {
    final cleaned = toString().replaceAll('TargetPlatform.', '');
    return cleaned[0].toUpperCase() + cleaned.substring(1);
  }
}

extension PlatformTargetExt on WidgetBuilder {
  Widget asMaterial() => asPlatform(TargetPlatform.android);
  Widget asCupertino() => asPlatform(TargetPlatform.iOS);
  Widget asWindows() => asPlatform(TargetPlatform.windows);
  Widget asMacos() => asPlatform(TargetPlatform.macOS);
  Widget asLinux() => asPlatform(TargetPlatform.linux);
  Widget asFuchsia() => asPlatform(TargetPlatform.fuchsia);

  Widget asPlatform(TargetPlatform platform) {
    return Builder(
      builder: (context) {
        final p = PlatformProvider.of(context)!;

        return PlatformProvider(
          settings: p.settings,
          initialPlatform: platform,
          builder: (context) => this(context),
        );
      },
    );
  }
}
