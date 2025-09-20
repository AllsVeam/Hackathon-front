import 'package:flutter/material.dart';

class PropertyImageCarouselWidget extends StatefulWidget {
  final List<String> imageUrls;

  const PropertyImageCarouselWidget({
    super.key,
    required this.imageUrls,
  });

  @override
  State<PropertyImageCarouselWidget> createState() => _PropertyImageCarouselWidgetState();
}

class _PropertyImageCarouselWidgetState extends State<PropertyImageCarouselWidget> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextImage() {
    if (_currentPage < widget.imageUrls.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _previousImage() {
    if (_currentPage > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250, // Altura fija para el carrusel de imágenes
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: widget.imageUrls.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    widget.imageUrls[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
              // Botón Anterior
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 30),
                  onPressed: _previousImage,
                ),
              ),
              // Botón Siguiente
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 30),
                  onPressed: _nextImage,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}