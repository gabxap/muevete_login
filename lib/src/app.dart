import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muevete/generated/gen_colors.g.dart';
import 'package:muevete/src/bloc/auth_cubit.dart';
import 'package:muevete/src/navigation/routes.dart';
import 'package:sizer/sizer.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color.fromRGBO(71, 24, 173, .1),
    100: Color.fromRGBO(71, 24, 173, .2),
    200: Color.fromRGBO(71, 24, 173, .3),
    300: Color.fromRGBO(71, 24, 173, .4),
    400: Color.fromRGBO(71, 24, 173, .5),
    500: Color.fromRGBO(71, 24, 173, .6),
    600: Color.fromRGBO(71, 24, 173, .7),
    700: Color.fromRGBO(71, 24, 173, .8),
    800: Color.fromRGBO(71, 24, 173, .9),
    900: Color.fromRGBO(71, 24, 173, 1),
  };
  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.unlogged, (route) => false);
        } else if (state is AuthSignedIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.logged, (route) => false);
        } else if (state is AuthSigningIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.splash, (route) => false);
        } else if (state is AuthError) {
          CoolAlert.show(
              context: _navigatorKey.currentContext!,
              type: CoolAlertType.error,
              title: '',
              widget: Column(
                children: [
                  Text(
                    '¡Error!',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    state.message,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ],
              ),
              confirmBtnColor: EasyColors.purple,
              confirmBtnTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Helvetica',
                  fontSize: 12.sp,
                  color: Colors.white));
        }
      },
      child: MyApp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Múevete',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          disabledColor: Colors.grey,
          primarySwatch: MaterialColor(4282849453, color),
          hintColor: Colors.grey,
        ),
        onGenerateRoute: Routes.routes,
      );
    });
  }
}
