import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/core/services/api_service.dart';
import 'package:mersal/features/auth/manager/auth_state.dart';

import '../../../../../consts.dart';
import '../../../../splash/manager/user_data_cubit.dart';
import '../../../manager/auth_cubit.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key, required this.focusNode,});
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    var userDataCubit = BlocProvider.of<UserDataCubit>(context);
    return BlocListener<AuthCubit,AuthState>(
      listener: (context,state) async {
        if(state is AuthSuccess) {
          ApiService.updateHeader();
          await userDataCubit.getReqData().then((x) => Navigator.pop(context));
        }
        if(state is AuthFailure) customDialog(context: context, message: state.errorMessage);
      },
      child: TextFormField(
        validator: (x){
          if(x==null || x.isEmpty || x.length!=4){
            return '';
          }else {
            return null;
          }
        },
        onSaved: (x)=>authCubit.confirmOtp(code: x!),
        focusNode: focusNode,
        textAlign: TextAlign.center,
        maxLength: 4,
        style: const TextStyle(letterSpacing: 10,fontWeight: FontWeight.w900,fontSize: 25),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontFamily: fontFamily),
          border: border(),
          focusedBorder: border(),
          focusColor: Colors.black12,
          enabledBorder: border(),
            filled: true,fillColor: const Color(0xfff6f6f6)
        ),
      ),
    );
  }

  border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 0, color: Colors.transparent));
  }
}
