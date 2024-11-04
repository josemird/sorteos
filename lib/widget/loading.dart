import 'package:flutter/material.dart';
import 'package:shoppy3/config/theme/theme.dart';
import 'package:shoppy3/widget/containers.dart';

class Loading extends StatelessWidget {

  final bool loading;
  final Widget child;

  const Loading({
    super.key,
    required this.loading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    if (!loading) return child;

    return Stack(

      children: [

        child,

        Opacity(
          opacity: 0.3,
          child: Container(
            color: COLOR_TEXT,
          ),
        ),

        Center(

          child: Container(

            height: 90,
            width: 90,

            decoration: BoxDecoration(
                color: COLOR_BACKGROUND_SECONDARY,
                borderRadius: BorderRadiusAllCustom(),
                boxShadow: [BoxShadowCustom()]
            ),

            child: const Center(child: CircularProgressIndicator(color: COLOR_ACCENT,)),

          ),

        )
        ,
      ],
    );
  }
}
