import '../../../../../core/export_package.dart';

class authContainer extends StatelessWidget {
  final Widget child;

  const authContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;
    return Container(
      height: height > 700 ? (width > 400 ? 48 : 45) : 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade50,
        border: Border.all(
          color: Colors.grey.shade800,
          width: 0.85,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}


InputDecoration customInputDecoration({
  String? hintText,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    errorMaxLines: 1,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.grey.shade600,
      fontSize: 15,
    ),
    isDense: true,
    errorBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    suffixIcon: suffixIcon,
  );
}
