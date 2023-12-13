import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:auto_route/auto_route.dart';
import 'package:clackbox/common/constants/app_color_scheme.dart';
import 'package:clackbox/common/constants/height_spacer.dart';
import 'package:clackbox/common/enum/state_status_enum.dart';
import 'package:clackbox/common/global_widgets/snakbar_widget.dart';
import 'package:clackbox/common/routes/app_router.dart';
import 'package:clackbox/features/Auth/data/models/register_model.dart';
import 'package:clackbox/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:clackbox/features/Auth/presentation/widgets/loading_widget.dart';
import 'package:clackbox/features/onboarding/presentation/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  models.User? loggedInUser;
  late final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // Future<void> login(String email, String password) async {
  //   await widget.account.createEmailSession(email: email, password: password);
  //   final user = await widget.account.get();
  //   setState(() {
  //     loggedInUser = user;
  //   });
  // }

  // Future<void> register(String email, String password, String name) async {
  //   // loading circle
  //   showDialog(
  //     context: context,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   // konfirmasi passwordnya sama
  //   if (_passwordController.text != _confirmPasswordController.text) {
  //     //loading circle
  //     Navigator.pop(context);
  //     // error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Password tidak sama"),
  //       ),
  //     );
  //   }
  //   await widget.account.create(
  //       userId: ID.unique(), email: email, password: password, name: name);
  //   await login(email, password);
  // }

  // Future<void> logout() async {
  //   await widget.account.deleteSession(sessionId: 'current');
  //   setState(() {
  //     loggedInUser = null;
  //   });
  // }

  // //register user method
  // Future<void> registerUser() async {
  //   // loading circle
  //   showDialog(
  //     context: context,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   // konfirmasi passwordnya sama
  //   if (_passwordController.text != _confirmPasswordController.text) {
  //     //loading circle
  //     Navigator.pop(context);
  //     // error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Password tidak sama"),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        key: _formKey,
        listener: _authBlocListener,
        bloc: _authBloc,
        builder: (context, state) {
          if (state.stateStatus == StateStatus.loading) {
            return LoadingWidget();
          }
          return Container(
            key: _formKey,
            width: double.infinity,
            height: double.infinity,
            // color: Color(lightColorScheme.background.value),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                    child: Image(
                      image: const AssetImage(
                        'assets/onboard/CB-logo-outline-white.png',
                      ),
                      width: 100.w,
                      height: 100.h,
                      color: Color(darkColorScheme.primary.value),
                    ),
                  ),
                  HeightSpacer(height: 10.h),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Signup to your account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  HeightSpacer(height: 100.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        HeightSpacer(height: 5.h),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        HeightSpacer(height: 5.h),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          obscureText: true,
                        ),
                        HeightSpacer(height: 5.h),
                        TextField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: 'Confirm your password',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        HeightSpacer(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Already have an account? Login Here',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        HeightSpacer(height: 50.h),
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              _register(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(darkColorScheme.primary.value),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.defualtSnackBar(state.errorMessage, context);
    }

    if (state.userModel != null) {
      SnackBarUtils.defualtSnackBar('Success!', context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const OnBoardingPage()),
          ModalRoute.withName('/'));
    }
  }

  void _register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        AuthRegisterEvent(
          registerModel: RegisterModel(
            email: _emailController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
            name: _nameController.text,
          ),
        ),
      );
    }
  }
}
