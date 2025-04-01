import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Models/home_tab_model.dart';
import 'jobListPage.dart';
import 'pdfViwer_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildCarouselSlider(),
                const SizedBox(height: 10),
                _buildIndicatorDots(),
                const SizedBox(height: 35),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid.builder(
              itemCount: hometab.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, idx) {
                return FadeInUp(
                  duration: Duration(milliseconds: 400 * (idx + 1)),
                  child: HomeTabCard(
                    index: idx,
                    imagePath: hometab[idx].imagePath,
                    name: hometab[idx].name,
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      stretchTriggerOffset: 200,
      floating: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF81D4FA), // Light Sky Blue
              Color(0xFF039BE5), // Deeper Sky Blue
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Uni App",
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 100,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 0.85,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: carouselItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              height: 200,
              width: double.infinity,
              //  margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        item['imagePath']!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        item['title']!,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildIndicatorDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: hometab.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => setState(() => _currentIndex = entry.key),
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == entry.key
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.5),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class HomeTabCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final int index;

  const HomeTabCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => JobListingPage(subscriptions: hometab[index].items));
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 6),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Hero(
                tag: 'image$index',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const Gap(12),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(25, 33, 38, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
