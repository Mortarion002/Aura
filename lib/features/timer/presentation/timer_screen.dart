import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/aura_logo.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with TickerProviderStateMixin {
  static const _defaultDuration = Duration(minutes: 4);

  Duration _duration = _defaultDuration;
  Duration _elapsed = Duration.zero;
  bool _running = false;
  final List<_Lap> _laps = [];
  Duration _lastLapElapsed = Duration.zero;
  DateTime? _runStartedAt;
  Duration _elapsedAtRunStart = Duration.zero;

  Timer? _countdownTimer;
  late final AnimationController _orbitCtrl;
  late final AnimationController _finishCtrl;

  @override
  void initState() {
    super.initState();
    _orbitCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
    _finishCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _orbitCtrl.dispose();
    _finishCtrl.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _runStartedAt = DateTime.now();
    _elapsedAtRunStart = _elapsed;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(
      const Duration(milliseconds: 250),
      (_) => _syncElapsed(),
    );
  }

  Duration _currentElapsed() {
    final startedAt = _runStartedAt;
    if (!_running || startedAt == null) return _elapsed;
    final liveElapsed =
        _elapsedAtRunStart + DateTime.now().difference(startedAt);
    return liveElapsed > _duration ? _duration : liveElapsed;
  }

  void _syncElapsed() {
    if (!_running) return;
    final nextElapsed = _currentElapsed();
    setState(() {
      _elapsed = nextElapsed;
      if (_elapsed >= _duration) {
        _elapsed = _duration;
        _running = false;
        _runStartedAt = null;
        _countdownTimer?.cancel();
        _finishCtrl.forward(from: 0);
      }
    });
  }

  void _toggleRun() {
    final wasRunning = _running;
    final currentElapsed = _currentElapsed();
    setState(() {
      if (wasRunning) {
        _elapsed = currentElapsed;
        _running = false;
        _runStartedAt = null;
        _countdownTimer?.cancel();
        return;
      }

      if (currentElapsed >= _duration) {
        _elapsed = Duration.zero;
        _laps.clear();
        _lastLapElapsed = Duration.zero;
      }
      _running = true;
      _finishCtrl.reset();
      _startCountdown();
    });
  }

  void _doLap() {
    if (!_running) return;
    final currentElapsed = _currentElapsed();
    setState(() {
      _elapsed = currentElapsed;
      _laps.insert(
        0,
        _Lap(lapTime: currentElapsed - _lastLapElapsed, total: currentElapsed),
      );
      if (_laps.length > 5) _laps.removeLast();
      _lastLapElapsed = currentElapsed;
    });
  }

  void _doReset() {
    _countdownTimer?.cancel();
    setState(() {
      _running = false;
      _elapsed = Duration.zero;
      _laps.clear();
      _lastLapElapsed = Duration.zero;
      _runStartedAt = null;
      _elapsedAtRunStart = Duration.zero;
      _finishCtrl.reset();
    });
  }

  Future<void> _showDurationPicker() async {
    if (_running) return;
    int pickHours = _duration.inHours;
    int pickMins = _duration.inMinutes.remainder(60);
    int pickSecs = _duration.inSeconds.remainder(60);

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: kWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSheet) => SizedBox(
          height: 320,
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text('Set Timer', style: AppTextStyles.cardCity(size: 16)),
              Expanded(
                child: Row(
                  children: [
                    _Picker(
                      label: 'H',
                      count: 24,
                      initial: pickHours,
                      onChanged: (v) => setSheet(() => pickHours = v),
                    ),
                    _Picker(
                      label: 'M',
                      count: 60,
                      initial: pickMins,
                      onChanged: (v) => setSheet(() => pickMins = v),
                    ),
                    _Picker(
                      label: 'S',
                      count: 60,
                      initial: pickSecs,
                      onChanged: (v) => setSheet(() => pickSecs = v),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: GestureDetector(
                  onTap: () {
                    final d = Duration(
                      hours: pickHours,
                      minutes: pickMins,
                      seconds: pickSecs,
                    );
                    if (d > Duration.zero) {
                      setState(() {
                        _duration = d;
                        _elapsed = Duration.zero;
                        _laps.clear();
                        _lastLapElapsed = Duration.zero;
                        _runStartedAt = null;
                        _elapsedAtRunStart = Duration.zero;
                        _finishCtrl.reset();
                      });
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: kBlack,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Set',
                      style: AppTextStyles.cardCity(size: 16, color: kWhite),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _fmt(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  Duration _ceilToSecond(Duration d) {
    if (d <= Duration.zero) return Duration.zero;
    final wholeSeconds = d.inSeconds;
    return d.inMilliseconds % 1000 == 0
        ? Duration(seconds: wholeSeconds)
        : Duration(seconds: wholeSeconds + 1);
  }

  @override
  Widget build(BuildContext context) {
    final remaining = _duration - _elapsed;
    final displayRemaining = _ceilToSecond(remaining);
    final progress = _duration.inMilliseconds > 0
        ? _elapsed.inMilliseconds / _duration.inMilliseconds
        : 0.0;
    final timerSize = math.min(MediaQuery.sizeOf(context).width - 44, 320.0);

    return SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 4, 22, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AuraLogo(size: 30),
                Text('Timer', style: AppTextStyles.cardCity(size: 18)),
                const SizedBox(width: 30),
              ],
            ),
          ),

          // Concentric circles — tap to set duration
          GestureDetector(
            onTap: _showDurationPicker,
            child: SizedBox.square(
              dimension: timerSize,
              child: AnimatedBuilder(
                animation: Listenable.merge([_orbitCtrl, _finishCtrl]),
                builder: (_, child) => CustomPaint(
                  painter: _TimerPainter(
                    progress: progress,
                    orbitAngle: _orbitCtrl.value * 2 * math.pi,
                    timeLabel: _fmt(displayRemaining),
                    finishPulse: _finishCtrl.value,
                  ),
                ),
              ),
            ),
          ),

          // Lap list
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_laps.isNotEmpty) ...[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'LAP TIME',
                            style: AppTextStyles.cardUtc(size: 11),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'TOTAL TIME',
                            style: AppTextStyles.cardUtc(size: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  ..._laps.map(
                    (l) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _fmt(l.lapTime),
                              style: AppTextStyles.cardTime(size: 22),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              _fmt(l.total),
                              style: AppTextStyles.cardTime(size: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_laps.isEmpty && _elapsed == Duration.zero)
                    Center(
                      child: Text(
                        'Tap the clock to set duration',
                        style: AppTextStyles.cardUtc(size: 13),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Controls
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CtrlBtn(
                  icon: Icons.flag_outlined,
                  color: kCard,
                  iconColor: _running ? kDim : kDim.withValues(alpha: 0.4),
                  onTap: _doLap,
                ),
                _CtrlBtn(
                  icon: _running ? Icons.pause : Icons.play_arrow,
                  color: _running ? kOrange : kBlack,
                  iconColor: kWhite,
                  onTap: _toggleRun,
                ),
                _CtrlBtn(
                  icon: Icons.refresh,
                  color: kCard,
                  iconColor: kDim,
                  onTap: _doReset,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Painter ────────────────────────────────────────────────────────────────────
class _TimerPainter extends CustomPainter {
  final double progress;
  final double orbitAngle;
  final String timeLabel;
  final double finishPulse;

  const _TimerPainter({
    required this.progress,
    required this.orbitAngle,
    required this.timeLabel,
    required this.finishPulse,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final outerR = size.width * 0.431;
    final innerR = size.width * 0.3125;
    final trackWidth = size.width * 0.0375;

    // Outer track bg
    canvas.drawCircle(
      Offset(cx, cy),
      outerR,
      Paint()
        ..color = kCard
        ..style = PaintingStyle.stroke
        ..strokeWidth = trackWidth,
    );

    // Countdown arc (remaining = black, elapsed = missing)
    if (progress < 1.0) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: outerR),
        -math.pi / 2,
        (1.0 - progress) * 2 * math.pi,
        false,
        Paint()
          ..color = kBlack
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackWidth
          ..strokeCap = StrokeCap.round,
      );
    } else if (finishPulse > 0) {
      canvas.drawCircle(
        Offset(cx, cy),
        outerR,
        Paint()
          ..color = Color.lerp(kOrange, kBlack, finishPulse)!
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackWidth
          ..strokeCap = StrokeCap.round,
      );
    }

    // Tick marks
    for (int i = 0; i < 60; i++) {
      final angle = i / 60 * 2 * math.pi - math.pi / 2;
      final isMajor = i % 5 == 0;
      final rOuter = outerR - size.width * 0.056;
      final rInner = outerR - size.width * (isMajor ? 0.094 : 0.075);
      canvas.drawLine(
        Offset(cx + rOuter * math.cos(angle), cy + rOuter * math.sin(angle)),
        Offset(cx + rInner * math.cos(angle), cy + rInner * math.sin(angle)),
        Paint()
          ..color = isMajor ? const Color(0xFFAAAAAA) : const Color(0xFFDDDDDD)
          ..strokeWidth = isMajor ? 1.5 : 1.0
          ..strokeCap = StrokeCap.round,
      );
    }

    // Inner orbit track
    canvas.drawCircle(
      Offset(cx, cy),
      innerR,
      Paint()
        ..color = kCard
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // White centre disc
    canvas.drawCircle(
      Offset(cx, cy),
      innerR - size.width * 0.0375,
      Paint()..color = kWhite,
    );

    // Time label
    final tp = TextPainter(
      text: TextSpan(
        text: timeLabel,
        style: AppTextStyles.timerDisplay(size: size.width * 0.094),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset(cx - tp.width / 2, cy - tp.height / 2 + size.width * 0.031),
    );

    // Orbiting dot
    final dotX = cx + innerR * math.cos(orbitAngle - math.pi / 2);
    final dotY = cy + innerR * math.sin(orbitAngle - math.pi / 2);
    canvas.drawCircle(
      Offset(dotX, dotY),
      size.width * 0.025,
      Paint()..color = kOrange,
    );
    canvas.drawCircle(
      Offset(dotX, dotY),
      size.width * 0.011,
      Paint()..color = kWhite,
    );
  }

  @override
  bool shouldRepaint(_TimerPainter old) =>
      old.progress != progress ||
      old.orbitAngle != orbitAngle ||
      old.timeLabel != timeLabel ||
      old.finishPulse != finishPulse;
}

// ── Control button ─────────────────────────────────────────────────────────────
class _CtrlBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const _CtrlBtn({
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 52,
      height: 52,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor, size: 22),
    ),
  );
}

// ── iOS-style scroll picker column ─────────────────────────────────────────────
class _Picker extends StatelessWidget {
  final String label;
  final int count;
  final int initial;
  final ValueChanged<int> onChanged;

  const _Picker({
    required this.label,
    required this.count,
    required this.initial,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: AppTextStyles.cardUtc(size: 12)),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: initial,
              ),
              itemExtent: 40,
              onSelectedItemChanged: onChanged,
              children: List.generate(
                count,
                (i) => Center(
                  child: Text(
                    i.toString().padLeft(2, '0'),
                    style: AppTextStyles.cardTime(size: 22),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Lap {
  final Duration lapTime;
  final Duration total;
  const _Lap({required this.lapTime, required this.total});
}
