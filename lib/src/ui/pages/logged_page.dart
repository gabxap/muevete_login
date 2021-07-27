import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muevete/src/bloc/auth_cubit.dart';
import 'package:muevete/src/ui/widgets/custom_btn.dart';

class LoggedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Muévete'),
          brightness: Brightness.dark,
        ),
        body: Column(
          children: [
            Text('iniciaste sesion.'),
            CustomButton(
              text: 'Cerrar sesión',
              onTap: () => BlocProvider.of<AuthCubit>(context).signOut(),
            )
          ],
        ));
  }
}
