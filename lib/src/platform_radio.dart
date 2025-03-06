/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart'
    show RadioButton, RadioButtonThemeData;
import 'package:flutter/cupertino.dart' show CupertinoRadio;
import 'package:flutter/material.dart'
    show Radio, MaterialTapTargetSize, VisualDensity;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData<T> {
  _BaseData({
    this.widgetKey,
    this.value,
    this.groupValue,
    this.onChanged,
    this.toggleable,
    this.activeColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
    this.mouseCursor,
  });

  final Key? widgetKey;
  final T? value;
  final T? groupValue;
  final ValueChanged<dynamic>? onChanged;
  final bool? toggleable;
  final Color? activeColor;

  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final MouseCursor? mouseCursor;
}

class MaterialRadioData extends _BaseData {
  MaterialRadioData({
    //Material
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.fillColor,
    // Common
    super.widgetKey,
    super.value,
    super.groupValue,
    super.onChanged,
    super.toggleable,
    super.activeColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.mouseCursor,
  });

  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final WidgetStateProperty<Color?>? fillColor;
}

class CupertinoRadioData extends _BaseData {
  CupertinoRadioData({
    //Cupertino
    this.inactiveColor,
    this.fillColor,
    this.useCheckmarkStyle,
    //Common
    super.widgetKey,
    super.value,
    super.groupValue,
    super.onChanged,
    super.toggleable,
    super.activeColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.mouseCursor,
  });

  final Color? inactiveColor;
  final Color? fillColor;
  final bool? useCheckmarkStyle;
}

class FluentRadioData<T> extends _BaseData<T> {
  FluentRadioData({
    super.widgetKey,
    super.value,
    super.groupValue,
    super.onChanged,
    super.toggleable,
    super.activeColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    this.buttonThemeData,
  });

  final RadioButtonThemeData? buttonThemeData;
}

class PlatformRadio<T>
    extends
        PlatformWidgetBase<
          Radio,
          CupertinoRadio,
          RadioButton,
          CupertinoRadio,
          Radio,
          Radio,
          Radio
        > {
  final Key? widgetKey;
  final T? value;
  final T? groupValue;
  final ValueChanged<dynamic>? onChanged;
  final bool toggleable;
  final Color? activeColor;
  final Color? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final MouseCursor? mouseCursor;

  final PlatformBuilder<MaterialRadioData>? material;
  final PlatformBuilder<CupertinoRadioData>? cupertino;
  final PlatformBuilder<FluentRadioData>? windows;
  final PlatformBuilder<CupertinoRadioData>? macos;
  final PlatformBuilder<MaterialRadioData>? linux;
  final PlatformBuilder<MaterialRadioData>? fuchsia;
  final PlatformBuilder<MaterialRadioData>? web;

  const PlatformRadio({
    super.key,
    this.widgetKey,
    this.value,
    this.groupValue,
    this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.mouseCursor,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });

  @override
  Radio createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    return Radio(
      //Material
      hoverColor: data?.hoverColor,
      overlayColor: data?.overlayColor,
      splashRadius: data?.splashRadius,
      materialTapTargetSize: data?.materialTapTargetSize,
      visualDensity: data?.visualDensity,
      //Common
      mouseCursor: data?.mouseCursor ?? mouseCursor,
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      groupValue: data?.groupValue ?? groupValue,
      onChanged: data?.onChanged ?? onChanged,
      toggleable: data?.toggleable ?? toggleable,
      activeColor: data?.activeColor ?? activeColor,
      fillColor: data?.fillColor ?? WidgetStateProperty.all(fillColor),
      focusColor: data?.focusColor ?? focusColor,
      autofocus: data?.autofocus ?? autofocus,
      focusNode: data?.focusNode ?? focusNode,
    );
  }

  @override
  CupertinoRadio createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    return CupertinoRadio(
      //Cupertino
      inactiveColor: data?.inactiveColor,
      //Common
      key: data?.widgetKey ?? widgetKey,
      value: data?.value ?? value,
      groupValue: data?.groupValue ?? groupValue,
      onChanged: data?.onChanged ?? onChanged,
      toggleable: data?.toggleable ?? toggleable,
      activeColor: data?.activeColor ?? activeColor,
      fillColor: data?.fillColor ?? fillColor,
      focusColor: data?.focusColor ?? focusColor,
      autofocus: data?.autofocus ?? autofocus,
      focusNode: data?.focusNode ?? focusNode,
      useCheckmarkStyle: data?.useCheckmarkStyle ?? false,
      mouseCursor: data?.mouseCursor ?? mouseCursor,
    );
  }

  @override
  RadioButton createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));
    final ownValueInGroup = data?.value ?? value;
    final currentValueInGroup = data?.groupValue ?? groupValue;
    final onStateChange = data?.onChanged ?? onChanged;

    return RadioButton(
      key: data?.widgetKey ?? widgetKey,
      // Logic to bridge groupVal/val and the simpler widget implementation
      checked: currentValueInGroup == ownValueInGroup,
      content:
          T == String
              ? Text(ownValueInGroup.toString())
              : ownValueInGroup as Widget?,
      onChanged:
          onStateChange == null ? null : (_) => onStateChange(ownValueInGroup),
      autofocus: data?.autofocus ?? autofocus,
      focusNode: data?.focusNode ?? focusNode,
      style: data?.buttonThemeData,
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoRadio createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  Radio createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Radio createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Radio createWebWidget(BuildContext context) => createMaterialWidget(context);
}
