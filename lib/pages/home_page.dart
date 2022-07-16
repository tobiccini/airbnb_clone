import 'package:airbnb_clone/widgets/city_widget.dart';
import 'package:airbnb_clone/widgets/header.dart';
import 'package:airbnb_clone/widgets/hero_banner.dart';
import 'package:airbnb_clone/widgets/live_anywhere_widget.dart';
import 'package:flutter/material.dart';





import '../widgets/fade_app_bar.dart';
import '../widgets/header.dart';
import '../widgets/hero_banner.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  /// _scrollListener() is a function that sets the state of the _scrollControllerOffset variable to the
  /// current offset of the scroll controller
  void _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  /// > The initState() function is called when the widget is first created
  @override
  void initState() {
    /// Creating a scroll controller and adding a listener to it.
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: const [
              HeroBanner(),
              Header(text: 'Explore Nearby',),
              CitiesGrid(),
              Header(text: 'Live Anywhere',),
              LiveAnywhereList(),
            ],
          ),
          FadeAppBar(scrollOffset: _scrollControllerOffset)
        ],
      ),
    );
  }
}
