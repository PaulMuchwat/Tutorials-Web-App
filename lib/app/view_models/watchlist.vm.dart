import 'package:flutter_academy/infrastructure/res/watchlist.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'course.vm.dart';

class WatchlistVM extends StateNotifier<List<CourseVM>> {
  final WatchlistService _watchlistService;

  WatchlistVM(this._watchlistService) : super(const []) {
    getWatchlist();
  }

  Future<void> addToWatchlist(String id, String userId) async {
    await _watchlistService.addToWatchlist(id, userId);
    await getWatchlist();
  }

  Future<void> removeFromWatchlist(String id) async {
    await _watchlistService.removeFromWatchlist(id);
    state = state.where((course) => course.course.id != id).toList();
  }

  Future<void> getWatchlist() async {
    final watchlist = await _watchlistService.getWatchlist();
    var courses = [];
    for (final course in watchlist) {
      courses = [CourseVM(course), ...state];
    }
    state = [...courses];
  }

  bool isInWatchlist(String id) {
    return state.where((element) => element.course.id == id).isNotEmpty;
  }
}

final watchlistVM = StateNotifierProvider<WatchlistVM, List<CourseVM>>(
    (_) => WatchlistVM(WatchlistService.instance));
