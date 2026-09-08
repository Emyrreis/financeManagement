import 'dart:async';
import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import 'functional_icon_view_model.dart';

class FunctionalIconComponent extends StatelessWidget {
  final FunctionalIconViewModel viewModel;

  const FunctionalIconComponent({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    switch (viewModel.type) {
      case FunctionalIconType.categoryPrimary:
      case FunctionalIconType.categorySecondary:
        return _CategoryIconTile(
          icon: viewModel.icon ?? Icons.category_outlined,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.loadingCheck:
        return const _LoadingSequenceIcon(isError: false);

      case FunctionalIconType.loadingError:
        return const _LoadingSequenceIcon(isError: true);

      case FunctionalIconType.navigation:
        return _NavigationIcon(
          icon: viewModel.icon ?? Icons.home_outlined,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.radio:
        return _RadioDot(
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.checkbox:
        return _SquareCheck(
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.notificationBell:
        return _ActionBadge(
          icon: Icons.notifications_none_rounded,
          defaultBackground: AppColors.lightGreen,
          defaultIconColor: AppColors.mainGreen,
          activeBackground: AppColors.oceanBlue,
          activeIconColor: Colors.white,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.searchAction:
        return _ActionBadge(
          icon: Icons.search_rounded,
          defaultBackground: AppColors.mainGreen,
          defaultIconColor: AppColors.lettersIcons,
          activeBackground: AppColors.oceanBlue,
          activeIconColor: Colors.white,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.calendarAction:
        return _ActionBadge(
          icon: Icons.calendar_month_rounded,
          defaultBackground: AppColors.mainGreen,
          defaultIconColor: Colors.white,
          activeBackground: AppColors.oceanBlue,
          activeIconColor: Colors.white,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.cameraAction:
        return _ActionBadge(
          icon: Icons.photo_camera_outlined,
          defaultBackground: AppColors.lightGreen,
          defaultIconColor: AppColors.lettersIcons,
          activeBackground: AppColors.darkModeBar,
          activeIconColor: AppColors.lightBackground,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.micAction:
        return _ActionBadge(
          icon: Icons.mic_none_outlined,
          defaultBackground: AppColors.lightGreen,
          defaultIconColor: AppColors.lettersIcons,
          activeBackground: AppColors.darkModeBar,
          activeIconColor: AppColors.lightBackground,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.sendAction:
        return _ActionBadge(
          icon: Icons.send_outlined,
          defaultBackground: AppColors.lightGreen,
          defaultIconColor: AppColors.lettersIcons,
          activeBackground: AppColors.darkModeBar,
          activeIconColor: AppColors.lightBackground,
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );

      case FunctionalIconType.eyesPass:
        return const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.remove_red_eye_outlined, color: AppColors.lettersIcons),
            SizedBox(width: 12),
            Icon(Icons.visibility_off_outlined, color: AppColors.lettersIcons),
          ],
        );

      case FunctionalIconType.toggle:
        return Switch(
          value: viewModel.active,
          activeThumbColor: AppColors.mainGreen,
          onChanged: viewModel.enabled
              ? (_) => viewModel.onTap?.call()
              : null,
        );

      case FunctionalIconType.calendarDate:
        return _CalendarDateBadge(
          day: viewModel.dayLabel ?? '1',
          active: viewModel.active,
          enabled: viewModel.enabled,
          onTap: viewModel.onTap,
        );
    }
  }
}

class _CategoryIconTile extends StatelessWidget {
  final IconData icon;
  final bool active;
  final bool enabled;
  final VoidCallback? onTap;

  const _CategoryIconTile({
    required this.icon,
    required this.active,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 56,
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? AppColors.oceanBlue : AppColors.categoryBlueDefault,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}

class _NavigationIcon extends StatelessWidget {
  final IconData icon;
  final bool active;
  final bool enabled;
  final VoidCallback? onTap;

  const _NavigationIcon({
    required this.icon,
    required this.active,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? AppColors.mainGreen : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: active ? Colors.white : AppColors.lettersIcons,
          size: 22,
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool active;
  final bool enabled;
  final VoidCallback? onTap;

  const _RadioDot({
    required this.active,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.mainGreen, width: 2),
        ),
        child: active
            ? Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.mainGreen,
          ),
        )
            : null,
      ),
    );
  }
}

class _SquareCheck extends StatelessWidget {
  final bool active;
  final bool enabled;
  final VoidCallback? onTap;

  const _SquareCheck({
    required this.active,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 22,
        height: 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.lettersIcons, width: 1.5),
        ),
        child: active
            ? const Icon(Icons.check, size: 16, color: AppColors.lettersIcons)
            : null,
      ),
    );
  }
}

class _ActionBadge extends StatelessWidget {
  final IconData icon;
  final Color defaultBackground;
  final Color defaultIconColor;
  final Color activeBackground;
  final Color activeIconColor;
  final bool active;
  final bool enabled;
  final VoidCallback? onTap;

  const _ActionBadge({
    required this.icon,
    required this.defaultBackground,
    required this.defaultIconColor,
    required this.activeBackground,
    required this.activeIconColor,
    required this.active,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? activeBackground : defaultBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 18,
          color: active ? activeIconColor : defaultIconColor,
        ),
      ),
    );
  }
}

class _CalendarDateBadge extends StatelessWidget {
  final String day;
  final bool active;
  final bool enabled;
  final VoidCallback? onTap;

  const _CalendarDateBadge({
    required this.day,
    required this.active,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? AppColors.oceanBlue : AppColors.lightBackground,
          border: active
              ? null
              : Border.all(color: AppColors.lightGreen, width: 1),
        ),
        child: Text(
          day,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: active ? Colors.white : AppColors.lettersIcons,
          ),
        ),
      ),
    );
  }
}

class _LoadingSequenceIcon extends StatefulWidget {
  final bool isError;

  const _LoadingSequenceIcon({required this.isError});

  @override
  State<_LoadingSequenceIcon> createState() => _LoadingSequenceIconState();
}

class _LoadingSequenceIconState extends State<_LoadingSequenceIcon> {
  static const _frameDuration = Duration(milliseconds: 500);
  static const _resultPause = Duration(milliseconds: 900);

  int _frame = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scheduleNext();
  }

  void _scheduleNext() {
    final delay = _frame == 3 ? _resultPause : _frameDuration;
    _timer = Timer(delay, () {
      if (!mounted) return;
      setState(() => _frame = (_frame + 1) % 4);
      _scheduleNext();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 2)),
      ),
      alignment: Alignment.center,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _buildFrame(),
      ),
    );
  }

  Widget _buildFrame() {
    if (_frame < 3) {
      final dots = _frame + 1;
      return Row(
        key: ValueKey(_frame),
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          dots,
              (_) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: CircleAvatar(radius: 3, backgroundColor: Colors.white),
          ),
        ),
      );
    }
    return Icon(
      key: const ValueKey(3),
      widget.isError ? Icons.close_rounded : Icons.check_rounded,
      color: Colors.white,
      size: 28,
    );
  }
}
