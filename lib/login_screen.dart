// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 5, 46, 79),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildCard(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: size.width * 0.9,
      height: size.height * 0.8,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(spreadRadius: 10, color: Colors.lightBlue)],
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(255, 133, 195, 223),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.01),
                  Text.rich(
                    TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 24.0,
                        color: const Color(0xFF21899C),
                        letterSpacing: 2.0,
                      ),
                      children: const [
                        TextSpan(
                            text: 'LOGIN',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.purple)),
                        TextSpan(
                            text: 'PAGE',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    child: Image(
                        image: AssetImage("assets/digital.png"),
                        color: Colors.white,
                        fit: BoxFit.fitHeight),
                    // Text("HI"),
                    height: 100,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildEmailFormField(size),
                  SizedBox(height: size.height * 0.02),
                  buildPasswordFormField(size),
                  SizedBox(height: size.height * 0.01),
                  buildRememberMeSection(size),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  signInButton(size),
                  SizedBox(height: size.height * 0.02),
                  // buildNoAccountText(),
                  SizedBox(height: size.height * 0.02),
                  // google_facebookButton(size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmailFormField(Size size) {
    return SizedBox(
      height: size.height / 12,
      child: TextFormField(
        controller: emailController,
        style: GoogleFonts.inter(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter Your email',
          hintStyle: GoogleFonts.inter(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          fillColor: emailController.text.isNotEmpty
              ? Colors.transparent
              : const Color.fromRGBO(248, 247, 251, 1),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: emailController.text.isEmpty
                  ? Colors.transparent
                  : const Color.fromARGB(255, 5, 46, 79),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          prefixIcon: Icon(Icons.email,
              color: const Color(0xFF151624).withOpacity(0.5), size: 16),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color.fromARGB(255, 5, 46, 79),
            ),
            child: emailController.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
    );
  }

  Widget buildPasswordFormField(Size size) {
    return SizedBox(
      height: size.height / 12,
      child: TextFormField(
        controller: passController,
        style: GoogleFonts.inter(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter Your Password',
          hintStyle: GoogleFonts.inter(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          fillColor: passController.text.isNotEmpty
              ? Colors.transparent
              : const Color.fromRGBO(248, 247, 251, 1),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: passController.text.isEmpty
                  ? Colors.transparent
                  : Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          prefixIcon: Icon(Icons.lock_outline_rounded,
              color: const Color(0xFF151624).withOpacity(0.5), size: 16),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Colors.black,
            ),
            child: passController.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 13,
                  ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }

  Widget buildRememberMeSection(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
              value: rememberMe,
              activeColor: const Color(0xFF21899C),
              onChanged: (value) {
                setState(() {
                  rememberMe = value!;
                });
              },
            ),
            Text(
              'Remember Me',
              style: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: const Color(0xFF151624).withOpacity(0.5)),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.inter(fontSize: 14.0, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget signInButton(Size size) {
    return SizedBox(
      height: size.height / 13,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            String email = emailController.text;
            String password = passController.text;
          }
        },
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 5, 46, 79),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Text(
          'Sign in',
          style: GoogleFonts.inter(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
