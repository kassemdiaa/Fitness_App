import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchiveScreen extends StatefulWidget {
  const AchiveScreen({super.key});

  @override
  State<AchiveScreen> createState() => _AchiveScreenState();
}

class _AchiveScreenState extends State<AchiveScreen> {
  final List<String> _options = [
    'Strength Training for Muscle Gain',
    'High-Intensity Interval Training for Fat Loss',
    'Cardiovascular Exercise for Fat Loss',
    'Functional Training for Overall Fitness',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              const _StepIndicator(currentStep: 2),

              SizedBox(height: 48.h),

              Text(
                'What do you want to acheive?',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1C1C2E),
                  height: 1.25,
                ),
              ),

              SizedBox(height: 32.h),

              Expanded(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _options.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndex == index;
                    return _OptionCard(
                      label: _options[index],
                      isSelected: isSelected,
                      onTap: () => setState(() => _selectedIndex = index),
                    );
                  },
                ),
              ),

              SizedBox(height: 24.h),

              _BottomButtons(onStart: () {}, onBack: () {}),

              SizedBox(height: 24.h),
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
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: isActive ? 32.w : 24.w,
          height: 5.h,
          decoration: BoxDecoration(
            color: isPast
                ? const Color(0xFFB2E4E0)
                : isActive
                    ? const Color(0xFF1C1C2E)
                    : const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(10.r),
          ),
        );
      }),
    );
  }
}

// ─── Option Card ──────────────────────────────────────────────────────────────

class _OptionCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Badge size
    final double badgeSize = 24.w;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Card
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 22.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF1C1C2E)
                    : const Color(0xFFE5E5E5),
                width: isSelected ? 2 : 1.5,
              ),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
                color: const Color(0xFF1C1C2E),
                height: 1.4,
              ),
            ),
          ),

          // Checkmark badge — sits on top-right corner of the border
          if (isSelected)
            Positioned(
              top: -(badgeSize / 2),
              right: -(badgeSize / 2),
              child: Container(
                width: badgeSize,
                height: badgeSize,
                decoration: const BoxDecoration(
                  color: Color(0xFF1C1C2E),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Bottom Buttons ───────────────────────────────────────────────────────────

class _BottomButtons extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onBack;

  const _BottomButtons({required this.onStart, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBack,
          child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              color: const Color(0xFF1C1C2E),
              size: 28.sp,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: GestureDetector(
            onTap: onStart,
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C2E),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Center(
                child: Text(
                  'Start Now',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
