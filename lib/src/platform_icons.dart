import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart' show FluentIcons;
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as microsoft;
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart' show Icons;
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter/widgets.dart';
import 'package:flutter_extended_platform_widgets/src/platform.dart';

extension PlatformIconsExt on BuildContext {
  /// Render either a Material or Cupertino icon based on the platform
  PlatformIcons get platformIcons => PlatformIcons(this);

  IconData platformIcon({
    required IconData material,
    required IconData cupertino,
    IconData? macos,
    IconData? windows,
    IconData? linux,
    IconData? fuchsia,
    IconData? web,
  }) =>
      isCupertino(this) || isMacos(this) ? cupertino : material;
}

class PlatformIcons {
  PlatformIcons(this.context);

  final BuildContext context;

  /// Icons: Icons.account_circle : CupertinoIcons.person_crop_circle
  IconData get accountCircle => const _PlatformIconDelegate(
        Icons.account_circle_outlined,
        CupertinoIcons.person_crop_circle,
        FluentIcons.account_management,
      ).nativeIcon(context);

  /// Icons: Icons.account_circle : CupertinoIcons.person_crop_circle_fill
  IconData get accountCircleSolid => const _PlatformIconDelegate(
        Icons.account_circle,
        CupertinoIcons.person_crop_circle_fill,
        FluentIcons.account_management,
      ).nativeIcon(context);

  /// Icons: Icons.add : CupertinoIcons.add
  IconData get add => const _PlatformIconDelegate(
        Icons.add,
        CupertinoIcons.add,
        FluentIcons.add,
      ).nativeIcon(context);

  /// Icons: Icons.add_circle_outline : CupertinoIcons.add_circled
  IconData get addCircledOutline => const _PlatformIconDelegate(
        Icons.add_circle_outline,
        CupertinoIcons.add_circled,
        FluentIcons.circle_addition,
      ).nativeIcon(context);

  /// Icons: Icons.add_circle : CupertinoIcons.add_circled_solid
  IconData get addCircledSolid => const _PlatformIconDelegate(
        Icons.add_circle,
        CupertinoIcons.add_circled_solid,
        FluentIcons.circle_addition_solid,
      ).nativeIcon(context);

  /// Icons: Icons.arrow_back : CupertinoIcons.back
  IconData get back => const _PlatformIconDelegate(
        Icons.arrow_back,
        CupertinoIcons.back,
        FluentIcons.back,
      ).nativeIcon(context);

  /// Icons: Icons.battery_charging_full : CupertinoIcons.battery_charging
  IconData get batteryCharging => const _PlatformIconDelegate(
        Icons.battery_charging_full,
        CupertinoIcons.battery_charging,
        FluentIcons.a_t_p_logo,
      ).nativeIcon(context);

  /// Icons: Icons.battery_alert : CupertinoIcons.battery_empty
  IconData get batteryEmpty => const _PlatformIconDelegate(
        Icons.battery_alert,
        CupertinoIcons.battery_empty,
        FluentIcons.a_t_p_logo,
      ).nativeIcon(context);

  /// Icons: Icons.battery_full : CupertinoIcons.battery_full
  IconData get batteryFull => const _PlatformIconDelegate(
        Icons.battery_full,
        CupertinoIcons.battery_full,
        FluentIcons.a_t_p_logo,
      ).nativeIcon(context);

  /// Icons: Icons.bluetooth : CupertinoIcons.bluetooth
  IconData get bluetooth => const _PlatformIconDelegate(
        Icons.bluetooth,
        CupertinoIcons.bluetooth,
        microsoft.FluentIcons.bluetooth_24_regular,
      ).nativeIcon(context);

  /// Icons: Icons.book : CupertinoIcons.book
  IconData get book => const _PlatformIconDelegate(
        Icons.book,
        CupertinoIcons.book,
        FluentIcons.library,
      ).nativeIcon(context);

  // IconData get bookSolid =>
  //     const _PlatformIconDelegate(Icons.book, CupertinoIcons.book_solid, FluentIcons.).nativeIcon(context);

  /// Icons: Icons.bookmark_border : CupertinoIcons.bookmark
  IconData get bookmark => const _PlatformIconDelegate(
        Icons.bookmark_outline,
        CupertinoIcons.bookmark,
        FluentIcons.single_bookmark,
      ).nativeIcon(context);

  /// Icons: Icons.bookmark : CupertinoIcons.bookmark_solid
  IconData get bookmarkSolid => const _PlatformIconDelegate(
        Icons.bookmark,
        CupertinoIcons.bookmark_solid,
        FluentIcons.single_bookmark_solid,
      ).nativeIcon(context);

  /// Icons: Icons.brightness_low : CupertinoIcons.brightness
  IconData get brightnessLow => const _PlatformIconDelegate(
        Icons.brightness_low,
        CupertinoIcons.brightness,
        FluentIcons.lower_brightness,
      ).nativeIcon(context);

