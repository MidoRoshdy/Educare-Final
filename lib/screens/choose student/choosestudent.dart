import 'package:educare/core/Assets.dart';
import 'package:educare/core/app_routes.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class ChooseStudent extends StatelessWidget {
  const ChooseStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(Assets.backgroundapp))),
            child: ListView(children: [
              const MyAppBar(),
              const Text(
                " Choose your child : ",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontFamily: "inter",
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 35,
              ),
              const MyContainer(),
              const SizedBox(
                height: 15,
              ),
              const MyContainer(),
              const SizedBox(
                height: 15,
              ),
              const MyContainer(),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.anotherchild);
                  },
                  child: const Text(
                    'Add Another Child',
                    style: TextStyle(
                        color: Color(0xff175073),
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  )),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff175073),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Continue',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ])),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff80A7D6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: AppColours.neutral300,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Iconsax.user),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Code',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Class',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(':'),
                      Text(':'),
                      Text(':'),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ziad mohamed',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'S-123-124',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '9-B',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(Object context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context as BuildContext);
              },
              icon: const Icon(Iconsax.arrow_left4),
            ),
            Image.asset(
              Assets.logoonx2,
              height: 5.h,
              width: 25.w,
            ),
          ],
        ),
      ),
    );
  }
}
