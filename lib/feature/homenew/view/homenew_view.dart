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
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

@RoutePage()
class HomenewView extends StatefulWidget {
  const HomenewView({super.key});

  @override
  State<HomenewView> createState() => _HomenewViewState();
}

class _HomenewViewState extends BaseState<HomenewView> with HomenewViewMixin {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homenewViewModel,
      child: Scaffold(
        body: Stack(
          children: [
            /*Positioned.fill(
              child: Image(
                image: AssetImage('asset/translations/pexels1.jpg'),
                fit: BoxFit.cover, // Resmin Stack'e nasıl sığacağını belirtir
              ),
            ),*/
            CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Colors.black, // Başlık başlığı rengi
                  expandedHeight: 250,
                  toolbarHeight: 20, // Kapalı halindeki yükseklik
                  leading: SizedBox(),
                  floating: true, // Kaydırıldığında görünmesini sağlar

                  pinned: true,
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image(
                      image: AssetImage('asset/translations/pexels1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverAppBar(
                  forceMaterialTransparency: true,
                  backgroundColor: Colors.white,
                  toolbarHeight: 40,
                  flexibleSpace: Row(
                    children: [
                      Container(
                        color: Colors.amber,
                        child: const Text('data'),
                      ),
                    ],
                  ),
                  leading: const SizedBox(),
                ),
                const SliverAppBar(
                  backgroundColor: Colors.black,
                  expandedHeight: 50,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Başlık'),
                  ),
                  leading: SizedBox(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.black,
                    width: 200,
                    height: 2000,
                    child: const Text('data'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//----------------------------------------------------------------
  BlocProvider<HomenewViewModel> firstHomeNew(BuildContext context) {
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
                            image: '',
                          ),
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
                        onOperation: () async {
                          await context.router.navigate(const StoryyRoute());
                          return true; // Ensure the return type is Future<bool>
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: selectedIndex, // Selected index (Settings)
          onTap: (index) {
            // Bottom navigation logic
            setState(() {
              selectedIndex = index;
              switch (selectedIndex) {
                case 0:
                  // Navigate to Home route
                  context.router.navigate(const HomenewRoute());
                // case 1:
                //   // Navigate to Search route
                //   context.router.navigate(const SearchRoute());
                // case 2:
                //   // Navigate to Profile route
                //   context.router.navigate(const ProfileRoute());
                case 3:
                  // Navigate to Settings route
                  context.router.navigate(const SettingsRoute());
                default:
                  break;
              }
            });
            print('$index');
          },
        ),
      ),
    );
  }
}
