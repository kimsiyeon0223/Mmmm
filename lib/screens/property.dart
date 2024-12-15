import 'package:flutter/material.dart';
import '../components/footer.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  String totalAsset = '500,000,000원';
  String monthlyBudget = '500,000,000원';

  List<Map<String, String>> expenses = [
    {'name': '에이블리', 'amount': '500,000원'},
    {'name': '스타벅스', 'amount': '10,000원'},
  ];

  void showEditModal(
      String title, String currentValue, Function(String) onSave) {
    final TextEditingController controller = TextEditingController(
        text: currentValue.replaceAll('원', '').replaceAll(',', ''));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title 수정',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '금액을 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF775AF4),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  String formattedValue =
                      '${int.parse(controller.text).toString().replaceAllMapped(
                            RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},',
                          )}원';
                  onSave(formattedValue);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '저장',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showAddExpenseModal() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '지출 추가',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: '지출 항목 이름',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '금액 입력',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF775AF4),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  String formattedAmount =
                      '${int.parse(amountController.text).toString().replaceAllMapped(
                            RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},',
                          )}원';
                  setState(() {
                    expenses.add({
                      'name': nameController.text,
                      'amount': formattedAmount,
                    });
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '추가',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSectionHeader(String title, String value, Function() onEdit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.black, size: 20),
              onPressed: onEdit,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF302C39),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF775AF4),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'HIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '예산 정해두고 돈 관리해보자',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '500,000원',
                      style: TextStyle(
                        color: Color(0xFF775AF4),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildSectionHeader(
                '등록 자산',
                totalAsset,
                () => showEditModal('등록 자산', totalAsset, (newValue) {
                  setState(() => totalAsset = newValue);
                }),
              ),
              const SizedBox(height: 30),
              buildSectionHeader(
                '등록한 이번달 예산',
                monthlyBudget,
                () => showEditModal('등록한 이번달 예산', monthlyBudget, (newValue) {
                  setState(() => monthlyBudget = newValue);
                }),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '지출',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Color(0xFF775AF4),
                      size: 28,
                    ),
                    onPressed: showAddExpenseModal,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: expenses.map((expense) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          expense['name']!,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              expense['amount']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF775AF4),
                                minimumSize: const Size(50, 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text('삭제',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(width: 5),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF775AF4),
                                minimumSize: const Size(50, 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text('메모',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
