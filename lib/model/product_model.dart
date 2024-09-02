// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:firebace_practice/model/firebase_response_model.dart';

// class ProductModel {
//   String? id;
//   String? name;
//   String? createdAt;
//   String? upDateAt;
//   double? price;
//   List<String>? images;
//   ProductModel(
//       {this.id,
//       this.name,
//       this.createdAt,
//       this.upDateAt,
//       this.price,
//       this.images});

//   Map<String, dynamic> toAddProduct() {
//     return {
//       "id": id ?? '',
//       "name": name ?? '',
//       "price": price ?? 0.0,
//       "images": images != null && images!.isNotEmpty
//           ? images!.map((e) => e.toString())
//           : [],
//       "createdAt": createdAt ?? DateTime.now().millisecondsSinceEpoch,
//       "upDateAt": upDateAt ?? DateTime.now().millisecondsSinceEpoch,
//     };
//   }

//   Map<String, dynamic> toAddCart() {
//     return {
//       "id": id ?? "",
//       "name": name ?? "",
//       "price": price ?? 0,
//     };
//   }

//   Map<String, dynamic> toAddOrder() {
//     return {
//       "id": id ?? "",
//       "name": name ?? "",
//       "price": price ?? 0,
//       "images": images != null && images!.isNotEmpty
//           ? images!.map((e) => e.toString())
//           : [],
//     };
//   }

//   // FROM PRODUCT
//   ProductModel.fromProduct(FirebaseResponseModel json)
//       : id = json.docId,
//         name = json.data["name"] ?? "",
//         price = json.data["price"] ?? "",
//         createdAt = json.data["createdAt"] ?? "",
//         upDateAt = json.data["upDateAt"] ?? "";

//   // FROM ORDER
//   ProductModel.fromOrder(FirebaseResponseModel json)
//       : id = json.data["id"] ?? "",
//         name = json.data["name"] ?? "",
//         price = json.data["price"] ?? "";

//   ProductModel copyWith({
//     String? id,
//     String? name,
//     String? createdAt,
//     String? upDateAt,
//     double? price,
//     List<String>? images,
//   }) {
//     return ProductModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       createdAt: createdAt ?? this.createdAt,
//       upDateAt: upDateAt ?? this.upDateAt,
//       price: price ?? this.price,
//       images: images ?? this.images,
//     );
//   }
// }

//  ORDER MODEL
// class OrderModel {
//   String? id;
//   String? addOrder;
//   List<ProductModel>? productData;

//   OrderModel({this.id, this.addOrder, this.productData});

//   Map<String, dynamic> toOrder() {
//     return {
//       "id": id,
//       "addOrder": addOrder,
//       "productData": productData != null && productData!.isNotEmpty
//           ? productData!.map((e) => e.toAddOrder())
//           : [],
//     };
//   }

//   OrderModel.fromejson(FirebaseResponseModel json)
//       : id = json.docId,
//         addOrder = json.data["addOrder"] ?? "",
//         productData = ((json.data["productData"] ?? {}) as List)
//             .map((e) => ProductModel.fromOrder(FirebaseResponseModel(e, '')))
//             .toList();
// }
// ===============================================================
// ===============================================================
// ===============================================================
// ===============================================================
class ProductModel {
  String? product_id,
      product_name,
      product_description,
      product_category,
      product_createdAt;
  double? product_price;
  bool? product_inStock;
  List<String>? product_image;
  List<ProductVariantsModel>? product_variants;
  SellerModel? seller;
  ProductModel(
      {this.product_id,
      this.product_name,
      this.product_description,
      this.product_category,
      this.product_createdAt,
      this.product_price,
      this.product_inStock,
      this.product_image,
      this.product_variants,
      this.seller});

  // to product
  Map<String, dynamic> toAddProduct() {
    return {
      "product_id": product_id ?? '',
      "product_name": product_name ?? '',
      "product_description": product_description ?? '',
      "product_category": product_category ?? '',
      "product_createdAt": product_createdAt ?? DateTime.now(),
      "product_price": product_price ?? 0.0,
      "product_inStock": product_inStock ?? false,
      "product_image": product_image != null && product_image!.isNotEmpty
          ? product_image!.map((e) => e.toString())
          : [],
      "product_variants":
          product_variants != null && product_variants!.isNotEmpty
              ? product_variants!.map((e) => e.toAddProductVariant()).toList()
              : [],
      "seller": seller == null ? {} : seller!.toAddSaller()
    };
  }

  //   // FROM PRODUCT
  ProductModel.fromProduct(FirebaseResponseModel json)
      : product_id = json.docId,
        product_name = json.data["product_name"] ?? "",
        product_description = json.data["product_description"] ?? "",
        product_category = json.data["product_category"] ?? "",
        product_createdAt = json.data["product_createdAt"] ?? "",
        product_price = json.data["product_price"] ?? 0.0,
        product_inStock = json.data["product_inStock"] ?? false,
        product_image = (json.data['product_image'] as List) == Null
            ? []
            : (json.data['product_image'] as List)
                .map((e) => e.toString())
                .toList(),
        product_variants = json.data['product_variants'] == null
            ? []
            : (json.data['product_variants'] as List)
                .map((e) => ProductVariantsModel.fromvariant(e))
                .toList(),
        seller = json.data['seller'] == null
            ? null
            : SellerModel.fromseller(json.data["seller"]);
}

// ProductVariants Model******
class ProductVariantsModel {
  String? color, size;
  int? stockLevel;
  ProductVariantsModel({this.color, this.size, this.stockLevel});
  Map<String, dynamic> toAddProductVariant() {
    return {
      "color": color ?? '',
      "size": size ?? '',
      "stockLevel": stockLevel ?? 0,
    };
  }

  ProductVariantsModel.fromvariant(Map<String, dynamic> json)
      : color = json["color"] ?? '',
        size = json['size'] ?? '',
        stockLevel = json["stockLevel"] ?? 0;
}

// seller model******
class SellerModel {
  String? seller_name, seller_email;
  int? seller_PhoneNumber;
  AddressModel? address;
  SellerModel(
      {this.seller_name,
      this.seller_email,
      this.seller_PhoneNumber,
      this.address});
  Map<String, dynamic> toAddSaller() {
    return {
      "seller_name": seller_name ?? '',
      "seller_email": seller_email ?? '',
      "seller_PhoneNumber": seller_PhoneNumber ?? 0,
      "address": address == null ? {} : address!.toAddAddress()
    };
  }

  SellerModel.fromseller(Map<String, dynamic> json)
      : seller_name = json['seller_name'] ?? '',
        seller_email = json['seller_email'] ?? '',
        seller_PhoneNumber = json['seller_PhoneNumber'] ?? 0,
        address = json['address'] == null
            ? null
            : AddressModel.fromaddress(json["address"]);
}

//  address model**********
class AddressModel {
  String? city, state;
  int? pinCode;
  AddressModel({this.city, this.state, this.pinCode});
  Map<String, dynamic> toAddAddress() {
    return {
      "city": city ?? '',
      "state": state ?? '',
      "pinCode": pinCode ?? 0,
    };
  }

  AddressModel.fromaddress(Map<String, dynamic> json)
      : city = json['city'] ?? '',
        state = json['state'] ?? '',
        pinCode = json['pinCode'] ?? '';
}
