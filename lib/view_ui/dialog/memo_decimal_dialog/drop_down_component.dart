
import '../../../core/export_package.dart';

class RecordDropDownButton extends HookConsumerWidget {

  final Function(String)? onRecordChanged; // 콜백 추가

  const RecordDropDownButton({super.key,this.onRecordChanged});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final List<String> recordList = ['0.0','0.5','1.0','1.5','2.0'];

    final dropdownValue = useState<String>(
        '0.0');

    TextStyle getStyle = TextStyle(
        fontSize: 12,
        color: Colors.grey.shade500,
        fontWeight: FontWeight.bold
    );

    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: DropdownButton<String>(
          value: dropdownValue.value,
            onChanged: (String? val){
              if (val != null){
                dropdownValue.value = val;

                onRecordChanged?.call(val);
              }
            },
          underline: SizedBox(),
          isDense: true, // 컴팩트하게
          icon: Icon(Icons.arrow_drop_down,
            size: 16,
            color: Colors.grey.shade500,
          ),
          items: recordList.map((value){
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(value,
                  textScaler: TextScaler.noScaling,
                  style: getStyle,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
