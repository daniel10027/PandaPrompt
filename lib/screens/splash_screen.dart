import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  final List<_PageData> _pages = [
    _PageData(
      image: 'assets/images/intro1.png',
      title: 'Bienvenue sur PandaPrompt',
      subtitle: 'Transformez vos textes en défilement fluide.',
    ),
    _PageData(
      image: 'assets/images/intro2.png',
      title: 'Personnalisez',
      subtitle: 'Choisissez police, taille, couleur et vitesse.',
    ),
    _PageData(
      image: 'assets/images/intro3.png',
      title: 'Commencez maintenant',
      subtitle: 'Appuyez sur “Démarrer” pour lancer votre premier prompteur.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  void _goToHome() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_pages.length, (i) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == i ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == i ? Colors.teal : Colors.grey[400],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, i) {
            final page = _pages[i];
            final isActive = i == _currentPage;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                children: [
                  Expanded(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: isActive ? 1.0 : 0.5,
                      child: AnimatedSlide(
                        offset: isActive ? Offset.zero : Offset(0.2, 0),
                        duration: Duration(milliseconds: 500),
                        child: Image.asset(page.image),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: isActive ? 1.0 : 0.0,
                    child: Column(
                      children: [
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: 32,
          left: 0,
          right: 0,
          child: Column(
            children: [
              _buildIndicator(),
              SizedBox(height: 16),
              if (_currentPage == _pages.length - 1)
                ElevatedButton(
                  onPressed: _goToHome,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text('Démarrer', style: TextStyle(fontSize: 18)),
                )
              else
                TextButton(
                  onPressed: () => _pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  ),
                  child: Text('Suivant', style: TextStyle(fontSize: 16)),
                ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _PageData {
  final String image;
  final String title;
  final String subtitle;
  _PageData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
