import 'dart:async';
import 'dart:ui';

class Debouncer {
  late Duration delay;
  Timer? timer;
  Debouncer({required this.delay});

  void run(VoidCallback action) {
    timer?.cancel();
    timer = Timer(delay, action);
  }
}
