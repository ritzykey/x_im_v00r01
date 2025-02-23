import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';
import 'package:x_im_v00r01/product/state/view_model/product_state.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

@RoutePage()
class NoConnectionView extends StatelessWidget {
  const NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'asset/images/10_Connection Lost.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 25,
                    color: const Color(0xFF59618B).withOpacity(0.17),
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  if (context.read<ProductViewModel>().state.networkStatus ==
                      NetworkStatus.connected) {
                    context.router.replaceAll([const NavigationRoute()]);
                    return;
                  }
                },
                child: Text(
                  'retry'.toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
