import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_simple_getx/presentation/home/controllers/home.controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Movies')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.movies.length,
          itemBuilder: (context, index) {
            final movie = controller.movies[index];
            return ListTile(
              leading: Image.network(
                'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(movie['title']),
              subtitle: Text('Rating: ${movie['vote_average']}'),
            );
          },
        );
      }),
    );
  }
}
