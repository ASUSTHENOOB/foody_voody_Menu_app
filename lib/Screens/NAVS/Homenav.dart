import 'package:flutter/material.dart';
import 'package:foody_voody/utilis/appbar.dart';
import 'package:foody_voody/utilis/grad_text.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Homenav extends StatelessWidget {
  const Homenav({super.key});

  Future<void> _handleRefresh() async {
    // Simulate a delay for the refresh action
    await Future.delayed(const Duration(seconds: 1));
    // Logic to refresh the content goes here
  }

  // Function to show the image in a full-screen dialog with swipe-down to dismiss
  void _showFullScreenImage(BuildContext context, String imagePath) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // User can dismiss by tapping outside
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.8), // Background color
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dismissible(
          key: const Key('dismissible'),
          direction: DismissDirection.down, // Allow swipe down to close
          onDismissed: (_) {
            Navigator.of(context).pop();
          },
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close when tapping on image
            },
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: InteractiveViewer(
                  panEnabled:
                      false, // Disable panning to avoid scrolling issues
                  minScale: 0.5,
                  maxScale: 4.0, // Allow pinch zoom
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain, // Ensure image fits in the screen
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );
        return ScaleTransition(
          scale: curvedAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // List of dish names and image paths
    final List<Map<String, String>> dishes = [
      {'name': 'Pizza', 'image': 'images/Pizza.jpg'},
      {'name': 'Burger', 'image': 'images/burger.jpg'},
      {'name': 'Deals 1', 'image': 'images/Deals.jpg'},
      {'name': 'Deals 2', 'image': 'images/Deals2.jpg'},
      {'name': 'Ice_Cream', 'image': 'images/Icecream.jpg'},
      {'name': 'Brownies', 'image': 'images/brownies.jpg'},
      {'name': 'Fast Items', 'image': 'images/fasts.jpg'},
      {'name': 'Cocktail Bar', 'image': 'images/Cocktail.jpg'},
      {'name': 'Fries And Nuggets', 'image': 'images/FRIES.jpg'},
    ];

    return Scaffold(
      appBar: MyAppbar(title: "H O M E"),
      body: LiquidPullToRefresh(
        color: const Color.fromARGB(255, 255, 6, 122),
        height: MediaQuery.of(context).size.height * 0.35,
        backgroundColor: Colors.white,
        animSpeedFactor: 5,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: true,
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
              child: MyGradText(title: "Welcome To the Foody Voody Menu App"),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
              child: Text(
                "Here the specified items !",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            for (var dish in dishes)
              GestureDetector(
                onTap: () => _showFullScreenImage(context, dish['image']!),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 1, 159, 174),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          dish['image']!,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        dish['name']!,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
