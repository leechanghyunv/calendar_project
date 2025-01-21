import '../../../core/export_package.dart';

class RangeFilterChipList1 extends StatefulWidget {
  const RangeFilterChipList1({super.key});

  @override
  State<RangeFilterChipList1> createState() => _RangeFilterChipList1State();
}

class _RangeFilterChipList1State extends State<RangeFilterChipList1> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            height: 22,
            width: appWidth * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rangeChipList1.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // 같은 칩을 다시 탭하면 선택 해제
                      selectedIndex = selectedIndex == index ? null : index;
                    });
                  },
                  child: RangeFilterChip(
                    rangeChipList1[index],
                    isSelected: selectedIndex == index,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


Widget RangeFilterChip(Map<String, dynamic> rangeData, {bool isSelected = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade300 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey.shade800,
          width: isSelected ? 1.25 : 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(
              ' ${rangeData['value']!}',
              style: TextStyle(
                color: isSelected ? Colors.grey.shade900 : Colors.grey.shade900,
                fontWeight: FontWeight.w900,
                fontSize: 10.5,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

final List<Map<String,dynamic>> rangeChipList1 = [
  {
    'value' : '1.0',
    'imoji' : '🚀'
  },
  {
    'value' : '1.5',
    'imoji' : '🔥'
  },
  {
    'value' : '2.0',
    'imoji' : '🎉'
  },
];