  /// Icons: Icons.brightness_high : CupertinoIcons.brightness_solid
  IconData get brightnessHigh => const _PlatformIconDelegate(
        Icons.brightness_high,
        CupertinoIcons.brightness_solid,
        FluentIcons.brightness,
      ).nativeIcon(context);

  /// Icons: Icons.directions_bus : CupertinoIcons.bus
  IconData get bus => const _PlatformIconDelegate(
        Icons.directions_bus,
        CupertinoIcons.bus,
        FluentIcons.bus_solid,
      ).nativeIcon(context);

  /// Icons: Icons.directions_car : CupertinoIcons.car
  IconData get car => const _PlatformIconDelegate(
        Icons.directions_car,
        CupertinoIcons.car,
        FluentIcons.car,
      ).nativeIcon(context);

  /// Icons: Icons.check_box_outline_blank_rounded : CupertinoIcons.square
  IconData get checkBoxBlankOutlineRounded => const _PlatformIconDelegate(
        Icons.check_box_outline_blank_rounded,
        CupertinoIcons.square,
        FluentIcons.square_shape,
      ).nativeIcon(context);

  /// Icons: Icons.indeterminate_check_box_outlined : CupertinoIcons.minus_square
  IconData get checkBoxIndeterminateOutlineRounded =>
      const _PlatformIconDelegate(
        Icons.indeterminate_check_box_outlined,
        CupertinoIcons.minus_square,
        FluentIcons.checkbox_indeterminate,
      ).nativeIcon(context);

  /// Icons: Icons.indeterminate_check_box_outlined : CupertinoIcons.checkmark_square
  IconData get checkBoxCheckedOutlineRounded => const _PlatformIconDelegate(
        Icons.check_box_outlined,
        CupertinoIcons.checkmark_square,
        FluentIcons.checkbox_composite,
      ).nativeIcon(context);

  /// Icons: Icons.check : CupertinoIcons.check_mark
  IconData get checkMark => const _PlatformIconDelegate(
        Icons.check,
        CupertinoIcons.check_mark,
        FluentIcons.check_mark,
      ).nativeIcon(context);

  /// Icons: Icons.check_circle : CupertinoIcons.check_mark_circled
  IconData get checkMarkCircled => const _PlatformIconDelegate(
        Icons.check_circle,
        CupertinoIcons.check_mark_circled,
        FluentIcons.checkbox_composite,
      ).nativeIcon(context);

  /// Icons: Icons.check_circle_outline : CupertinoIcons.check_mark_circled
  IconData get checkMarkCircledOutline => const _PlatformIconDelegate(
        Icons.check_circle_outline,
        CupertinoIcons.check_mark_circled,
        FluentIcons.checkbox_composite,
      ).nativeIcon(context);

  /// Icons: Icons.check_circle : CupertinoIcons.check_mark_circled_solid
  IconData get checkMarkCircledSolid => const _PlatformIconDelegate(
        Icons.check_circle,
        CupertinoIcons.check_mark_circled_solid,
        FluentIcons.checkbox_composite_reversed,
      ).nativeIcon(context);

  /// Icons: Icons.clear : CupertinoIcons.clear
  IconData get clear => const _PlatformIconDelegate(
        Icons.clear,
        CupertinoIcons.clear,
        FluentIcons.clear,
      ).nativeIcon(context);

  /// Icons: Icons.collections : CupertinoIcons.collections
  IconData get clearCircled => const _PlatformIconDelegate(
        Icons.cancel,
        CupertinoIcons.clear_thick_circled,
        FluentIcons.box_multiply_solid,
      ).nativeIcon(context);

  /// Icons: Icons.cloud_outlined : CupertinoIcons.cloud
  IconData get cloud => const _PlatformIconDelegate(
        Icons.cloud_outlined,
        CupertinoIcons.cloud,
        FluentIcons.cloud,
      ).nativeIcon(context);

  /// Icons: Icons.cloud : CupertinoIcons.cloud_fill
  IconData get cloudSolid => const _PlatformIconDelegate(
        Icons.cloud,
        CupertinoIcons.cloud_fill,
        FluentIcons.cloud,
      ).nativeIcon(context);

  /// Icons: Icons.cloud_download_outlined : CupertinoIcons.cloud_download
  IconData get cloudDownload => const _PlatformIconDelegate(
        Icons.cloud_download_outlined,
        CupertinoIcons.cloud_download,
        FluentIcons.cloud_download,
      ).nativeIcon(context);

  /// Icons: Icons.cloud_download : CupertinoIcons.cloud_download_fill
  IconData get cloudDownloadSolid => const _PlatformIconDelegate(
        Icons.cloud_download,
        CupertinoIcons.cloud_download_fill,
        FluentIcons.cloud_download,
      ).nativeIcon(context);

  /// Icons: Icons.cloud_upload_outlined : CupertinoIcons.cloud_upload
  IconData get cloudUpload => const _PlatformIconDelegate(
        Icons.cloud_upload_outlined,
        CupertinoIcons.cloud_upload,
        FluentIcons.cloud_upload,
      ).nativeIcon(context);

