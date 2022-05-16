import 'package:flutter_riverpod/flutter_riverpod.dart';

final balanceStateProvider = StateNotifierProvider((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(1000);

  void increment(int value) => state += value;
  void decrement(int value) => state -= value;
}