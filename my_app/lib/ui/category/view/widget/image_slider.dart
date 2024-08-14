import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget{

  final double heightImage;
  const ImageSlider({super.key, required this.heightImage});

  @override
  State<StatefulWidget> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider>{

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;
  
  final List<String> _images = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpg'
  ];

  @override
  void initState(){
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic( const Duration(seconds: 3), (timer) {
      int nextPage = (_currentPage + 1) % _images.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

   void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

 void _onDotClicked(double position) {
    int page = position.round();
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

   @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25)
          ),
          width: MediaQuery.of(context).size.width,
          height: widget.heightImage,
          padding: const EdgeInsets.all(15),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(_images[index], fit: BoxFit.cover),
              );
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _images.length,
          position: _currentPage.toDouble(),
          onTap: _onDotClicked,
        ),
      ],
    );
  }
}