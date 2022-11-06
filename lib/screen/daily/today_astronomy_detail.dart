import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_iamge_app/data/model/astronomy_data.dart';
import 'package:space_iamge_app/data/repository.dart';

final astronomyDetailProvider =
    FutureProvider.family<AstronomyData, String>((ref, id) async {
  final data = await Repository().fetchAstronomy();
  return data;
});

class TodayAstronomyDetailScreen extends ConsumerWidget {
  const TodayAstronomyDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<AstronomyData> apodData =
        ref.watch(astronomyDetailProvider('1'));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Astronomy Detail"),
      ),
      body: Center(
        child: apodData.when(
            data: (apodData) {
              return astronomyDetailBody(apodData);
            },
            error: (error, stack) => Text("$error"),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }

  Widget astronomyDetailBody(AstronomyData data) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(data.url),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.7, 0.95],
              colors: [
                Colors.black12,
                Colors.black54,
                Colors.black87,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topCenter,
                child: Text(data.title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.topCenter,
                child: Text(data.explanation,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