  /// Icons: Icons.cloud_upload : CupertinoIcons.cloud_upload_fill
  IconData get cloudUploadSolid => const _PlatformIconDelegate(
        Icons.cloud_upload,
        CupertinoIcons.cloud_upload_fill,
        FluentIcons.cloud_upload,
      ).nativeIcon(context);

  /// Icons: Icons.collections : CupertinoIcons.collections
  IconData get collectionsOutlined => const _PlatformIconDelegate(
        Icons.featured_play_list_outlined,
        CupertinoIcons.collections,
        FluentIcons.project_collection,
      ).nativeIcon(context);

  /// Icons: Icons.collections : CupertinoIcons.collections_solid
  IconData get collectionsSolid => const _PlatformIconDelegate(
        Icons.featured_play_list_outlined,
        CupertinoIcons.collections_solid,
        FluentIcons.project_collection,
      ).nativeIcon(context);

  /// Icons: Icons.chat_bubble_outline : CupertinoIcons.conversation_bubble
  IconData get conversationBubbleOutline => const _PlatformIconDelegate(
        Icons.chat_bubble_outline,
        CupertinoIcons.conversation_bubble,
        FluentIcons.chat,
      ).nativeIcon(context);

  /// Icons: Icons.create : CupertinoIcons.create
  IconData get create => const _PlatformIconDelegate(
        Icons.create,
        CupertinoIcons.create,
        FluentIcons.edit_create,
      ).nativeIcon(context);

  /// Icons: Icons.dehaze : CupertinoIcons.bars
  IconData get dehaze => const _PlatformIconDelegate(
        Icons.dehaze,
        CupertinoIcons.bars,
        FluentIcons.gripper_bar_horizontal,
      ).nativeIcon(context);

  /// Icons: Icons.delete : CupertinoIcons.delete
  IconData get delete => const _PlatformIconDelegate(
        Icons.delete,
        CupertinoIcons.delete,
        FluentIcons.delete,
      ).nativeIcon(context);

  /// Icons: Icons.delete : CupertinoIcons.delete_solid
  IconData get deleteSolid => const _PlatformIconDelegate(
        Icons.delete,
        CupertinoIcons.delete_solid,
        FluentIcons.delete,
      ).nativeIcon(context);

  /// Icons: Icons.delete_outline : CupertinoIcons.delete
  IconData get deleteOutline => const _PlatformIconDelegate(
        Icons.delete_outline,
        CupertinoIcons.delete,
        FluentIcons.delete,
      ).nativeIcon(context);

  /// Icons: Icons.arrow_downward : CupertinoIcons.down_arrow
  IconData get downArrow => const _PlatformIconDelegate(
        Icons.arrow_downward,
        CupertinoIcons.down_arrow,
        FluentIcons.down,
      ).nativeIcon(context);

  /// Icons: Icons.more_horiz : CupertinoIcons.ellipsis
  IconData get edit => const _PlatformIconDelegate(
        Icons.edit,
        CupertinoIcons.pencil,
        FluentIcons.edit,
      ).nativeIcon(context);

  /// Icons: Icons.more_horiz : CupertinoIcons.ellipsis
  IconData get ellipsis => const _PlatformIconDelegate(
        Icons.more_horiz,
        CupertinoIcons.ellipsis,
        FluentIcons.charticulator_line_style_dotted,
      ).nativeIcon(context);

  /// Icons: Icons.error : CupertinoIcons.exclamationmark_circle_fill
  IconData get error => const _PlatformIconDelegate(
        Icons.error,
        CupertinoIcons.exclamationmark_circle_fill,
        FluentIcons.status_circle_exclamation,
      ).nativeIcon(context);

  IconData get eye => const _PlatformIconDelegate(
        Icons.remove_red_eye_outlined,
        CupertinoIcons.eye,
        FluentIcons.red_eye,
      ).nativeIcon(context);

  /// Icons: Icons.visibility_off : CupertinoIcons.eye_slash
  IconData get eyeSlash => const _PlatformIconDelegate(
        Icons.visibility_off_outlined,
        CupertinoIcons.eye_slash,
        FluentIcons.hide3,
      ).nativeIcon(context);

  /// Icons: Icons.visibility_off : CupertinoIcons.eye_slash
  IconData get eyeSlashSolid => const _PlatformIconDelegate(
        Icons.visibility_off,
        CupertinoIcons.eye_slash_fill,
        FluentIcons.hide3,
      ).nativeIcon(context);

  /// Icons: Icons.visibility : CupertinoIcons.eye_solid
  IconData get eyeSolid => const _PlatformIconDelegate(
        Icons.visibility,
        CupertinoIcons.eye_solid,
        FluentIcons.red_eye,
      ).nativeIcon(context);

  /// Icons: Icons.favorite : CupertinoIcons.heart_solid
  IconData get favoriteSolid => const _PlatformIconDelegate(
        Icons.favorite,
        CupertinoIcons.heart_solid,
        FluentIcons.heart_fill,
      ).nativeIcon(context);

