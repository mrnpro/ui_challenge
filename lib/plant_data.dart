import 'package:plant_app/core/constants/assets.dart';

class PlantModel {
  final String id;
  final String name;
  final String subTitle;
  final String price;
  final String image;

  PlantModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.subTitle,
      required this.price});
}

final plantList = <PlantModel>[
  // the first index will not be rendered on the screen b/c it is skipped
  PlantModel(
      id: "1",
      name: "African violet",
      subTitle: "subTitle",
      price: "price",
      image: Assets.assetsPicturesPlant1),
  PlantModel(
      id: "2",
      name: "Lucky Jade Plant",
      subTitle: "Super green",
      price: "price",
      image: Assets.assetsPicturesPlant1),
  PlantModel(
      id: "3",
      name: "Calla lily",
      subTitle: "green",
      price: "price",
      image: Assets.assetsPicturesPlant5),
  PlantModel(
      id: "4",
      name: "Begonia",
      subTitle: "green",
      price: "price",
      image: Assets.assetsPicturesPlant2),
  PlantModel(
      id: "5",
      name: "Snake Plants",
      subTitle: "Super green",
      price: "price",
      image: Assets.assetsPicturesPlant3),
  PlantModel(
      id: "6",
      name: "",
      subTitle: "subTitle",
      price: "price",
      image: Assets.assetsPicturesPlant4),
  PlantModel(
      id: "7",
      name: "Christmas cactus",
      subTitle: "cactus",
      price: "price",
      image: Assets.assetsPicturesPlant5),
  PlantModel(
      id: "8",
      name: "African violet",
      subTitle: "green",
      price: "price",
      image: Assets.assetsPicturesPlant6),
];
