/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

class PlatformWidget extends PlatformWidgetBase<Widget, Widget, Widget, Widget,
    Widget, Widget, Widget> {
  const PlatformWidget({
    super.key,
    this.cupertino,
    this.material,
    this.macos,
    this.windows,
    this.linux,
    this.web,
    this.fuchsia,
  });
  final PlatformBuilder<Widget?>? material;
  final PlatformBuilder<Widget?>? cupertino;
  final PlatformBuilder<Widget?>? macos;
  final PlatformBuilder<Widget?>? windows;
  final PlatformBuilder<Widget?>? linux;
  final PlatformBuilder<Widget?>? web;
  final PlatformBuilder<Widget?>? fuchsia;

  @override
  Widget createMaterialWidget(BuildContext context) {
    return material?.call(context, platform(context)) ??
        const SizedBox.shrink();
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    return cupertino?.call(context, platform(context)) ??
        const SizedBox.shrink();
  }

  @override
  Widget createMacosWidget(BuildContext context) {
    return macos?.call(context, platform(context)) ?? const SizedBox.shrink();
  }

  @override
  Widget createWindowsWidget(BuildContext context) {
    return windows?.call(context, platform(context)) ?? const SizedBox.shrink();
  }

  @override
  Widget createLinuxWidget(BuildContext context) {
    return linux?.call(context, platform(context)) ?? const SizedBox.shrink();
  }

  @override
  Widget createWebWidget(BuildContext context) {
    return web?.call(context, platform(context)) ?? const SizedBox.shrink();
  }

  @override
  Widget createFuchsiaWidget(BuildContext context) {
    return fuchsia?.call(context, platform(context)) ?? const SizedBox.shrink();
  }
}
