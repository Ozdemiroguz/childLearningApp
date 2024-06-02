//register state ile register provider 

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/features/test/test_state.dart';

import '../home/domain/models/charging_point.dart';

final testProvider = NotifierProvider.autoDispose<_TestNotifier, TestState>(
  _TestNotifier.new,
);

class _TestNotifier extends AutoDisposeNotifier<TestState> {
  @override
  TestState build() {
    Future(() => init());
    return TestState.initial();
  }


  //test değerleini kontrol et 
  void onChangedTestBool1(bool testbool1) {
    state = state.copyWith(testbool1: testbool1);
  }
  void onChangedTestBool2(bool testbool2) {
    state = state.copyWith(testbool2: testbool2);
  }
  void onChangedTestBool3(bool testbool3) {
    state = state.copyWith(testbool3: testbool3);
  }
  void onChangedTestString(String teststring) {
    state = state.copyWith(teststring: teststring);
  }
  void onChangedTestString2(String teststring2) {
    state = state.copyWith(teststring2: teststring2);
  }
  void onChangedTestString3(String teststring3) {
    state = state.copyWith(teststring3: teststring3);
  }

  void onChangedTestInt(int testint) {
    state = state.copyWith(testint: testint);
  }
  void onChangedTestInt2(int testint2) {
    state = state.copyWith(testint2: testint2);
  }
  void onChangedTestInt3(int testint3) {
    state = state.copyWith(testint3: testint3);
  }
  Future<void> init() async {
    onChangedChargingPointList();
  }
  

  void onChangedChargingPointList() {
    state = state.copyWith(charginPoinstList: [
    ChargingPoint(
      name: "Büfe ",
      distance: "2 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
  ],);
  }


 


}
