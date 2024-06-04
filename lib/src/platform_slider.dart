/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart' show CupertinoColors, CupertinoSlider;
import 'package:flutter/material.dart'
    show SemanticFormatterCallback, Slider, SliderInteraction;
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.value,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.activeColor,
    this.divisions,
    this.min,
    this.max,
    this.thumbColor,
  });

  final Key? widgetKey;
  final double? value;
  final Color? activeColor;
  final void Function(double)? onChanged;
  final void Function(double)? onChangeStart;
  final void Function(double)? onChangeEnd;
  final int? divisions;
  final double? min;
  final double? max;
  final Color? thumbColor;
}

class MaterialSliderData extends _BaseData {
  MaterialSliderData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.onChangeStart,
    super.onChangeEnd,
    super.divisions,
    super.min,
    super.max,
    super.activeColor,
    super.thumbColor,
    this.inactiveColor,
    this.label,
    this.semanticFormatterCallback,
    this.focusNode,
    this.mouseCursor,
    this.autofocus,
    this.overlayColor,
    this.secondaryActiveColor,
    this.secondaryTrackValue,
    this.allowedInteraction,
    this.padding,
  });

  final Color? inactiveColor;
  final String? label;
  final SemanticFormatterCallback? semanticFormatterCallback;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final bool? autofocus;
  final WidgetStateProperty<Color?>? overlayColor;
  final Color? secondaryActiveColor;
  final double? secondaryTrackValue;
  final SliderInteraction? allowedInteraction;
  final EdgeInsetsGeometry? padding;
}

class CupertinoSliderData extends _BaseData {
  CupertinoSliderData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.onChangeStart,
    super.onChangeEnd,
    super.activeColor,
    super.divisions,
    super.min,
    super.max,
    super.thumbColor,
  });
}

class FluentSliderData extends _BaseData {
  FluentSliderData({
    super.widgetKey,
    super.value,
    super.onChanged,
    super.onChangeStart,
    super.onChangeEnd,
    super.divisions,
    super.min,
    super.max,
    super.activeColor,
    super.thumbColor,
    this.vertical,
    this.label,
    this.focusNode,
    this.mouseCursor,
    this.autofocus,
  });

  final bool? vertical;
  final String? label;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final bool? autofocus;
}

class PlatformSlider extends PlatformWidgetBase<Slider, CupertinoSlider,
    fluent.Slider, CupertinoSlider, Slider, Slider, Slider> {
  const PlatformSlider({
    required this.value,
    required this.onChanged,
    super.key,
    this.widgetKey,
    this.onChangeStart,
    this.onChangeEnd,
    this.activeColor,
    this.divisions,
    this.min = 0.0,
    this.max = 1.0,
    this.thumbColor,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  })  : assert(divisions == null || divisions > 0),
        assert(value >= min && value <= max);
  final Key? widgetKey;

  final double value;
  final Color? activeColor;
  final void Function(double)? onChanged;
  final void Function(double)? onChangeStart;
  final void Function(double)? onChangeEnd;
  final int? divisions;
  final double min;
  final double max;
  final Color? thumbColor;

  final PlatformBuilder<MaterialSliderData>? material;
  final PlatformBuilder<CupertinoSliderData>? cupertino;
  final PlatformBuilder<FluentSliderData>? windows;
  final PlatformBuilder<CupertinoSliderData>? macos;
  final PlatformBuilder<MaterialSliderData>? linux;
  final PlatformBuilder<MaterialSliderData>? fuchsia;
  final PlatformBuilder<MaterialSliderData>? web;

  @override
  Slider createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return Slider(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      onChangeStart: data?.onChangeStart ?? onChangeStart,
      onChangeEnd: data?.onChangeEnd ?? onChangeEnd,
      activeColor: data?.activeColor ?? activeColor,
      divisions: data?.divisions ?? divisions,
      max: data?.max ?? max,
      min: data?.min ?? min,
      inactiveColor: data?.inactiveColor,
      label: data?.label,
      semanticFormatterCallback: data?.semanticFormatterCallback,
      focusNode: data?.focusNode,
      mouseCursor: data?.mouseCursor,
      autofocus: data?.autofocus ?? false,
      thumbColor: data?.thumbColor ?? thumbColor,
      overlayColor: data?.overlayColor,
      secondaryActiveColor: data?.secondaryActiveColor,
      secondaryTrackValue: data?.secondaryTrackValue,
      allowedInteraction: data?.allowedInteraction,
      padding: data?.padding,
      //year2023: Deprecated
    );
  }

  @override
  CupertinoSlider createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoSlider(
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      onChangeStart: data?.onChangeStart ?? onChangeStart,
      onChangeEnd: data?.onChangeEnd ?? onChangeEnd,
      activeColor: data?.activeColor ?? activeColor,
      divisions: data?.divisions ?? divisions,
      max: data?.max ?? max,
      min: data?.min ?? min,
      thumbColor: data?.thumbColor ?? thumbColor ?? CupertinoColors.white,
    );
  }

  @override
  fluent.Slider createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    return fluent.Slider(
      key: data?.widgetKey ?? widgetKey,
      vertical: data?.vertical ?? false,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      onChangeStart: data?.onChangeStart ?? onChangeStart,
      onChangeEnd: data?.onChangeEnd ?? onChangeEnd,
      divisions: data?.divisions ?? divisions,
      max: data?.max ?? max,
      min: data?.min ?? min,
      label: data?.label,
      focusNode: data?.focusNode,
      mouseCursor: data?.mouseCursor ?? MouseCursor.defer,
      autofocus: data?.autofocus ?? false,
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoSlider createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  Slider createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Slider createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Slider createWebWidget(BuildContext context) => createMaterialWidget(context);
}
