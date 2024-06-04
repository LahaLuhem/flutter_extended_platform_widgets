import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart'
    show CupertinoDatePicker, CupertinoDatePickerMode, DatePickerDateOrder;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show
        DatePickerEntryMode,
        DatePickerMode,
        SelectableDayPredicate,
        Theme,
        showDatePicker;
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/platform_text_button.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

// Values derived from https://developer.apple.com/design/resources/ and on iOS
// simulators with "Debug View Hierarchy".
const double _kItemExtent = 32.0;

class DatePickerContentData {
  DatePickerContentData({
    required this.selectedDate,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime selectedDate;
}

typedef DatePickerContentBuilder = Widget Function(
  DatePickerContentData data,
  CupertinoDatePickerData? cupertinoData,
);

abstract class _BaseData {
  _BaseData({
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
}

class MaterialDatePickerData extends _BaseData {
  MaterialDatePickerData({
    super.initialDate,
    super.firstDate,
    super.lastDate,
    this.currentDate,
    this.initialEntryMode,
    this.selectableDayPredicate,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.locale,
    this.useRootNavigator,
    this.routeSettings,
    this.textDirection,
    this.builder,
    this.initialDatePickerMode,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.anchorPoint,
    this.keyboardType,
    this.onDatePickerModeChange,
    this.switchToCalendarEntryModeIcon,
    this.switchToInputEntryModeIcon,
    this.barrierColor,
    this.barrierDismissible,
    this.barrierLabel,
  });

  final DateTime? currentDate;
  final DatePickerEntryMode? initialEntryMode;
  final SelectableDayPredicate? selectableDayPredicate;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final Locale? locale;
  final bool? useRootNavigator;
  final RouteSettings? routeSettings;
  final TextDirection? textDirection;
  final TransitionBuilder? builder;
  final DatePickerMode? initialDatePickerMode;
  final String? errorFormatText;
  final String? errorInvalidText;
  final String? fieldHintText;
  final String? fieldLabelText;
  final Offset? anchorPoint;
  final TextInputType? keyboardType;
  final ValueChanged<DatePickerEntryMode>? onDatePickerModeChange;
  final Icon? switchToCalendarEntryModeIcon;
  final Icon? switchToInputEntryModeIcon;
  final Color? barrierColor;
  final bool? barrierDismissible;
  final String? barrierLabel;
}

class CupertinoDatePickerData extends _BaseData {
  CupertinoDatePickerData({
    super.initialDate,
    super.firstDate,
    super.lastDate,
    this.key,
    this.mode,
    this.onDateTimeChanged,
    this.minimumYear = 1,
    this.maximumYear,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.dateOrder,
    this.backgroundColor,
    this.doneLabel,
    this.cancelLabel,
    this.showDayOfWeek,
    this.itemExtent,
  });

  final Key? key;
  final CupertinoDatePickerMode? mode;
  final int? minimumYear;
  final int? maximumYear;
  final int? minuteInterval;
  final bool? use24hFormat;
  final DatePickerDateOrder? dateOrder;
  final ValueChanged<DateTime>? onDateTimeChanged;
  final Color? backgroundColor;
  final String? doneLabel;
  final String? cancelLabel;
  final bool? showDayOfWeek;
  final double? itemExtent;
}

class FluentDatePickerData extends _BaseData {
  FluentDatePickerData({
    this.key,
    super.initialDate,
    super.firstDate,
    super.lastDate,
    this.onDateTimeChanged,
    this.minimumYear = 1,
    this.maximumYear,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.dateOrder,
    this.backgroundColor,
    this.doneLabel,
    this.cancelLabel,
    this.showDayOfWeek,
  });

  final Key? key;
  final int? minimumYear;
  final int? maximumYear;
  final int? minuteInterval;
  final bool? use24hFormat;
  final DatePickerDateOrder? dateOrder;
  final ValueChanged<DateTime>? onDateTimeChanged;
  final Color? backgroundColor;
  final String? doneLabel;
  final String? cancelLabel;
  final bool? showDayOfWeek;
}

Future<DateTime?> showPlatformDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  PlatformBuilder<MaterialDatePickerData>? material,
  PlatformBuilder<CupertinoDatePickerData>? cupertino,
  PlatformBuilder<CupertinoDatePickerData>? macos,
  PlatformBuilder<MaterialDatePickerData>? linux,
  PlatformBuilder<MaterialDatePickerData>? fuchsia,
  PlatformBuilder<MaterialDatePickerData>? web,
  DatePickerContentBuilder? cupertinoContentBuilder,
}) async {
  if (isMaterial(context)) {
    final data = material?.call(context, platform(context));
    return await showDatePicker(
      context: context,
      initialDate: data?.initialDate ?? initialDate,
      firstDate: data?.firstDate ?? firstDate,
      lastDate: data?.lastDate ?? lastDate,
      builder: data?.builder,
      confirmText: data?.confirmText,
      currentDate: data?.currentDate,
      errorFormatText: data?.errorFormatText,
      errorInvalidText: data?.errorInvalidText,
      fieldHintText: data?.fieldHintText,
      fieldLabelText: data?.fieldLabelText,
      helpText: data?.helpText,
      initialDatePickerMode: data?.initialDatePickerMode ?? DatePickerMode.day,
      initialEntryMode: data?.initialEntryMode ?? DatePickerEntryMode.calendar,
      locale: data?.locale,
      routeSettings: data?.routeSettings,
      selectableDayPredicate: data?.selectableDayPredicate,
      textDirection: data?.textDirection,
      useRootNavigator: data?.useRootNavigator ?? true,
      cancelText: data?.cancelText,
      anchorPoint: data?.anchorPoint,
      keyboardType: data?.keyboardType,
      onDatePickerModeChange: data?.onDatePickerModeChange,
      switchToCalendarEntryModeIcon: data?.switchToCalendarEntryModeIcon,
      switchToInputEntryModeIcon: data?.switchToInputEntryModeIcon,
      barrierColor: data?.barrierColor,
      barrierDismissible: data?.barrierDismissible ?? true,
      barrierLabel: data?.barrierLabel,
    );
  } else if (isCupertino(context)) {
    final data = cupertino?.call(context, platform(context));

    final contentData = DatePickerContentData(
      initialDate: data?.initialDate ?? initialDate,
      firstDate: data?.firstDate ?? firstDate,
      lastDate: data?.lastDate ?? lastDate,
      selectedDate: data?.initialDate ?? initialDate,
    );
    return await _showDateModalBottomSheet<DateTime?>(
      context,
      cupertinoContentBuilder?.call(
            contentData,
            data,
          ) ??
          _renderManagedCupertinoDatePicker(
            data: data,
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
          ),
    );
  } else if (isMacos(context)) {
    final data = macos?.call(context, platform(context));

    final contentData = DatePickerContentData(
      initialDate: data?.initialDate ?? initialDate,
      firstDate: data?.firstDate ?? firstDate,
      lastDate: data?.lastDate ?? lastDate,
      selectedDate: data?.initialDate ?? initialDate,
    );
    return await _showDateModalBottomSheet<DateTime?>(
      context,
      cupertinoContentBuilder?.call(
            contentData,
            data,
          ) ??
          _renderManagedCupertinoDatePicker(
            data: data,
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
          ),
    );
  } else if (isLinux(context)) {
    final data = linux?.call(context, platform(context));
    return await showDatePicker(
      context: context,
      initialDate: data?.initialDate ?? initialDate,
      firstDate: data?.firstDate ?? firstDate,
      lastDate: data?.lastDate ?? lastDate,
      builder: data?.builder,
      confirmText: data?.confirmText,
      currentDate: data?.currentDate,
      errorFormatText: data?.errorFormatText,
      errorInvalidText: data?.errorInvalidText,
      fieldHintText: data?.fieldHintText,
      fieldLabelText: data?.fieldLabelText,
      helpText: data?.helpText,
      initialDatePickerMode: data?.initialDatePickerMode ?? DatePickerMode.day,
      initialEntryMode: data?.initialEntryMode ?? DatePickerEntryMode.calendar,
      locale: data?.locale,
      routeSettings: data?.routeSettings,
      selectableDayPredicate: data?.selectableDayPredicate,
      textDirection: data?.textDirection,
      useRootNavigator: data?.useRootNavigator ?? true,
      cancelText: data?.cancelText,
      anchorPoint: data?.anchorPoint,
      keyboardType: data?.keyboardType,
      onDatePickerModeChange: data?.onDatePickerModeChange,
    );
  } else if (isFuchsia(context)) {
    final data = fuchsia?.call(context, platform(context));
    return await showDatePicker(
      context: context,
      initialDate: data?.initialDate ?? initialDate,
      firstDate: data?.firstDate ?? firstDate,
      lastDate: data?.lastDate ?? lastDate,
      builder: data?.builder,
      confirmText: data?.confirmText,
      currentDate: data?.currentDate,
      errorFormatText: data?.errorFormatText,
      errorInvalidText: data?.errorInvalidText,
      fieldHintText: data?.fieldHintText,
      fieldLabelText: data?.fieldLabelText,
      helpText: data?.helpText,
      initialDatePickerMode: data?.initialDatePickerMode ?? DatePickerMode.day,
      initialEntryMode: data?.initialEntryMode ?? DatePickerEntryMode.calendar,
      locale: data?.locale,
      routeSettings: data?.routeSettings,
      selectableDayPredicate: data?.selectableDayPredicate,
      textDirection: data?.textDirection,
      useRootNavigator: data?.useRootNavigator ?? true,
      cancelText: data?.cancelText,
      anchorPoint: data?.anchorPoint,
      keyboardType: data?.keyboardType,
      onDatePickerModeChange: data?.onDatePickerModeChange,
    );
  } else if (isWeb(context)) {
    final data = web?.call(context, platform(context));
    return await showDatePicker(
      context: context,
      initialDate: data?.initialDate ?? initialDate,
      firstDate: data?.firstDate ?? firstDate,
      lastDate: data?.lastDate ?? lastDate,
      builder: data?.builder,
      confirmText: data?.confirmText,
      currentDate: data?.currentDate,
      errorFormatText: data?.errorFormatText,
      errorInvalidText: data?.errorInvalidText,
      fieldHintText: data?.fieldHintText,
      fieldLabelText: data?.fieldLabelText,
      helpText: data?.helpText,
      initialDatePickerMode: data?.initialDatePickerMode ?? DatePickerMode.day,
      initialEntryMode: data?.initialEntryMode ?? DatePickerEntryMode.calendar,
      locale: data?.locale,
      routeSettings: data?.routeSettings,
      selectableDayPredicate: data?.selectableDayPredicate,
      textDirection: data?.textDirection,
      useRootNavigator: data?.useRootNavigator ?? true,
      cancelText: data?.cancelText,
      anchorPoint: data?.anchorPoint,
      keyboardType: data?.keyboardType,
      onDatePickerModeChange: data?.onDatePickerModeChange,
    );
  } else {
    return throw UnsupportedError(
      'This platform is not supported: $defaultTargetPlatform',
    );
  }
}

Widget _renderManagedCupertinoDatePicker({
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  CupertinoDatePickerData? data,
}) {
  var selectedDate = data?.initialDate ?? initialDate;

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      final contentData = DatePickerContentData(
        initialDate: data?.initialDate ?? initialDate,
        firstDate: data?.firstDate ?? firstDate,
        lastDate: data?.lastDate ?? lastDate,
        selectedDate: selectedDate,
      );
      return DefaultCupertinoDatePicker(
        contentData: contentData,
        data: data,
        modalColor: data?.backgroundColor,
        onDateTimeChanged: (newDate) => setState(() => selectedDate = newDate),
      );
    },
  );
}