  /// Icons: Icons.favorite_border : CupertinoIcons.heart
  IconData get favoriteOutline => const _PlatformIconDelegate(
        Icons.favorite_border,
        CupertinoIcons.heart,
        FluentIcons.heart,
      ).nativeIcon(context);

  /// Icons: Icons.flag : CupertinoIcons.flag
  IconData get flag => const _PlatformIconDelegate(
        Icons.flag,
        CupertinoIcons.flag,
        FluentIcons.flag,
      ).nativeIcon(context);

  IconData get folder => const _PlatformIconDelegate(
        Icons.folder,
        CupertinoIcons.folder,
        FluentIcons.folder,
      ).nativeIcon(context);

  /// Icons: Icons.folder_open : CupertinoIcons.folder_open
  IconData get folderOpen => const _PlatformIconDelegate(
        Icons.folder_open,
        CupertinoIcons.folder_open,
        FluentIcons.folder,
      ).nativeIcon(context);

  /// Icons: Icons.folder : CupertinoIcons.folder_solid
  IconData get folderSolid => const _PlatformIconDelegate(
        Icons.folder,
        CupertinoIcons.folder_solid,
        FluentIcons.folder_fill,
      ).nativeIcon(context);

  /// Icons: Icons.arrow_forward : CupertinoIcons.forward
  IconData get forward => const _PlatformIconDelegate(
        Icons.arrow_forward,
        CupertinoIcons.forward,
        FluentIcons.forward,
      ).nativeIcon(context);

  /// Icons: Icons.fullscreen : CupertinoIcons.fullscreen
  IconData get fullscreen => const _PlatformIconDelegate(
        Icons.fullscreen,
        CupertinoIcons.fullscreen,
        FluentIcons.full_screen,
      ).nativeIcon(context);

  /// Icons:
  IconData get fullscreenExit => const _PlatformIconDelegate(
        Icons.fullscreen_exit,
        CupertinoIcons.fullscreen_exit,
        FluentIcons.chrome_minimize,
      ).nativeIcon(context);

  /// Icons: Icons.gamepad : CupertinoIcons.game_controller
  IconData get gameController => const _PlatformIconDelegate(
        Icons.gamepad,
        CupertinoIcons.game_controller,
        FluentIcons.game,
      ).nativeIcon(context);

  /// Icons: Icons.games : CupertinoIcons.game_controller_solid
  IconData get gameControllerSolid => const _PlatformIconDelegate(
        Icons.games,
        CupertinoIcons.game_controller_solid,
        FluentIcons.game,
      ).nativeIcon(context);

  /// Icons: Icons.group : CupertinoIcons.group
  IconData get group => const _PlatformIconDelegate(
        Icons.group,
        CupertinoIcons.group,
        FluentIcons.group,
      ).nativeIcon(context);

  /// Icons: Icons.group : CupertinoIcons.group_solid
  IconData get groupSolid => const _PlatformIconDelegate(
        Icons.group,
        CupertinoIcons.group_solid,
        FluentIcons.group,
      ).nativeIcon(context);

  /// Icons: Icons.help : CupertinoIcons.question_circle_fill
  IconData get help => const _PlatformIconDelegate(
        Icons.help,
        CupertinoIcons.question_circle_fill,
        FluentIcons.status_circle_question_mark,
      ).nativeIcon(context);

  /// Icons: Icons.helpOutline : CupertinoIcons.question_circle
  IconData get helpOutline => const _PlatformIconDelegate(
        Icons.help_outline,
        CupertinoIcons.question_circle,
        FluentIcons.status_circle_question_mark,
      ).nativeIcon(context);

  /// Icons: Icons.home : CupertinoIcons.home
  IconData get home => const _PlatformIconDelegate(
        Icons.home,
        CupertinoIcons.home,
        FluentIcons.home,
      ).nativeIcon(context);

  /// Icons: Icons.info : CupertinoIcons.info
  IconData get info => const _PlatformIconDelegate(
        Icons.info,
        CupertinoIcons.info,
        FluentIcons.status_circle_info,
      ).nativeIcon(context);

  IconData get labFlask => const _PlatformIconDelegate(
        Icons.science_outlined,
        CupertinoIcons.lab_flask,
        FluentIcons.test_beaker,
      ).nativeIcon(context);

  /// Icons: Icons.chevron_left : CupertinoIcons.left_chevron
  IconData get leftChevron => const _PlatformIconDelegate(
        Icons.chevron_left,
        CupertinoIcons.left_chevron,
        FluentIcons.chevron_left,
      ).nativeIcon(context);

  /// Icons: Icons.location_on : CupertinoIcons.location
  IconData get locationOutline => const _PlatformIconDelegate(
        Icons.location_on_outlined,
        CupertinoIcons.location,
        FluentIcons.location,
      ).nativeIcon(context);

  /// Icons: Icons.location_on : CupertinoIcons.location_solid
  IconData get locationSolid => const _PlatformIconDelegate(
        Icons.location_on,
        CupertinoIcons.location_solid,
        FluentIcons.location,
      ).nativeIcon(context);

