import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:muevete/generated/gen_colors.g.dart';
import 'package:muevete/src/bloc/unlogged_form_cubit.dart';
import 'package:muevete/src/ui/widgets/auth_card.dart';
import 'package:muevete/src/ui/widgets/login_widget.dart';
import 'package:muevete/src/ui/widgets/register_widget.dart';
import 'package:sizer/sizer.dart';

class UnloggedPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EasyColors.purple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 100.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Muévete',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Helvetica',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                BlocBuilder<UnloggedFormCubit, UnloggedFormState>(
                  builder: (context, state) {
                    if (state is LoginForm) {
                      return LoginWidget();
                    } else {
                      return RegisterWidget();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
