import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/menu_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'dishes';

  // 获取所有菜品（假设所有菜品都在 dishes 集合）
  Stream<List<Dish>> getDishes() {
    return _firestore
        .collection(_collection)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Dish(
                  id: doc.id,
                  name: Map<String, String>.from(doc['name'] ?? {}),
                  status: doc['status'] ?? 'locked',
                  emoji: doc['emoji'],
                  notes: doc['notes'] != null ? Map<String, String>.from(doc['notes']) : null,
                  rating: doc['rating'],
                ))
            .toList());
  }

  // 添加菜品
  Future<void> addDish(Dish dish) {
    return _firestore.collection(_collection).doc(dish.id).set({
      'name': dish.name,
      'status': dish.status,
      'emoji': dish.emoji,
      'notes': dish.notes,
      'rating': dish.rating,
    });
  }

  // 更新菜品
  Future<void> updateDish(Dish dish) {
    return _firestore.collection(_collection).doc(dish.id).update({
      'name': dish.name,
      'status': dish.status,
      'emoji': dish.emoji,
      'notes': dish.notes,
      'rating': dish.rating,
    });
  }

  // 删除菜品
  Future<void> deleteDish(String id) {
    return _firestore.collection(_collection).doc(id).delete();
  }

  // 获取单个菜品
  Future<Dish?> getDish(String id) async {
    final doc = await _firestore.collection(_collection).doc(id).get();
    if (doc.exists) {
      return Dish(
        id: doc.id,
        name: Map<String, String>.from(doc['name'] ?? {}),
        status: doc['status'] ?? 'locked',
        emoji: doc['emoji'],
        notes: doc['notes'] != null ? Map<String, String>.from(doc['notes']) : null,
        rating: doc['rating'],
      );
    }
    return null;
  }
} 