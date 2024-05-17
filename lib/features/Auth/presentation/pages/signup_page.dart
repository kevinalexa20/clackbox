import 'package:appwrite/models.dart' as model;
import 'package:auto_route/auto_route.dart';
import 'package:clackbox/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../auth.dart';

@RoutePage()
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  model.User? loggedInUser;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
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
      body: isLoading
          ? const Loader()
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                        child: Image(
                          image: const AssetImage(
                            'assets/onboard/CB-logo-outline-white.png',
                          ),
                          width: 100.w,
                          height: 100.h,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    HeightSpacer(height: 10.h),
                    const Text(
                      'Welcome!',
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
                    HeightSpacer(height: 70.h),
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
                          // TextField(
                          //   controller: _confirmPasswordController,
                          //   decoration: InputDecoration(
                          //     hintText: 'Confirm your password',
                          //     hintStyle: const TextStyle(
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //   ),
                          // ),
                          // HeightSpacer(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.router.push(const LoginRoute());
                                },
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
                          HeightSpacer(height: 20.h),
                          SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                onSignUp();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                            ),
                          ),
                          HeightSpacer(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Or signup with',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                          HeightSpacer(height: 20.h),
                          //Register with google
                          SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                // _authBloc.add(OAuth2LoginEvent(provider: 'google'));
                                // _loginWithGoogle();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/google-icon.png',
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                  WidthSpacer(width: 10.w),
                                  Text(
                                    'Google',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
