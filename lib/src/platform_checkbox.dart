/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart' show CupertinoCheckbox;
import 'package:flutter/material.dart'
    show Checkbox, MaterialTapTargetSize, VisualDensity;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

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
    this.mouseCursor,
    this.fillColor,
    this.semanticLabel,
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
  final MouseCursor? mouseCursor;
  final WidgetStateProperty<Color?>? fillColor;
  final String? semanticLabel;
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
    super.mouseCursor,
    super.fillColor,
    super.semanticLabel,

    //Material
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.isError = false,
  });

  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final bool isError;
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
    super.mouseCursor,
    super.fillColor,
    super.semanticLabel,
  });
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

class PlatformCheckbox
    extends
        PlatformWidgetBase<
          Checkbox,
          CupertinoCheckbox,
          _FluentCheckBox,
          CupertinoCheckbox,
          Checkbox,
          Checkbox,
          Checkbox
        > {
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
  final MouseCursor? mouseCursor;
  final WidgetStateProperty<Color?>? fillColor;
  final String? semanticLabel;

  //Platform
  final PlatformBuilder<MaterialCheckboxData>? material;
  final PlatformBuilder<CupertinoCheckboxData>? cupertino;
  final PlatformBuilder<FluentCheckboxData>? windows;
  final PlatformBuilder<CupertinoCheckboxData>? macos;
  final PlatformBuilder<MaterialCheckboxData>? linux;
  final PlatformBuilder<MaterialCheckboxData>? fuchsia;
  final PlatformBuilder<MaterialCheckboxData>? web;

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
    this.mouseCursor,
    this.fillColor,
    this.semanticLabel,
    //Platform
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });

  @override
  Checkbox createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    final value = data?.value ?? this.value;
    final tristate = data?.tristate ?? this.tristate;
    assert(tristate || value != null);
    return Checkbox(
      //Material
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
      mouseCursor: data?.mouseCursor ?? mouseCursor,
      fillColor: data?.fillColor ?? fillColor,
      semanticLabel: data?.semanticLabel ?? semanticLabel,
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
      // inactiveColor: Deprecated
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
      fillColor: data?.fillColor ?? fillColor,
      mouseCursor: data?.mouseCursor ?? mouseCursor,
      semanticLabel: data?.semanticLabel ?? semanticLabel,
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