  /// Icons: Icons.loop : CupertinoIcons.loop
  IconData get loop => const _PlatformIconDelegate(
        Icons.loop,
        CupertinoIcons.loop,
        microsoft.FluentIcons.arrow_repeat_all_24_regular,
      ).nativeIcon(context);

  // IconData get loopThick =>
  //     const _PlatformIconDelegate(Icons.loop, CupertinoIcons.loop_thick, FluentIcons.).nativeIcon(context);

  /// Icons: Icons.mail : CupertinoIcons.mail
  IconData get mail => const _PlatformIconDelegate(
        Icons.mail,
        CupertinoIcons.mail,
        FluentIcons.mail,
      ).nativeIcon(context);

  /// Icons: Icons.mail : CupertinoIcons.mail_solid
  IconData get mailSolid => const _PlatformIconDelegate(
        Icons.mail,
        CupertinoIcons.mail_solid,
        FluentIcons.mail_solid,
      ).nativeIcon(context);

  /// Icons: Icons.mail_outline : CupertinoIcons.mail
  IconData get mailOutline => const _PlatformIconDelegate(
        Icons.mail_outline,
        CupertinoIcons.mail,
        FluentIcons.mail,
      ).nativeIcon(context);

  /// Icons: Icons.mic : CupertinoIcons.mic
  IconData get mic => const _PlatformIconDelegate(
        Icons.mic,
        CupertinoIcons.mic,
        FluentIcons.microphone,
      ).nativeIcon(context);

  /// Icons: Icons.mic_off : CupertinoIcons.mic_off
  IconData get micOff => const _PlatformIconDelegate(
        Icons.mic_off,
        CupertinoIcons.mic_off,
        FluentIcons.mic_off2,
      ).nativeIcon(context);

  /// Icons: Icons.mic_none : CupertinoIcons.mic
  IconData get micOutline => const _PlatformIconDelegate(
        Icons.mic_none,
        CupertinoIcons.mic,
        FluentIcons.microphone,
      ).nativeIcon(context);

  /// Icons: Icons.mic : CupertinoIcons.mic_solid
  IconData get micSolid => const _PlatformIconDelegate(
        Icons.mic,
        CupertinoIcons.mic_solid,
        FluentIcons.microphone,
      ).nativeIcon(context);

  /// Icons: Icons.music_note : CupertinoIcons.music_note
  IconData get musicNote => const _PlatformIconDelegate(
        Icons.music_note,
        CupertinoIcons.music_note,
        FluentIcons.music_note,
      ).nativeIcon(context);

  IconData get news => const _PlatformIconDelegate(
        Icons.newspaper,
        CupertinoIcons.news,
        FluentIcons.news,
      ).nativeIcon(context);

  /// Icons: Icons.lock : CupertinoIcons.padlock
  IconData get padLock => const _PlatformIconDelegate(
        Icons.lock,
        CupertinoIcons.padlock,
        FluentIcons.lock,
      ).nativeIcon(context);

  /// Icons: Icons.lock_outline : CupertinoIcons.padlock
  IconData get padlockOutline => const _PlatformIconDelegate(
        Icons.lock_outline,
        CupertinoIcons.padlock,
        FluentIcons.lock,
      ).nativeIcon(context);

  /// Icons: Icons.lock : CupertinoIcons.padlock_solid
  IconData get padlockSolid => const _PlatformIconDelegate(
        Icons.lock,
        CupertinoIcons.padlock_solid,
        FluentIcons.lock_solid,
      ).nativeIcon(context);

  /// Icons: Icons.pause : CupertinoIcons.pause
  IconData get pause => const _PlatformIconDelegate(
        Icons.pause,
        CupertinoIcons.pause,
        FluentIcons.pause,
      ).nativeIcon(context);

  IconData get pauseSolid => const _PlatformIconDelegate(
        Icons.pause_circle_filled,
        CupertinoIcons.pause_solid,
        FluentIcons.circle_pause_solid,
      ).nativeIcon(context);

  /// Icons: Icons.person : CupertinoIcons.person
  IconData get person => const _PlatformIconDelegate(
        Icons.person,
        CupertinoIcons.person,
        FluentIcons.contact,
      ).nativeIcon(context);

  /// Icons: Icons.person_add : CupertinoIcons.person_add
  IconData get personAdd => const _PlatformIconDelegate(
        Icons.person_add,
        CupertinoIcons.person_add,
        FluentIcons.add_friend,
      ).nativeIcon(context);

  /// Icons: Icons.person_add : CupertinoIcons.person_add_solid
  IconData get personAddSolid => const _PlatformIconDelegate(
        Icons.person_add,
        CupertinoIcons.person_add_solid,
        FluentIcons.add_friend,
      ).nativeIcon(context);

  /// Icons: Icons.person_outline : CupertinoIcons.person
  IconData get personOutline => const _PlatformIconDelegate(
        Icons.person_outline,
        CupertinoIcons.person,
        FluentIcons.contact,
      ).nativeIcon(context);

