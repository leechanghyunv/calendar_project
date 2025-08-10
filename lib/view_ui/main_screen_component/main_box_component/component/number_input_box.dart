
import '../../../../core/export_package.dart';

class NumberInputBox extends StatelessWidget {
  final String name;

  const NumberInputBox({
    super.key,
    required this.name,

  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height > 750
          ? (width > 400 ? 160.0 : (width < 375 ? 130.0 : 140.0))
          : 125,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade900,
          width: 0.35,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize:
                        (width > 400 ? 15.0 : (width < 376 ? 12.0 : 14.0)),
                    color: Colors.grey.shade600,
                    fontWeight:
                        Platform.isAndroid ? FontWeight.w600 : FontWeight.w900,
                  ),
                ),
                Spacer(),
              ],
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey.shade900,
                  width: 0.35,
                ),
              ),
            ),
            /// toggle switch가 만들어질 위치
            Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey.shade900,
                  width: 0.35,
                ),
              ),
            ),
            /// toggle switch가 만들어질 위치
          ],
        ),
      ),
    );
  }
}
