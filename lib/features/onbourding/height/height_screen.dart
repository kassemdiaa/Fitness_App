import 'package:fitness_app/providers/user_cradintials_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  bool _isCm = true;
  double _heightCm = 170;
  double _heightInches = 67;

  static const double _minCm = 100;
  static const double _maxCm = 220;
  static const double _minInches = 48;
  static const double _maxInches = 96;

  double get _currentValue => _isCm ? _heightCm : _heightInches;
  double get _minValue => _isCm ? _minCm : _minInches;
  double get _maxValue => _isCm ? _maxCm : _maxInches;
  String get _unit => _isCm ? 'cm' : 'in';

  String get _displayValue {
    if (_isCm) return _heightCm.round().toString();
    int totalInches = _heightInches.round();
    int feet = totalInches ~/ 12;
    int inches = totalInches % 12;
    return "$feet'$inches\"";
  }

  void _onUnitToggle(bool toCm) => setState(() => _isCm = toCm);

  void _onValueChanged(double value) => setState(() {
        if (_isCm) {
          _heightCm = value;
        } else {
          _heightInches = value;
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const _StepIndicator(currentStep: 1),
              const SizedBox(height: 36),
              const Text(
                'What is your\nheight?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1C1C2E),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 28),
              _UnitToggle(isCm: _isCm, onToggle: _onUnitToggle),
              const SizedBox(height: 24),
              Expanded(
                child: _RulerCard(
                  value: _currentValue,
                  min: _minValue,
                  max: _maxValue,
                  unit: _unit,
                  displayValue: _displayValue,
                  onChanged: _onValueChanged,
                ),
              ),
              const SizedBox(height: 24),
              _BottomButtons(
                onNext: () {
                  final heightInCm = _isCm
                      ? _heightCm.round()
                      : (_heightInches * 2.54).round();
                  context
                      .read<UserCradintialsProvider>()
                      .changeHeight(heightInCm);
                  // TODO: navigate to next screen
                },
                onBack: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Step Indicator ───────────────────────────────────────────────────────────

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  const _StepIndicator({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final isActive = index == currentStep;
        final isPast = index < currentStep;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 32 : 24,
          height: 5,
          decoration: BoxDecoration(
            color: isPast
                ? const Color(0xFFB2E4E0)
                : isActive
                    ? const Color(0xFF1C1C2E)
                    : const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}

// ─── Unit Toggle ──────────────────────────────────────────────────────────────

class _UnitToggle extends StatelessWidget {
  final bool isCm;
  final ValueChanged<bool> onToggle;

  const _UnitToggle({required this.isCm, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ToggleOption(
            label: 'inches',
            isSelected: !isCm,
            onTap: () => onToggle(false),
          ),
          _ToggleOption(
            label: 'cm',
            isSelected: isCm,
            onTap: () => onToggle(true),
          ),
        ],
      ),
    );
  }
}

class _ToggleOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToggleOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1C1C2E) : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFFAAAAAA),
          ),
        ),
      ),
    );
  }
}

// ─── Ruler Card ───────────────────────────────────────────────────────────────

class _RulerCard extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final String unit;
  final String displayValue;
  final ValueChanged<double> onChanged;

  const _RulerCard({
    required this.value,
    required this.min,
    required this.max,
    required this.unit,
    required this.displayValue,
    required this.onChanged,
  });

  @override
  State<_RulerCard> createState() => _RulerCardState();
}

class _RulerCardState extends State<_RulerCard> {
  late ScrollController _scrollController;
  static const double _pixelsPerUnit = 14.0;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: (widget.value - widget.min) * _pixelsPerUnit,
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(_RulerCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.min != widget.min || oldWidget.max != widget.max) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(
            (widget.value - widget.min) * _pixelsPerUnit,
          );
        }
      });
    }
  }

  void _onScroll() {
    if (!_isScrolling) return;
    final offset = _scrollController.offset;
    final newValue =
        (offset / _pixelsPerUnit + widget.min).clamp(widget.min, widget.max);
    final rounded = newValue.roundToDouble();
    if (rounded != widget.value) widget.onChanged(rounded);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5F4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: Text(
              widget.displayValue,
              key: ValueKey(widget.displayValue),
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1C1C2E),
                height: 1,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  _isScrolling = true;
                } else if (notification is ScrollEndNotification) {
                  _isScrolling = false;
                  final offset = _scrollController.offset;
                  final snapped =
                      (offset / _pixelsPerUnit).round() * _pixelsPerUnit;
                  if ((snapped - offset).abs() > 0.5) {
                    _scrollController.animateTo(
                      snapped,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeOut,
                    );
                  }
                }
                return false;
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 2 - 12,
                    ),
                    itemCount: (widget.max - widget.min).toInt() + 1,
                    itemBuilder: (context, index) {
                      final val = widget.min + index;
                      final isLabel = val % 10 == 0;
                      final isMajor = val % 5 == 0;

                      return SizedBox(
                        width: _pixelsPerUnit,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (isLabel)
                              Text(
                                val.toInt().toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF8AADA9),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            if (!isLabel) const SizedBox(height: 14),
                            const SizedBox(height: 2),
                            Container(
                              width: 1.5,
                              height: isLabel
                                  ? 22
                                  : isMajor
                                      ? 16
                                      : 10,
                              color: isLabel
                                  ? const Color(0xFF6B9E9A)
                                  : const Color(0xFFAACECB),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 2.5,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C2E),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.unit,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF8AADA9),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ─── Bottom Buttons ───────────────────────────────────────────────────────────

class _BottomButtons extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const _BottomButtons({required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBack,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.chevron_left_rounded,
              color: Color(0xFF1C1C2E),
              size: 28,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: onNext,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C2E),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right_rounded,
                      color: Colors.white, size: 20),
                  Icon(Icons.chevron_right_rounded,
                      color: Color(0xFF6B6B80), size: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