  /// Icons: Icons.person : CupertinoIcons.person_solid
  IconData get personSolid => const _PlatformIconDelegate(
        Icons.person,
        CupertinoIcons.person_solid,
        FluentIcons.contact,
      ).nativeIcon(context);

  /// Icons: Icons.phone : CupertinoIcons.phone
  IconData get phone => const _PlatformIconDelegate(
        Icons.phone,
        CupertinoIcons.phone,
        FluentIcons.phone,
      ).nativeIcon(context);

  /// Icons: Icons.phone : CupertinoIcons.phone_solid
  IconData get phoneSolid => const _PlatformIconDelegate(
        Icons.phone,
        CupertinoIcons.phone_solid,
        FluentIcons.phone,
      ).nativeIcon(context);

  /// Icons: Icons.photo_camera : CupertinoIcons.photo_camera
  IconData get photoCamera => const _PlatformIconDelegate(
        Icons.photo_camera,
        CupertinoIcons.photo_camera,
        FluentIcons.camera,
      ).nativeIcon(context);

  /// Icons: Icons.photo_camera : CupertinoIcons.photo_camera_solid
  IconData get photoCameraSolid => const _PlatformIconDelegate(
        Icons.photo_camera,
        CupertinoIcons.photo_camera_solid,
        FluentIcons.camera,
      ).nativeIcon(context);

  /// Icons: Icons.photo_library_outlined : CupertinoIcons.photo_on_rectangle
  IconData get photoLibrary => const _PlatformIconDelegate(
        Icons.photo_library_outlined,
        CupertinoIcons.photo_on_rectangle,
        FluentIcons.photo_collection,
      ).nativeIcon(context);

  /// Icons: Icons.photo_library : CupertinoIcons.photo_fill_on_rectangle_fill
  IconData get photoLibrarySolid => const _PlatformIconDelegate(
        Icons.photo_library,
        CupertinoIcons.photo_fill_on_rectangle_fill,
        FluentIcons.photo_collection,
      ).nativeIcon(context);

  /// Icons: Icons.play_arrow : CupertinoIcons.play_arrow
  IconData get playArrow => const _PlatformIconDelegate(
        Icons.play_arrow,
        CupertinoIcons.play_arrow,
        FluentIcons.play,
      ).nativeIcon(context);

  /// Icons: Icons.play_arrow : CupertinoIcons.play_arrow_solid
  IconData get playArrowSolid => const _PlatformIconDelegate(
        Icons.play_arrow,
        CupertinoIcons.play_arrow_solid,
        FluentIcons.play_solid,
      ).nativeIcon(context);

  /// Icons: Icons.play_circle_outline : CupertinoIcons.play_circle
  IconData get playCircle => const _PlatformIconDelegate(
        Icons.play_circle_outline,
        CupertinoIcons.play_circle,
        FluentIcons.box_play_solid,
      ).nativeIcon(context);

  /// Icons: Icons.play_circle : CupertinoIcons.play_circle_fill
  IconData get playCircleSolid => const _PlatformIconDelegate(
        Icons.play_circle,
        CupertinoIcons.play_circle_fill,
        FluentIcons.box_play_solid,
      ).nativeIcon(context);

  /// Icons: Icons.refresh : CupertinoIcons.refresh
  IconData get refresh => const _PlatformIconDelegate(
        Icons.refresh,
        CupertinoIcons.refresh,
        FluentIcons.refresh,
      ).nativeIcon(context);

  /// Icons: Icons.refresh : CupertinoIcons.refresh_bold
  IconData get refreshBold => const _PlatformIconDelegate(
        Icons.refresh,
        CupertinoIcons.refresh_bold,
        FluentIcons.refresh,
      ).nativeIcon(context);

  /// Icons: Icons.remove : CupertinoIcons.minus
  IconData get remove => const _PlatformIconDelegate(
        Icons.remove,
        CupertinoIcons.minus,
        FluentIcons.remove,
      ).nativeIcon(context);

  /// Icons: Icons.remove_circle : CupertinoIcons.minus_circle
  IconData get removeCircled => const _PlatformIconDelegate(
        Icons.remove_circle,
        CupertinoIcons.minus_circle,
        FluentIcons.skype_circle_minus,
      ).nativeIcon(context);

  /// Icons: Icons.remove_circle_outline : CupertinoIcons.minus_circle
  IconData get removeCircledOutline => const _PlatformIconDelegate(
        Icons.remove_circle_outline,
        CupertinoIcons.minus_circle,
        FluentIcons.skype_circle_minus,
      ).nativeIcon(context);

  /// Icons: Icons.remove_circle : CupertinoIcons.minus_circle_fill
  IconData get removeCircledSolid => const _PlatformIconDelegate(
        Icons.remove_circle,
        CupertinoIcons.minus_circle_fill,
        FluentIcons.skype_circle_minus,
      ).nativeIcon(context);

