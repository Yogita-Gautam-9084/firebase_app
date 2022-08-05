import 'package:firebase_use/constants/colors.dart';
import 'package:firebase_use/constants/icons.dart';
import 'package:firebase_use/constants/images.dart';
import 'package:firebase_use/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  void signup() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: 'yogita00gautam@gmail.com', password: '1234578');
    } catch (e) {
      print(e);
    }
  }

  final List items = [
    {
      'icon': IconsConstants.email,
      'title': StringConstants.email,
    },
    {'icon': IconsConstants.password, 'title': StringConstants.password},
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  StringConstants.hello,
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.w500),
                ),
                const Text(
                  StringConstants.yourAccount,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(
                  height: 70,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildListVeiw(
                          icon: items[index]['icon'],
                          title: items[index]['title']);
                    },
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    StringConstants.forgotPassword,
                    style: TextStyle(color: ColorsConstants.mistBlueYourAccount),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    signup();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:100,vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),color: ColorsConstants.blue
                    ),
                    child: Text(StringConstants.signIn),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildListVeiw({required dynamic icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10),
      child: Column(
        children: [
          Card(
            elevation: 10,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: ColorsConstants.black,
                ),
                hintStyle: const TextStyle(
                    color: ColorsConstants.black, fontWeight: FontWeight.w500),
                hintText: title,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
