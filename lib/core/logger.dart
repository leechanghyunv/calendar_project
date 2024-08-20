

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container){
    print('Updated : $provider\nprevious : $previousValue\nnew: $newValue ');
  }
}