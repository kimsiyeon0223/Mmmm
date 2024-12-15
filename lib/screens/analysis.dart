import 'package:flutter/material.dart';
import '../components/footer.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '이번달 ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '예산',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF775AF4),
                      ),
                    ),
                    TextSpan(
                      text: '을 초과했어요',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '10,000원 초과',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: 240,
                  width: 240,
                  child: CustomPaint(
                    painter: PieChartPainter(),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                '12월',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Divider(
                thickness: 1.0,
                color: const Color(0xffE4E4E4),
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  buildExpenseItem(
                      '에이블리', '40,000,000원', const Color(0xFF775AF4)),
                  buildExpenseItem(
                      '무신사', '40,000,000원', const Color(0xFF9B8FFB)),
                  buildExpenseItem(
                      '식비', '40,000,000원', const Color(0xFF8CCAF8)),
                  buildExpenseItem(
                      '뿌링클', '40,000,000원', const Color(0xFF66B2FF)),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  Widget buildExpenseItem(String name, String amount, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '25%',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// 원형 차트 페인터
class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final sections = [
      {'color': const Color(0xFF775AF4), 'start': 0.0, 'sweep': 90.0}, // 에이블리
      {'color': const Color(0xFF9B8FFB), 'start': 90.0, 'sweep': 90.0}, // 무신사
      {'color': const Color(0xFF8CCAF8), 'start': 180.0, 'sweep': 90.0}, // 식비
      {'color': const Color(0xFF66B2FF), 'start': 270.0, 'sweep': 90.0}, // 뿌링클
    ];

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (var section in sections) {
      paint.color = section['color'] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        degreeToRadian(section['start'] as double),
        degreeToRadian(section['sweep'] as double),
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double degreeToRadian(double degree) => degree * (3.141592653589793 / 180);
}
