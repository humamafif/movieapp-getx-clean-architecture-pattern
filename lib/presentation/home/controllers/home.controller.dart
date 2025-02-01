import 'package:get/get.dart';
import 'package:movie_simple_getx/infrastructure/dal/services/movie_services.dart';

class HomeController extends GetxController {
  final MovieServices _movieServices = MovieServices();
  var movies = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      final result = await _movieServices.fetchPopularMovies();
      movies.assignAll(result);
    } catch (err) {
      print("Error $err");
    } finally {
      isLoading(false);
    }
  }
}
