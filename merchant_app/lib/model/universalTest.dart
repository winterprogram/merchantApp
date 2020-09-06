class Success {
  bool success;
  var errorMsg;
  String message;
  String errorCode;
  int statusCode = 0;

  Success({this.success, this.errorMsg, this.message, this.errorCode});

  Success.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMsg = json['error_msg'];
    message = json['message'];
    errorCode = json['error_code'];
  }

  Success.requestNotAuthorized() {
    statusCode = 401;
  }
}

