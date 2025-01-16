import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:x_im_v00r01/feature/homenew/view/mixin/homenew_view_mixin.dart';
import 'package:x_im_v00r01/feature/homenew/view/widget/HomenewAppBar.dart';
import 'package:x_im_v00r01/feature/homenew/view/widget/HomenewStatusBar.dart';
import 'package:x_im_v00r01/feature/homenew/view/widget/HomenewStoryButton.dart';
import 'package:x_im_v00r01/feature/homenew/view/widget/HomenewText.dart';
import 'package:x_im_v00r01/feature/homenew/view/widget/SearchAndFriend.dart';
import 'package:x_im_v00r01/feature/homenew/view_model/homenew_view_model.dart';
import 'package:x_im_v00r01/feature/homenew/view_model/state/homenew_state.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

@RoutePage()
class HomenewView extends StatefulWidget {
  const HomenewView({super.key});

  @override
  State<HomenewView> createState() => _HomenewViewState();
}

class _HomenewViewState extends BaseState<HomenewView> with HomenewViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homenewViewModel,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
          child: ListView(
            children: [
              const HomenewAppBar(),
              const SizedBox(
                height: 34,
              ),
              const Center(child: HomenewStatusBar()),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: SearchAndFriend(),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocListener<HomenewViewModel, HomenewState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                child:
                    BlocSelector<HomenewViewModel, HomenewState, List<Content>>(
                  selector: (state) {
                    return state.content ??
                        [
                          Content(
                              email: '',
                              fullName: '',
                              id: '',
                              username: '',
                              image: '')
                        ];
                  },
                  builder: (context, state) {
                    return HomenewText(
                      text: state.first.email ?? 'email',
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HomenewStoryButton(
                onOperation: homenewViewModel.fetchUsers,
                width: 335,
                height: 184,
              ),
              const SizedBox(height: 32),
              const Row(
                children: [
                  HomenewText(text: 'Life-changing moments'),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 184,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: HomenewStoryButton(
                        width: 161,
                        height: 184,
                        onOperation: homenewViewModel.fetchUsers,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
