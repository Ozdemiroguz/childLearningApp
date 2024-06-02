
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rota/features/home/domain/models/charging_point.dart';


part 'test_state.freezed.dart';

@freezed
class TestState with _$TestState {
  factory TestState({
    required bool testbool1,
    required bool testbool2,
    required bool testbool3,
    required String teststring,
    required String teststring2,
    required String teststring3,
    required int testint,
    required int testint2,
    required int testint3,
    required List<ChargingPoint> charginPoinstList, 

    
  }) = _TestState;

  factory TestState.initial() => TestState(
        testbool1: false,
        testbool2: false,
        testbool3: false,
        teststring: "",
        teststring2: "",
        teststring3: "",
        testint: 0,
        testint2: 0,
        testint3: 0,
        charginPoinstList: [],
        

      );


  const TestState._();


}
