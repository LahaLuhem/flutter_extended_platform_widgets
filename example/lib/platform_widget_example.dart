import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extended_platform_widgets/flutter_extended_platform_widgets.dart';

import 'extensions.dart';

class PlatformWidgetExample extends StatelessWidget {
  final Widget Function(BuildContext context, TargetPlatform platform) builder;
  final String title;
  final bool showBothPlatforms;

  const PlatformWidgetExample({
    Key? key,
    required this.builder,
    required this.title,
    this.showBothPlatforms = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TargetPlatform platform;
    if (isMaterial(context)) {
      platform = TargetPlatform.android;
    } else if (isCupertino(context)) {
      platform = TargetPlatform.iOS;
    } else if (Platform.isWindows) {
      platform = TargetPlatform.windows;
    } else if (Platform.isMacOS) {
      platform = TargetPlatform.macOS;
    } else if (Platform.isLinux) {
      platform = TargetPlatform.linux;
    } else if (Platform.isFuchsia) {
      platform = TargetPlatform.fuchsia;
    } else
      throw PlatformException(code: 'Unsupported platform');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(title),
        ),
        if (showBothPlatforms) _doublePlatformWidgets(),
        if (!showBothPlatforms)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: builder(
              context,
              platform,
            ),
          ),
        Divider(
          height: 16,
          thickness: 2,
        ),
      ],
    );
  }

  Widget _doublePlatformWidgets() {
    return IntrinsicHeight(
        child: Row(
      children: [
        ((context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: builder(context, TargetPlatform.android),
              ),
            )).asMaterial(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VerticalDivider(
            width: 1,
            thickness: 1,
          ),
        ),
        ((context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: builder(context, TargetPlatform.iOS),
              ),
            )).asCupertino(),
        ((context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: builder(context, TargetPlatform.windows),
              ),
            )).asWindows(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VerticalDivider(
            width: 1,
            thickness: 1,
          ),
        ),
        ((context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: builder(context, TargetPlatform.macOS),
              ),
            )).asMacos(),
        ((context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: builder(context, TargetPlatform.linux),
              ),
            )).asLinux(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VerticalDivider(
            width: 1,
            thickness: 1,
          ),
        ),
        ((context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: builder(context, TargetPlatform.fuchsia),
              ),
            )).asFuchsia(),
      ],
    ).maxWidth(500));
  }
}
