import 'package:flutter/material.dart';

class Dish {
  final String id;
  final Map<String, String> name;
  final String status;
  final String? emoji;
  final Map<String, String>? notes;
  final int? rating;

  const Dish({
    required this.id,
    required this.name,
    required this.status,
    this.emoji,
    this.notes,
    this.rating,
  });
}

class Subcategory {
  final String id;
  final Map<String, String> name;
  final List<Dish> dishes;

  const Subcategory({
    required this.id,
    required this.name,
    required this.dishes,
  });
}

class Category {
  final String id;
  final Map<String, String> name;
  final List<Subcategory> subcategories;

  const Category({
    required this.id,
    required this.name,
    required this.subcategories,
  });
}

String getDishStatus(String status, String language) {
  switch (status) {
    case 'unlocked':
      return language == 'zh' ? '已解锁' : 'Unlocked';
    case 'locked':
      return language == 'zh' ? '待解锁' : 'Locked';
    case 'testing':
      return language == 'zh' ? '测试中' : 'Testing';
    default:
      return status;
  }
}

Color getDishStatusColor(String status) {
  switch (status) {
    case 'unlocked':
      return Colors.green;
    case 'locked':
      return Colors.grey;
    case 'testing':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}

final List<Category> menuData = [
  Category(
    id: 'home-cooking',
    name: {
      'zh': '家常菜类',
      'en': 'Home Cooking',
    },
    subcategories: [
      Subcategory(
        id: 'pork',
        name: {
          'zh': '猪肉类',
          'en': 'Pork Dishes',
        },
        dishes: [
          Dish(
            id: 'stir-fried-pork-peppers',
            name: {
              'zh': '辣椒炒肉',
              'en': 'Stir-fried Pork with Peppers',
            },
            status: 'unlocked',
            emoji: '🌶️',
            rating: 85,
          ),
          Dish(
            id: 'stir-fried-pork-carrots',
            name: {
              'zh': '胡萝卜炒肉',
              'en': 'Stir-fried Pork with Carrots',
            },
            status: 'unlocked',
            emoji: '🥕',
            rating: 90,
          ),
          Dish(
            id: 'stir-fried-pork-leek-tofu',
            name: {
              'zh': '五花肉韭菜炒香干',
              'en': 'Stir-fried Pork Belly with Leek and Tofu',
            },
            status: 'unlocked',
            emoji: '🥬',
            rating: 95,
          ),
          Dish(
            id: 'jing-jiang-pork',
            name: {
              'zh': '京酱肉丝',
              'en': 'Jing Jiang Pork Shreds',
            },
            status: 'unlocked',
            emoji: '🥢',
            rating: 88,
          ),
          Dish(
            id: 'yu-xiang-pork',
            name: {
              'zh': '鱼香肉丝',
              'en': 'Yu Xiang Pork Shreds',
            },
            status: 'unlocked',
            emoji: '🐟',
            rating: 92,
          ),
          Dish(
            id: 'braised-pork-ribs',
            name: {
              'zh': '红烧排骨',
              'en': 'Braised Pork Ribs',
            },
            status: 'unlocked',
            emoji: '🍖',
            rating: 95,
          ),
          Dish(
            id: 'sweet-sour-ribs',
            name: {
              'zh': '糖醋排骨',
              'en': 'Sweet and Sour Pork Ribs',
            },
            status: 'unlocked',
            emoji: '🍯',
            rating: 98,
          ),
          Dish(
            id: 'braised-pork-belly',
            name: {
              'zh': '红烧肉',
              'en': 'Braised Pork Belly',
            },
            status: 'unlocked',
            emoji: '🥩',
            rating: 96,
            notes: {
              'zh': '配合肉夹馍吧🤤',
              'en': 'Perfect with Chinese Hamburger',
            },
          ),
          Dish(
            id: 'braised-pork-potato-corn',
            name: {
              'zh': '土豆玉米红烧肉',
              'en': 'Braised Pork with Potato and Corn',
            },
            status: 'unlocked',
            emoji: '🌽',
            rating: 60,
            notes: {
              'zh': '60分😐',
              'en': '60/100',
            },
          ),
          Dish(
            id: 'crispy-pork',
            name: {
              'zh': '小酥肉',
              'en': 'Crispy Pork',
            },
            status: 'unlocked',
            emoji: '🍤',
            rating: 75,
            notes: {
              'zh': '75分',
              'en': '75/100',
            },
          ),
          Dish(
            id: 'garlic-ribs',
            name: {
              'zh': '蒜香排骨',
              'en': 'Garlic Pork Ribs',
            },
            status: 'unlocked',
            emoji: '🧄',
            rating: 85,
          ),
          Dish(
            id: 'hongkong-pork-chop',
            name: {
              'zh': '港式洋葱猪排',
              'en': 'Hong Kong Style Onion Pork Chop',
            },
            status: 'unlocked',
            emoji: '🧅',
            rating: 82,
            notes: {
              'zh': '不错😌',
              'en': 'Pretty good',
            },
          ),
          Dish(
            id: 'honey-char-siu',
            name: {
              'zh': '蜜汁叉烧',
              'en': 'Honey Char Siu',
            },
            status: 'testing',
            emoji: '🍯',
            notes: {
              'zh': '待测',
              'en': 'To be tested',
            },
          ),
          Dish(
            id: 'stir-fried-pork-pepper-shreds',
            name: {
              'zh': '青椒猪肉丝',
              'en': 'Stir-fried Pork Shreds with Peppers',
            },
            status: 'locked',
            emoji: '🌶️',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'pork-vermicelli-cabbage',
            name: {
              'zh': '猪肉粉条炖白菜',
              'en': 'Pork with Vermicelli and Cabbage Stew',
            },
            status: 'locked',
            emoji: '🥬',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'tomato-slippery-pork',
            name: {
              'zh': '番茄滑肉',
              'en': 'Tomato Slippery Pork',
            },
            status: 'locked',
            emoji: '🍅',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'sweet-sour-pork',
            name: {
              'zh': '糖醋里脊',
              'en': 'Sweet and Sour Pork',
            },
            status: 'locked',
            emoji: '🍯',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'seafood',
        name: {
          'zh': '海鲜类',
          'en': 'Seafood',
        },
        dishes: [
          Dish(
            id: 'braised-fish',
            name: {
              'zh': '红烧鱼',
              'en': 'Braised Fish',
            },
            status: 'unlocked',
            emoji: '🐟',
            rating: 95,
          ),
          Dish(
            id: 'stir-fried-oysters-peppers',
            name: {
              'zh': '辣椒炒牡蛎肉',
              'en': 'Stir-fried Oysters with Peppers',
            },
            status: 'unlocked',
            emoji: '🦪',
            rating: 92,
            notes: {
              'zh': '宝宝爱吃',
              'en': 'Baby loves it',
            },
          ),
          Dish(
            id: 'kung-pao-shrimp-cashew-celery',
            name: {
              'zh': '宫保腰果芹菜炒虾仁',
              'en': 'Kung Pao Shrimp with Cashew and Celery',
            },
            status: 'unlocked',
            emoji: '🍤',
            rating: 96,
          ),
          Dish(
            id: 'braised-shrimp',
            name: {
              'zh': '油焖大虾',
              'en': 'Braised Shrimp',
            },
            status: 'unlocked',
            emoji: '🦐',
            rating: 88,
            notes: {
              'zh': '要努力做好！宝宝爱吃虾',
              'en': 'Need to improve! Baby loves shrimp',
            },
          ),
          Dish(
            id: 'steamed-seafood-garlic',
            name: {
              'zh': '蒜蓉粉丝/生蚝/虾/扇贝',
              'en': 'Steamed Seafood with Garlic and Vermicelli',
            },
            status: 'unlocked',
            emoji: '🧄',
            rating: 90,
            notes: {
              'zh': '好久没做了',
              'en': 'Haven\'t made it for a while',
            },
          ),
          Dish(
            id: 'stir-fried-squid-rings',
            name: {
              'zh': '姜蒜鱿鱼圈',
              'en': 'Stir-fried Squid Rings with Ginger and Garlic',
            },
            status: 'locked',
            emoji: '🦑',
            notes: {
              'zh': '待解锁，宝宝想吃，努力！',
              'en': 'To be unlocked, baby wants to try!',
            },
          ),
          Dish(
            id: 'sour-cabbage-fish',
            name: {
              'zh': '酸菜鱼',
              'en': 'Sour Cabbage Fish',
            },
            status: 'unlocked',
            emoji: '🥬',
            rating: 85,
            notes: {
              'zh': '鲈鱼❌',
              'en': 'Not sea bass',
            },
          ),
          Dish(
            id: 'spicy-fish',
            name: {
              'zh': '麻辣鱼',
              'en': 'Spicy Fish',
            },
            status: 'locked',
            emoji: '🌶️',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'chicken',
        name: {
          'zh': '鸡肉类',
          'en': 'Chicken Dishes',
        },
        dishes: [
          Dish(
            id: 'coke-chicken-wings',
            name: {
              'zh': '可乐鸡翅',
              'en': 'Coke Chicken Wings',
            },
            status: 'unlocked',
            emoji: '🥤',
            rating: 95,
          ),
          Dish(
            id: 'chicken-wings-pot',
            name: {
              'zh': '鸡翅煲',
              'en': 'Chicken Wings Pot',
            },
            status: 'unlocked',
            emoji: '🍗',
            rating: 98,
            notes: {
              'zh': '宝宝超爱的，我也爱😋',
              'en': 'Both baby and I love it!',
            },
          ),
          Dish(
            id: 'scallion-oil-chicken',
            name: {
              'zh': '葱油焖鸡',
              'en': 'Scallion Oil Braised Chicken',
            },
            status: 'unlocked',
            emoji: '🧅',
            rating: 98,
            notes: {
              'zh': '98分',
              'en': '98/100',
            },
          ),
          Dish(
            id: 'fermented-bean-curd-chicken',
            name: {
              'zh': '南乳炸鸡翅',
              'en': 'Fermented Bean Curd Fried Chicken Wings',
            },
            status: 'unlocked',
            emoji: '🧈',
            rating: 100,
            notes: {
              'zh': '1000分！！南乳yyds',
              'en': 'Perfect! Fermented bean curd is the key!',
            },
          ),
          Dish(
            id: 'potato-tomato-chicken',
            name: {
              'zh': '土豆番茄油焖鸡',
              'en': 'Braised Chicken with Potato and Tomato',
            },
            status: 'unlocked',
            emoji: '🍅',
            rating: 92,
          ),
          Dish(
            id: 'stir-fried-chicken',
            name: {
              'zh': '农家小炒鸡',
              'en': 'Stir-fried Chicken',
            },
            status: 'unlocked',
            emoji: '🌶️',
            rating: 90,
          ),
          Dish(
            id: 'chicken-with-garlic-sauce',
            name: {
              'zh': '柱侯酱蒜头炒鸡',
              'en': 'Chicken with Garlic and Sauce',
            },
            status: 'unlocked',
            emoji: '🧄',
            rating: 80,
            notes: {
              'zh': '80分下饭！记得只放一勺酱！放多了咸！',
              'en': '80/100, great with rice! Remember to use only one spoon of sauce!',
            },
          ),
          Dish(
            id: 'truffle-chicken-rice',
            name: {
              'zh': '黑松露鸡肉焖饭',
              'en': 'Truffle Chicken Rice',
            },
            status: 'unlocked',
            emoji: '🍄',
            rating: 95,
            notes: {
              'zh': '95分ms黑松露酱',
              'en': '95/100 with M&S black truffle sauce',
            },
          ),
          Dish(
            id: 'yellow-braised-chicken',
            name: {
              'zh': '黄焖鸡',
              'en': 'Yellow Braised Chicken',
            },
            status: 'unlocked',
            emoji: '🍲',
            rating: 75,
            notes: {
              'zh': '还不错 75分',
              'en': 'Pretty good, 75/100',
            },
          ),
          Dish(
            id: 'fried-chicken',
            name: {
              'zh': '蒜香/蜂蜜/糖醋炸鸡',
              'en': 'Fried Chicken (Garlic/Honey/Sweet & Sour)',
            },
            status: 'unlocked',
            emoji: '🍗',
            rating: 88,
          ),
          Dish(
            id: 'garlic-chicken-breast',
            name: {
              'zh': '蒜香鸡胸肉',
              'en': 'Garlic Chicken Breast',
            },
            status: 'unlocked',
            emoji: '🧄',
            rating: 85,
          ),
          Dish(
            id: 'dry-pot-chicken-wings',
            name: {
              'zh': '干锅鸡翅',
              'en': 'Dry Pot Chicken Wings',
            },
            status: 'locked',
            emoji: '🌶️',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'chongqing-chicken-pot',
            name: {
              'zh': '重庆鸡公煲',
              'en': 'Chongqing Chicken Pot',
            },
            status: 'locked',
            emoji: '🍲',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'kung-pao-chicken',
            name: {
              'zh': '宫保鸡丁',
              'en': 'Kung Pao Chicken',
            },
            status: 'locked',
            emoji: '🥜',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'duck',
        name: {
          'zh': '鸭肉类',
          'en': 'Duck Dishes',
        },
        dishes: [
          Dish(
            id: 'beer-duck',
            name: {
              'zh': '啤酒鸭',
              'en': 'Beer Duck',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'roast-duck',
            name: {
              'zh': '烤鸭',
              'en': 'Roast Duck',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'lamb',
        name: {
          'zh': '羊肉类',
          'en': 'Lamb Dishes',
        },
        dishes: [
          Dish(
            id: 'stir-fried-lamb-scallion',
            name: {
              'zh': '葱爆羊肉',
              'en': 'Stir-fried Lamb with Scallion',
            },
            status: 'unlocked',
            emoji: '🧅',
            rating: 95,
          ),
          Dish(
            id: 'cumin-lamb',
            name: {
              'zh': '孜然羊肉',
              'en': 'Cumin Lamb',
            },
            status: 'unlocked',
            emoji: '🐑',
            rating: 92,
          ),
          Dish(
            id: 'french-lamb-stew',
            name: {
              'zh': '法式炖羊肉',
              'en': 'French Lamb Stew',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'beef',
        name: {
          'zh': '牛肉类',
          'en': 'Beef Dishes',
        },
        dishes: [
          Dish(
            id: 'stir-fried-beef-cilantro',
            name: {
              'zh': '香菜炒牛肉',
              'en': 'Stir-fried Beef with Cilantro',
            },
            status: 'unlocked',
            emoji: '🥬',
            rating: 90,
          ),
          Dish(
            id: 'stir-fried-beef-peppers',
            name: {
              'zh': '辣椒炒牛肉',
              'en': 'Stir-fried Beef with Peppers',
            },
            status: 'unlocked',
            emoji: '🌶️',
            rating: 93,
          ),
          Dish(
            id: 'tomato-beef-tail',
            name: {
              'zh': '番茄牛尾/牛腩煲',
              'en': 'Tomato Beef Tail/Brisket Pot',
            },
            status: 'unlocked',
            emoji: '🍅',
            rating: 95,
          ),
          Dish(
            id: 'curry-beef-brisket',
            name: {
              'zh': '咖喱牛腩',
              'en': 'Curry Beef Brisket',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'braised-beef',
            name: {
              'zh': '卤牛肉',
              'en': 'Braised Beef',
            },
            status: 'unlocked',
            emoji: '🥩',
            rating: 93,
          ),
          Dish(
            id: 'cold-braised-beef',
            name: {
              'zh': '凉拌卤牛肉',
              'en': 'Cold Braised Beef',
            },
            status: 'unlocked',
            emoji: '🥩',
            rating: 92,
          ),
          Dish(
            id: 'stir-fried-braised-beef-garlic',
            name: {
              'zh': '卤牛肉炒蒜苗',
              'en': 'Stir-fried Braised Beef with Garlic Sprouts',
            },
            status: 'unlocked',
            emoji: '🧄',
            rating: 94,
          ),
          Dish(
            id: 'honey-pepper-beef',
            name: {
              'zh': '蜜汁椒香牛肉粒',
              'en': 'Honey Pepper Beef Cubes',
            },
            status: 'unlocked',
            emoji: '🍯',
            rating: 96,
            notes: {
              'zh': '1.5酱油 2蜂蜜😋',
              'en': '1.5 soy sauce, 2 honey',
            },
          ),
          Dish(
            id: 'boiled-beef',
            name: {
              'zh': '水煮牛肉',
              'en': 'Boiled Beef',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'stir-fried-beef-potato',
            name: {
              'zh': '土豆炒牛肉',
              'en': 'Stir-fried Beef with Potato',
            },
            status: 'unlocked',
            notes: {
              'zh': '宝宝待开发🧚‍♀️',
              'en': 'To be developed for baby',
            },
          ),
          Dish(
            id: 'stir-fried-beef-pepper-shreds',
            name: {
              'zh': '青椒牛肉丝',
              'en': 'Stir-fried Beef Shreds with Peppers',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'black-pepper-beef',
            name: {
              'zh': '黑椒牛肉粒',
              'en': 'Black Pepper Beef Cubes',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'vegetables',
        name: {
          'zh': '蔬菜类',
          'en': 'Vegetables',
        },
        dishes: [
          Dish(
            id: 'stir-fried-cabbage-vinegar',
            name: {
              'zh': '醋溜包菜',
              'en': 'Stir-fried Cabbage with Vinegar',
            },
            status: 'unlocked',
            emoji: '🥬',
            rating: 90,
          ),
          Dish(
            id: 'stir-fried-greens',
            name: {
              'zh': '油渣/白灼菜心',
              'en': 'Stir-fried/Blanched Greens',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'stir-fried-cabbage',
            name: {
              'zh': '老厨白菜',
              'en': 'Stir-fried Cabbage',
            },
            status: 'unlocked',
            notes: {
              'zh': '记得用菜叶',
              'en': 'Remember to use cabbage leaves',
            },
          ),
          Dish(
            id: 'stir-fried-kale-bacon',
            name: {
              'zh': '培根炒甘蓝',
              'en': 'Stir-fried Kale with Bacon',
            },
            status: 'unlocked',
            notes: {
              'zh': '健康无敌',
              'en': 'Super healthy',
            },
          ),
          Dish(
            id: 'stir-fried-potato-vinegar',
            name: {
              'zh': '醋溜土豆丝',
              'en': 'Stir-fried Potato Shreds with Vinegar',
            },
            status: 'unlocked',
            notes: {
              'zh': '好久没做了',
              'en': 'Haven\'t made it for a while',
            },
          ),
          Dish(
            id: 'cumin-potato',
            name: {
              'zh': '孜然土豆',
              'en': 'Cumin Potato',
            },
            status: 'unlocked',
            emoji: '🥔',
            rating: 92,
            notes: {
              'zh': '街头小吃😋',
              'en': 'Street food',
            },
          ),
          Dish(
            id: 'stir-fried-potato-bacon',
            name: {
              'zh': '培根土豆片',
              'en': 'Stir-fried Potato with Bacon',
            },
            status: 'unlocked',
            emoji: '🥔',
            rating: 90,
          ),
          Dish(
            id: 'stir-fried-tofu-scallion',
            name: {
              'zh': '葱烧豆腐',
              'en': 'Stir-fried Tofu with Scallion',
            },
            status: 'unlocked',
            notes: {
              'zh': '好久没做了',
              'en': 'Haven\'t made it for a while',
            },
          ),
          Dish(
            id: 'three-fresh-vegetables',
            name: {
              'zh': '地三鲜',
              'en': 'Three Fresh Vegetables',
            },
            status: 'unlocked',
            notes: {
              'zh': '微波炉版',
              'en': 'Microwave version',
            },
          ),
          Dish(
            id: 'stir-fried-leek-tofu',
            name: {
              'zh': '油渣韭菜(🥕)炒香干',
              'en': 'Stir-fried Leek and Tofu with Pork Fat',
            },
            status: 'unlocked',
            emoji: '🥬',
            rating: 93,
          ),
          Dish(
            id: 'stir-fried-lotus-root',
            name: {
              'zh': '醋溜炝炒藕片',
              'en': 'Stir-fried Lotus Root with Vinegar',
            },
            status: 'unlocked',
            emoji: '🥬',
            rating: 91,
          ),
          Dish(
            id: 'mapo-tofu',
            name: {
              'zh': '麻婆豆腐',
              'en': 'Mapo Tofu',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'eggs',
            name: {
              'zh': '鸡蛋',
              'en': 'Eggs',
            },
            status: 'unlocked',
            notes: {
              'zh': '青椒鸡蛋\n韭菜鸡蛋\n番茄鸡蛋 ⭐95\n葱烧鸡蛋 ⭐92\n芦笋炒蛋\n生菜丝炒鸡蛋\n四季豆炒鸡蛋',
              'en': 'Egg with Peppers\nEgg with Leek\nEgg with Tomato (95/100)\nEgg with Scallion (92/100)\nEgg with Asparagus\nEgg with Shredded Lettuce\nEgg with Green Beans',
            },
          ),
          Dish(
            id: 'stir-fried-cabbage-soup',
            name: {
              'zh': '烂糊白菜',
              'en': 'Stir-fried Cabbage Soup',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'stir-fried-baby-cabbage',
            name: {
              'zh': '蒜蓉娃娃菜',
              'en': 'Stir-fried Baby Cabbage with Garlic',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'fried-lotus-root',
            name: {
              'zh': '炸藕盒',
              'en': 'Fried Lotus Root',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'fried-eggplant',
            name: {
              'zh': '炸茄盒',
              'en': 'Fried Eggplant',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'hot-pot',
        name: {
          'zh': '锅仔',
          'en': 'Hot Pot',
        },
        dishes: [
          Dish(
            id: 'spicy-mix',
            name: {
              'zh': '麻辣拌',
              'en': 'Spicy Mix',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'spicy-pot',
            name: {
              'zh': '麻辣香锅',
              'en': 'Spicy Pot',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'three-sauce-pot',
            name: {
              'zh': '三汁焖锅',
              'en': 'Three Sauce Pot',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'cold-dishes',
        name: {
          'zh': '凉拌类',
          'en': 'Cold Dishes',
        },
        dishes: [
          Dish(
            id: 'cold-tofu-skin',
            name: {
              'zh': '凉拌豆腐皮',
              'en': 'Cold Tofu Skin',
            },
            status: 'unlocked',
            notes: {
              'zh': '师从我爸',
              'en': 'Learned from my dad',
            },
          ),
          Dish(
            id: 'cold-tofu',
            name: {
              'zh': '凉拌豆腐',
              'en': 'Cold Tofu',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'cold-cucumber',
            name: {
              'zh': '凉拌黄瓜',
              'en': 'Cold Cucumber',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'cold-potato',
            name: {
              'zh': '凉拌土豆丝',
              'en': 'Cold Potato Shreds',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'cold-chicken',
            name: {
              'zh': '凉拌/麻酱手撕鸡',
              'en': 'Cold Shredded Chicken with Sesame Sauce',
            },
            status: 'unlocked',
            emoji: '🐔',
            rating: 95,
          ),
          Dish(
            id: 'spicy-chicken',
            name: {
              'zh': '椒麻口水鸡',
              'en': 'Spicy Chicken',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'garlic-peanuts',
            name: {
              'zh': '蒜香花生米',
              'en': 'Garlic Peanuts',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'century-egg-tofu',
            name: {
              'zh': '皮蛋豆腐',
              'en': 'Century Egg with Tofu',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
    ],
  ),
  Category(
    id: 'bbq',
    name: {
      'zh': '烧烤类',
      'en': 'BBQ',
    },
    subcategories: [
      Subcategory(
        id: 'bbq-dishes',
        name: {
          'zh': '烧烤',
          'en': 'BBQ Dishes',
        },
        dishes: [
          Dish(
            id: 'roast-chicken',
            name: {
              'zh': '烤鸡',
              'en': 'Roast Chicken',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'roast-steak',
            name: {
              'zh': '烤牛排',
              'en': 'Roast Steak',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'roast-lamb-ribs',
            name: {
              'zh': '烤羊排',
              'en': 'Roast Lamb Ribs',
            },
            status: 'unlocked',
            emoji: '🍖',
            rating: 95,
            notes: {
              'zh': '撒椒盐！',
              'en': 'Sprinkle with pepper salt!',
            },
          ),
          Dish(
            id: 'roast-leek',
            name: {
              'zh': '烤韭菜',
              'en': 'Roast Leek',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'roast-corn',
            name: {
              'zh': '烤玉米',
              'en': 'Roast Corn',
            },
            status: 'unlocked',
            emoji: '🌽',
            rating: 93,
            notes: {
              'zh': '水果玉米yyds🤤',
              'en': 'Sweet corn is the best!',
            },
          ),
          Dish(
            id: 'orleans-chicken',
            name: {
              'zh': '奥尔良鸡翅&手枪腿',
              'en': 'Orleans Chicken Wings & Drumsticks',
            },
            status: 'unlocked',
            emoji: '🍗',
            rating: 94,
            notes: {
              'zh': '多放调料',
              'en': 'Add more seasoning',
            },
          ),
          Dish(
            id: 'pineapple-chicken-wings',
            name: {
              'zh': '菠萝烤鸡翅',
              'en': 'Pineapple Roast Chicken Wings',
            },
            status: 'unlocked',
            emoji: '🍍',
            rating: 95,
            notes: {
              'zh': '咸甜党yyds😋',
              'en': 'Perfect for sweet and salty lovers',
            },
          ),
          Dish(
            id: 'roast-cabbage',
            name: {
              'zh': '烤包菜',
              'en': 'Roast Cabbage',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'roast-eggplant',
            name: {
              'zh': '烤茄子',
              'en': 'Roast Eggplant',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'roast-oysters',
            name: {
              'zh': '烤生蚝',
              'en': 'Roast Oysters',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
    ],
  ),
  Category(
    id: 'staples',
    name: {
      'zh': '主食类',
      'en': 'Staples',
    },
    subcategories: [
      Subcategory(
        id: 'rice',
        name: {
          'zh': '饭',
          'en': 'Rice',
        },
        dishes: [
          Dish(
            id: 'curry-rice',
            name: {
              'zh': '咖喱饭',
              'en': 'Curry Rice',
            },
            status: 'unlocked',
            notes: {
              'zh': '牛/羊/鸡/土豆',
              'en': 'Beef/Lamb/Chicken/Potato',
            },
          ),
          Dish(
            id: 'lamb-rice',
            name: {
              'zh': '羊肉抓饭',
              'en': 'Lamb Rice',
            },
            status: 'unlocked',
            rating: 90,
            notes: {
              'zh': '90分😋！',
              'en': '90/100!',
            },
          ),
          Dish(
            id: 'beef-egg-rice',
            name: {
              'zh': '牛肉滑蛋饭',
              'en': 'Beef and Egg Rice',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'teriyaki-chicken-rice',
            name: {
              'zh': '照烧鸡排饭',
              'en': 'Teriyaki Chicken Rice',
            },
            status: 'unlocked',
            emoji: '🍗',
            rating: 92,
          ),
          Dish(
            id: 'braised-pork-rice',
            name: {
              'zh': '卤肉饭',
              'en': 'Braised Pork Rice',
            },
            status: 'unlocked',
            emoji: '🥩',
            rating: 95,
          ),
          Dish(
            id: 'hamburger-rice',
            name: {
              'zh': '汉堡排盖饭',
              'en': 'Hamburger Steak Rice',
            },
            status: 'unlocked',
            emoji: '🍖',
            rating: 92,
            notes: {
              'zh': '打个流心蛋，简单美味',
              'en': 'Add a runny egg, simple and delicious',
            },
          ),
          Dish(
            id: 'fried-rice',
            name: {
              'zh': '炒饭',
              'en': 'Fried Rice',
            },
            status: 'unlocked',
            emoji: '🍚',
            rating: 90,
          ),
          Dish(
            id: 'char-siu-rice',
            name: {
              'zh': '蜜汁叉烧饭',
              'en': 'Char Siu Rice',
            },
            status: 'testing',
            notes: {
              'zh': '待测',
              'en': 'To be tested',
            },
          ),
          Dish(
            id: 'pork-pumpkin-rice',
            name: {
              'zh': '五花肉南瓜/土豆焖饭',
              'en': 'Pork Belly with Pumpkin/Potato Rice',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'noodles',
        name: {
          'zh': '面',
          'en': 'Noodles',
        },
        dishes: [
          Dish(
            id: 'ribs-potato-noodles',
            name: {
              'zh': '排骨土豆焖面',
              'en': 'Ribs and Potato Braised Noodles',
            },
            status: 'unlocked',
            emoji: '🍜',
            rating: 95,
          ),
          Dish(
            id: 'scallion-oil-noodles',
            name: {
              'zh': '葱油拌面',
              'en': 'Scallion Oil Noodles',
            },
            status: 'unlocked',
            emoji: '🧅',
            rating: 93,
          ),
          Dish(
            id: 'potato-bean-noodles',
            name: {
              'zh': '土豆豆角焖面',
              'en': 'Potato and Bean Braised Noodles',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'tomato-egg-noodles',
            name: {
              'zh': '番茄鸡蛋拌面',
              'en': 'Tomato and Egg Noodles',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'pepper-pork-noodles',
            name: {
              'zh': '青椒肉丝面',
              'en': 'Pepper and Pork Noodles',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'beef-noodles',
            name: {
              'zh': '牛肉面',
              'en': 'Beef Noodles',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'oil-splashed-noodles',
            name: {
              'zh': '油泼面',
              'en': 'Oil Splashed Noodles',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'zhajiang-noodles',
            name: {
              'zh': '炸酱面',
              'en': 'Zhajiang Noodles',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'fried-cold-noodles',
            name: {
              'zh': '烤冷面',
              'en': 'Fried Cold Noodles',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
      Subcategory(
        id: 'bread',
        name: {
          'zh': '饼/饺',
          'en': 'Bread/Dumplings',
        },
        dishes: [
          Dish(
            id: 'stir-fried-bread',
            name: {
              'zh': '炒饼',
              'en': 'Stir-fried Bread',
            },
            status: 'unlocked',
            emoji: '🥯',
            rating: 90,
          ),
          Dish(
            id: 'scallion-pancake',
            name: {
              'zh': '手抓饼',
              'en': 'Scallion Pancake',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'egg-pancake',
            name: {
              'zh': '鸡蛋灌饼',
              'en': 'Egg Pancake',
            },
            status: 'unlocked',
            notes: {
              'zh': '好久没做了，我还记得么🤔',
              'en': 'Haven\'t made it for a while, do I still remember?',
            },
          ),
          Dish(
            id: 'plain-egg-pancake',
            name: {
              'zh': '鸡蛋饼',
              'en': 'Plain Egg Pancake',
            },
            status: 'unlocked',
            emoji: '🥚',
            rating: 92,
          ),
          Dish(
            id: 'sauce-pancake',
            name: {
              'zh': '酱香饼',
              'en': 'Sauce Pancake',
            },
            status: 'unlocked',
            emoji: '🥯',
            rating: 93,
          ),
          Dish(
            id: 'chinese-hamburger',
            name: {
              'zh': '肉夹馍',
              'en': 'Chinese Hamburger',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'pork-fillet-bun',
            name: {
              'zh': '里脊夹馍',
              'en': 'Pork Fillet Bun',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'beef-pie',
            name: {
              'zh': '牛肉馅饼',
              'en': 'Beef Pie',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁 用手抓饼吧…',
              'en': 'To be unlocked, use scallion pancake...',
            },
          ),
          Dish(
            id: 'meat-pancake',
            name: {
              'zh': '鲜肉锅盔',
              'en': 'Meat Pancake',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁，用手抓饼！',
              'en': 'To be unlocked, use scallion pancake!',
            },
          ),
          Dish(
            id: 'beef-dumplings',
            name: {
              'zh': '牛肉锅贴',
              'en': 'Beef Dumplings',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
    ],
  ),
  Category(
    id: 'soup',
    name: {
      'zh': '汤/粥类',
      'en': 'Soup/Congee',
    },
    subcategories: [
      Subcategory(
        id: 'soup-congee',
        name: {
          'zh': '汤/粥',
          'en': 'Soup/Congee',
        },
        dishes: [
          Dish(
            id: 'yam-corn-ribs-soup',
            name: {
              'zh': '山药玉米排骨汤',
              'en': 'Yam, Corn and Ribs Soup',
            },
            status: 'unlocked',
            emoji: '🌽',
            rating: 94,
          ),
          Dish(
            id: 'corn-chicken-soup',
            name: {
              'zh': '玉米鸡汤',
              'en': 'Corn and Chicken Soup',
            },
            status: 'unlocked',
            emoji: '🌽',
            rating: 92,
          ),
          Dish(
            id: 'tomato-egg-soup',
            name: {
              'zh': '番茄蛋汤',
              'en': 'Tomato and Egg Soup',
            },
            status: 'unlocked',
            notes: {
              'zh': '暖暖的，好喝😋',
              'en': 'Warm and delicious',
            },
          ),
          Dish(
            id: 'rice-congee',
            name: {
              'zh': '米粥',
              'en': 'Rice Congee',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'vermicelli-cabbage-beef-ball-soup',
            name: {
              'zh': '粉丝白菜牛肉丸汤',
              'en': 'Vermicelli, Cabbage and Beef Ball Soup',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'tomato-egg-dough-soup',
            name: {
              'zh': '番茄鸡蛋疙瘩汤',
              'en': 'Tomato and Egg Dough Soup',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'lamb-soup',
            name: {
              'zh': '羊肉汤',
              'en': 'Lamb Soup',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'hot-sour-soup',
            name: {
              'zh': '酸辣汤',
              'en': 'Hot and Sour Soup',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
    ],
  ),
  Category(
    id: 'western',
    name: {
      'zh': '西餐',
      'en': 'Western Cuisine',
    },
    subcategories: [
      Subcategory(
        id: 'western-dishes',
        name: {
          'zh': '西餐',
          'en': 'Western Dishes',
        },
        dishes: [
          Dish(
            id: 'mayonnaise-lobster',
            name: {
              'zh': '蛋黄酱焗龙虾',
              'en': 'Mayonnaise Baked Lobster',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'bacon-cheese-fries',
            name: {
              'zh': '培根芝士薯条',
              'en': 'Bacon and Cheese Fries',
            },
            status: 'unlocked',
            emoji: '🍟',
            rating: 94,
          ),
          Dish(
            id: 'pizza',
            name: {
              'zh': '披萨',
              'en': 'Pizza',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'steak',
            name: {
              'zh': '牛排',
              'en': 'Steak',
            },
            status: 'unlocked',
            emoji: '🥩',
            rating: 95,
            notes: {
              'zh': '空气炸锅200度13分钟！',
              'en': 'Air fryer 200°C for 13 minutes!',
            },
          ),
          Dish(
            id: 'wellington-steak',
            name: {
              'zh': '惠灵顿牛排',
              'en': 'Wellington Steak',
            },
            status: 'unlocked',
            notes: {
              'zh': '米其林超级大菜，需要提前预约呦',
              'en': 'Michelin super dish, need to book in advance',
            },
          ),
          Dish(
            id: 'beef-burger',
            name: {
              'zh': '牛肉汉堡',
              'en': 'Beef Burger',
            },
            status: 'unlocked',
            emoji: '🍔',
            rating: 93,
          ),
          Dish(
            id: 'bacon-mushroom-soup',
            name: {
              'zh': '培根蘑菇奶油浓汤',
              'en': 'Bacon and Mushroom Cream Soup',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'hash-browns',
            name: {
              'zh': '炸薯饼',
              'en': 'Hash Browns',
            },
            status: 'unlocked',
            emoji: '🥔',
            rating: 91,
          ),
          Dish(
            id: 'butter-cheese-potato',
            name: {
              'zh': '黄油芝士蒜香土豆',
              'en': 'Butter and Cheese Garlic Potato',
            },
            status: 'unlocked',
            notes: {
              'zh': '培根/土豆泥',
              'en': 'Bacon/Potato Mash',
            },
          ),
          Dish(
            id: 'french-tomato-chicken',
            name: {
              'zh': '法式番茄奶油炖鸡',
              'en': 'French Tomato Cream Chicken',
            },
            status: 'unlocked',
            emoji: '🍅',
            rating: 92,
          ),
          Dish(
            id: 'tuscan-salmon',
            name: {
              'zh': '托斯卡纳三文鱼',
              'en': 'Tuscan Salmon',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'thai-mint-chicken',
            name: {
              'zh': '泰式薄荷脆皮鸡排',
              'en': 'Thai Mint Crispy Chicken',
            },
            status: 'unlocked',
            emoji: '🌿',
            rating: 94,
            notes: {
              'zh': '鸡排看品质',
              'en': 'Depends on chicken quality',
            },
          ),
          Dish(
            id: 'shakshuka',
            name: {
              'zh': '北非蛋/土耳其烩蛋',
              'en': 'Shakshuka/Turkish Eggs',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'butter-sausage-egg-pancake',
            name: {
              'zh': '黄油香肠葱香蛋饼',
              'en': 'Butter Sausage and Scallion Egg Pancake',
            },
            status: 'unlocked',
            emoji: '🥚',
            rating: 92,
          ),
          Dish(
            id: 'spinach-mushroom-egg-pancake',
            name: {
              'zh': '菠菜口蘑胡萝卜火腿肠芝士蛋饼',
              'en': 'Spinach, Mushroom, Carrot, Ham and Cheese Egg Pancake',
            },
            status: 'unlocked',
          ),
          Dish(
            id: 'potato-bacon-egg-pancake',
            name: {
              'zh': '土豆培根芝士蛋饼',
              'en': 'Potato, Bacon and Cheese Egg Pancake',
            },
            status: 'unlocked',
            emoji: '🥚',
            rating: 93,
          ),
          Dish(
            id: 'korean-bibimbap',
            name: {
              'zh': '韩式拌饭',
              'en': 'Korean Bibimbap',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料任意组装吧',
              'en': 'Mix and match ingredients',
            },
          ),
          Dish(
            id: 'sandwich',
            name: {
              'zh': '自选组装三明治',
              'en': 'Customizable Sandwich',
            },
            status: 'unlocked',
            notes: {
              'zh': '焦糖洋葱 ⭐95\n培根\n鸡蛋\n芝士\n火腿\n奶油菠菜\n炸虾排\n蔬菜沙拉\n汉堡排',
              'en': 'Caramelized Onion (95/100)\nBacon\nEgg\nCheese\nHam\nCreamed Spinach\nFried Shrimp\nVegetable Salad\nHamburger Steak',
            },
          ),
          Dish(
            id: 'pasta',
            name: {
              'zh': '意面',
              'en': 'Pasta',
            },
            status: 'unlocked',
            notes: {
              'zh': '番茄牛肉 ⭐95\n辣奶油奶油海鲜（虾仁，扇贝都可）\nCarbonara ⭐93\n咖喱牛肉/鸡排（待测）',
              'en': 'Tomato Beef (95/100)\nSpicy Cream Seafood (Shrimp, Scallops)\nCarbonara (93/100)\nCurry Beef/Chicken (To be tested)',
            },
          ),
          Dish(
            id: 'parmesan-chicken',
            name: {
              'zh': '帕玛森芝士鸡排',
              'en': 'Parmesan Chicken',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
          Dish(
            id: 'shepherds-pie',
            name: {
              'zh': '牧羊人派',
              'en': 'Shepherd\'s Pie',
            },
            status: 'locked',
            notes: {
              'zh': '待解锁',
              'en': 'To be unlocked',
            },
          ),
        ],
      ),
    ],
  ),
  Category(
    id: 'desert',
    name: {
      'zh': '甜品',
      'en': 'Deserts',
    },
    subcategories: [
      Subcategory(
        id: 'western-dishes',
        name: {
          'zh': '西餐',
          'en': 'Western Dishes',
        },
        dishes: [
          Dish(
            id: 'unkown1',
            name: {
              'zh': '测试1',
              'en': 'Test1',
            },
            status: 'locked',
            emoji: '🥚',
          ),
          Dish(
            id: 'unkown2',
            name: {
              'zh': '测试2',
              'en': 'Test2',
            },
            status: 'locked',
            emoji: '🥚',
            rating: 93,
          ),
        ],
      ),
    ],
  ),
]; 