import 'package:merchant_app/api/apiresponse.dart';
import 'package:merchant_app/model/universalTest.dart';
import 'package:merchant_app/src/bloc/baseBloc.dart';
import 'package:merchant_app/src/utils/signupValidator.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class SignupBloc extends Object with Validator implements BlocBase {
  final _firstNameController = BehaviorSubject<String>();
  final _otpFieldController = BehaviorSubject<String>();
  final _apiCallStatus = BehaviorSubject<bool>();
  // final _repository = Repository();

  SignupBloc() {
    addApiCallStatus(false);
  }
  //SINK
  Function(String) get firstName => _firstNameController.sink.add;
  Function(String) get addOtp => _otpFieldController.sink.add;
  Function(bool) get addApiCallStatus => _apiCallStatus.sink.add;

  //STREAM
  Stream<String> get userFName =>
      _firstNameController.stream.transform(validateMobileNo);
  // Stream<String> get otp => _otpFieldController.stream.transform(validateOtp);
  // Stream<bool> get apiCallStatus => _apiCallStatus.stream;
  // Stream<bool> get submit => Rx.combineLatest3(
  //     mobileNo, otp, apiCallStatus, (m, c, a) => loginCombiner(m, c, a));

  loginCombiner(String mobileNo, String otp, bool apiCallStatus) {
    //if api call in progress return false else true if mobileno and password is set
    if (apiCallStatus == false && mobileNo != null && otp != null) {
      return true;
    }
    return false;
  }

  Future<ApiResponse<Success>> verifyMobileNumer() async {
    try {
      // final response =
      //     await _repository.verifyMobileNum(_mobileNoFieldController.value);
      // return ApiResponse.complete(response);
    } catch (e) {
      return ApiResponse.error(e);
    }
  }

  // Future<ApiResponse<LoginModel>> loginUser() async {
  //   try {
  //     final loginResponse = await _repository.loginUser(
  //         _mobileNoFieldController.value, _otpFieldController.value);
  //     return ApiResponse.complete(loginResponse);
  //   } catch (e) {
  //     return ApiResponse.error(e);
  //   }
  // }

  dispose() {
    _firstNameController.close();
    _otpFieldController.close();
    _apiCallStatus.close();
  }
}
