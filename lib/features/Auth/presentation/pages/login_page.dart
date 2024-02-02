import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final DIContainer diContainer = DIContainer();

  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  void clearText() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        listener: _authBlocListener,
        bloc: _authBloc,
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            // color: Color(lightColorScheme.background.value),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                      child: Image(
                          image: const AssetImage(
                            'assets/onboard/CB-logo-outline-white.png',
                          ),
                          width: 100.w,
                          height: 100.h,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  HeightSpacer(height: 10.h),
                  Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  Text(
                    'Login to your account',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  HeightSpacer(height: 100.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        HeightSpacer(height: 5.h),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        HeightSpacer(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        HeightSpacer(height: 5.h),
                        // Container(
                        //   width: double.infinity,
                        //   height: 50,
                        //   decoration: BoxDecoration(
                        //     color: Theme.of(context).colorScheme.primary,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: TextButton(
                        //     onPressed: () {
                        //       _login(context);
                        //     },
                        //     child: Text(
                        //       'Login',
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineMedium
                        //           ?.copyWith(
                        //             color: Theme.of(context).colorScheme.onPrimary,
                        //           ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              _login(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
      SnackBarUtils.defualtSnackBar('Login Success!', context);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MultiBlocProvider(
      //                 providers: [
      //                   BlocProvider<AuthBloc>(
      //                     create: (BuildContext context) =>
      //                         diContainer.authBloc,
      //                   ),

      //                   // BlocProvider<TodoBloc>(
      //                   //     create: (BuildContext context) =>
      //                   //         diContainer.todoBloc)
      //                 ],
      //                 child: HomePage(
      //                   userModel: state.userModel!,
      //                 ))),
      //     ModalRoute.withName('/'));

      // context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => false);
      context.router.push(HomeRoute());
    }
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        AuthLoginEvent(
          loginModel: LoginModel(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
    clearText();
  }

  Widget _loadingWidget() {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
