import 'package:flutter/material.dart';
import '../screens/property.dart';
import '../screens/analysis.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FooterButton(
            icon: Icons.handshake_outlined,
            label: '자산',
            onTap: () {
              // 자산 클릭 시 PropertyScreen으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyScreen(),
                ),
              );
            },
          ),
          FooterButton(
            icon: Icons.analytics_outlined,
            label: '분석',
            onTap: () {
              // 분석 클릭 시 AnalysisScreen으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnalysisScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FooterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const FooterButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.deepPurple,
            size: 30,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
