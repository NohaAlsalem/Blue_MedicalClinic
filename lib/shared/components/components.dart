import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';


void navigateTo(widget , context) =>Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));
void navigateAndFinish(widget , context) => Navigator.pushAndRemoveUntil(
    context,
     MaterialPageRoute(builder: (context) => widget),
        (route) => false);
Widget defaultTextFormField(
{
  @required bool? isPassword,
  @required TextInputType? keyBoardType,
  FormFieldValidator<String>? validate,
  @required TextEditingController? controller,
  @required String? label,
  @required String? hint,
  @required IconData? prefixIcon,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
   IconData? suffixIcon,
  VoidCallback? suffixIconFun,
  TextInputAction? textInputAction = TextInputAction.next,
  bool isClickable = true,
}
    ) => TextFormField(
  textInputAction: textInputAction,
  keyboardType: keyBoardType,
  obscureText: isPassword!,
  autovalidateMode: AutovalidateMode.onUserInteraction,
  validator: validate,
  controller: controller,
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: '$hint',
    hintStyle: const TextStyle(color : Colors.grey),
    labelText: label,
    prefixIcon: Icon(prefixIcon),
    suffixIcon: IconButton( onPressed : suffixIconFun, icon: Icon(suffixIcon),),
  ),
  onChanged: onChanged,
  onTap: onTap,
);

Widget defaultMaterialButton(
{
  double? width,
  Color? color,
  Color? textColor = Colors.white,
  @required  String? buttonText,
  double? height,
  @required VoidCallback? function,
  Color? containerColor = const Color(0xAA1a76b5),
}
    ) => Container(
  height : 50,
  width: width,
  margin: const EdgeInsets.symmetric(horizontal: 50),
  decoration: BoxDecoration(
    // gradient: const LinearGradient(
    //     colors: [
    //       Color(0xff93f0fc),
    //       Color(0xAAf3e5f5),
    //     ]),
  //  color: const Color(0xAA1a76b5),
    color : containerColor,
    borderRadius: BorderRadius.circular(10),
  ),
  child :  MaterialButton(
    onPressed: function,
    height: height,
    color: color,
    child: Text(
      buttonText! ,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style :  TextStyle(
        fontSize: 20,
        color : textColor,
      ),
    ),
  ),
);

Widget defaultTextButton(
{
  @required VoidCallback? function,
  @required  String? buttonText,
  @required double? fontSize,
}
    ) =>
    TextButton(
        onPressed: function,
        child: Text('$buttonText',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        style:  TextStyle(
          color: const Color(0xAA1a76b5),
          fontSize: fontSize,
        ),),
    );
