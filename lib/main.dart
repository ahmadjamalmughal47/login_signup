import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _txt = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var height2 = 60.0;
  bool showEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Log in or sign up to Airbnb",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                    Padding(padding: EdgeInsets.all(10)),
                    Visibility(
                      visible: showEmail,
                      child: Container(
                        height: height2,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "خدارا کچھ لکھیے تو";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ),
                    Visibility(visible: !showEmail, child: Container(
                      height: height2,
//                    padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CountryCodePicker(
                        showDropDownButton: true,
                        showOnlyCountryWhenClosed: true,
                        initialSelection: "Pakistan",
                        showFlag: false,
                        onChanged: (value) {
                          _txt.text = value.dialCode;
                        },
                        onInit: (value) {
                          _txt.text = value.dialCode;
                        },
                      ),
                    )),
                    Visibility(
                      visible: !showEmail,
                      child: Container(
                        height: height2,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "خدارا کچھ لکھیے تو";
                            }
                            return null;
                          },
                          controller: _txt,
                          keyboardType: TextInputType.number,
                          showCursor: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Phone number",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Visibility(
                      visible: !showEmail,
                      child: Text(
                        "We'll call or text you to confirm your number. Standard message and data rates apply.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                      height: height2,
                      child: ElevatedButton(
                        child: Text("Continue"),
                        onPressed: () {},
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Text(
                      "or",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: height2,
                        child: TextButton.icon(
                          icon: Icon(showEmail ? Icons.email : Icons.phone),
                            onPressed: () {
                              setState(() {
                                showEmail = !showEmail;
                              });
                            },
                            label: Text(
                                showEmail
                                    ? "Continue with mail"
                                    : "Continue with Phone",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700])
                            ),
                        )
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: height2,
                        child: TextButton.icon(
                          icon: ImageIcon(AssetImage("assets/images/facebook.png")),
                          onPressed: () {
                            setState(() {
                            });
                          },
                          label: Text("Continue with Facebook",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700])
                          ),
                        )
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: height2,
                        child: TextButton.icon(
                          icon: ImageIcon(AssetImage("assets/images/google.png")),
                          onPressed: () {
                            setState(() {
                            });
                          },
                          label: Text("Continue with Google",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700])
                          ),
                        )
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: height2,
                        child: TextButton.icon(
                          icon: ImageIcon(AssetImage("assets/images/apple.png")),
                          onPressed: () {
                            setState(() {
                            });
                          },
                          label: Text("Continue with Apple",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700])
                          ),
                        )
                    ),
                  ]),
            ),
          ),
        ));
  }
}
