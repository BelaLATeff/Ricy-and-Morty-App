import 'package:flutter/material.dart';
import '../../constants/my_color.dart';
import '../../data/models/character_results.dart';
import 'widget/divider.dart';
import 'widget/properties_field.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterResults charResult;
  const CharacterDetailsScreen({
    super.key,
    required this.charResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      appBar: AppBar(
        backgroundColor: MyColors.myWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 240,
                color: MyColors.myWhite,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: charResult.status == "Alive"
                          ? Colors.green
                          : Colors.red,
                      child: Container(
                        width: 185,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: charResult.image!.isNotEmpty
                            ? FadeInImage.assetNetwork(
                                placeholder: "assets/images/Loading.gif",
                                image: charResult.image!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "${charResult.image}",
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    Positioned(
                      height: 38,
                      width: 75,
                      bottom: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: charResult.status == "Alive"
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            charResult.status!,
                            style: const TextStyle(
                              fontSize: 25,
                              color: MyColors.myWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                charResult.name!,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              const DividerHorizontal(info: "PROPERTIES"),
              const SizedBox(height: 25),
              PropertiesField(
                  keyString: "Gender", valueString: "${charResult.gender}"),
              const SizedBox(height: 12),
              PropertiesField(
                  keyString: "Species", valueString: "${charResult.species}"),
              const SizedBox(height: 12),
              PropertiesField(
                  keyString: "Status", valueString: "${charResult.status}"),
              const SizedBox(height: 25),
              const DividerHorizontal(info: "WHERE ABOUT"),
              const SizedBox(height: 25),
              PropertiesField(
                  keyString: "Origin",
                  valueString: "${charResult.origin!.name}"),
              const SizedBox(height: 12),
              PropertiesField(
                  keyString: "Location",
                  valueString: "${charResult.location!.name}"),
            ],
          ),
        ),
      ),
    );
  }
}
