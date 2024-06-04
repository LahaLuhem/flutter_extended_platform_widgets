import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/platform_widget.dart';

/// Provides a builder for either the Material or Cupertino platforms
/// which take a child for common use
///
/// ```dart
/// PlatformWidgetBuilder(;
///   cupertino: (context, child, target) => GestureDetector(child: child, onTap: _handleTap),
///   material: (context, child, target) => InkWell(child: child, onTap: _handleTap),
///   child: Container(child: Text('Common text')),
/// );
///
/// ```
class PlatformWidgetBuilder extends StatelessWidget {
  const PlatformWidgetBuilder({
    super.key,
    this.cupertino,
    this.material,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
    this.child,
  });
  final Widget? child;
  final Widget? Function(BuildContext, Widget?, PlatformTarget)? cupertino;
  final Widget? Function(BuildContext, Widget?, PlatformTarget)? material;
  final Widget? Function(BuildContext, Widget?, PlatformTarget)? windows;
  final Widget? Function(BuildContext, Widget?, PlatformTarget)? macos;
  final Widget? Function(BuildContext, Widget?, PlatformTarget)? linux;
  final Widget? Function(BuildContext, Widget?, PlatformTarget)? fuchsia;
  final Widget? Function(BuildContext, Widget?, PlatformTarget)? web;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, target) => material?.call(context, child, target),
      cupertino: (context, target) => cupertino?.call(context, child, target),
      windows: (context, target) => windows?.call(context, child, target),
      macos: (context, target) => macos?.call(context, child, target),
      linux: (context, target) => linux?.call(context, child, target),
      fuchsia: (context, target) => fuchsia?.call(context, child, target),
      web: (context, target) => web?.call(context, child, target),
    );
  }
}
