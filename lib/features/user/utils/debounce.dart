import 'dart:async';
import 'dart:ui';

import 'package:injectable/injectable.dart';

@Injectable()
class Debounce {
  Timer? _debounceTimer;
  // ignore: constant_identifier_names
  static const int DEBOUNCE_DURATION_IN_MILLISECOND = 500;

  void call(
    VoidCallback callback, {
    Duration duration = const Duration(
      milliseconds: DEBOUNCE_DURATION_IN_MILLISECOND,
    ),
  }) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(duration, callback);
  }

  void cancel() {
    _debounceTimer?.cancel();
  }
}
