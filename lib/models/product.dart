class ProductModel{
  static const ID = "id";
  static const IMAGE = "image";
  static const MARQUE = "marque";
  static const PRIX = "prix";
  static const TAILLE = "taille";
  static const TITRE = "titre";

    String id ='';
    String image ='';
    String marque ='';
    String prix= '';
    String taille= '';
    String titre= '';



  ProductModel({ required this.id, required this.image, required this.marque, required this.prix, required this.taille,required this.titre});


  ProductModel.fromMap(Map <String,dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    marque = data[MARQUE];
    prix = data[PRIX];
    taille = data[TAILLE];
    titre = data[TITRE];
  }

}