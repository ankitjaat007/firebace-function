// ignore_for_file: public_member_api_docs, sort_constructors_first
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
