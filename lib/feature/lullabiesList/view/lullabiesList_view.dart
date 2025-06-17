import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/lullabiesList/view/mixin/lullabiesList_view_mixin.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

@RoutePage()
class LullabiesListView extends StatefulWidget {
  const LullabiesListView({
    required this.title,
    super.key,
    @PathParam('categoryId') this.path,
  });
  final int? path;

  final String title;

  @override
  State<LullabiesListView> createState() => _LullabiesListViewState();
}

class _LullabiesListViewState extends BaseState<LullabiesListView>
    with LullabiesListViewMixin {
  @override
  Widget build(BuildContext context) {
    print(widget.path);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: context.sized.height * 0.25,
              automaticallyImplyLeading: false,
              centerTitle: false,
              elevation: 1,
              bottom: PreferredSize(
                preferredSize: Size(
                  context.general.mediaSize.width ?? 143,
                  30,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: SizedBox(
                    height: 20,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // backgroundColor: const Color(0xFF4A6FA5), // Match banner color
              leading: SizedBox(
                height: 5,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Geri gider
                  },
                ),
              ),
              title: Text(
                widget.title,
                style: context.general.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .white, // Changed to white for visibility on blue app bar
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: const Color(0xFF4A6FA5), // A soothing blue color
                  child: Center(
                    child: Text(
                      'Ninni Dünyası',
                      style: context.general.textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(context.sized.normalValue),
                ),
                child: Container(
                  color: Colors
                      .white, // Background for the list to appear floating
                  child: FutureBuilder<List<LulbyModel>>(
                    future: lullabiesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No lullabies found.'),
                        );
                      } else {
                        final lullabies = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero, // Remove default padding
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(), // Handled by CustomScrollView
                          itemCount: lullabies.length,
                          itemBuilder: (context, index) {
                            final lullaby = lullabies[index];
                            return Card(
                              margin: context.padding.low,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: context.border.lowBorderRadius,
                              ),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    context.sized.lowValue,
                                  ),
                                  child: CachedNetworkImage(
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    imageUrl: lullaby.coverURL ?? '',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                title: Text(
                                  lullaby.title,
                                  style: context.general.textTheme.titleMedium,
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // TODO: Navigate to lullaby detail page
                                  print('Navigate detail page');
                                  audioViewModel.changeLullaby([
                                    LulbyModel(
                                      title: lullaby.title,
                                      audioURL: lullaby.audioURL,
                                      artist: lullaby.artist,
                                    ),
                                  ]);
                                  audioService.play(
                                    lullaby.audioURL,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
