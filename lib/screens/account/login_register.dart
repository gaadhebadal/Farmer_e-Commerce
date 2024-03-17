// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:grocery_app/controllers/firebase_users.dart';
// import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
//
// import '../../common_widgets/app_text.dart';
// import '../../styles/colors.dart';
//
// class LoginPage extends StatefulWidget {
//   // const LoginPage({super.key});
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   String? errorMessage = "";
//   bool isLogin = true;
//
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   final TextEditingController _controllerFirstName = TextEditingController();
//   final TextEditingController _controllerLastName = TextEditingController();
//   final TextEditingController _controllerPhone = TextEditingController();
//
//   Future<void> signInWithEmailPassword() async {
//     try {
//       await Auth().signEmailPassword(
//           email: _controllerEmail.text, password: _controllerPassword.text);
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }
//
//   Future<void> createUserWithEmailAndPassword() async {
//     try {
//       await Auth().createEmailPassword(
//           email: _controllerEmail.text,
//           password: _controllerPassword.text,
//           firstName: _controllerFirstName.text,
//           lastName: _controllerLastName.text,
//           phone: _controllerPhone.text);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//       setState(() {
//         errorMessage = e.message;
//       });
//
//       showDialog(
//           context: context,
//           builder: (context) {
//             return Center(
//               child: Text(e.message.toString()),
//             );
//           });
//     }
//   }
//
//   Widget _title() {
//     return const Text("Firebase Auth");
//   }
//
//   Widget _entryField(String title, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: title,
//         labelStyle: TextStyle(
//           color: AppColors.darkGrey,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: AppColors.darkGrey,
//             width: 2.0,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: AppColors.primaryColor,
//             width: 2.0,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: AppColors.primaryColor,
//             width: 2.0,
//           ),
//         ),
//       ),
//       style: _textFieldStyle,
//     );
//   }
//
//   Widget _errorMessage() {
//     return Text(errorMessage == '' ? '' : 'Ooops...  $errorMessage');
//   }
//
//   Widget _submitButton() {
//     return ElevatedButton(
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)),
//         onPressed:
//             isLogin ? signInWithEmailPassword : createUserWithEmailAndPassword,
//         child: AppText(text: isLogin ? 'Login' : "Register"));
//   }
//
//   Widget skipButton() {
//     return ElevatedButton(
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)),
//         onPressed: () => {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => DashboardScreen()))
//             },
//         child: AppText(text: "Skip"));
//   }
//
//   Widget _loginOrRegisterButton() {
//     return TextButton(
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
//             foregroundColor: MaterialStateProperty.all(AppColors.darkGrey)),
//         onPressed: () => {
//               setState(
//                 () => isLogin = !isLogin,
//               )
//             },
//         child: AppText(text: isLogin ? "Register instead" : "Login instead"));
//   }
//
//   Widget getAppIcon() {
//     String iconPath = "assets/icons/app_icon.svg";
//     return SvgPicture.asset(
//       iconPath,
//       alignment: Alignment.center,
//       color: AppColors.darkGrey,
//     );
//   }
//
//   TextStyle _textFieldStyle = TextStyle(
//     color: Colors.black,
//     fontSize: 18,
//     fontWeight: FontWeight.normal,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: _title(),
//       // ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Center(
//             heightFactor: 1.0,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 !isLogin
//                     ? Column(
//                         children: [
//                           getAppIcon(),
//                           SizedBox(height: 15),
//                           _entryField("First Name", _controllerFirstName),
//                           SizedBox(height: 10),
//                           _entryField("Last Name", _controllerLastName),
//                           SizedBox(height: 10),
//                           _entryField("email", _controllerEmail),
//                           SizedBox(height: 10),
//                           _entryField("password", _controllerPassword),
//                           SizedBox(height: 10),
//                           _errorMessage(),
//                           SizedBox(height: 10),
//                           _submitButton(),
//                           SizedBox(height: 10),
//                           _loginOrRegisterButton()
//                         ],
//                       )
//                     : Column(children: [
//                         getAppIcon(),
//                         SizedBox(height: 15),
//                         _entryField("email", _controllerEmail),
//                         SizedBox(height: 10),
//                         _entryField("password", _controllerPassword),
//                         SizedBox(height: 10),
//                         _errorMessage(),
//                         SizedBox(height: 10),
//                         _submitButton(),
//                         SizedBox(height: 10),
//                         _loginOrRegisterButton(),
//                       ]),
//                 Divider(
//                   thickness: 2,
//                 ),
//                 skipButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common_widgets/app_text.dart';
import '../../styles/colors.dart';
import '../dashboard/dashboard_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRegistering = false;
  String _errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void _authenticate() {
    // Example authentication logic
    if (_isRegistering) {
      // Register user
      if (_controllerEmail.text.isEmpty || _controllerPassword.text.isEmpty) {
        setState(() {
          _errorMessage = 'Please enter email and password.';
        });
        return;
      }
      // Implement your registration logic here
      // For example, you can create a new user account
      // and navigate to the dashboard screen
    } else {
      // Login user
      if (_controllerEmail.text.isEmpty || _controllerPassword.text.isEmpty) {
        setState(() {
          _errorMessage = 'Please enter email and password.';
        });
        return;
      }
      // Implement your login logic here
      // For example, you can validate the user's credentials
      // and navigate to the dashboard screen
    }
  }

  void _toggleRegisterMode() {
    setState(() {
      _isRegistering = !_isRegistering;
      _errorMessage = ''; // Clear error message when toggling modes
    });
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      ),
      onPressed: _authenticate,
      child: AppText(text: _isRegistering ? 'Register' : 'Login'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: _toggleRegisterMode,
      child: AppText(text: _isRegistering ? 'Login instead' : 'Register instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/app_icon.svg",
                alignment: Alignment.center,
                color: AppColors.darkGrey,
              ),
              SizedBox(height: 15),
              _entryField("Email", _controllerEmail),
              SizedBox(height: 10),
              _entryField("Password", _controllerPassword),
              SizedBox(height: 10),
              _errorMessage.isNotEmpty ? Text(_errorMessage) : SizedBox(),
              SizedBox(height: 10),
              _submitButton(),
              SizedBox(height: 10),
              _loginOrRegisterButton(),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                },
                child: AppText(text: "Skip"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(
          color: AppColors.darkGrey,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.darkGrey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
