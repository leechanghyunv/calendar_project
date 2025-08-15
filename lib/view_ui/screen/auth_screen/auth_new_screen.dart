import '../../../core/export_package.dart';
import 'auth_default_screen.dart';

class NewAuthScreen extends HookConsumerWidget {
  const NewAuthScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final _formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final _scrollController = useScrollController();
    return AuthDefaultScreen(
      scrollController: _scrollController,
      authKey: _formKey,
      widget: Column(
        children: [

        ],
      ),

    );
  }
}
