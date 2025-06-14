import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class LullabiesListView extends StatefulWidget {
  const LullabiesListView({super.key});

  @override
  State<LullabiesListView> createState() => _LullabiesListViewState();
}

class _LullabiesListViewState extends State<LullabiesListView> {
  late final Future<List<Map<String, dynamic>>> _lullabiesFuture;

  @override
  void initState() {
    super.initState();
    _lullabiesFuture = _getLullabies();
  }

  Future<List<Map<String, dynamic>>> _getLullabies() async {
    final response = await Supabase.instance.client
        .from('lullabies')
        .select()
        .order('created_at', ascending: false);
    return (response as List<dynamic>).cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ninniler',
          style: context.general.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple.shade700,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Optional Banner Image
            Container(
              height: context.sized.height * 0.2,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey, // Placeholder color
              ),
              child: const Center(
                child:
                    Text('Banner Alanı', style: TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _lullabiesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No lullabies found.'));
                  } else {
                    final lullabies = snapshot.data!;
                    return ListView.builder(
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
                              borderRadius:
                                  BorderRadius.circular(context.sized.lowValue),
                              child: CachedNetworkImage(
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                imageUrl:
                                    (lullaby['cover_url'] ?? '') as String,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            title: Text(
                              (lullaby['title'] ?? 'No Title') as String,
                              style: context.general.textTheme.titleMedium,
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // TODO: Navigate to lullaby detail page
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
