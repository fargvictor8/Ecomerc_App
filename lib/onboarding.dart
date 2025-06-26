import 'package:flutter/material.dart';
import 'package:untitled/Components/color.dart';
import 'package:untitled/Components/onboarding_data.dart';
import 'package:untitled/core/Routing/app_router.dart';
import 'package:untitled/features/presentation/view/widgets/home_Page.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final controller = OnboardingDate();
  final pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          body(),
          buildDots(),
          button()
        ],
      ),
    );
  }

  //Body

    Widget body(){
    return Expanded(
      child: Center(
        child: PageView.builder(
          onPageChanged: (value){
            setState(() {
              currentIndex = value;

            });
          },
          itemCount: controller.items.length,
            itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:  20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Images
              Image.asset(controller.items[currentIndex].image),

                //Titles
                Text(controller.items[currentIndex].title,
                  style: const TextStyle(
                  fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),

                //Descriptions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(controller.items[currentIndex].description,
                  style: const TextStyle(
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center),
                )
              ],
            ),
          );
        } ),
      ),
    ); //Column
  }

  //Dots

  Widget buildDots(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
          List.generate(controller.items.length, (index) =>AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration:  BoxDecoration(
                color: currentIndex == index ? Colors.black : Colors.grey
              ),
              height: 7,
              width: currentIndex == index? 20 : 10,
              duration: const Duration(microseconds: 700)))
      ),
    );
  }

  //Buttons
  Widget button(){
    return Container(
      width: MediaQuery.of(context).size.width *.9,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor
      ),

      child: TextButton(
        onPressed: () {
          setState(() {
            if (currentIndex != controller.items.length - 1) {
              currentIndex++;
            } else {
              // initialRoute : Route.HomePage,
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          });
        },
        child: Text(
          currentIndex == controller.items.length - 1 ? "Get Started" : "Continue",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}
