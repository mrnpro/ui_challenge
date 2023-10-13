import 'package:plant_app/core/constants/assets.dart';

class PlantModel {
  final String name;
  final String subTitle;
  final String price;
  final String image;

  PlantModel(
      {required this.image,
      required this.name,
      required this.subTitle,
      required this.price});
}

final plantList = <PlantModel>[
  // the first index will not be rendered on the screen b/c it is skipped
  PlantModel(
      name: "African violet",
      subTitle: "subTitle",
      price: "price",
      image: Assets.assetsPicturesPlant1),
  PlantModel(
      name: "Lucky Jade Plant",
      subTitle: "Super green",
      price: "price",
      image: Assets.assetsPicturesPlant1),
  PlantModel(
      name: "Calla lily",
      subTitle: "green",
      price: "price",
      image: Assets.assetsPicturesPlant4),
  PlantModel(
      name: "Begonia",
      subTitle: "green",
      price: "price",
      image: Assets.assetsPicturesPlant1),
  PlantModel(
      name: "Snake Plants",
      subTitle: "Super green",
      price: "price",
      image: Assets.assetsPicturesPlant3),
  PlantModel(
      name: "",
      subTitle: "subTitle",
      price: "price",
      image: Assets.assetsPicturesPlant2),
  PlantModel(
      name: "Christmas cactus",
      subTitle: "cactus",
      price: "price",
      image: Assets.assetsPicturesPlant1),
  PlantModel(
      name: "African violet",
      subTitle: "green",
      price: "price",
      image: Assets.assetsPicturesPlant1),
];
