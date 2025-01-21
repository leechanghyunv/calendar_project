import '../../../core/export_package.dart';
import '../../../repository/view_controll/singlechild_scroll_repo.dart';

class ContractFormBox extends ConsumerStatefulWidget {
  final Widget child;
  final List<FocusNode> nodes;

  const ContractFormBox({
    super.key,
    required this.child,
    required this.nodes,
  });

  @override
  ConsumerState<ContractFormBox> createState() => _ContractFormBoxState();
}

class _ContractFormBoxState extends ConsumerState<ContractFormBox> {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    for (var node in widget.nodes) {
      node.addListener(_handleFocusChange);
    }
  }

  @override
  void dispose() {
    for (var node in widget.nodes) {
      node.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      isKeyboardVisible = widget.nodes.any((node) => node.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);

    return SingleChildScrollView(
      controller: scrollController,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 300),
        tween: Tween<double>(
          begin:  375.sp,
          end: isKeyboardVisible
              ? 320.sp
              : 375.sp,
        ),
        builder: (context, height, child) => Container(
          height: height,
          width:  double.infinity,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}