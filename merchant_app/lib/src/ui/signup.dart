import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:merchant_app/src/bloc/signUpBloc.dart';
import 'package:merchant_app/src/ui/homePage.dart';
import 'package:hexcolor/hexcolor.dart';

class Signup extends StatefulWidget {
  final SignupBloc signupBloc;
  Signup({@required this.signupBloc});
  @override
  _SignupState createState() => _SignupState();
}

enum SingingCharacter { Online, Offline }

class _SignupState extends State<Signup> {
  final firstNameController = new TextEditingController();
  final lastNameController = new TextEditingController();
  final mobileController = new TextEditingController();
  final emailIdController = new TextEditingController();
  final pinController = new TextEditingController();
  final outletNameController = new TextEditingController();
  final outletAddressController = new TextEditingController();
  SignupBloc bloc;
  // final pinController = new TextEditingController()
  static String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  // List<DropdownMenuItem<String>> countryName = [
  //   DropdownMenuItem(child: Text("Select One")),
  //   DropdownMenuItem(child: Text("India")),
  //   DropdownMenuItem(child: Text("USA"))
  // ];
  SingingCharacter _character = SingingCharacter.Online;
  String selectedCity = "Select One";
  String selectedCountry = "Select One";
  @override
  void initState() {
    bloc = widget.signupBloc;
    firstNameController.addListener(firstNameValueListener);
    // otpController.addListener();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.orange),
            backgroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Container(height: height, width: width, child: _body(context)),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(),
          SizedBox(height: 24),
          _fName(bloc),
          SizedBox(height: 24),
          _lName(),
          SizedBox(height: 24),
          _mobileNo(),
          SizedBox(height: 24),
          _emailId(),
          SizedBox(height: 24),
          _pin(),
          SizedBox(height: 24),
          _outletName(),
          SizedBox(height: 24),
          _outletAddress(),
          SizedBox(height: 24),
          _country(),
          SizedBox(height: 24),
          _city(),
          SizedBox(height: 24),
          _category(),
          SizedBox(height: 24),
          _signup(),
          SizedBox(height: 24),
          _gotoHome()
        ],
      ),
    );
  }

  Widget _label() {
    return Text(
      "Sign Up",
      style: TextStyle(
          fontSize: 24,
          color: Hexcolor("#FF7E55"),
          fontWeight: FontWeight.bold),
    );
  }

  Widget _fName(SignupBloc bloc) {
    return StreamBuilder(
      stream: bloc.userFName,
      builder: (context, AsyncSnapshot<String> snapShot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fist Name"),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: firstNameController.text.isNotEmpty &&
                        snapShot.hasError == true
                    ? 70
                    : 50,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextFormField(
                    decoration: _decoration(),
                    keyboardType: TextInputType.name,
                    controller: firstNameController,
                    onChanged: (name) {
                      print(name);
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _lName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Last Name"),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return text;
                },
                decoration: _decoration(),
                keyboardType: TextInputType.name,
                controller: lastNameController,
                onChanged: (name) {
                  print(name);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileNo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mobile Number"),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextFormField(
                validator: (text) {
                  RegExp regExp = new RegExp(patttern);
                  if ((text == null || text.isEmpty) &&
                      (!regExp.hasMatch(text))) {
                    return 'Special characters are not allowed!';
                  }
                  return text;
                },
                maxLength: 10,
                minLines: 1,
                keyboardType: TextInputType.number,
                decoration: _decoration(),
                controller: mobileController,
                onChanged: (name) {
                  print(name);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailId() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email ID"),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return text;
                },
                decoration: _decoration(),
                controller: emailIdController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (name) {
                  print(name);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _pin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("PIN"),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return text;
                },
                decoration: _decoration(),
                maxLength: 4,
                controller: pinController,
                keyboardType: TextInputType.number,
                onChanged: (name) {
                  print(name);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _outletName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Outlet Name"),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return text;
                },
                decoration: _decoration(),
                controller: outletNameController,
                keyboardType: TextInputType.name,
                onChanged: (name) {
                  print(name);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _outletAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Outlet Address"),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return text;
                },
                decoration: _decorationAddress(),
                controller: outletAddressController,
                keyboardType: TextInputType.name,
                onChanged: (name) {
                  print(name);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      enabledBorder: new UnderlineInputBorder(
        borderSide: new BorderSide(
          color: Colors.grey[100],
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[100],
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[100]),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[100],
        ),
      ),
    );
  }

  InputDecoration _decorationAddress() {
    return InputDecoration(
      contentPadding:
          new EdgeInsets.symmetric(vertical: 35.0, horizontal: 35.0),
      enabledBorder: new UnderlineInputBorder(
        borderSide: new BorderSide(
          color: Colors.grey[100],
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[100],
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[100]),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[100],
        ),
      ),
    );
  }

  Widget _country() {
    return Row(
      children: [
        Text("Country"),
        Expanded(child: Container()),
        Container(
          width: 170,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: Colors.grey[400],
                  style: BorderStyle.solid,
                  width: 0.80)),
          child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: DropdownButton<String>(
                value: selectedCity,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),
                onChanged: (String newValue) {
                  setState(() {
                    selectedCity = newValue;
                  });
                },
                items: <String>['Select One', 'India', 'USA', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ),
      ],
    );
  }

  Widget _city() {
    return Row(
      children: [
        Text("City"),
        Expanded(child: Container()),
        Container(
          width: 170,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: Colors.grey[400],
                  style: BorderStyle.solid,
                  width: 0.80)),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
              value: selectedCity,
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              onChanged: (String newValue) {
                setState(() {
                  selectedCity = newValue;
                });
              },
              items: <String>['Select One', 'Mumbai', 'Thane', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
          ),
        ),
      ],
    );
  }

  Widget _category() {
    return Row(
      children: [
        Text("Category"),
        Expanded(child: Container()),
        Column(
          children: [
            Container(
              width: 160,
              child: Row(
                children: [
                  Radio(
                    activeColor: Colors.orange,
                    value: SingingCharacter.Online,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Text('Online'),
                ],
              ),
            ),
            Container(
              width: 160,
              child: Row(
                children: [
                  Radio(
                    activeColor: Colors.orange,
                    value: SingingCharacter.Offline,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Text('Offline'),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _signup() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: Hexcolor("#FF7E55"), borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        onTap: () {
          print("test done");
        },
        child: Center(
          child: Text("Sign Up",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.6,
                  fontSize: 16)),
        ),
      ),
    );
  }

  Widget _gotoHome() {
    return Container(
      // decoration: _loginPage(),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              child: Center(
            child: RichText(
                text: TextSpan(
                    text: "Aleady have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: ' Login here',
                      style: TextStyle(color: Hexcolor("#FF7E55")),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        })
                ])),
          ))
        ],
      ),
    );
  }

  firstNameValueListener() {
    bloc.firstName(firstNameController.text);
  }
}
