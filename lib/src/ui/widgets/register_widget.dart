import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:muevete/generated/gen_colors.g.dart';
import 'package:muevete/src/bloc/auth_cubit.dart';
import 'package:muevete/src/bloc/unlogged_form_cubit.dart';
import 'package:muevete/src/ui/widgets/custom_btn.dart';
import 'package:sizer/sizer.dart';

import 'auth_card.dart';

class RegisterWidget extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  final nameValidator =
      RequiredValidator(errorText: 'escribe tu nombre completo');
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'escribe un correo'),
    EmailValidator(errorText: 'ingresa un correo válido')
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'escribe una contraseña'),
    MinLengthValidator(8,
        errorText: 'la contrasaña debe tener al menos 8 cáracteres'),
  ]);

  final _nameController = TextEditingController(text: "");
  final _emailController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final hidePassword = useState(true);
    return AuthCard(
      forLogin: false,
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          Text(
            'Registrarse',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Helvetica',
                fontSize: 23.sp),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nombre completo',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 11.sp,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  style: TextStyle(fontFamily: 'OpenSans'),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'nombre',
                  ),
                  validator: nameValidator,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Correo',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 11.sp,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(fontFamily: 'OpenSans'),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'email@email.com',
                  ),
                  validator: emailValidator,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Contraseña',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 11.sp,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    TextFormField(
                      controller: _passwordController,
                      obscureText: hidePassword.value,
                      obscuringCharacter: '*',
                      style: TextStyle(fontFamily: 'OpenSans'),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: '*****************',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: passwordValidator,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.eye,
                          color: (hidePassword.value)
                              ? Colors.grey
                              : EasyColors.purple,
                        ),
                        onPressed: () {
                          hidePassword.value = !hidePassword.value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomButton(
                  text: 'Registrarse',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      BlocProvider.of<AuthCubit>(context)
                          .createUserWithEmailAndPassword(email, password);
                      BlocProvider.of<UnloggedFormCubit>(context)
                          .emit(LoginForm());
                    }
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Ya tienes una cuenta?',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    TextButton(
                      onPressed: () =>
                          BlocProvider.of<UnloggedFormCubit>(context)
                              .emit(LoginForm()),
                      child: Text(
                        'Inicia Sesión',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
