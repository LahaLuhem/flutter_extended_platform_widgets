/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/src/platform.dart';

typedef PlatformBuilder<T> = T Function(
  BuildContext context,
  PlatformTarget platform,
);
typedef PlatformIndexBuilder<T> = T Function(
  BuildContext context,
  PlatformTarget platform,
  int index,
);

abstract class PlatformWidgetBase<
    A extends Widget,
    B extends Widget,
    C extends Widget,
    D extends Widget,
    E extends Widget,
    F extends Widget,
    G extends Widget> extends StatelessWidget {
  const PlatformWidgetBase({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMaterial(context)) {
      return createMaterialWidget(context);
    } else if (isCupertino(context)) {
      return createCupertinoWidget(context);
    } else if (isWindows(context)) {
      return createWindowsWidget(context);
    } else if (isMacos(context)) {
      return createMacosWidget(context);
    } else if (isLinux(context)) {
      return createLinuxWidget(context);
    } else if (isFuchsia(context)) {
      return createFuchsiaWidget(context);
    } else if (isWeb(context)) {
      return createWebWidget(context);
    }

    return throw UnsupportedError(
      'This platform is not supported: $defaultTargetPlatform',
    );
  }

  A createMaterialWidget(BuildContext context);

  B createCupertinoWidget(BuildContext context);

  C createWindowsWidget(BuildContext context);

  D createMacosWidget(BuildContext context);

  E createLinuxWidget(BuildContext context);

  F createFuchsiaWidget(BuildContext context);

  G createWebWidget(BuildContext context);
}
