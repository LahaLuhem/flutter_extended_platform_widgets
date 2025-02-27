/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart' show CupertinoCheckbox, CupertinoColors;
import 'package:flutter/material.dart'
    show Checkbox, MaterialTapTargetSize, VisualDensity, WidgetStateProperty;
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.value,
    this.tristate,
    this.onChanged,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
    this.shape,
    this.side,
  });

  final Key? widgetKey;
  final bool? value;
  final bool? tristate;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
}

class MaterialCheckboxData extends _BaseData {
  MaterialCheckboxData({
    // Common
    super.widgetKey,
    super.value,
    super.tristate,
    super.onChanged,
    super.activeColor,
    super.checkColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.shape,
    super.side,
    //Material
    this.mouseCursor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.isError = false,
    this.semanticLabel,
  });

  final MouseCursor? mouseCursor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final bool isError;
  final String? semanticLabel;
}

class CupertinoCheckboxData extends _BaseData {
  CupertinoCheckboxData({
    //Common
    super.widgetKey,
    super.value,
    super.tristate,
    super.onChanged,
    super.activeColor,
    super.checkColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.shape,
    super.side,

    //Cupertino
    this.fillColor,
  });

  final Color? fillColor;
}

class FluentCheckboxData extends _BaseData {
  FluentCheckboxData({
    // Common
    super.widgetKey,
    super.value,
    super.tristate,
    super.onChanged,
    super.activeColor,
    super.checkColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.shape,
    super.side,
    this.checkboxThemeData,
  });

  final fluent.CheckboxThemeData? checkboxThemeData;
}

//Todo(mehul): change themes here
class PlatformCheckbox extends PlatformWidgetBase<Checkbox, CupertinoCheckbox,
    _FluentCheckBox, CupertinoCheckbox, Checkbox, Checkbox, Checkbox> {
  const PlatformCheckbox({
    required this.onChanged,
    //Common
    super.key,
    this.widgetKey,
    this.value,
    this.tristate = false,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
    //Platform
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });

  //Common
  final Key? widgetKey;
  final bool? value;
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;

  //Platform
  final PlatformBuilder<MaterialCheckboxData>? material;
  final PlatformBuilder<CupertinoCheckboxData>? cupertino;
  final PlatformBuilder<FluentCheckboxData>? windows;
  final PlatformBuilder<CupertinoCheckboxData>? macos;
  final PlatformBuilder<MaterialCheckboxData>? linux;
  final PlatformBuilder<MaterialCheckboxData>? fuchsia;
  final PlatformBuilder<MaterialCheckboxData>? web;

  @override
  Checkbox createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    final value = data?.value ?? this.value;
    final tristate = data?.tristate ?? this.tristate;
    assert(tristate || value != null);
    return Checkbox(
      //Material
      mouseCursor: data?.mouseCursor,
      fillColor: data?.fillColor,
      hoverColor: data?.hoverColor,
      overlayColor: data?.overlayColor,
      splashRadius: data?.splashRadius,
      materialTapTargetSize: data?.materialTapTargetSize,
      visualDensity: data?.visualDensity,
      isError: data?.isError ?? false,
      //Common
      key: data?.widgetKey ?? widgetKey,
      value: value,
      tristate: tristate,
      onChanged: data?.onChanged ?? onChanged,
      activeColor: data?.activeColor ?? activeColor,
      checkColor: data?.checkColor ?? checkColor,
      focusColor: data?.focusColor ?? focusColor,
      focusNode: data?.focusNode ?? focusNode,
      autofocus: data?.autofocus ?? autofocus,
      shape: data?.shape ?? shape,
      side: data?.side ?? side,
      semanticLabel: data?.semanticLabel,
    );
  }

  @override
  CupertinoCheckbox createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    final value = data?.value ?? this.value;
    final tristate = data?.tristate ?? this.tristate;
    assert(tristate || value != null);
    return CupertinoCheckbox(
      //Cupertino
      //Common
      key: data?.widgetKey ?? widgetKey,
      value: value,
      tristate: tristate,
      onChanged: data?.onChanged ?? onChanged,
      activeColor: data?.activeColor ?? activeColor,
      fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled))
          return CupertinoColors.white.withValues(alpha: 0.5);
        if (states.contains(WidgetState.selected))
          return data?.activeColor ?? activeColor;
        return data?.fillColor;
      }),
      checkColor: data?.checkColor ?? checkColor,
      focusColor: data?.focusColor ?? focusColor,
      focusNode: data?.focusNode ?? focusNode,
      autofocus: data?.autofocus ?? autofocus,
      shape: data?.shape ?? shape,
      side: data?.side ?? side,
    );
  }

  @override
  _FluentCheckBox createWindowsWidget(BuildContext context) => _FluentCheckBox(
        data: windows?.call(context, platform(context)),
        value: value,
        onChanged: onChanged,
        focusNode: focusNode,
        autofocus: autofocus,
      );

  //Todo(mehul): change themes here
  @override
  CupertinoCheckbox createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  Checkbox createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Checkbox createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  Checkbox createWebWidget(BuildContext context) =>
      createMaterialWidget(context);
}

class _FluentCheckBox extends StatelessWidget {
  _FluentCheckBox({
    required this.data,
    required bool? value,
    required this.onChanged,
    required this.focusNode,
    required this.autofocus,
  }) : _isCheckedNotifier = ValueNotifier(data?.value ?? value);

  final FluentCheckboxData? data;
  final void Function(bool?)? onChanged;
  final FocusNode? focusNode;
  final bool? autofocus;

  final ValueNotifier<bool?> _isCheckedNotifier;

  @override
  Widget build(BuildContext context) {
    return fluent.Checkbox(
      key: data?.widgetKey ?? key,
      checked: _isCheckedNotifier.value,
      onChanged: (newValue) {
        _isCheckedNotifier.value = newValue;
        if (data?.onChanged != null) {
          data!.onChanged!(newValue);
        } else if (onChanged != null) {
          onChanged!(newValue);
        }
      },
      focusNode: data?.focusNode ?? focusNode,
      autofocus: data?.autofocus ?? autofocus ?? false,
      style: data?.checkboxThemeData,
    );
  }
}
