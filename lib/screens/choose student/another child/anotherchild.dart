import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AnotherChild extends StatelessWidget {
  const AnotherChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.backgroundapp),
            ),
          ),
          child: ListView(
            children: [
              const MyAppBar(),
              const Text(
                " Add your child : ",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Educational code",
                      hintStyle: const TextStyle(
                        color: Color(0xffD9D9D9),
                      ),
                      prefixIcon: const Icon(Iconsax.search_normal),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(177, 0, 0, 0), width: 2))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD9D9D9)),
                  onPressed: () {},
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
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
                                shape: BoxShape.circle,
                                color: AppColours.neutral300,
                              ),
                              child: const Icon(
                                Iconsax.user,
                              )),
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
                                  'ziad mohamed  ',
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
              ),
              const SizedBox(
                height: 150,
              ),
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
            ],
          ),
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
            InkWell(
                onTap: () {
                  Navigator.pop(context as BuildContext);
                },
                child: const Icon(Iconsax.arrow_left_2)),
            Image.asset(
              Assets.logoonx2,
              height: 22,
              width: 115,
            ),
          ],
        ),
      ),
    );
  }
}
