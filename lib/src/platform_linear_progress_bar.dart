/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:fluent_ui/fluent_ui.dart' show ProgressBar;
import 'package:flutter/material.dart' show LinearProgressIndicator;
import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.key,
    this.value,
    this.color,
  });

  final Key? key;
  final double? value;
  final Color? color;
}

class MaterialLinearProgressBarData extends _BaseData {
  MaterialLinearProgressBarData({
    super.key,
    super.color,
    this.backgroundColor,
    super.value,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
  });

  final Color? backgroundColor;
  final Animation<Color>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
}

class CupertinoLinearProgressBarData extends _BaseData {
  CupertinoLinearProgressBarData({
    super.key,
    super.value,
    super.color,
    this.animating,
    this.radius,
  });

  final bool? animating;
  final double? radius;
}

class FluentLinearProgressBarData extends _BaseData {
  FluentLinearProgressBarData({
    super.key,
    super.color,
    this.backgroundColor,
    this.strokeWidth,
    this.value,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
  });

  final Color? backgroundColor;
  final double? strokeWidth;
  @override
  final double? value;
  final Animation<Color>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
}

class PlatformLinearProgressBar extends PlatformWidgetBase<
    LinearProgressIndicator,
    CupertinoProgressBar,
    ProgressBar,
    CupertinoProgressBar,
    LinearProgressIndicator,
    LinearProgressIndicator,
    LinearProgressIndicator> {
  const PlatformLinearProgressBar({
    super.key,
    this.value,
    this.widgetKey,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });
  final Key? widgetKey;
  final double? value;

  final PlatformBuilder<MaterialLinearProgressBarData>? material;
  final PlatformBuilder<CupertinoLinearProgressBarData>? cupertino;
  final PlatformBuilder<FluentLinearProgressBarData>? windows;
  final PlatformBuilder<CupertinoLinearProgressBarData>? macos;
  final PlatformBuilder<MaterialLinearProgressBarData>? linux;
  final PlatformBuilder<MaterialLinearProgressBarData>? fuchsia;
  final PlatformBuilder<MaterialLinearProgressBarData>? web;

  @override
  LinearProgressIndicator createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return LinearProgressIndicator(
      key: data?.key ?? widgetKey,
      backgroundColor: data?.backgroundColor,
      value: data?.value,
      valueColor: data?.valueColor,
      semanticsLabel: data?.semanticsLabel,
      semanticsValue: data?.semanticsValue,
      color: data?.color,
    );
  }

  @override
  CupertinoProgressBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoProgressBar(
      key: data?.key ?? widgetKey,
      value: data?.value ?? value ?? 0,
      valueColor: data?.color,
    );
  }

  @override
  ProgressBar createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    return ProgressBar(
      key: data?.key ?? widgetKey,
      value: data?.value ?? value,
      activeColor: data?.color,
      semanticLabel: data?.semanticsLabel,
      strokeWidth: data?.strokeWidth ?? 4.5,
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoProgressBar createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  LinearProgressIndicator createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  LinearProgressIndicator createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  LinearProgressIndicator createWebWidget(BuildContext context) =>
      createMaterialWidget(context);
}