  /// Icons: Icons.reply : CupertinoIcons.reply
  IconData get reply => const _PlatformIconDelegate(
        Icons.reply,
        CupertinoIcons.reply,
        FluentIcons.reply,
      ).nativeIcon(context);

  /// Icons: Icons.reply_all : CupertinoIcons.reply_all
  IconData get replyAll => const _PlatformIconDelegate(
        Icons.reply_all,
        CupertinoIcons.reply_all,
        FluentIcons.reply_all,
      ).nativeIcon(context);

  /// Icons: Icons.chevron_right : CupertinoIcons.right_chevron
  IconData get rightChevron => const _PlatformIconDelegate(
        Icons.chevron_right,
        CupertinoIcons.right_chevron,
        FluentIcons.chevron_right,
      ).nativeIcon(context);

  /// Icons: Icons.search : CupertinoIcons.search
  IconData get search => const _PlatformIconDelegate(
        Icons.search,
        CupertinoIcons.search,
        FluentIcons.search,
      ).nativeIcon(context);

  /// Icons: Icons.settings : CupertinoIcons.settings
  IconData get settings => const _PlatformIconDelegate(
        Icons.settings,
        CupertinoIcons.settings,
        FluentIcons.settings,
      ).nativeIcon(context);

  /// Icons: Icons.settings : CupertinoIcons.settings_solid
  IconData get settingsSolid => const _PlatformIconDelegate(
        Icons.settings,
        CupertinoIcons.settings_solid,
        FluentIcons.settings,
      ).nativeIcon(context);

  /// Icons: Icons.share : CupertinoIcons.share
  IconData get share => const _PlatformIconDelegate(
        Icons.share,
        CupertinoIcons.share,
        FluentIcons.share,
      ).nativeIcon(context);

  /// Icons: Icons.share : CupertinoIcons.share_solid
  IconData get shareSolid => const _PlatformIconDelegate(
        Icons.share,
        CupertinoIcons.share_solid,
        FluentIcons.share,
      ).nativeIcon(context);

  // IconData get shareUp =>
  //     const _PlatformIconDelegate(Icons., CupertinoIcons.share_up, FluentIcons.;.nativeIcon(context))

  /// Icons: Icons.shopping_cart : CupertinoIcons.shopping_cart
  IconData get shoppingCart => const _PlatformIconDelegate(
        Icons.shopping_cart,
        CupertinoIcons.shopping_cart,
        FluentIcons.shopping_cart_solid,
      ).nativeIcon(context);

  /// Icons: Icons.shuffle : CupertinoIcons.shuffle
  IconData get shuffle => const _PlatformIconDelegate(
        Icons.shuffle,
        CupertinoIcons.shuffle,
        microsoft.FluentIcons.arrow_shuffle_24_regular,
      ).nativeIcon(context);

  /// Icons: Icons.star : CupertinoIcons.(custom)
  IconData get star => const _PlatformIconDelegate(
        Icons.star,
        CupertinoIcons.star,
        FluentIcons.favorite_star,
      ).nativeIcon(context);

  /// Icons: Icons.stars : CupertinoIcons.(custom)
  IconData get starCircleSolid => const _PlatformIconDelegate(
        Icons.stars,
        CupertinoIcons.star_circle_fill,
        FluentIcons.starburst_solid,
      ).nativeIcon(context);

  /// Icons: Icons.switch_camera : CupertinoIcons.switch_camera
  IconData get switchCameraOutlined => const _PlatformIconDelegate(
        Icons.switch_camera_outlined,
        CupertinoIcons.switch_camera,
        microsoft.FluentIcons.camera_switch_24_regular,
      ).nativeIcon(context);

  /// Icons: Icons.switch_camera : CupertinoIcons.switch_camera_solid
  IconData get switchCameraSolid => const _PlatformIconDelegate(
        Icons.switch_camera,
        CupertinoIcons.switch_camera_solid,
        microsoft.FluentIcons.camera_switch_24_filled,
      ).nativeIcon(context);

  /// Icons: Icons.label : CupertinoIcons.tag
  IconData get tag => const _PlatformIconDelegate(
        Icons.label,
        CupertinoIcons.tag,
        FluentIcons.tag_solid,
      ).nativeIcon(context);

  /// Icons: Icons.label_outline : CupertinoIcons.tag
  IconData get tagOutline => const _PlatformIconDelegate(
        Icons.label_outline,
        CupertinoIcons.tag,
        FluentIcons.tag,
      ).nativeIcon(context);

  /// Icons: Icons.label : CupertinoIcons.tag_solid
  IconData get tagSolid => const _PlatformIconDelegate(
        Icons.label,
        CupertinoIcons.tag_solid,
        FluentIcons.tag_solid,
      ).nativeIcon(context);

  IconData get tagsSolid => const _PlatformIconDelegate(
        Icons.style,
        CupertinoIcons.tags_solid,
        FluentIcons.tag_group,
      ).nativeIcon(context);