class DefaultCupertinoDatePicker extends StatelessWidget {
  const DefaultCupertinoDatePicker({
    required this.contentData,
    required this.onDateTimeChanged,
    this.data,
    this.modalColor,
    this.modalHeight = 300,
    this.mode = CupertinoDatePickerMode.date,
    this.doneLabel,
    this.cancelLabel,
    super.key,
  });
  final double modalHeight;
  final Color? modalColor;
  final CupertinoDatePickerMode mode;
  final DatePickerContentData contentData;
  final ValueChanged<DateTime> onDateTimeChanged;
  final CupertinoDatePickerData? data;
  final String? doneLabel;
  final String? cancelLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: modalHeight,
      color: modalColor ?? Theme.of(context).canvasColor,
      child: Stack(
        children: [
          CupertinoDatePicker(
            key: data?.key,
            mode: data?.mode ?? mode,
            onDateTimeChanged: (value) {
              data?.onDateTimeChanged?.call(value);
              onDateTimeChanged.call(value);
            },
            initialDateTime: contentData.initialDate,
            minimumDate: contentData.firstDate,
            maximumDate: contentData.lastDate,
            backgroundColor: data?.backgroundColor,
            dateOrder: data?.dateOrder,
            maximumYear: data?.maximumYear,
            minimumYear: data?.minimumYear ?? 1,
            minuteInterval: data?.minuteInterval ?? 1,
            use24hFormat: data?.use24hFormat ?? false,
            showDayOfWeek: data?.showDayOfWeek ?? false,
            itemExtent: data?.itemExtent ?? _kItemExtent,
          ),
          Row(
            children: [
              PlatformTextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(data?.cancelLabel ?? cancelLabel ?? 'Cancel'),
              ),
              const Spacer(),
              PlatformTextButton(
                onPressed: () {
                  Navigator.pop(context, contentData.selectedDate);
                },
                child: Text(data?.doneLabel ?? doneLabel ?? 'Done'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FluentDatePicker extends StatefulWidget {
  const FluentDatePicker({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.data,
    super.key,
  });

  final FluentDatePickerData? data;
  final DateTime initialDate, firstDate, lastDate;

  @override
  State<FluentDatePicker> createState() => _FluentDatePickerState();
}

class _FluentDatePickerState extends State<FluentDatePicker> {
  _FluentDatePickerState({DateTime? selectedDate})
      : selectedDate = selectedDate ?? DateTime.now();
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    // widget.data?.;
    return fluent.DatePicker(
      key: widget.data?.key,
      selected: selectedDate,
      startDate: widget.data?.firstDate ?? widget.firstDate,
      endDate: widget.data?.lastDate ?? widget.lastDate,
      onChanged: (newDate) {
        if (widget.data?.onDateTimeChanged != null) {
          widget.data?.onDateTimeChanged!(newDate);
        }
        setState(() => selectedDate = newDate);
      },
    );
  }
}

Future<T?> _showDateModalBottomSheet<T>(
  BuildContext context,
  Widget content,
) async {
  return await showPlatformModalSheet<T>(
    context: context,
    builder: (builder) => content,
  );
}
