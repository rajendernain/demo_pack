import 'package:api_projects/bloc/login_bloc.dart';
import 'package:api_projects/common/shared_pref.dart';
import 'package:api_projects/constants/routes.dart';
import 'package:api_projects/repo/login_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/login_bloc.dart';
import '../common/common.dart';
import '../models/login_request_model.dart';
import '../widgets/filled_button_widget.dart';
import '../widgets/label_password_textfield.dart';
import '../widgets/lable_textfield_widget.dart';
import '../widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _emailTextFieldValue = '';
  String _passwordTextFieldValue = '';

  @override
  Widget build(BuildContext context) {
    context.read<LoginBloc>().add(TextFieldTapped());

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(child: _body(context)),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
        child: BlocListener<LoginBloc, LoginState>(
            listener: (BuildContext context, state) async {
              //display error message in toast on success login and redirect to home screen
              if (state is LoginSuccess) {
               toast(state.message, Colors.green);
                Navigator.pushReplacementNamed(context, Routes.homeRoute,
                    arguments: LoginRequestModel(
                        name: _emailTextFieldValue, password: _passwordTextFieldValue));
              }
              //display error message in toast if error occor
              if(state is LoginErrorState){
                toast(state.errorMessage, Colors.red);
              }
              //check event when login button pressed
              if (state is LoginButtonPressed) {
                FocusScope.of(context).unfocus();
              }
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _logoImage(),
                      _loginTitle(),
                      _form(),
                      _loginButton(context),
                      vSpace(20),
                      _registerHere()
                    ]))));
  }

  Widget _logoImage() {
    return Center(
        child: SizedBox(height: 57.63, width: 42.63, child: Image.asset("assets/logo.png")));
  }

  Widget _loginTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      vSpace(45),
      const Center(child: TextWidget("Login", size: 30, weight: FontWeight.bold)),
      const Center(
        child: TextWidget("Fill the below details to continue", size: 16, weight: FontWeight.w300),
      )
    ]);
  }

  Widget _registerHere() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Need an account?  ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'Register here',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle tap on 'here'
                  print('Clicked on "here"');
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _form() {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, LoginState state) {
    return Column(children: [
      vSpace(30),
      LabelTextFieldWidget(
          formKey: _emailFormKey,
          label: "Email",
          errorMessage: context.watch<LoginBloc>().emailErr,
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (val) {
            _emailTextFieldValue = val;
            context.read<LoginBloc>().add(TextFieldTapped());
          },
          prefixIconConstraints: const BoxConstraints(maxHeight: 50, maxWidth: 75)),
      vSpace(30),
      LabelPasswordTextfieldWidget(
        formKey: _passwordFormKey,
        label: "Password",
        errorMessage: context.watch<LoginBloc>().passwordErr,
        isObscure: true,
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(30)],
        onChanged: (val) {
          _passwordTextFieldValue = val;
          // context
          //     .read<ChangePasswordBloc>()
          //     .changeOldPasswordErr;
          // return null;
        },
      ),
    ]);
     });
  }

  Widget _loginButton(BuildContext context) {
    return Column(children: [
      vSpace(30),
      FilledButtonWidget(
          onSubmit: () async {
            context
                .read<LoginBloc>()
                .add(LoginTapped(_emailTextFieldValue, _passwordTextFieldValue));
          },
          text: "Login",
          elevated: 0)
    ]);
  }

  Widget _buildButton() {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: const Color(0xffff69b4),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