  /// Icons: Icons.thumb_down : CupertinoIcons.hand_thumbsdown_fill
  IconData get thumbDownSolid => const _PlatformIconDelegate(
        Icons.thumb_down,
        CupertinoIcons.hand_thumbsdown_fill,
        FluentIcons.dislike_solid,
      ).nativeIcon(context);

  /// Icons: Icons.thumb_down_outlined : CupertinoIcons.hand_thumbsdown
  IconData get thumbDownOutlined => const _PlatformIconDelegate(
        Icons.thumb_down_outlined,
        CupertinoIcons.hand_thumbsdown,
        FluentIcons.dislike,
      ).nativeIcon(context);

  /// Icons: Icons.thumb_up : CupertinoIcons.hand_thumbsup_fill
  IconData get thumbUpSolid => const _PlatformIconDelegate(
        Icons.thumb_up,
        CupertinoIcons.hand_thumbsup_fill,
        FluentIcons.like_solid,
      ).nativeIcon(context);

  /// Icons: Icons.thumb_up_outlined : CupertinoIcons.hand_thumbsup
  IconData get thumbUpOutlined => const _PlatformIconDelegate(
        Icons.thumb_up_outlined,
        CupertinoIcons.hand_thumbsup,
        FluentIcons.like,
      ).nativeIcon(context);

  /// Icons: Icons.schedule : CupertinoIcons.time
  IconData get time => const _PlatformIconDelegate(
        Icons.schedule,
        CupertinoIcons.time,
        FluentIcons.clock,
      ).nativeIcon(context);

  /// Icons: Icons.watch_later : CupertinoIcons.time_solid
  IconData get timeSolid => const _PlatformIconDelegate(
        Icons.watch_later,
        CupertinoIcons.time_solid,
        FluentIcons.skype_circle_clock,
      ).nativeIcon(context);

  /// Icons: Icons.tram : CupertinoIcons.train_style_one
  IconData get train => const _PlatformIconDelegate(
        Icons.tram,
        CupertinoIcons.train_style_one,
        FluentIcons.train_solid,
      ).nativeIcon(context);

  /// Icons: Icons.arrow_upward : CupertinoIcons.up_arrow
  IconData get upArrow => const _PlatformIconDelegate(
        Icons.arrow_upward,
        CupertinoIcons.up_arrow,
        FluentIcons.up,
      ).nativeIcon(context);

  /// Icons: Icons.videocam : CupertinoIcons.video_camer
  IconData get videoCamera => const _PlatformIconDelegate(
        Icons.videocam,
        CupertinoIcons.video_camera,
        FluentIcons.video,
      ).nativeIcon(context);

  /// Icons: Icons.videocam : CupertinoIcons.video_camera_solid
  IconData get videoCameraSolid => const _PlatformIconDelegate(
        Icons.videocam,
        CupertinoIcons.video_camera_solid,
        FluentIcons.video_solid,
      ).nativeIcon(context);

  /// Icons: Icons.volume_down : CupertinoIcons.volume_down
  IconData get volumeDown => const _PlatformIconDelegate(
        Icons.volume_down,
        CupertinoIcons.volume_down,
        FluentIcons.volume1,
      ).nativeIcon(context);

  /// Icons: Icons.volume_mute : CupertinoIcons.volume_mute
  IconData get volumeMute => const _PlatformIconDelegate(
        Icons.volume_mute,
        CupertinoIcons.volume_mute,
        FluentIcons.volume0,
      ).nativeIcon(context);

  /// Icons: Icons.volume_off : CupertinoIcons.volume_off
  IconData get volumeOff => const _PlatformIconDelegate(
        Icons.volume_off,
        CupertinoIcons.volume_off,
        FluentIcons.volume_disabled,
      ).nativeIcon(context);

  /// Icons: Icons.volume_up : CupertinoIcons.volume_up
  IconData get volumeUp => const _PlatformIconDelegate(
        Icons.volume_up,
        CupertinoIcons.volume_up,
        FluentIcons.volume3,
      ).nativeIcon(context);

  /// Icons: Icons.wifi : CupertinoIcons.wifi
  IconData get wifi => const _PlatformIconDelegate(
        Icons.wifi,
        CupertinoIcons.wifi,
        microsoft.FluentIcons.wifi_1_24_regular,
      ).nativeIcon(context);

  /// Icons: Icons.wifi_off : CupertinoIcons.wifi_slash
  IconData get wifiOff => const _PlatformIconDelegate(
        Icons.wifi_off,
        CupertinoIcons.wifi_slash,
        microsoft.FluentIcons.wifi_off_24_regular,
      ).nativeIcon(context);
}

class _PlatformIconDelegate {
  const _PlatformIconDelegate(
    this.materialIcon,
    this.cupertinoIcon,
    this.fluentIcon,
  );
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final IconData fluentIcon;

  IconData nativeIcon(BuildContext buildContext) {
    if (Platform.isAndroid) {
      return materialIcon;
    } else if (Platform.isIOS) {
      return cupertinoIcon;
    } else if (Platform.isWindows) {
      return fluentIcon;
    }

    throw PlatformException(code: 'Only android, cupertino, windows supported');
  }
}
