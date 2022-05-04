import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketonline/models/category.dart';

class CategoryService {
  FirebaseFirestore? _instance;

  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance!.collection('marketOnline');
    DocumentSnapshot snapshot = await categories.doc('categories').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories'] as List<dynamic>;
    categoriesData.forEach((catData) {
      _categories.add(Category.fromJson(catData));
    });
  }
}
