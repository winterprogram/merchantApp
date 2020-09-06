import 'dart:async';

class Validator {
  static String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  static RegExp regExp = new RegExp(patttern);
  final validateMobileNo = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobileNo, sink) {
    if (mobileNo.length != 10) {
      sink.addError('please enter 10 digit number!');
    } else if (!regExp.hasMatch(mobileNo)) {
      sink.addError('Special characters are not allowed!');
    } else {
      sink.add(mobileNo);
    }
  });

  final validateOtp =
      StreamTransformer<String, String>.fromHandlers(handleData: (otp, sink) {
    if (otp.length < 4) {
      sink.addError('Length of otp must be 4 characters!');
    } else {
      sink.add(otp);
    }
  });
}
