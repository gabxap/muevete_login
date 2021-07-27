import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muevete/src/app.dart';
import 'package:muevete/src/bloc/auth_cubit.dart';
import 'package:muevete/src/bloc/unlogged_form_cubit.dart';
import 'package:muevete/src/repository/implementation/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<UnloggedFormCubit>(
      create: (context) => UnloggedFormCubit(),
    ),
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(AuthRepository())..init(),
    ),
  ], child: MyApp.create()));
}
