import 'package:flutter/material.dart';
import 'package:flutterprovider/src/provider/bottom_navigation_provider.dart';
import 'package:flutterprovider/src/provider/count_provider.dart';
import 'package:flutterprovider/src/ui/count_home_widget.dart';
import 'package:flutterprovider/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  CountProvider? _countProvider;
  BottomNavigationProvider? _bottomNavigationProvider;

  Widget _navigationBody() {
    switch (_bottomNavigationProvider!.currentPage) {
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieList();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
      ],
      currentIndex: _bottomNavigationProvider!.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        _bottomNavigationProvider?.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Provider demo'),
      // ),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
