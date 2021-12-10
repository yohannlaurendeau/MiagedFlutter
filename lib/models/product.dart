import 'package:miagedflutter/bd/BdManager.dart';

class ProductModel{

  final String id,image,marque,prix,taille,titre;

  ProductModel({
    required this.id,
    required this.image,
    required this.marque,
    required this.prix,
    required this.taille,
    required this.titre
  });


  List productsList =[];
  fetchDatabaseList() async {
    dynamic resultant = await BdManager().getProductList();
    productsList = resultant;

  }









}