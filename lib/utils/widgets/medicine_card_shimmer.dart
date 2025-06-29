import 'package:flutter/material.dart';

class MedicineCardShimmer extends StatefulWidget {
  const MedicineCardShimmer({super.key});

  @override
  State<MedicineCardShimmer> createState() => _MedicineCardShimmerState();
}

class _MedicineCardShimmerState extends State<MedicineCardShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerHeader(),
                  const SizedBox(height: 16),
                  _buildShimmerUsageTypes(),
                  _buildShimmerHungerSituation(),
                  _buildShimmerReminderTimes(),
                  _buildShimmerNotificationText(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerContainer(width: 4, height: 40),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildShimmerContainer(width: 200, height: 24),
              const SizedBox(height: 4),
              _buildShimmerContainer(width: 150, height: 16),
            ],
          ),
        ),
        _buildShimmerContainer(width: 32, height: 32, borderRadius: 12),
        const SizedBox(width: 8),
        _buildShimmerContainer(width: 100, height: 32, borderRadius: 16),
      ],
    );
  }

  Widget _buildShimmerUsageTypes() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Wrap(
        spacing: 6.0,
        runSpacing: 4.0,
        children: [
          _buildShimmerContainer(width: 80, height: 24, borderRadius: 8),
          _buildShimmerContainer(width: 60, height: 24, borderRadius: 8),
          _buildShimmerContainer(width: 90, height: 24, borderRadius: 8),
        ],
      ),
    );
  }

  Widget _buildShimmerHungerSituation() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          _buildShimmerContainer(width: 16, height: 16, borderRadius: 8),
          const SizedBox(width: 6),
          _buildShimmerContainer(width: 120, height: 16),
        ],
      ),
    );
  }

  Widget _buildShimmerReminderTimes() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildShimmerContainer(width: 16, height: 16, borderRadius: 8),
              const SizedBox(width: 6),
              _buildShimmerContainer(width: 160, height: 16),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              _buildShimmerContainer(width: 50, height: 24, borderRadius: 6),
              _buildShimmerContainer(width: 50, height: 24, borderRadius: 6),
              _buildShimmerContainer(width: 50, height: 24, borderRadius: 6),
              _buildShimmerContainer(width: 50, height: 24, borderRadius: 6),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerNotificationText() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFFF9800), width: 0.5),
        ),
        child: Row(
          children: [
            _buildShimmerContainer(width: 16, height: 16, borderRadius: 8),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerContainer(width: double.infinity, height: 16),
                  const SizedBox(height: 4),
                  _buildShimmerContainer(width: 200, height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerContainer({
    required double width,
    required double height,
    double borderRadius = 4,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: const [
            Color(0xFFE0E0E0),
            Color(0xFFF5F5F5),
            Color(0xFFE0E0E0),
          ],
          stops: const [0.4, 0.5, 0.6],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          transform: GradientRotation(_animation.value * 3.14159),
        ),
      ),
    );
  }
}