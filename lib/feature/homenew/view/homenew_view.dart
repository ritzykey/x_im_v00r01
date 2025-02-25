import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/homenew/view/mixin/homenew_view_mixin.dart';
import 'package:x_im_v00r01/feature/homenew/view/widget/FeadAnimation.dart';
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
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homenewViewModel,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView.builder(
          controller: homenewViewModel.pageController,
          itemCount: 3,
          onPageChanged: (index) {},
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverLayoutBuilder(
                      builder: (context, constraints) {
                        var opacity = 0.0;
                        if (constraints.scrollOffset > (450 - kToolbarHeight))
                          opacity =
                              ((constraints.scrollOffset - kToolbarHeight) /
                                      kToolbarHeight)
                                  .clamp(0.0, 1.0);
                        return SliverPadding(
                          padding: const EdgeInsets.all(8),
                          sliver: SliverAppBar(
                            stretch:
                                true, // Kullanıcı aşağı kaydırınca genişleyecek.

                            expandedHeight: 450,
                            pinned: true,
                            automaticallyImplyLeading: false,
                            backgroundColor: Colors.black,
                            flexibleSpace: FlexibleSpaceBar(
                              title: AnimatedOpacity(
                                opacity: opacity,
                                duration: const Duration(milliseconds: 300),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Emma Watson',
                                    style:
                                        context.general.textTheme.bodySmall ??
                                            const TextStyle(),
                                  ),
                                ),
                              ),
                              collapseMode: CollapseMode.pin,
                              background: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'asset/images/pexels1.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black,
                                        Colors.black.withOpacity(.1),
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FadeAnimation(
                                                1,
                                                Text(
                                                  'Emma Watson',
                                                  style: context
                                                          .general
                                                          .textTheme
                                                          .bodySmall ??
                                                      const TextStyle(),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Row(
                                                children: <Widget>[
                                                  FadeAnimation(
                                                    1.2,
                                                    Text(
                                                      '60 Videos',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  FadeAnimation(
                                                    1.3,
                                                    Text(
                                                      '240K Subscribers',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const FadeAnimation(
                                1.6,
                                Text(
                                  'Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const FadeAnimation(
                                1.6,
                                Text(
                                  'Born',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FadeAnimation(
                                1.6,
                                Text(
                                  'April, 15th 1990, Paris, France',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const FadeAnimation(
                                1.6,
                                Text(
                                  'Nationality',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FadeAnimation(
                                1.6,
                                Text(
                                  'British',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const FadeAnimation(
                                1.6,
                                Text(
                                  'Videos',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                1.8,
                                SizedBox(
                                  height: 200,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      makeVideo(
                                        image: 'assets/images/emma-1.jpg',
                                      ),
                                      makeVideo(
                                        image: 'assets/images/emma-2.jpg',
                                      ),
                                      makeVideo(
                                        image: 'assets/images/emma-3.jpg',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 120,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                // Positioned.fill(
                //   bottom: 50,
                //   child: Container(
                //     child: Align(
                //       alignment: Alignment.bottomCenter,
                //       child: FadeAnimation(
                //         2,
                //         Container(
                //           margin: const EdgeInsets.symmetric(horizontal: 30),
                //           height: 50,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(50),
                //             color: Colors.yellow[700],
                //           ),
                //           child: const Align(
                //             child: Text(
                //               'Follow',
                //               style: TextStyle(color: Colors.white),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget makeVideo({required String image}) {
  return AspectRatio(
    aspectRatio: 1.5 / 1,
    child: Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.3),
            ],
          ),
        ),
        child: const Align(
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 70,
          ),
        ),
      ),
    ),
  );
}

class HomenewPage2 extends StatelessWidget {
  const HomenewPage2({
    required this.homenewViewModel,
    super.key,
  });

  final HomenewViewModel homenewViewModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            CustomScrollView(
              controller: homenewViewModel.scrollController,
              slivers: [
                SliverLayoutBuilder(
                  builder: (context, constraints) {
                    return SliverAppBar(
                      backgroundColor: Colors.blueGrey[900],
                      expandedHeight: 500,
                      toolbarHeight: 100,
                      pinned: true,
                      leading: const SizedBox(),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            TweenAnimationBuilder<double>(
                              duration: const Duration(
                                milliseconds: 500,
                              ), // 🔥 Animasyon süresi
                              tween: Tween<double>(
                                begin: 150,
                                end: homenewViewModel.scrollOffset <= 100
                                    ? 150
                                    : 100,
                              ),
                              builder: (context, height, child) {
                                return AppBar(
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.blueGrey[400],
                                  clipBehavior: Clip.none,
                                  toolbarHeight: height,
                                  leading: const SizedBox(),
                                  leadingWidth: 0,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  title: Text(
                                    'Başlık aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                    softWrap: true,
                                    maxLines: homenewViewModel.titlemaxline,
                                    style: TextStyle(
                                      fontSize: 20 -
                                          (10 * homenewViewModel.titleSize),
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              top:
                                  -20, // İkonları yukarı kaydırıyoruz, böylece yarısı dışarıda kalır
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center, // Ortalamak için
                                children: [
                                  AnimatedOpacity(
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    opacity: homenewViewModel.opacity,
                                    child: AppBarTopIcon(
                                      // Üstteki ikonlar

                                      color: Colors.black,
                                      iconSizeHeight: 30,
                                      iconSizeWidth: 50,
                                      icon: Icons.home,
                                      text: 'Home',
                                      onPressed: () {
                                        print('object');
                                      },
                                      iconColor: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ), // İkonlar arası boşluk
                                  AnimatedOpacity(
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    opacity: homenewViewModel.opacity,
                                    child: AppBarTopIcon(
                                      // Üstteki ikonlar

                                      color: Colors.black,
                                      iconSizeHeight: 30,
                                      iconSizeWidth: 50,
                                      icon: Icons.home,
                                      text: 'Home',
                                      onPressed: () {
                                        print('object');
                                      },
                                      iconColor: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  AnimatedOpacity(
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    opacity: homenewViewModel.opacity,
                                    child: IconButton(
                                      // Üstteki ikonlar
                                      icon: const Icon(
                                        Icons.home,
                                        color: Colors.white,
                                      ),
                                      style: ButtonStyle(
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          Colors.black,
                                        ),
                                      ),

                                      onPressed: () {
                                        print('object');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: [
                              FlexibleSpaceBar(
                                background: Stack(
                                  fit: StackFit
                                      .expand, // 📌 Tüm alanı kaplamasını sağlar
                                  children: [
                                    Padding(
                                      padding: homenewViewModel.dynamicPadding,
                                      child: Image.asset(
                                        'asset/images/pexels1.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Başlığın üst kısmındaki semboller
                              Positioned(
                                top: 50,
                                right: 20,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: homenewViewModel
                                      .opacity, // Kaydırıldıkça kaybolur
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          print('tttt');
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.share,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                SliverLayoutBuilder(
                  builder: (context, constraints) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: homenewViewModel.scrollOffset <= 300
                                ? const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  )
                                : const EdgeInsets.only(),
                            child: const Card(
                              color: Colors.white,
                              child: Text('''
                        Flutter'da `scrollOffset` kullanarak sayfa kaydırıldıkça içerik ve animasyonları değiştirebilirsin.  
                        Bu, özellikle `SliverAppBar`, `PageView.builder`, `ListView.builder` ve sonsuz kaydırma (infinite scroll) gibi özelliklerle oldukça kullanışlıdır.  
                        Örneğin, kullanıcı aşağı kaydırdıkça bir başlık görünmez hale gelebilir veya yeni veriler yüklenebilir.  
                        Bunu `ScrollController` ile dinleyerek yapabilirsin.Flutter'da `scrollOffset` kullanarak sayfa kaydırıldıkça içerik ve animasyonları değiştirebilirsin.  
                        Bu, özellikle `SliverAppBar`, `PageView.builder`, `ListView.builder` ve sonsuz kaydırma (infinite scroll) gibi özelliklerle oldukça kullanışlıdır.  
                        Örneğin, kullanıcı aşağı kaydırdıkça bir başlık görünmez hale gelebilir veya yeni veriler yüklenebilir.  
                        Bunu `ScrollController` ile dinleyerek yapabilirsin.Flutter'da `scrollOffset` kullanarak sayfa kaydırıldıkça içerik ve animasyonları değiştirebilirsin.  
                        Bu, özellikle `SliverAppBar`, `PageView.builder`, `ListView.builder` ve sonsuz kaydırma (infinite scroll) gibi özelliklerle oldukça kullanışlıdır.  
                        Örneğin, kullanıcı aşağı kaydırdıkça bir başlık görünmez hale gelebilir veya yeni veriler yüklenebilir.  
                        Bunu `ScrollController` ile dinleyerek yapabilirsin.Flutter'da `scrollOffset` kullanarak sayfa kaydırıldıkça içerik ve animasyonları değiştirebilirsin.  
                        Bu, özellikle `SliverAppBar`, `PageView.builder`, `ListView.builder` ve sonsuz kaydırma (infinite scroll) gibi özelliklerle oldukça kullanışlıdır.  
                        Örneğin, kullanıcı aşağı kaydırdıkça bir başlık görünmez hale gelebilir veya yeni veriler yüklenebilir.  
                        Bunu `ScrollController` ile dinleyerek yapabilirsin.Flutter'da `scrollOffset` kullanarak sayfa kaydırıldıkça içerik ve animasyonları değiştirebilirsin.  
                        Bu, özellikle `SliverAppBar`, `PageView.builder`, `ListView.builder` ve sonsuz kaydırma (infinite scroll) gibi özelliklerle oldukça kullanışlıdır.  
                        Örneğin, kullanıcı aşağı kaydırdıkça bir başlık görünmez hale gelebilir veya yeni veriler yüklenebilir.  
                        Bunu `ScrollController` ile dinleyerek yapabilirsin.
                        '''),
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    );
                  },
                ),
              ],
            ),

            // Sağ alt köşedeki semboller
            BlocSelector<HomenewViewModel, HomenewState, double>(
              selector: (state) {
                return state.opacity ?? 0.0;
              },
              builder: (context, state) {
                return Positioned(
                  bottom: 20,
                  right: 20,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: state < 0.1
                        ? 1.0
                        : 0.0, // Kaybolan semboller sağ alt köşede belirir
                    child: Row(
                      children: [
                        Builder(
                          builder: (context) {
                            if (state < 0.1) {
                              print('oooooooooo $state');
                              return IconButton(
                                icon: const Icon(Icons.favorite),
                                onPressed: () {
                                  print('bbbb');
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: Colors.amber,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class AppBarTopIcon extends StatelessWidget {
  const AppBarTopIcon({
    required this.color,
    required this.iconSizeWidth,
    required this.iconSizeHeight,
    required this.text,
    required this.onPressed,
    required this.iconColor,
    this.icon,
    super.key,
  });

  final Color color;
  final double? iconSizeWidth;
  final double? iconSizeHeight;
  final IconData? icon;
  final String text;
  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          Size(iconSizeWidth ?? 30, iconSizeHeight ?? 30),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          Colors.black,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min, // İçeriğin fazla genişlememesi için
        children: [
          Icon(icon, color: Colors.white), // İkon
          const SizedBox(width: 4), // İkon ile metin arasında boşluk
          Text(text, style: const TextStyle(color: Colors.white)), // Metin
        ],
      ),
    );
  }
}

//----------------------------------------------------------------
 /*BlocProvider<HomenewViewModel> firstHomeNew(BuildContext context) {
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
}*/
