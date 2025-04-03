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
            notes: {
              'zh': '配料：猪肉、青椒、红椒、大蒜、生姜、酱油、盐、料酒、食用油\n做法：1. 猪肉切片，用料酒和酱油腌制15分钟。2. 青椒和红椒切丝，蒜姜切末。3. 热锅加油，放入蒜姜爆香。4. 加入猪肉炒至变色，再加入辣椒丝翻炒。5. 加盐调味，炒匀出锅。',
              'en': 'Ingredients: Pork, green peppers, red peppers, garlic, ginger, soy sauce, salt, cooking wine, cooking oil\nMethod: 1. Slice pork and marinate with cooking wine and soy sauce for 15 minutes. 2. Slice green and red peppers, mince garlic and ginger. 3. Heat oil in a pan, sauté garlic and ginger until fragrant. 4. Add pork and stir-fry until it changes color, then add pepper slices and stir-fry. 5. Season with salt, stir well, and serve.'
            },
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
            notes: {
              'zh': '配料：猪肉、胡萝卜、葱、姜、酱油、盐、食用油\n做法：1. 猪肉切片，胡萝卜切丝，葱姜切末。2. 猪肉用酱油腌制10分钟。3. 热锅加油，爆香葱姜。4. 放入猪肉炒至变色，再加入胡萝卜丝翻炒。5. 加盐调味，炒至胡萝卜变软即可。',
              'en': 'Ingredients: Pork, carrots, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Slice pork, shred carrots, mince green onions and ginger. 2. Marinate pork with soy sauce for 10 minutes. 3. Heat oil in a pan, sauté green onions and ginger. 4. Add pork and stir-fry until it changes color, then add carrot shreds and stir-fry. 5. Season with salt and cook until carrots soften.'
            },
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
            notes: {
              'zh': '配料：五花肉、韭菜、香干（干豆腐）、蒜、酱油、盐、食用油\n做法：1. 五花肉切片，韭菜切段，香干切条，蒜切末。2. 热锅加油，放入五花肉煸炒出油。3. 加入蒜末爆香，再放入香干翻炒。4. 最后加入韭菜，快速翻炒，加酱油和盐调味，出锅。',
              'en': 'Ingredients: Pork belly, leeks, dried tofu, garlic, soy sauce, salt, cooking oil\nMethod: 1. Slice pork belly, cut leeks into segments, slice dried tofu into strips, mince garlic. 2. Heat oil in a pan, stir-fry pork belly until oil renders. 3. Add minced garlic and sauté until fragrant, then add dried tofu and stir-fry. 4. Finally, add leeks, stir-fry quickly, season with soy sauce and salt, and serve.'
            },
          ),
          Dish(
            id: 'jing-jiang-pork',
            name: {
              'zh': '京酱肉丝',
              'en': 'Jing Jiang Pork Shreds',
            },
            status: 'locked',
            emoji: '🥢',
            notes: {
              'zh': '配料：猪里脊肉、葱、甜面酱、酱油、料酒、糖、淀粉、食用油\n做法：1. 猪里脊切丝，用料酒、酱油和淀粉腌制20分钟。2. 葱切丝备用。3. 热锅加油，放入肉丝快速炒散至变色，盛出。4. 锅中留底油，加入甜面酱炒香，加糖和少许水调匀。5. 放入肉丝翻炒均匀，搭配葱丝食用。',
              'en': 'Ingredients: Pork tenderloin, green onions, sweet bean paste, soy sauce, cooking wine, sugar, cornstarch, cooking oil\nMethod: 1. Shred pork tenderloin, marinate with cooking wine, soy sauce, and cornstarch for 20 minutes. 2. Shred green onions and set aside. 3. Heat oil in a pan, stir-fry pork shreds quickly until they change color, then remove. 4. Leave some oil in the pan, add sweet bean paste and stir-fry until fragrant, then add sugar and a little water to mix. 5. Return pork to the pan, stir-fry evenly, and serve with green onion shreds.'
            },
          ),
          Dish(
            id: 'yu-xiang-pork',
            name: {
              'zh': '鱼香肉丝',
              'en': 'Yu Xiang Pork Shreds',
            },
            status: 'testing',
            emoji: '🐟',
            notes: {
              'zh': '配料：猪里脊肉、木耳、胡萝卜、青椒、葱姜蒜、酱油、醋、糖、淀粉、辣椒、食用油\n做法：1. 猪肉切丝，用酱油和淀粉腌制。2. 木耳泡发切丝，胡萝卜和青椒切丝，葱姜蒜切末。3. 调鱼香汁：酱油、醋、糖、淀粉加水拌匀。4. 热锅加油，炒肉丝至变色盛出。5. 锅中爆香葱姜蒜和辣椒，放入蔬菜炒匀，再加入肉丝和鱼香汁，炒至收汁。',
              'en': 'Ingredients: Pork tenderloin, wood ear mushrooms, carrots, green peppers, green onions, ginger, garlic, soy sauce, vinegar, sugar, cornstarch, chili peppers, cooking oil\nMethod: 1. Shred pork and marinate with soy sauce and cornstarch. 2. Soak and shred wood ear mushrooms, shred carrots and green peppers, mince green onions, ginger, and garlic. 3. Prepare Yu Xiang sauce: mix soy sauce, vinegar, sugar, cornstarch, and water. 4. Heat oil in a pan, stir-fry pork until it changes color, then remove. 5. Sauté green onions, ginger, garlic, and chili peppers in the pan, add vegetables and stir-fry, then add pork and Yu Xiang sauce, cooking until thickened.'
            },
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
            notes: {
              'zh': '配料：猪排骨、葱、姜、蒜、酱油、料酒、糖、八角、食用油\n做法：1. 排骨洗净焯水去血沫。2. 热锅加油，放入糖炒至焦糖色，加入排骨翻炒上色。3. 加葱姜蒜、八角炒香，再加入酱油和料酒。4. 加水没过排骨，大火烧开后转小火炖40分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Pork ribs, green onions, ginger, garlic, soy sauce, cooking wine, sugar, star anise, cooking oil\nMethod: 1. Rinse ribs and blanch to remove blood foam. 2. Heat oil in a pan, add sugar and cook until caramelized, then add ribs and stir-fry to coat. 3. Add green onions, ginger, garlic, and star anise, sauté until fragrant, then add soy sauce and cooking wine. 4. Add water to cover the ribs, bring to a boil, then simmer for 40 minutes. 5. Reduce sauce over high heat and serve.'
            },
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
            notes: {
              'zh': '配料：猪排骨、葱、姜、醋、糖、酱油、料酒、淀粉、食用油\n做法：1. 排骨焯水备用。2. 热锅加油，将排骨煎至两面金黄。3. 加葱姜炒香，加入酱油、料酒、醋和糖调味。4. 加水炖煮30分钟至排骨软烂。5. 大火收汁，撒上淀粉水勾芡即可。',
              'en': 'Ingredients: Pork ribs, green onions, ginger, vinegar, sugar, soy sauce, cooking wine, cornstarch, cooking oil\nMethod: 1. Blanch ribs and set aside. 2. Heat oil in a pan, fry ribs until golden on both sides. 3. Add green onions and ginger, sauté until fragrant, then add soy sauce, cooking wine, vinegar, and sugar. 4. Add water and simmer for 30 minutes until ribs are tender. 5. Reduce sauce over high heat, thicken with cornstarch slurry, and serve.'
            },
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
              'zh': '配料：五花肉、葱、姜、蒜、酱油、料酒、糖、八角、食用油\n做法：1. 五花肉切块焯水去腥。2. 热锅加油，加糖炒至焦糖色，放入五花肉翻炒上色。3. 加葱姜蒜和八角炒香，再加入酱油和料酒。4. 加水没过肉，大火烧开后小火炖1小时。5. 大火收汁至浓稠即可。',
              'en': 'Ingredients: Pork belly, green onions, ginger, garlic, soy sauce, cooking wine, sugar, star anise, cooking oil\nMethod: 1. Cut pork belly into chunks and blanch to remove odor. 2. Heat oil in a pan, add sugar and cook until caramelized, then add pork belly and stir-fry to coat. 3. Add green onions, ginger, garlic, and star anise, sauté until fragrant, then add soy sauce and cooking wine. 4. Add water to cover the pork, bring to a boil, then simmer for 1 hour. 5. Reduce sauce over high heat until thick and serve.'
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
              'zh': '配料：五花肉、土豆、玉米、葱、姜、酱油、料酒、糖、食用油\n做法：1. 五花肉切块焯水，土豆切块，玉米切段。2. 热锅加油，加糖炒至焦糖色，放入五花肉翻炒上色。3. 加葱姜炒香，加入酱油和料酒。4. 放入土豆和玉米，加水炖40分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Pork belly, potatoes, corn, green onions, ginger, soy sauce, cooking wine, sugar, cooking oil\nMethod: 1. Cut pork belly into chunks and blanch, dice potatoes, and cut corn into segments. 2. Heat oil in a pan, add sugar and cook until caramelized, then add pork belly and stir-fry to coat. 3. Add green onions and ginger, sauté until fragrant, then add soy sauce and cooking wine. 4. Add potatoes and corn, cover with water, and simmer for 40 minutes. 5. Reduce sauce over high heat and serve.'
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
              'zh': '配料：猪肉、面粉、淀粉、鸡蛋、五香粉、盐、食用油\n做法：1. 猪肉切小块，用盐和五香粉腌制30分钟。2. 面粉、淀粉和鸡蛋调成糊，裹在肉块上。3. 热锅加油，油温六成热时放入肉块炸至金黄酥脆。4. 捞出控油即可食用。',
              'en': 'Ingredients: Pork, flour, cornstarch, egg, five-spice powder, salt, cooking oil\nMethod: 1. Cut pork into small pieces and marinate with salt and five-spice powder for 30 minutes. 2. Mix flour, cornstarch, and egg into a batter, coat pork pieces. 3. Heat oil in a pan to medium-high heat, fry pork until golden and crispy. 4. Drain oil and serve.'
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
            notes: {
              'zh': '配料：猪排骨、大蒜、酱油、料酒、糖、盐、食用油\n做法：1. 排骨焯水洗净，用酱油、料酒和盐腌制1小时。2. 大蒜切末。3. 热锅加油，放入排骨煎至两面金黄。4. 加入蒜末炒香，加糖和少许水焖煮10分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Pork ribs, garlic, soy sauce, cooking wine, sugar, salt, cooking oil\nMethod: 1. Blanch ribs and rinse, marinate with soy sauce, cooking wine, and salt for 1 hour. 2. Mince garlic. 3. Heat oil in a pan, fry ribs until golden on both sides. 4. Add minced garlic and sauté until fragrant, then add sugar and a little water, simmer for 10 minutes. 5. Reduce sauce over high heat and serve.'
            },
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
              'zh': '配料：猪排、洋葱、酱油、糖、料酒、淀粉、食用油\n做法：1. 猪排用刀背拍松，加入酱油、料酒和淀粉腌制20分钟。2. 洋葱切丝。3. 热锅加油，煎猪排至两面金黄，盛出。4. 锅中留油，炒洋葱至软，加糖和酱油调味。5. 放入猪排翻炒均匀即可。',
              'en': 'Ingredients: Pork chop, onion, soy sauce, sugar, cooking wine, cornstarch, cooking oil\nMethod: 1. Tenderize pork chop with the back of a knife, marinate with soy sauce, cooking wine, and cornstarch for 20 minutes. 2. Slice onion. 3. Heat oil in a pan, fry pork chop until golden on both sides, then remove. 4. Leave some oil in the pan, stir-fry onion until soft, season with sugar and soy sauce. 5. Return pork chop to the pan, stir-fry evenly, and serve.'
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
              'zh': '配料：猪梅花肉、蜂蜜、酱油、料酒、糖、五香粉、蒜、食用油\n做法：1. 猪肉切长条，用酱油、料酒、糖、五香粉和蒜末腌制一夜。2. 烤箱预热180度，猪肉放在烤架上，刷上蜂蜜。3. 烤30分钟，每10分钟翻面并刷一次蜜汁。4. 烤至表面焦糖色即可。',
              'en': 'Ingredients: Pork shoulder, honey, soy sauce, cooking wine, sugar, five-spice powder, garlic, cooking oil\nMethod: 1. Cut pork into long strips, marinate with soy sauce, cooking wine, sugar, five-spice powder, and minced garlic overnight. 2. Preheat oven to 180°C, place pork on a rack, and brush with honey. 3. Bake for 30 minutes, flipping and brushing with honey every 10 minutes. 4. Bake until caramelized and serve.'
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
              'zh': '配料：猪里脊肉、青椒、葱、姜、酱油、盐、淀粉、食用油\n做法：1. 猪肉切丝，用酱油和淀粉腌制15分钟。2. 青椒切丝，葱姜切末。3. 热锅加油，爆香葱姜。4. 放入肉丝炒至变色，再加入青椒丝翻炒。5. 加盐调味，炒匀出锅。',
              'en': 'Ingredients: Pork tenderloin, green peppers, green onions, ginger, soy sauce, salt, cornstarch, cooking oil\nMethod: 1. Shred pork and marinate with soy sauce and cornstarch for 15 minutes. 2. Shred green peppers, mince green onions and ginger. 3. Heat oil in a pan, sauté green onions and ginger. 4. Add pork shreds and stir-fry until they change color, then add pepper shreds and stir-fry. 5. Season with salt, stir well, and serve.'
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
              'zh': '配料：猪肉、粉条、白菜、葱、姜、酱油、盐、食用油\n做法：1. 猪肉切片，粉条泡软，白菜切段。2. 热锅加油，炒猪肉至变色，加葱姜炒香。3. 加入白菜翻炒至软，放入粉条。4. 加水和酱油，大火烧开后小火炖20分钟。5. 加盐调味即可。',
              'en': 'Ingredients: Pork, vermicelli, cabbage, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Slice pork, soak vermicelli until soft, cut cabbage into segments. 2. Heat oil in a pan, stir-fry pork until it changes color, add green onions and ginger and sauté. 3. Add cabbage and stir-fry until soft, then add vermicelli. 4. Add water and soy sauce, bring to a boil, then simmer for 20 minutes. 5. Season with salt and serve.'
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
              'zh': '配料：猪里脊肉、番茄、鸡蛋、淀粉、葱、盐、食用油\n做法：1. 猪肉切片，用淀粉和鸡蛋液腌制20分钟。2. 番茄切块，葱切段。3. 热锅加油，将肉片滑炒至变色，盛出。4. 锅中留油，炒番茄至出汁，加水煮开。5. 放入肉片，加盐调味，煮2分钟即可。',
              'en': 'Ingredients: Pork tenderloin, tomatoes, egg, cornstarch, green onions, salt, cooking oil\nMethod: 1. Slice pork and marinate with cornstarch and egg for 20 minutes. 2. Dice tomatoes, cut green onions into segments. 3. Heat oil in a pan, stir-fry pork slices until they change color, then remove. 4. Leave some oil in the pan, cook tomatoes until juicy, add water and bring to a boil. 5. Add pork slices, season with salt, and cook for 2 minutes before serving.'
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
              'zh': '配料：猪里脊肉、面粉、淀粉、鸡蛋、醋、糖、番茄酱、食用油\n做法：1. 猪肉切条，用盐腌制10分钟。2. 面粉、淀粉和鸡蛋调成糊，裹在肉条上。3. 热锅加油，炸肉条至金黄酥脆，捞出。4. 锅中留油，加糖、醋和番茄酱炒匀成酱汁。5. 放入肉条翻炒裹上酱汁即可。',
              'en': 'Ingredients: Pork tenderloin, flour, cornstarch, egg, vinegar, sugar, ketchup, cooking oil\nMethod: 1. Cut pork into strips and marinate with salt for 10 minutes. 2. Mix flour, cornstarch, and egg into a batter, coat pork strips. 3. Heat oil in a pan, fry pork strips until golden and crispy, then remove. 4. Leave some oil in the pan, add sugar, vinegar, and ketchup, stir-fry to make a sauce. 5. Add pork strips, stir-fry to coat with sauce, and serve.'
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
            notes: {
              'zh': '配料：鱼（鲤鱼或草鱼）、葱、姜、蒜、酱油、料酒、糖、食用油\n做法：1. 鱼洗净两面划刀，用料酒和盐腌制15分钟。2. 热锅加油，煎鱼至两面金黄。3. 加葱姜蒜炒香，加入酱油、料酒和糖调味。4. 加水炖煮20分钟。5. 大火收汁，撒葱花即可。',
              'en': 'Ingredients: Fish (carp or grass carp), green onions, ginger, garlic, soy sauce, cooking wine, sugar, cooking oil\nMethod: 1. Clean fish and score both sides, marinate with cooking wine and salt for 15 minutes. 2. Heat oil in a pan, fry fish until golden on both sides. 3. Add green onions, ginger, and garlic, sauté until fragrant, then add soy sauce, cooking wine, and sugar. 4. Add water and simmer for 20 minutes. 5. Reduce sauce over high heat, sprinkle with green onions, and serve.'
            },
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
              'zh': '配料：牡蛎肉、青椒、红椒、葱、姜、酱油、盐、食用油\n做法：1. 牡蛎肉洗净沥干，青椒和红椒切丝，葱姜切末。2. 热锅加油，爆香葱姜。3. 放入牡蛎肉翻炒至变色。4. 加入辣椒丝快速炒匀，加酱油和盐调味即可。',
              'en': 'Ingredients: Oyster meat, green peppers, red peppers, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Rinse and drain oyster meat, shred green and red peppers, mince green onions and ginger. 2. Heat oil in a pan, sauté green onions and ginger. 3. Add oyster meat and stir-fry until it changes color. 4. Add pepper shreds, stir-fry quickly, season with soy sauce and salt, and serve.'
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
            notes: {
              'zh': '配料：虾仁、腰果、芹菜、干辣椒、花椒、葱、姜、酱油、糖、醋、淀粉、食用油\n做法：1. 虾仁用淀粉腌制10分钟，芹菜切段。2. 腰果炸至金黄捞出。3. 热锅加油，炒香干辣椒和花椒，放入葱姜爆香。4. 加虾仁炒至变色，再放入芹菜翻炒。5. 调酱汁（酱油、糖、醋）倒入，加入腰果炒匀即可。',
              'en': 'Ingredients: Shrimp, cashews, celery, dried chilies, Sichuan peppercorns, green onions, ginger, soy sauce, sugar, vinegar, cornstarch, cooking oil\nMethod: 1. Marinate shrimp with cornstarch for 10 minutes, cut celery into segments. 2. Fry cashews until golden and remove. 3. Heat oil in a pan, sauté dried chilies and peppercorns, then add green onions and ginger. 4. Add shrimp and stir-fry until they change color, then add celery and stir-fry. 5. Mix sauce (soy sauce, sugar, vinegar), pour in, add cashews, stir well, and serve.'
            },
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
              'zh': '配料：大虾、葱、姜、蒜、酱油、料酒、糖、食用油\n做法：1. 大虾剪须洗净。2. 热锅加油，放入大虾煎至两面变红。3. 加葱姜蒜炒香，加入酱油、料酒和糖调味。4. 加少许水焖煮5分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Large shrimp, green onions, ginger, garlic, soy sauce, cooking wine, sugar, cooking oil\nMethod: 1. Trim and rinse shrimp. 2. Heat oil in a pan, fry shrimp until both sides turn red. 3. Add green onions, ginger, and garlic, sauté until fragrant, then add soy sauce, cooking wine, and sugar. 4. Add a little water and braise for 5 minutes. 5. Reduce sauce over high heat and serve.'
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
              'zh': '配料：粉丝、生蚝/虾/扇贝、大蒜、葱、酱油、食用油\n做法：1. 粉丝泡软铺在盘底，生蚝/虾/扇贝洗净放上。2. 大蒜切末，热油炒香，加入酱油调味。3. 将蒜蓉酱淋在海鲜上。4. 水开后蒸8-10分钟。5. 撒葱花出锅。',
              'en': 'Ingredients: Vermicelli, oysters/shrimp/scallops, garlic, green onions, soy sauce, cooking oil\nMethod: 1. Soak vermicelli until soft and place at the bottom of a dish, rinse oysters/shrimp/scallops and arrange on top. 2. Mince garlic, heat oil and sauté until fragrant, add soy sauce to season. 3. Pour garlic sauce over the seafood. 4. Steam for 8-10 minutes after water boils. 5. Sprinkle with green onions and serve.'
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
              'zh': '配料：鱿鱼、姜、蒜、葱、酱油、料酒、盐、食用油\n做法：1. 鱿鱼切圈，用料酒腌制10分钟。2. 姜蒜切末，葱切段。3. 热锅加油，爆香姜蒜。4. 放入鱿鱼圈快速翻炒至卷曲。5. 加酱油和盐调味，撒葱段出锅。',
              'en': 'Ingredients: Squid, ginger, garlic, green onions, soy sauce, cooking wine, salt, cooking oil\nMethod: 1. Cut squid into rings, marinate with cooking wine for 10 minutes. 2. Mince ginger and garlic, cut green onions into segments. 3. Heat oil in a pan, sauté ginger and garlic. 4. Add squid rings and stir-fry quickly until they curl. 5. Season with soy sauce and salt, sprinkle with green onions, and serve.'
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
              'zh': '配料：鱼片（草鱼或鲈鱼）、酸菜、泡椒、葱、姜、蒜、鸡蛋清、淀粉、食用油\n做法：1. 鱼片用蛋清和淀粉腌制15分钟。2. 酸菜切段，泡椒切碎。3. 热锅加油，炒香葱姜蒜和泡椒，加入酸菜炒匀。4. 加水煮开，下鱼片煮至变白。5. 加盐调味即可。',
              'en': 'Ingredients: Fish fillets (grass carp or bass), pickled cabbage, pickled peppers, green onions, ginger, garlic, egg white, cornstarch, cooking oil\nMethod: 1. Marinate fish fillets with egg white and cornstarch for 15 minutes. 2. Cut pickled cabbage into segments, chop pickled peppers. 3. Heat oil in a pan, sauté green onions, ginger, garlic, and pickled peppers, then add pickled cabbage and stir-fry. 4. Add water and bring to a boil, add fish fillets and cook until they turn white. 5. Season with salt and serve.'
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
              'zh': '配料：鱼（鲤鱼或草鱼）、干辣椒、花椒、葱、姜、蒜、豆瓣酱、酱油、食用油\n做法：1. 鱼洗净切块，用料酒腌制15分钟。2. 热锅加油，煎鱼块至两面金黄，盛出。3. 锅中留油，炒香干辣椒、花椒和豆瓣酱。4. 加葱姜蒜炒香，放入鱼块加水煮10分钟。5. 加酱油调味，大火收汁即可。',
              'en': 'Ingredients: Fish (carp or grass carp), dried chilies, Sichuan peppercorns, green onions, ginger, garlic, bean paste, soy sauce, cooking oil\nMethod: 1. Clean and cut fish into chunks, marinate with cooking wine for 15 minutes. 2. Heat oil in a pan, fry fish chunks until golden on both sides, then remove. 3. Leave some oil in the pan, sauté dried chilies, peppercorns, and bean paste. 4. Add green onions, ginger, and garlic, sauté until fragrant, then add fish chunks and water, cook for 10 minutes. 5. Season with soy sauce, reduce sauce over high heat, and serve.'
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
            notes: {
              'zh': '配料：鸡翅、可乐、葱、姜、酱油、料酒、盐、食用油\n做法：1. 鸡翅洗净两面划刀，用料酒腌制10分钟。2. 热锅加油，煎鸡翅至两面金黄。3. 加葱姜炒香，加入酱油和可乐没过鸡翅。4. 大火烧开后小火炖20分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Chicken wings, cola, green onions, ginger, soy sauce, cooking wine, salt, cooking oil\nMethod: 1. Rinse chicken wings and score both sides, marinate with cooking wine for 10 minutes. 2. Heat oil in a pan, fry wings until golden on both sides. 3. Add green onions and ginger, sauté until fragrant, then add soy sauce and cola to cover the wings. 4. Bring to a boil, then simmer for 20 minutes. 5. Reduce sauce over high heat and serve.'
            },
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
              'zh': '配料：鸡翅、土豆、青椒、葱、姜、蒜、酱油、料酒、糖、食用油\n做法：1. 鸡翅用料酒和酱油腌制20分钟，土豆切块，青椒切段。2. 热锅加油，煎鸡翅至金黄。3. 加葱姜蒜炒香，放入土豆和青椒翻炒。4. 加水、酱油和糖，大火烧开后小火炖30分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Chicken wings, potatoes, green peppers, green onions, ginger, garlic, soy sauce, cooking wine, sugar, cooking oil\nMethod: 1. Marinate chicken wings with cooking wine and soy sauce for 20 minutes, dice potatoes, cut green peppers into segments. 2. Heat oil in a pan, fry wings until golden. 3. Add green onions, ginger, and garlic, sauté until fragrant, then add potatoes and green peppers, stir-fry. 4. Add water, soy sauce, and sugar, bring to a boil, then simmer for 30 minutes. 5. Reduce sauce over high heat and serve.'
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
              'zh': '配料：鸡腿肉、葱、姜、酱油、料酒、糖、食用油\n做法：1. 鸡腿肉切块，用料酒和酱油腌制15分钟。2. 葱切段，姜切片。3. 热锅加油，煎鸡肉至两面金黄。4. 加葱姜炒香，加入酱油和糖调味。5. 加水小火焖煮20分钟，大火收汁即可。',
              'en': 'Ingredients: Chicken thigh, green onions, ginger, soy sauce, cooking wine, sugar, cooking oil\nMethod: 1. Cut chicken thigh into pieces, marinate with cooking wine and soy sauce for 15 minutes. 2. Cut green onions into segments, slice ginger. 3. Heat oil in a pan, fry chicken until golden on both sides. 4. Add green onions and ginger, sauté until fragrant, then add soy sauce and sugar. 5. Add water, simmer for 20 minutes, then reduce sauce over high heat and serve.'
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
              'zh': '配料：鸡翅、南乳（红腐乳）、蒜、料酒、淀粉、食用油\n做法：1. 鸡翅用南乳、料酒和蒜末腌制2小时。2. 裹上淀粉。3. 热锅加油，油温六成热时放入鸡翅炸至金黄酥脆。4. 捞出控油即可。',
              'en': 'Ingredients: Chicken wings, fermented bean curd (red), garlic, cooking wine, cornstarch, cooking oil\nMethod: 1. Marinate chicken wings with fermented bean curd, cooking wine, and minced garlic for 2 hours. 2. Coat with cornstarch. 3. Heat oil in a pan to medium-high heat, fry wings until golden and crispy. 4. Drain oil and serve.'
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
            notes: {
              'zh': '配料：鸡腿肉、土豆、番茄、葱、姜、酱油、糖、食用油\n做法：1. 鸡腿肉切块，用酱油腌制15分钟，土豆和番茄切块。2. 热锅加油，煎鸡肉至金黄。3. 加葱姜炒香，放入土豆和番茄翻炒。4. 加水和糖，大火烧开后小火炖30分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Chicken thigh, potatoes, tomatoes, green onions, ginger, soy sauce, sugar, cooking oil\nMethod: 1. Cut chicken thigh into pieces, marinate with soy sauce for 15 minutes, dice potatoes and tomatoes. 2. Heat oil in a pan, fry chicken until golden. 3. Add green onions and ginger, sauté until fragrant, then add potatoes and tomatoes, stir-fry. 4. Add water and sugar, bring to a boil, then simmer for 30 minutes. 5. Reduce sauce over high heat and serve.'
            },
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
            notes: {
              'zh': '配料：鸡肉、青椒、红椒、干辣椒、葱、姜、蒜、酱油、料酒、盐、食用油\n做法：1. 鸡肉切块，用料酒和酱油腌制15分钟。2. 青椒和红椒切丝，葱姜蒜切末，干辣椒剪段。3. 热锅加油，爆香葱姜蒜和干辣椒。4. 放入鸡肉炒至变色，再加入青红椒丝翻炒。5. 加盐调味，炒匀出锅。',
              'en': 'Ingredients: Chicken, green peppers, red peppers, dried chilies, green onions, ginger, garlic, soy sauce, cooking wine, salt, cooking oil\nMethod: 1. Cut chicken into pieces and marinate with cooking wine and soy sauce for 15 minutes. 2. Slice green and red peppers, mince green onions, ginger, and garlic, cut dried chilies into segments. 3. Heat oil in a pan, sauté green onions, ginger, garlic, and dried chilies. 4. Add chicken and stir-fry until it changes color, then add pepper slices and stir-fry. 5. Season with salt, stir well, and serve.'
            },
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
              'zh': '配料：鸡肉、大蒜、柱侯酱、葱、姜、酱油、食用油\n做法：1. 鸡肉切块，用酱油腌制15分钟。2. 大蒜拍碎，葱姜切末。3. 热锅加油，炒鸡肉至变色。4. 加葱姜和大蒜炒香，放入柱侯酱翻炒均匀。5. 加少许水焖煮5分钟即可。',
              'en': 'Ingredients: Chicken, garlic, Chu Hou sauce, green onions, ginger, soy sauce, cooking oil\nMethod: 1. Cut chicken into pieces, marinate with soy sauce for 15 minutes. 2. Crush garlic, mince green onions and ginger. 3. Heat oil in a pan, stir-fry chicken until it changes color. 4. Add green onions, ginger, and garlic, sauté until fragrant, then add Chu Hou sauce and stir-fry evenly. 5. Add a little water, simmer for 5 minutes, and serve.'
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
              'zh': '配料：鸡腿肉、土豆、香菇、青椒、葱、姜、酱油、料酒、糖、食用油\n做法：1. 鸡肉切块，用料酒和酱油腌制15分钟。2. 土豆切块，香菇泡发切片，青椒切段。3. 热锅加油，炒鸡肉至变色。4. 加葱姜炒香，放入土豆、香菇和青椒。5. 加水、酱油和糖，小火焖30分钟，大火收汁即可。',
              'en': 'Ingredients: Chicken thigh, potatoes, shiitake mushrooms, green peppers, green onions, ginger, soy sauce, cooking wine, sugar, cooking oil\nMethod: 1. Cut chicken into pieces, marinate with cooking wine and soy sauce for 15 minutes. 2. Dice potatoes, soak and slice shiitake mushrooms, cut green peppers into segments. 3. Heat oil in a pan, stir-fry chicken until it changes color. 4. Add green onions and ginger, sauté until fragrant, then add potatoes, mushrooms, and green peppers. 5. Add water, soy sauce, and sugar, simmer for 30 minutes, then reduce sauce over high heat and serve.'
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
            notes: {
              'zh': '配料：鸡翅或鸡腿、蒜（蒜香）、蜂蜜（蜂蜜）、醋和糖（糖醋）、面粉、淀粉、盐、食用油\n做法：1. 鸡肉用盐腌制20分钟。2. 面粉和淀粉调成糊，裹在鸡肉上。3. 热锅加油，炸鸡肉至金黄酥脆。4. 蒜香：炒蒜末淋上；蜂蜜：刷蜂蜜；糖醋：炒醋和糖成酱汁裹上。5. 出锅食用。',
              'en': 'Ingredients: Chicken wings or thighs, garlic (garlic flavor), honey (honey flavor), vinegar and sugar (sweet & sour), flour, cornstarch, salt, cooking oil\nMethod: 1. Marinate chicken with salt for 20 minutes. 2. Mix flour and cornstarch into a batter, coat chicken. 3. Heat oil in a pan, fry chicken until golden and crispy. 4. Garlic: Sauté minced garlic and drizzle over; Honey: Brush with honey; Sweet & Sour: Stir-fry vinegar and sugar into a sauce and coat. 5. Serve.'
            },
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
            notes: {
              'zh': '配料：鸡胸肉、大蒜、酱油、料酒、盐、食用油\n做法：1. 鸡胸肉切片，用酱油和料酒腌制20分钟。2. 大蒜切末。3. 热锅加油，煎鸡肉至两面金黄。4. 加蒜末炒香，加盐调味。5. 炒匀出锅即可。',
              'en': 'Ingredients: Chicken breast, garlic, soy sauce, cooking wine, salt, cooking oil\nMethod: 1. Slice chicken breast, marinate with soy sauce and cooking wine for 20 minutes. 2. Mince garlic. 3. Heat oil in a pan, fry chicken until golden on both sides. 4. Add minced garlic and sauté until fragrant, season with salt. 5. Stir well and serve.'
            },
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
              'zh': '配料：鸡翅、干辣椒、花椒、葱、姜、蒜、酱油、糖、食用油\n做法：1. 鸡翅用酱油腌制15分钟。2. 热锅加油，煎鸡翅至金黄。3. 加干辣椒、花椒、葱姜蒜炒香。4. 加酱油和糖调味，翻炒均匀。5. 小火焖5分钟即可。',
              'en': 'Ingredients: Chicken wings, dried chilies, Sichuan peppercorns, green onions, ginger, garlic, soy sauce, sugar, cooking oil\nMethod: 1. Marinate chicken wings with soy sauce for 15 minutes. 2. Heat oil in a pan, fry wings until golden. 3. Add dried chilies, peppercorns, green onions, ginger, and garlic, sauté until fragrant. 4. Season with soy sauce and sugar, stir-fry evenly. 5. Simmer on low heat for 5 minutes and serve.'
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
              'zh': '配料：鸡肉、土豆、干辣椒、花椒、豆瓣酱、葱、姜、蒜、酱油、食用油\n做法：1. 鸡肉切块，用酱油腌制20分钟，土豆切块。2. 热锅加油，炒鸡肉至变色。3. 加干辣椒、花椒和豆瓣酱炒香，再加葱姜蒜。4. 放入土豆，加水炖30分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Chicken, potatoes, dried chilies, Sichuan peppercorns, bean paste, green onions, ginger, garlic, soy sauce, cooking oil\nMethod: 1. Cut chicken into pieces, marinate with soy sauce for 20 minutes, dice potatoes. 2. Heat oil in a pan, stir-fry chicken until it changes color. 3. Add dried chilies, peppercorns, and bean paste, sauté until fragrant, then add green onions, ginger, and garlic. 4. Add potatoes and water, simmer for 30 minutes. 5. Reduce sauce over high heat and serve.'
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
              'zh': '配料：鸡胸肉、花生米、干辣椒、花椒、葱、姜、蒜、酱油、糖、醋、淀粉、食用油\n做法：1. 鸡肉切丁，用淀粉和酱油腌制15分钟。2. 花生米炒熟备用。3. 热锅加油，炒香干辣椒和花椒，加葱姜蒜。4. 放入鸡丁炒至变色，调酱汁（酱油、糖、醋）倒入。5. 加入花生米炒匀即可。',
              'en': 'Ingredients: Chicken breast, peanuts, dried chilies, Sichuan peppercorns, green onions, ginger, garlic, soy sauce, sugar, vinegar, cornstarch, cooking oil\nMethod: 1. Dice chicken, marinate with cornstarch and soy sauce for 15 minutes. 2. Toast peanuts and set aside. 3. Heat oil in a pan, sauté dried chilies and peppercorns, add green onions, ginger, and garlic. 4. Add chicken and stir-fry until it changes color, pour in sauce (soy sauce, sugar, vinegar). 5. Add peanuts, stir well, and serve.'
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
              'zh': '配料：鸭肉、啤酒、葱、姜、蒜、酱油、八角、干辣椒、食用油\n做法：1. 鸭肉切块焯水去腥。2. 热锅加油，炒鸭肉至出油。3. 加葱姜蒜、八角和干辣椒炒香。4. 倒入啤酒和酱油，大火烧开后小火炖40分钟。5. 大火收汁即可。',
              'en': 'Ingredients: Duck, beer, green onions, ginger, garlic, soy sauce, star anise, dried chilies, cooking oil\nMethod: 1. Cut duck into pieces and blanch to remove odor. 2. Heat oil in a pan, stir-fry duck until oil renders. 3. Add green onions, ginger, garlic, star anise, and dried chilies, sauté until fragrant. 4. Pour in beer and soy sauce, bring to a boil, then simmer for 40 minutes. 5. Reduce sauce over high heat and serve.'
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
              'zh': '配料：鸭子、蜂蜜、酱油、五香粉、料酒、葱、姜\n做法：1. 鸭子洗净，用酱油、五香粉和料酒腌制一夜。2. 烤箱预热180度，鸭子刷上蜂蜜。3. 放入烤箱烤1.5小时，每20分钟翻面并刷蜜汁。4. 烤至皮脆肉嫩，切片搭配葱丝食用。',
              'en': 'Ingredients: Duck, honey, soy sauce, five-spice powder, cooking wine, green onions, ginger\nMethod: 1. Clean duck and marinate with soy sauce, five-spice powder, and cooking wine overnight. 2. Preheat oven to 180°C, brush duck with honey. 3. Roast in the oven for 1.5 hours, flipping and brushing with honey every 20 minutes. 4. Roast until skin is crispy and meat is tender, slice and serve with green onion shreds.'
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
            notes: {
              'zh': '配料：羊肉、葱、姜、酱油、料酒、盐、食用油\n做法：1. 羊肉切薄片，用酱油和料酒腌制15分钟。2. 葱切段，姜切丝。3. 热锅加油，爆香姜丝。4. 放入羊肉快速翻炒至变色。5. 加入葱段翻炒均匀，加盐调味后出锅。',
              'en': 'Ingredients: Lamb, green onions, ginger, soy sauce, cooking wine, salt, cooking oil\nMethod: 1. Slice lamb thinly and marinate with soy sauce and cooking wine for 15 minutes. 2. Cut green onions into segments, shred ginger. 3. Heat oil in a pan, sauté ginger. 4. Add lamb and stir-fry quickly until it changes color. 5. Add green onions, stir-fry evenly, season with salt, and serve.'
            },
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
            notes: {
              'zh': '配料：羊肉、孜然粉、干辣椒、葱、姜、酱油、盐、食用油\n做法：1. 羊肉切薄片，用酱油腌制15分钟。2. 葱切段，姜切丝，干辣椒剪段。3. 热锅加油，爆香姜丝和干辣椒。4. 放入羊肉炒至变色，撒入孜然粉翻炒均匀。5. 加盐调味，加入葱段炒匀后出锅。',
              'en': 'Ingredients: Lamb, cumin powder, dried chilies, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Slice lamb thinly and marinate with soy sauce for 15 minutes. 2. Cut green onions into segments, shred ginger, cut dried chilies into segments. 3. Heat oil in a pan, sauté ginger and dried chilies. 4. Add lamb and stir-fry until it changes color, sprinkle with cumin powder and stir-fry evenly. 5. Season with salt, add green onions, stir well, and serve.'
            },
          ),
          Dish(
            id: 'french-lamb-stew',
            name: {
              'zh': '法式炖羊肉',
              'en': 'French Lamb Stew',
            },
            status: 'locked',
            notes: {
              'zh': '配料：羊肉、胡萝卜、土豆、洋葱、西红柿、红酒、迷迭香、盐、食用油\n做法：1. 羊肉切块焯水。2. 热锅加油，炒羊肉至表面焦黄。3. 加入切块的胡萝卜、土豆、洋葱和西红柿翻炒。4. 倒入红酒，加迷迭香和盐调味，加水炖1小时。5. 大火收汁即可。',
              'en': 'Ingredients: Lamb, carrots, potatoes, onions, tomatoes, red wine, rosemary, salt, cooking oil\nMethod: 1. Cut lamb into chunks and blanch. 2. Heat oil in a pan, brown lamb on the surface. 3. Add diced carrots, potatoes, onions, and tomatoes, stir-fry. 4. Pour in red wine, season with rosemary and salt, add water and simmer for 1 hour. 5. Reduce sauce over high heat and serve.'
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
            notes: {
              'zh': '配料：牛肉、香菜、葱、姜、蒜、酱油、料酒、盐、食用油\n做法：1. 牛肉切薄片，用酱油和料酒腌制15分钟。2. 香菜洗净切段，葱姜蒜切末。3. 热锅加油，爆香葱姜蒜。4. 放入牛肉快速翻炒至变色。5. 加入香菜翻炒均匀，加盐调味后出锅。',
              'en': 'Ingredients: Beef, cilantro, green onions, ginger, garlic, soy sauce, cooking wine, salt, cooking oil\nMethod: 1. Slice beef thinly and marinate with soy sauce and cooking wine for 15 minutes. 2. Rinse cilantro and cut into segments, mince green onions, ginger, and garlic. 3. Heat oil in a pan, sauté green onions, ginger, and garlic. 4. Add beef and stir-fry quickly until it changes color. 5. Add cilantro, stir-fry evenly, season with salt, and serve.'
            },
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
            notes: {
              'zh': '配料：牛肉、青椒、红椒、葱、姜、酱油、淀粉、盐、食用油\n做法：1. 牛肉切丝，用酱油和淀粉腌制15分钟。2. 青椒和红椒切丝，葱姜切末。3. 热锅加油，爆香葱姜。4. 放入牛肉丝炒至变色，再加入辣椒丝翻炒。5. 加盐调味，炒匀后出锅。',
              'en': 'Ingredients: Beef, green peppers, red peppers, green onions, ginger, soy sauce, cornstarch, salt, cooking oil\nMethod: 1. Shred beef and marinate with soy sauce and cornstarch for 15 minutes. 2. Shred green and red peppers, mince green onions and ginger. 3. Heat oil in a pan, sauté green onions and ginger. 4. Add beef shreds and stir-fry until they change color, then add pepper shreds and stir-fry. 5. Season with salt, stir well, and serve.'
            },
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
            notes: {
              'zh': '配料：牛尾或牛腩、番茄、洋葱、胡萝卜、葱、姜、酱油、料酒、糖、盐、食用油\n做法：1. 牛尾或牛腩切块，焯水去血沫。2. 番茄切块，洋葱和胡萝卜切丁，葱姜切末。3. 热锅加油，炒香葱姜，放入牛肉煸炒至表面微焦。4. 加入番茄、洋葱和胡萝卜翻炒，加酱油、料酒和糖调味。5. 加水没过食材，大火烧开后小火炖1.5小时，加盐调味后出锅。',
              'en': 'Ingredients: Beef tail or brisket, tomatoes, onion, carrots, green onions, ginger, soy sauce, cooking wine, sugar, salt, cooking oil\nMethod: 1. Cut beef tail or brisket into chunks and blanch to remove blood foam. 2. Dice tomatoes, onion, and carrots, mince green onions and ginger. 3. Heat oil in a pan, sauté green onions and ginger, then add beef and stir-fry until slightly browned. 4. Add tomatoes, onion, and carrots, stir-fry, and season with soy sauce, cooking wine, and sugar. 5. Add water to cover ingredients, bring to a boil, then simmer for 1.5 hours, season with salt, and serve.'
            },
          ),
          Dish(
            id: 'curry-beef-brisket',
            name: {
              'zh': '咖喱牛腩',
              'en': 'Curry Beef Brisket',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：牛腩、土豆、胡萝卜、洋葱、咖喱块、椰奶、盐、食用油\n做法：1. 牛腩切块焯水。2. 热锅加油，炒洋葱至透明，加入牛腩炒至表面焦黄。3. 加土豆和胡萝卜块翻炒。4. 加入咖喱块和椰奶，加水炖40分钟。5. 加盐调味，大火收汁即可。',
              'en': 'Ingredients: Beef brisket, potatoes, carrots, onions, curry blocks, coconut milk, salt, cooking oil\nMethod: 1. Cut beef brisket into chunks and blanch. 2. Heat oil in a pan, sauté onions until translucent, add brisket and brown the surface. 3. Add potato and carrot chunks, stir-fry. 4. Add curry blocks and coconut milk, add water and simmer for 40 minutes. 5. Season with salt, reduce sauce over high heat, and serve.'
            },
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
            notes: {
              'zh': '配料：牛腱肉、葱、姜、八角、桂皮、酱油、料酒、糖、盐\n做法：1. 牛肉焯水去血沫。2. 锅中加水，放入葱姜、八角、桂皮、酱油、料酒和糖煮开。3. 放入牛肉，小火炖2小时。4. 加盐调味，继续炖30分钟。5. 捞出放凉切片即可。',
              'en': 'Ingredients: Beef shank, green onions, ginger, star anise, cinnamon, soy sauce, cooking wine, sugar, salt\nMethod: 1. Blanch beef to remove blood foam. 2. Add water to a pot with green onions, ginger, star anise, cinnamon, soy sauce, cooking wine, and sugar, bring to a boil. 3. Add beef and simmer for 2 hours. 4. Season with salt and simmer for another 30 minutes. 5. Remove, cool, and slice to serve.'
            },
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
            notes: {
              'zh': '配料：卤牛肉、香菜、葱、花椒油、酱油、醋、糖、辣椒油\n做法：1. 卤牛肉切薄片，香菜和葱切段。2. 调酱汁：酱油、醋、糖、花椒油和辣椒油拌匀。3. 将酱汁倒入牛肉中拌匀。4. 撒上香菜和葱段即可。',
              'en': 'Ingredients: Braised beef, cilantro, green onions, Sichuan pepper oil, soy sauce, vinegar, sugar, chili oil\nMethod: 1. Slice braised beef thinly, cut cilantro and green onions into segments. 2. Mix sauce: soy sauce, vinegar, sugar, Sichuan pepper oil, and chili oil. 3. Pour sauce over beef and mix well. 4. Sprinkle with cilantro and green onions and serve.'
            },
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
            notes: {
              'zh': '配料：卤牛肉、蒜苗、葱、姜、酱油、食用油\n做法：1. 卤牛肉切片，蒜苗切段，葱姜切末。2. 热锅加油，爆香葱姜。3. 放入牛肉翻炒，再加入蒜苗快速炒匀。4. 加酱油调味，出锅即可。',
              'en': 'Ingredients: Braised beef, garlic sprouts, green onions, ginger, soy sauce, cooking oil\nMethod: 1. Slice braised beef, cut garlic sprouts into segments, mince green onions and ginger. 2. Heat oil in a pan, sauté green onions and ginger. 3. Add beef and stir-fry, then add garlic sprouts and stir-fry quickly. 4. Season with soy sauce and serve.'
            },
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
              'en': '1.5 soy sauce, 2 honey'
            },
          ),
          Dish(
            id: 'boiled-beef',
            name: {
              'zh': '水煮牛肉',
              'en': 'Boiled Beef',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：牛肉、豆芽、干辣椒、花椒、葱、姜、蒜、豆瓣酱、酱油、食用油\n做法：1. 牛肉切薄片，用淀粉和酱油腌制15分钟。2. 热锅加油，炒香豆瓣酱、干辣椒和花椒。3. 加水煮开，下豆芽煮熟捞出垫底。4. 下牛肉煮至变色，淋上热油和葱花即可。',
              'en': 'Ingredients: Beef, bean sprouts, dried chilies, Sichuan peppercorns, green onions, ginger, garlic, bean paste, soy sauce, cooking oil\nMethod: 1. Slice beef thinly, marinate with cornstarch and soy sauce for 15 minutes. 2. Heat oil in a pan, sauté bean paste, dried chilies, and peppercorns. 3. Add water and bring to a boil, cook bean sprouts and remove to serve as a base. 4. Add beef and cook until it changes color, drizzle with hot oil and green onions, and serve.'
            },
          ),
          Dish(
            id: 'stir-fried-beef-potato',
            name: {
              'zh': '土豆炒牛肉',
              'en': 'Stir-fried Beef with Potato',
            },
            status: 'testing',
            notes: {
              'zh': '配料：牛肉、土豆、葱、姜、酱油、盐、食用油\n做法：1. 牛肉切片，用酱油腌制15分钟，土豆切片。2. 热锅加油，炒牛肉至变色，盛出。3. 加葱姜炒香，放入土豆片炒至半熟。4. 回锅牛肉，加盐调味，炒匀即可。',
              'en': 'Ingredients: Beef, potatoes, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Slice beef and marinate with soy sauce for 15 minutes, slice potatoes. 2. Heat oil in a pan, stir-fry beef until it changes color, then remove. 3. Sauté green onions and ginger, add potato slices and cook until half-done. 4. Return beef to the pan, season with salt, stir well, and serve.'
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
              'zh': '配料：牛肉、青椒、葱、姜、酱油、淀粉、食用油\n做法：1. 牛肉切丝，用酱油和淀粉腌制15分钟。2. 青椒切丝，葱姜切末。3. 热锅加油，爆香葱姜。4. 放入牛肉丝炒至变色，再加青椒丝翻炒。5. 加盐调味，出锅即可。',
              'en': 'Ingredients: Beef, green peppers, green onions, ginger, soy sauce, cornstarch, cooking oil\nMethod: 1. Shred beef and marinate with soy sauce and cornstarch for 15 minutes. 2. Shred green peppers, mince green onions and ginger. 3. Heat oil in a pan, sauté green onions and ginger. 4. Add beef shreds and stir-fry until they change color, then add pepper shreds and stir-fry. 5. Season with salt and serve.'
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
              'zh': '配料：牛肉、黑胡椒粉、洋葱、青椒、酱油、糖、淀粉、食用油\n做法：1. 牛肉切丁，用酱油和淀粉腌制20分钟。2. 洋葱和青椒切块。3. 热锅加油，炒牛肉至变色，盛出。4. 加洋葱和青椒炒软，放入牛肉。5. 加黑胡椒粉和糖调味，炒匀即可。',
              'en': 'Ingredients: Beef, black pepper powder, onion, green pepper, soy sauce, sugar, cornstarch, cooking oil\nMethod: 1. Dice beef and marinate with soy sauce and cornstarch for 20 minutes. 2. Dice onion and green pepper. 3. Heat oil in a pan, stir-fry beef until it changes color, then remove. 4. Sauté onion and green pepper until soft, add beef back. 5. Season with black pepper and sugar, stir well, and serve.'
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
            notes: {
              'zh': '配料：包菜、醋、干辣椒、葱、姜、酱油、糖、食用油\n做法：1. 包菜撕成片洗净。2. 热锅加油，炒香干辣椒、葱和姜。3. 放入包菜翻炒至软。4. 加醋、酱油和糖调味，快速炒匀即可。',
              'en': 'Ingredients: Cabbage, vinegar, dried chilies, green onions, ginger, soy sauce, sugar, cooking oil\nMethod: 1. Tear cabbage into pieces and rinse. 2. Heat oil in a pan, sauté dried chilies, green onions, and ginger. 3. Add cabbage and stir-fry until soft. 4. Season with vinegar, soy sauce, and sugar, stir-fry quickly, and serve.'
            },
          ),
          Dish(
            id: 'stir-fried-greens',
            name: {
              'zh': '油渣/白灼菜心',
              'en': 'Stir-fried/Blanched Greens',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：菜心、猪油渣（可选）、蒜、盐、食用油\n做法：1. 菜心洗净。2. 油渣版：热锅加油，炒香油渣和蒜，放入菜心炒至变色，加盐调味；白灼版：水开后焯菜心1分钟，捞出拌蒜末和盐。3. 出锅即可。',
              'en': 'Ingredients: Choy sum, pork fat (optional), garlic, salt, cooking oil\nMethod: 1. Rinse choy sum. 2. Pork fat version: Heat oil in a pan, sauté pork fat and garlic, add choy sum and stir-fry until it changes color, season with salt; Blanched version: Boil water, blanch choy sum for 1 minute, drain, and mix with minced garlic and salt. 3. Serve.'
            },
          ),
          Dish(
            id: 'stir-fried-cabbage',
            name: {
              'zh': '老厨白菜',
              'en': 'Stir-fried Cabbage',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：白菜、蒜、干辣椒、酱油、盐、食用油\n做法：1. 白菜洗净切段。2. 蒜切片，干辣椒剪段。3. 热锅加油，爆香蒜片和干辣椒。4. 放入白菜翻炒至软。5. 加酱油和盐调味，炒匀后出锅。',
              'en': 'Ingredients: Cabbage, garlic, dried chilies, soy sauce, salt, cooking oil\nMethod: 1. Rinse and cut cabbage into segments. 2. Slice garlic, cut dried chilies into segments. 3. Heat oil in a pan, sauté garlic and dried chilies. 4. Add cabbage and stir-fry until soft. 5. Season with soy sauce and salt, stir well, and serve.'
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
              'zh': '配料：甘蓝、培根、蒜、盐、食用油、蜂蜜、黑胡椒\n做法：1. 甘蓝洗净切段，放入沸水焯1-2分钟后捞出沥干。2. 将焯好的甘蓝放入空气炸锅，200度烤10分钟。3. 培根切小片，蒜切末。4. 热锅加油，放入培根炒出油脂。5. 加蒜末炒香，再放入烤好的甘蓝翻炒至软。6. 加盐、蜂蜜和黑胡椒调味，炒匀后出锅。',
              'en': 'Ingredients: Kale, bacon, garlic, salt, cooking oil, honey, black pepper\nMethod: 1. Rinse and cut kale into segments, blanch in boiling water for 1-2 minutes, then drain. 2. Place blanched kale in an air fryer, bake at 200°C for 10 minutes. 3. Slice bacon into small pieces, mince garlic. 4. Heat oil in a pan, fry bacon until oil renders. 5. Add minced garlic and sauté until fragrant, then add air-fried kale and stir-fry until soft. 6. Season with salt, honey, and black pepper, stir well, and serve.'},
          ),
          Dish(
            id: 'stir-fried-potato-vinegar',
            name: {
              'zh': '醋溜土豆丝',
              'en': 'Stir-fried Potato Shreds with Vinegar',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：土豆、醋、干辣椒、葱、盐、食用油\n做法：1. 土豆去皮切丝，泡水洗去淀粉后沥干。2. 葱切段，干辣椒剪段。3. 热锅加油，爆香干辣椒和葱段。4. 放入土豆丝快速翻炒至变软。5. 加醋和盐调味，炒匀后出锅。',
              'en': 'Ingredients: Potatoes, vinegar, dried chilies, green onions, salt, cooking oil\nMethod: 1. Peel and shred potatoes, soak in water to remove starch, then drain. 2. Cut green onions into segments, cut dried chilies into segments. 3. Heat oil in a pan, sauté dried chilies and green onions. 4. Add potato shreds and stir-fry quickly until soft. 5. Season with vinegar and salt, stir well, and serve.'
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
              'zh': '配料：土豆、孜然粉、干辣椒、葱、盐、食用油\n做法：1. 土豆去皮切小块，煮至八成熟后捞出。2. 葱切段，干辣椒剪段。3. 热锅加油，放入土豆块煎至表面金黄。4. 加干辣椒和葱段炒香，撒孜然粉炒匀即可。',
              'en': 'Ingredients: Potatoes, cumin powder, dried chilies, green onions, salt, cooking oil\nMethod: 1. Peel and cut potatoes into small chunks, boil until 80% cooked, then drain. 2. Cut green onions into segments, cut dried chilies into segments. 3. Heat oil in a pan, fry potato chunks until golden on the surface. 4. Add dried chilies and green onions, sauté until fragrant, then sprinkle with cumin powder and stir-fry evenly. 5. Season with salt, stir well, and serve.'
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
            notes: {
              'zh': '配料：土豆、培根、葱、蒜、酱油、盐、食用油\n做法：1. 土豆去皮切薄片，泡水洗去淀粉后沥干。2. 培根切小片，葱切段，蒜切末。3. 热锅加油，放入培根炒出油脂。4. 加蒜末炒香，再放入土豆片翻炒至熟。5. 加酱油和盐调味，撒上葱段后出锅。',
              'en': 'Ingredients: Potatoes, bacon, green onions, garlic, soy sauce, salt, cooking oil\nMethod: 1. Peel and slice potatoes thinly, soak in water to remove starch, then drain. 2. Cut bacon into small pieces, cut green onions into segments, mince garlic. 3. Heat oil in a pan, fry bacon until oil renders. 4. Add minced garlic and sauté until fragrant, then add potato slices and stir-fry until cooked. 5. Season with soy sauce and salt, sprinkle with green onions, and serve.'
            },
          ),
          Dish(
            id: 'stir-fried-tofu-scallion',
            name: {
              'zh': '葱烧豆腐',
              'en': 'Stir-fried Tofu with Scallion',
            },
            status: 'unlocked',
            rating: 93,
          ),
          Dish(
            id: 'three-fresh-vegetables',
            name: {
              'zh': '地三鲜',
              'en': 'Three Fresh Vegetables',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：茄子、土豆、青椒、葱、姜、蒜、酱油、糖、盐、淀粉、食用油\n做法：1. 茄子和土豆切块，青椒切片。2. 热锅加油，将茄子和土豆炸至金黄，捞出沥油。3. 锅中留底油，爆香葱姜蒜。4. 放入青椒翻炒，再加入炸好的茄子和土豆。5. 调酱汁（酱油、糖、盐、淀粉加水拌匀）倒入，翻炒均匀后出锅。',
              'en': 'Ingredients: Eggplant, potatoes, green peppers, green onions, ginger, garlic, soy sauce, sugar, salt, cornstarch, cooking oil\nMethod: 1. Cut eggplant and potatoes into chunks, slice green peppers. 2. Heat oil in a pan, fry eggplant and potatoes until golden, then drain. 3. Leave some oil in the pan, sauté green onions, ginger, and garlic. 4. Add green peppers and stir-fry, then add fried eggplant and potatoes. 5. Mix sauce (soy sauce, sugar, salt, cornstarch with water), pour in, stir-fry evenly, and serve.'
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
            notes: {
            },
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
            notes: {
            },
          ),
          Dish(
            id: 'mapo-tofu',
            name: {
              'zh': '麻婆豆腐',
              'en': 'Mapo Tofu',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：豆腐、牛肉末、豆瓣酱、花椒、干辣椒、葱、姜、蒜、酱油、淀粉、食用油\n做法：1. 豆腐切块焯水备用。2. 热锅加油，炒香豆瓣酱、花椒和干辣椒。3. 加葱姜蒜炒香，放入牛肉末炒至变色。4. 加入豆腐，加水煮开后小火炖5分钟。5. 用淀粉水勾芡，撒葱花后出锅。',
              'en': 'Ingredients: Tofu, ground beef, bean paste, Sichuan peppercorns, dried chilies, green onions, ginger, garlic, soy sauce, cornstarch, cooking oil\nMethod: 1. Cut tofu into cubes and blanch in boiling water, set aside. 2. Heat oil in a pan, sauté bean paste, Sichuan peppercorns, and dried chilies. 3. Add green onions, ginger, and garlic, sauté until fragrant, then add ground beef and stir-fry until it changes color. 4. Add tofu, pour in water, bring to a boil, then simmer for 5 minutes. 5. Thicken with cornstarch slurry, sprinkle with green onions, and serve.'
            },
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
              'zh': '配料：白菜、猪肉片、粉条、葱、姜、酱油、盐、食用油\n做法：1. 白菜切段，粉条泡软，猪肉切薄片。2. 热锅加油，炒猪肉至变色，加葱姜炒香。3. 放入白菜翻炒至软，加入粉条。4. 加水煮开，小火炖至白菜烂糊。5. 加酱油和盐调味后出锅。',
              'en': 'Ingredients: Cabbage, pork slices, vermicelli, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Cut cabbage into segments, soak vermicelli until soft, slice pork thinly. 2. Heat oil in a pan, stir-fry pork until it changes color, add green onions and ginger and sauté. 3. Add cabbage and stir-fry until soft, then add vermicelli. 4. Add water and bring to a boil, simmer until cabbage is mushy. 5. Season with soy sauce and salt, then serve.'
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
              'zh': '配料：娃娃菜、大蒜、酱油、盐、食用油\n做法：1. 娃娃菜洗净切段，大蒜切末。2. 热锅加油，放入蒜末炒香。3. 加入娃娃菜翻炒至软。4. 加酱油和盐调味，炒匀后出锅。',
              'en': 'Ingredients: Baby cabbage, garlic, soy sauce, salt, cooking oil\nMethod: 1. Rinse and cut baby cabbage into segments, mince garlic. 2. Heat oil in a pan, sauté minced garlic until fragrant. 3. Add baby cabbage and stir-fry until soft. 4. Season with soy sauce and salt, stir well, and serve.'
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
              'zh': '配料：莲藕、猪肉末、面粉、淀粉、鸡蛋、葱、姜、酱油、盐、食用油\n做法：1. 莲藕切片，猪肉末加葱姜末、酱油和盐拌匀。2. 将肉馅夹在两片莲藕间。3. 面粉、淀粉和鸡蛋调成糊，裹在藕盒上。4. 热锅加油，炸至金黄酥脆。5. 捞出控油后食用。',
             'en': 'Ingredients: Lotus root, ground pork, flour, cornstarch, egg, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Slice lotus root, mix ground pork with minced green onions, ginger, soy sauce, and salt. 2. Sandwich pork filling between two lotus root slices. 3. Mix flour, cornstarch, and egg into a batter, coat the lotus root sandwiches. 4. Heat oil in a pan, fry until golden and crispy. 5. Drain oil and serve.'
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
              'zh': '配料：茄子、猪肉末、面粉、淀粉、鸡蛋、葱、姜、酱油、盐、食用油\n做法：1. 茄子切片，猪肉末加葱姜末、酱油和盐拌匀。2. 将肉馅夹在两片茄子间。3. 面粉、淀粉和鸡蛋调成糊，裹在茄盒上。4. 热锅加油，炸至金黄酥脆。5. 捞出控油后食用。',
              'en': 'Ingredients: Eggplant, ground pork, flour, cornstarch, egg, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Slice eggplant, mix ground pork with minced green onions, ginger, soy sauce, and salt. 2. Sandwich pork filling between two eggplant slices. 3. Mix flour, cornstarch, and egg into a batter, coat the eggplant sandwiches. 4. Heat oil in a pan, fry until golden and crispy. 5. Drain oil and serve.'
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
            notes: {
              'zh': '配料：待确认（常见包括粉条、蔬菜、肉片等）、干辣椒、花椒、酱油、糖、醋、食用油\n做法：1. 食材洗净切好，粉条泡软。2. 热锅加油，炒香干辣椒和花椒。3. 放入食材翻炒均匀。4. 加酱油、糖和醋调味，拌匀后出锅。',
              'en': 'Ingredients: To be confirmed (commonly includes vermicelli, vegetables, meat slices, etc.), dried chilies, Sichuan peppercorns, soy sauce, sugar, vinegar, cooking oil\nMethod: 1. Rinse and cut ingredients, soak vermicelli until soft. 2. Heat oil in a pan, sauté dried chilies and Sichuan peppercorns. 3. Add ingredients and stir-fry evenly. 4. Season with soy sauce, sugar, and vinegar, mix well, and serve.'
            },
          ),
          Dish(
            id: 'spicy-pot',
            name: {
              'zh': '麻辣香锅',
              'en': 'Spicy Pot',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：待确认（常见包括肉类、海鲜、蔬菜、豆制品等）、干辣椒、花椒、豆瓣酱、葱、姜、蒜、酱油、食用油\n做法：1. 食材洗净切好。2. 热锅加油，炒香干辣椒、花椒和豆瓣酱。3. 加葱姜蒜炒香，放入食材翻炒。4. 加酱油调味，炒匀后出锅。',
              'en': 'Ingredients: To be confirmed (commonly includes meat, seafood, vegetables, tofu products, etc.), dried chilies, Sichuan peppercorns, bean paste, green onions, ginger, garlic, soy sauce, cooking oil\nMethod: 1. Rinse and cut ingredients. 2. Heat oil in a pan, sauté dried chilies, Sichuan peppercorns, and bean paste. 3. Add green onions, ginger, and garlic, sauté until fragrant, then add ingredients and stir-fry. 4. Season with soy sauce, stir well, and serve.'
            },
          ),
          Dish(
            id: 'three-sauce-pot',
            name: {
              'zh': '三汁焖锅',
              'en': 'Three Sauce Pot',
            },
            status: 'locked',
            notes: {
              'zh': '待确认',
              'en': 'To be confirmed'
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
              'zh': '配料：豆腐皮、葱、蒜、酱油、醋、糖、辣椒油、食用油\n做法：1. 豆腐皮切丝，焯水后过凉水沥干。2. 葱切段，蒜切末。3. 调酱汁：酱油、醋、糖、辣椒油拌匀。4. 将酱汁倒入豆腐皮中拌匀。5. 撒上葱段后食用。',
              'en': 'Ingredients: Tofu skin, green onions, garlic, soy sauce, vinegar, sugar, chili oil, cooking oil\nMethod: 1. Cut tofu skin into strips, blanch in boiling water, then rinse with cold water and drain. 2. Cut green onions into segments, mince garlic. 3. Mix sauce: soy sauce, vinegar, sugar, and chili oil. 4. Pour sauce over tofu skin and mix well. 5. Sprinkle with green onions and serve.'
            },
          ),
          Dish(
            id: 'cold-tofu',
            name: {
              'zh': '凉拌豆腐',
              'en': 'Cold Tofu',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：豆腐、葱、蒜、酱油、醋、糖、辣椒油、食用油\n做法：1. 豆腐切小块，焯水后过凉水沥干。2. 葱切段，蒜切末。3. 调酱汁：酱油、醋、糖、辣椒油拌匀。4. 将酱汁倒入豆腐中拌匀。5. 撒上葱段后食用。',
              'en': 'Ingredients: Tofu, green onions, garlic, soy sauce, vinegar, sugar, chili oil, cooking oil\nMethod: 1. Cut tofu into small cubes, blanch in boiling water, then rinse with cold water and drain. 2. Cut green onions into segments, mince garlic. 3. Mix sauce: soy sauce, vinegar, sugar, and chili oil. 4. Pour sauce over tofu and mix well. 5. Sprinkle with green onions and serve.'
            },
          ),
          Dish(
            id: 'cold-cucumber',
            name: {
              'zh': '凉拌黄瓜',
              'en': 'Cold Cucumber',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：黄瓜、蒜、酱油、醋、糖、辣椒油、食用油\n做法：1. 黄瓜洗净拍碎切块。2. 蒜切末。3. 调酱汁：酱油、醋、糖、辣椒油拌匀。4. 将酱汁倒入黄瓜中拌匀。5. 静置10分钟后食用。',
             'en': 'Ingredients: Cucumber, garlic, soy sauce, vinegar, sugar, chili oil, cooking oil\nMethod: 1. Rinse cucumber, smash and cut into chunks. 2. Mince garlic. 3. Mix sauce: soy sauce, vinegar, sugar, and chili oil. 4. Pour sauce over cucumber and mix well. 5. Let sit for 10 minutes before serving.'
            },
          ),
          Dish(
            id: 'cold-potato',
            name: {
              'zh': '凉拌土豆丝',
              'en': 'Cold Potato Shreds',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：土豆、葱、蒜、酱油、醋、糖、辣椒油、食用油\n做法：1. 土豆去皮切丝，焯水后过凉水沥干。2. 葱切段，蒜切末。3. 调酱汁：酱油、醋、糖、辣椒油拌匀。4. 将酱汁倒入土豆丝中拌匀。5. 撒上葱段后食用。',
              'en': 'Ingredients: Potatoes, green onions, garlic, soy sauce, vinegar, sugar, chili oil, cooking oil\nMethod: 1. Peel and shred potatoes, blanch in boiling water, then rinse with cold water and drain. 2. Cut green onions into segments, mince garlic. 3. Mix sauce: soy sauce, vinegar, sugar, and chili oil. 4. Pour sauce over potato shreds and mix well. 5. Sprinkle with green onions and serve.'
            },
          ),
          Dish(
            id: 'cold-chicken',
            name: {
              'zh': '凉拌麻酱手撕鸡',
              'en': 'Cold Shredded Chicken with Sesame Sauce',
            },
            status: 'unlocked',
            emoji: '🐔',
            rating: 95,
            notes: {
            },
          ),
          Dish(
            id: 'spicy-chicken',
            name: {
              'zh': '椒麻口水鸡',
              'en': 'Spicy Chicken',
            },
            status: 'locked',
            notes: {
              'zh': '配料：鸡肉、花椒、干辣椒、葱、姜、蒜、酱油、醋、糖、食用油\n做法：1. 鸡肉煮熟后撕成丝，过凉水沥干。2. 葱切段，姜蒜切末，干辣椒剪段。3. 热锅加油，炒香花椒和干辣椒，捞出备用。4. 调酱汁：酱油、醋、糖、炒好的花椒辣椒油拌匀。5. 将酱汁倒入鸡丝中拌匀，撒上葱段后食用。',
              'en': 'Ingredients: Chicken, Sichuan peppercorns, dried chilies, green onions, ginger, garlic, soy sauce, vinegar, sugar, cooking oil\nMethod: 1. Cook chicken, shred it, rinse with cold water, and drain. 2. Cut green onions into segments, mince ginger and garlic, cut dried chilies into segments. 3. Heat oil in a pan, sauté Sichuan peppercorns and dried chilies, then remove and set aside. 4. Mix sauce: soy sauce, vinegar, sugar, and the sautéed pepper-chili oil. 5. Pour sauce over chicken shreds, mix well, sprinkle with green onions, and serve.'
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
              'zh': '配料：花生米、大蒜、干辣椒、酱油、糖、食用油\n做法：1. 花生米洗净沥干。2. 热锅加油，炸花生米至金黄酥脆，捞出控油。3. 锅中留底油，炒香蒜末和干辣椒。4. 放入花生米，加酱油和糖翻炒均匀。5. 出锅放凉后食用。',
              'en': 'Ingredients: Peanuts, garlic, dried chilies, soy sauce, sugar, cooking oil\nMethod: 1. Rinse and drain peanuts. 2. Heat oil in a pan, fry peanuts until golden and crispy, then drain oil. 3. Leave some oil in the pan, sauté minced garlic and dried chilies. 4. Add peanuts, season with soy sauce and sugar, and stir-fry evenly. 5. Remove from heat, let cool, and serve.'
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
              'zh': '配料：皮蛋、豆腐、葱、酱油、醋、糖、食用油\n做法：1. 皮蛋去壳切块，豆腐切小块焯水后过凉水沥干。2. 葱切段。3. 调酱汁：酱油、醋、糖拌匀。4. 将皮蛋和豆腐放入盘中，倒入酱汁拌匀。5. 撒上葱段后食用。',
              'en': 'Ingredients: Century egg, tofu, green onions, soy sauce, vinegar, sugar, cooking oil\nMethod: 1. Peel and cut century egg into pieces, cut tofu into small cubes, blanch, rinse with cold water, and drain. 2. Cut green onions into segments. 3. Mix sauce: soy sauce, vinegar, and sugar. 4. Place century egg and tofu in a dish, pour sauce over and mix well. 5. Sprinkle with green onions and serve.'
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
            notes: {
              'zh': '配料：整鸡、盐、黑胡椒、蒜粉、迷迭香、橄榄油\n做法：1. 鸡洗净，用厨房纸擦干。2. 混合盐、黑胡椒、蒜粉和迷迭香，涂抹鸡内外。3. 刷上橄榄油，放入预热180度的烤箱。4. 烤1.5小时，每30分钟翻面一次。5. 烤至表面金黄酥脆后取出食用。',
              'en': 'Ingredients: Whole chicken, salt, black pepper, garlic powder, rosemary, olive oil\nMethod: 1. Rinse chicken and pat dry with paper towels. 2. Mix salt, black pepper, garlic powder, and rosemary, rub inside and outside the chicken. 3. Brush with olive oil, place in a preheated 180°C oven. 4. Roast for 1.5 hours, flipping every 30 minutes. 5. Remove when the surface is golden and crispy, then serve.'
            },
          ),
          Dish(
            id: 'roast-steak',
            name: {
              'zh': '烤牛排',
              'en': 'Roast Steak',
            },
            status: 'unlocked',
            notes: {
              },
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
            },
          ),
          Dish(
            id: 'roast-leek',
            name: {
              'zh': '烤韭菜',
              'en': 'Roast Leek',
            },
            status: 'unlocked',
            notes: {
              },
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
            },
          ),
          Dish(
            id: 'roast-cabbage',
            name: {
              'zh': '烤包菜',
              'en': 'Roast Cabbage',
            },
            status: 'unlocked',
            notes: {
              },
          ),
          Dish(
            id: 'roast-eggplant',
            name: {
              'zh': '烤茄子',
              'en': 'Roast Eggplant',
            },
            status: 'locked',
            notes: {
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
              'zh': '配料：羊肉、大米、胡萝卜、洋葱、孜然粉、盐、食用油\n做法：1. 羊肉切块，大米洗净泡水30分钟，胡萝卜切条，洋葱切丝。2. 热锅加油，炒羊肉至表面焦黄。3. 加洋葱和胡萝卜炒香，撒上孜然粉。4. 放入大米，加水（水面高出米约1厘米），加盐调味。5. 大火煮开后小火焖20分钟，拌匀后食用。',
              'en': 'Ingredients: Lamb, rice, carrots, onions, cumin powder, salt, cooking oil\nMethod: 1. Cut lamb into chunks, rinse rice and soak for 30 minutes, cut carrots into strips, slice onions. 2. Heat oil in a pan, fry lamb until browned. 3. Add onions and carrots, sauté until fragrant, sprinkle with cumin powder. 4. Add rice, pour in water (about 1 cm above rice level), season with salt. 5. Bring to a boil, then simmer for 20 minutes, mix well, and serve.'
            },
          ),
          Dish(
            id: 'beef-egg-rice',
            name: {
              'zh': '牛肉滑蛋饭',
              'en': 'Beef and Egg Rice',
            },
            status: 'unlocked',
            notes: {
             'zh': '配料：牛肉、鸡蛋、大米、葱、姜、酱油、淀粉、盐、食用油\n做法：1. 牛肉切薄片，用酱油和淀粉腌制15分钟。2. 鸡蛋打散加少许盐。3. 热锅加油，炒牛肉至变色，盛出。4. 锅中加油，倒入蛋液炒至半熟，加入牛肉翻炒。5. 将炒好的牛肉蛋盖在煮熟的米饭上，撒上葱花食用。',
              'en': 'Ingredients: Beef, eggs, rice, green onions, ginger, soy sauce, cornstarch, salt, cooking oil\nMethod: 1. Slice beef thinly, marinate with soy sauce and cornstarch for 15 minutes. 2. Beat eggs with a pinch of salt. 3. Heat oil in a pan, stir-fry beef until it changes color, then remove. 4. Add oil to the pan, pour in eggs and scramble until half-cooked, add beef back and stir-fry. 5. Serve over cooked rice, sprinkle with green onions.'},
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
            notes: {
            },
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
            notes: {
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
              'zh': 'ms黑松露酱yyds',
              'en': 'M&S black truffle sauce is the best!',
            },
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
            notes: {
              'zh': '配料：剩饭、鸡蛋、火腿、胡萝卜、葱、酱油、盐、食用油\n做法：1. 鸡蛋打散，火腿和胡萝卜切丁，葱切段。2. 热锅加油，炒鸡蛋至熟，盛出。3. 加少许油，放入火腿和胡萝卜炒香。4. 加入剩饭翻炒均匀，加酱油和盐调味。5. 放入鸡蛋和葱段，炒匀后出锅。',
              'en': 'Ingredients: Leftover rice, eggs, ham, carrots, green onions, soy sauce, salt, cooking oil\nMethod: 1. Beat eggs, dice ham and carrots, cut green onions into segments. 2. Heat oil in a pan, scramble eggs until cooked, then remove. 3. Add a little oil, sauté ham and carrots until fragrant. 4. Add leftover rice, stir-fry evenly, season with soy sauce and salt. 5. Add eggs and green onions, stir well, and serve.'
            },
          ),
          Dish(
            id: 'char-siu-rice',
            name: {
              'zh': '蜜汁叉烧饭',
              'en': 'Char Siu Rice',
            },
            status: 'testing',
            notes: {
              'zh': '配料：猪肉、大米、蜂蜜、酱油、料酒、糖、五香粉、蒜、食用油\n做法：1. 猪肉切长条，用酱油、料酒、糖、五香粉和蒜末腌制一夜。2. 热锅加油，煎猪肉至两面金黄。3. 刷上蜂蜜，放入预热180度的烤箱烤20分钟。4. 烤好的叉烧切片，盖在煮熟的米饭上。5. 淋上少许酱油和蜂蜜汁后食用。',
              'en': 'Ingredients: Pork, rice, honey, soy sauce, cooking wine, sugar, five-spice powder, garlic, cooking oil\nMethod: 1. Cut pork into long strips, marinate with soy sauce, cooking wine, sugar, five-spice powder, and minced garlic overnight. 2. Heat oil in a pan, fry pork until golden on both sides. 3. Brush with honey, bake in a preheated 180°C oven for 20 minutes. 4. Slice roasted char siu and place over cooked rice. 5. Drizzle with a little soy sauce and honey sauce before serving.'
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
              'zh': '配料：五花肉、大米、南瓜或土豆、葱、姜、酱油、料酒、糖、食用油\n做法：1. 五花肉切块，大米洗净泡水30分钟，南瓜或土豆切块。2. 热锅加油，炒五花肉至出油。3. 加葱姜炒香，加入酱油、料酒和糖调味。4. 放入大米和南瓜/土豆，加水（水面高出米约1厘米）。5. 大火煮开后小火焖20分钟，拌匀后食用。',
               'en': 'Ingredients: Pork belly, rice, pumpkin or potatoes, green onions, ginger, soy sauce, cooking wine, sugar, cooking oil\nMethod: 1. Cut pork belly into chunks, rinse rice and soak for 30 minutes, cut pumpkin or potatoes into chunks. 2. Heat oil in a pan, fry pork belly until oil renders. 3. Add green onions and ginger, sauté until fragrant, season with soy sauce, cooking wine, and sugar. 4. Add rice and pumpkin/potatoes, pour in water (about 1 cm above rice level). 5. Bring to a boil, then simmer for 20 minutes, mix well, and serve.'
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
            notes: {
            },
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
            notes: {
            },
          ),
          Dish(
            id: 'potato-bean-noodles',
            name: {
              'zh': '土豆豆角焖面',
              'en': 'Potato and Bean Braised Noodles',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：面条、土豆、四季豆、猪肉、葱、姜、酱油、盐、食用油\n做法：1. 土豆切块，四季豆掰段，猪肉切片。2. 热锅加油，炒猪肉至变色，加葱姜炒香。3. 放入土豆和四季豆翻炒，加酱油和盐调味。4. 加入面条和适量水，大火煮开后小火焖10分钟。5. 水分收干后拌匀食用。',
              'en': 'Ingredients: Noodles, potatoes, green beans, pork, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Cut potatoes into chunks, break green beans into segments, slice pork. 2. Heat oil in a pan, stir-fry pork until it changes color, add green onions and ginger and sauté. 3. Add potatoes and green beans, stir-fry, season with soy sauce and salt. 4. Add noodles and enough water, bring to a boil, then simmer for 10 minutes. 5. Mix well once water is absorbed and serve.'
            },
          ),
          Dish(
            id: 'tomato-egg-noodles',
            name: {
              'zh': '番茄鸡蛋拌面',
              'en': 'Tomato and Egg Noodles',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：面条、番茄、鸡蛋、葱、姜、酱油、糖、盐、食用油\n做法：1. 番茄切块，鸡蛋打散，葱姜切末。2. 热锅加油，炒鸡蛋至熟，盛出。3. 加少许油，炒葱姜和番茄至出汁，加糖和盐调味。4. 面条煮熟捞出，放入番茄蛋汁中拌匀。5. 撒上葱花后食用。',
              'en': 'Ingredients: Noodles, tomatoes, eggs, green onions, ginger, soy sauce, sugar, salt, cooking oil\nMethod: 1. Dice tomatoes, beat eggs, mince green onions and ginger. 2. Heat oil in a pan, scramble eggs until cooked, then remove. 3. Add a little oil, sauté green onions, ginger, and tomatoes until juicy, season with sugar and salt. 4. Cook noodles, drain, and mix with tomato-egg sauce. 5. Sprinkle with green onions and serve.'
            },
          ),
          Dish(
            id: 'pepper-pork-noodles',
            name: {
              'zh': '青椒肉丝面',
              'en': 'Pepper and Pork Noodles',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：面条、猪肉、青椒、葱、姜、酱油、淀粉、盐、食用油\n做法：1. 猪肉切丝，用酱油和淀粉腌制15分钟，青椒切丝。2. 热锅加油，炒肉丝至变色，盛出。3. 加少许油，爆香葱姜，放入青椒炒软。4. 回锅肉丝，加盐调味，炒匀后盖在煮熟的面条上食用。',
              'en': 'Ingredients: Noodles, pork, green peppers, green onions, ginger, soy sauce, cornstarch, salt, cooking oil\nMethod: 1. Shred pork, marinate with soy sauce and cornstarch for 15 minutes, shred green peppers. 2. Heat oil in a pan, stir-fry pork until it changes color, then remove. 3. Add a little oil, sauté green onions and ginger, add green peppers and stir-fry until soft. 4. Return pork to the pan, season with salt, stir well, and serve over cooked noodles.'
            },
          ),
          Dish(
            id: 'beef-noodles',
            name: {
              'zh': '牛肉面',
              'en': 'Beef Noodles',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：面条、牛肉、葱、姜、八角、酱油、盐、食用油\n做法：1. 牛肉切块焯水去血沫。2. 热锅加油，炒葱姜和八角，放入牛肉煸炒。3. 加水煮开，小火炖1小时，加酱油和盐调味。4. 面条煮熟捞出，放入牛肉汤中。5. 撒上葱花后食用。',
              'en': 'Ingredients: Noodles, beef, green onions, ginger, star anise, soy sauce, salt, cooking oil\nMethod: 1. Cut beef into chunks and blanch to remove blood foam. 2. Heat oil in a pan, sauté green onions, ginger, and star anise, add beef and stir-fry. 3. Add water, bring to a boil, simmer for 1 hour, season with soy sauce and salt. 4. Cook noodles, drain, and place in beef broth. 5. Sprinkle with green onions and serve.'
            },
          ),
          Dish(
            id: 'oil-splashed-noodles',
            name: {
              'zh': '油泼面',
              'en': 'Oil Splashed Noodles',
            },
            status: 'locked',
            notes: {
              'zh': '配料：面条、葱、蒜、干辣椒粉、酱油、醋、盐、食用油\n做法：1. 面条煮熟捞出，放入碗中。2. 葱切段，蒜切末，撒上干辣椒粉。3. 热锅加油，油烧至冒烟后泼在调料上。4. 加酱油和醋拌匀。5. 拌匀后即可食用。',
              'en': 'Ingredients: Noodles, green onions, garlic, chili powder, soy sauce, vinegar, salt, cooking oil\nMethod: 1. Cook noodles, drain, and place in a bowl. 2. Cut green onions into segments, mince garlic, sprinkle with chili powder. 3. Heat oil in a pan until smoking, pour over the seasonings. 4. Add soy sauce and vinegar, mix well. 5. Stir and serve.'
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
              'zh': '配料：面条、猪肉末、甜面酱、黄豆酱、葱、姜、食用油\n做法：1. 热锅加油，炒葱姜和猪肉末至变色。2. 加入甜面酱和黄豆酱炒香，加少许水煮开。3. 小火熬至酱汁浓稠。4. 面条煮熟捞出，淋上炸酱。5. 拌匀后食用。',
              'en': 'Ingredients: Noodles, ground pork, sweet bean paste, soybean paste, green onions, ginger, cooking oil\nMethod: 1. Heat oil in a pan, sauté green onions, ginger, and ground pork until it changes color. 2. Add sweet bean paste and soybean paste, stir-fry until fragrant, add a little water and bring to a boil. 3. Simmer until the sauce thickens. 4. Cook noodles, drain, and top with the sauce. 5. Mix well and serve.'
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
              'zh': '配料：冷面、鸡蛋、火腿肠、葱、酱油、糖、醋、食用油\n做法：1. 冷面提前泡软，火腿肠切片，葱切段。2. 热平底锅加油，放入冷面煎至一面金黄。3. 翻面后打入鸡蛋，煎熟。4. 加火腿肠、酱油、糖和醋调味，撒上葱段。5. 煎至两面焦脆后食用。',
              'en': 'Ingredients: Cold noodles, egg, sausage, green onions, soy sauce, sugar, vinegar, cooking oil\nMethod: 1. Soak cold noodles until soft, slice sausage, cut green onions into segments. 2. Heat oil in a flat pan, fry noodles until one side is golden. 3. Flip, crack an egg on top, and fry until cooked. 4. Add sausage, season with soy sauce, sugar, and vinegar, sprinkle with green onions. 5. Fry until both sides are crispy and serve.'
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
            notes: {
            },
          ),
          Dish(
            id: 'scallion-pancake',
            name: {
              'zh': '手抓饼',
              'en': 'Scallion Pancake',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：面粉、水、葱、盐、食用油\n做法：1. 面粉加水和少许盐揉成面团，醒30分钟。2. 擀成薄片，刷油撒上葱花，卷起再擀平。3. 热平底锅加油，放入面饼煎至两面金黄。4. 煎好后用手抓松。5. 出锅后即可食用。',
              'en': 'Ingredients: Flour, water, green onions, salt, cooking oil\nMethod: 1. Mix flour with water and a pinch of salt to form a dough, let rest for 30 minutes. 2. Roll out into a thin sheet, brush with oil, sprinkle with chopped green onions, roll up, and flatten again. 3. Heat oil in a flat pan, fry the pancake until golden on both sides. 4. After frying, scrunch with hands to loosen. 5. Serve immediately.'
            },
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
            notes: {
            },
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
            notes: {
            },
          ),
          Dish(
            id: 'chinese-hamburger',
            name: {
              'zh': '肉夹馍',
              'en': 'Chinese Hamburger',
            },
            status: 'locked',
            notes: {
              'zh': '配料：面粉、猪肉、葱、姜、八角、酱油、料酒、糖、食用油\n做法：1. 面粉加水揉成面团，发酵后擀成饼，烤至金黄。2. 猪肉切块焯水，热锅加油炒至表面焦黄。3. 加葱姜、八角、酱油、料酒和糖，加水炖1小时。4. 炖好的肉剁碎，夹入烤好的饼中。5. 出锅后食用。',
              'en': 'Ingredients: Flour, pork, green onions, ginger, star anise, soy sauce, cooking wine, sugar, cooking oil\nMethod: 1. Mix flour with water to form a dough, ferment, roll into flatbreads, and bake until golden. 2. Cut pork into chunks, blanch, then fry in a heated pan with oil until browned. 3. Add green onions, ginger, star anise, soy sauce, cooking wine, and sugar, cover with water and braise for 1 hour. 4. Chop braised pork and stuff into baked flatbreads. 5. Serve immediately.'
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
              'zh': '配料：面粉、猪里脊肉、面粉、淀粉、鸡蛋、葱、酱油、盐、食用油\n做法：1. 面粉加水揉成面团，发酵后擀成饼，烤至金黄。2. 猪里脊切条，用酱油腌制20分钟。3. 面粉、淀粉和鸡蛋调成糊，裹在肉条上。4. 热锅加油，炸肉条至金黄酥脆。5. 炸好的肉夹入饼中，撒上葱花食用。',
              'en': 'Ingredients: Flour, pork tenderloin, flour, cornstarch, egg, green onions, soy sauce, salt, cooking oil\nMethod: 1. Mix flour with water to form a dough, ferment, roll into flatbreads, and bake until golden. 2. Cut pork tenderloin into strips, marinate with soy sauce for 20 minutes. 3. Mix flour, cornstarch, and egg into a batter, coat pork strips. 4. Heat oil in a pan, fry pork strips until golden and crispy. 5. Place fried pork in the flatbreads, sprinkle with green onions, and serve.'
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
              'zh': '配料：面粉、牛肉末、葱、姜、酱油、盐、食用油\n做法：1. 面粉加水揉成面团，醒30分钟。2. 牛肉末加葱姜末、酱油和盐拌匀。3. 面团分成小份，擀成圆皮包入牛肉馅。4. 热平底锅加油，煎馅饼至两面金黄。5. 出锅后食用。',
              'en': 'Ingredients: Flour, ground beef, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Mix flour with water to form a dough, let rest for 30 minutes. 2. Mix ground beef with minced green onions, ginger, soy sauce, and salt. 3. Divide dough into small portions, roll into rounds, and fill with beef mixture. 4. Heat oil in a flat pan, fry pies until golden on both sides. 5. Serve immediately.'
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
              'zh': '配料：面粉、猪肉末、葱、姜、酱油、盐、食用油\n做法：1. 面粉加水揉成面团，醒30分钟。2. 猪肉末加葱姜末、酱油和盐拌匀。3. 面团擀成大圆皮，抹油撒肉馅，卷起压扁。4. 热平底锅加油，煎至两面金黄酥脆。5. 出锅后食用。',
              'en': 'Ingredients: Flour, ground pork, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Mix flour with water to form a dough, let rest for 30 minutes. 2. Mix ground pork with minced green onions, ginger, soy sauce, and salt. 3. Roll dough into a large round, spread with oil and meat filling, roll up and flatten. 4. Heat oil in a flat pan, fry until golden and crispy on both sides. 5. Serve immediately.'
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
              'zh': '配料：面粉、牛肉末、葱、姜、酱油、盐、食用油\n做法：1. 面粉加水揉成面团，醒30分钟。2. 牛肉末加葱姜末、酱油和盐拌匀。3. 面团分成小份，擀成圆皮包入牛肉馅。4. 热平底锅加油，放入锅贴煎至底部金黄，加水盖盖焖5分钟。5. 水分收干后出锅食用。',
              'en': 'Ingredients: Flour, ground beef, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Mix flour with water to form a dough, let rest for 30 minutes. 2. Mix ground beef with minced green onions, ginger, soy sauce, and salt. 3. Divide dough into small portions, roll into rounds, and fill with beef mixture. 4. Heat oil in a flat pan, fry dumplings until bottoms are golden, add water, cover, and steam for 5 minutes. 5. Serve once water evaporates.'
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
            notes: {
            },
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
            notes: {
            },
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
            notes: {
            },
          ),
          Dish(
            id: 'vermicelli-cabbage-beef-ball-soup',
            name: {
              'zh': '粉丝白菜牛肉丸汤',
              'en': 'Vermicelli, Cabbage and Beef Ball Soup',
            },
            status: 'locked',
            notes: {
              'zh': '配料：粉丝、白菜、牛肉丸、葱、姜、酱油、盐、食用油\n做法：1. 粉丝泡软，白菜切段，牛肉丸备好。2. 热锅加油，爆香葱姜。3. 加水煮开，放入牛肉丸煮5分钟。4. 加入白菜和粉丝，再煮3分钟。5. 加酱油和盐调味后出锅。',
              'en': 'Ingredients: Vermicelli, cabbage, beef balls, green onions, ginger, soy sauce, salt, cooking oil\nMethod: 1. Soak vermicelli until soft, cut cabbage into segments, prepare beef balls. 2. Heat oil in a pot, sauté green onions and ginger. 3. Add water and bring to a boil, add beef balls and cook for 5 minutes. 4. Add cabbage and vermicelli, cook for another 3 minutes. 5. Season with soy sauce and salt, then serve.'
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
              'zh': '配料：面粉、番茄、鸡蛋、葱、盐、食用油\n做法：1. 面粉加水调成面疙瘩，番茄切块，鸡蛋打散。2. 热锅加油，炒番茄至出汁，加水煮开。3. 下入面疙瘩，煮至浮起。4. 倒入蛋液，搅拌成蛋花，加盐调味。5. 撒上葱花后出锅。',
              'en': 'Ingredients: Flour, tomatoes, eggs, green onions, salt, cooking oil\nMethod: 1. Mix flour with water to form dough lumps, dice tomatoes, beat eggs. 2. Heat oil in a pot, sauté tomatoes until juicy, add water and bring to a boil. 3. Add dough lumps, cook until they float. 4. Pour in egg mixture, stir into egg flowers, season with salt. 5. Sprinkle with green onions and serve.'
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
              'zh': '配料：羊肉、葱、姜、白萝卜、八角、盐、食用油\n做法：1. 羊肉切块焯水去血沫。2. 热锅加油，炒葱姜和八角，放入羊肉煸炒。3. 加水煮开，小火炖1.5小时。4. 加入白萝卜块，再煮20分钟。5. 加盐调味后出锅。',
              'en': 'Ingredients: Lamb, green onions, ginger, white radish, star anise, salt, cooking oil\nMethod: 1. Cut lamb into chunks and blanch to remove blood foam. 2. Heat oil in a pot, sauté green onions, ginger, and star anise, add lamb and stir-fry. 3. Add water, bring to a boil, simmer for 1.5 hours. 4. Add white radish chunks, cook for another 20 minutes. 5. Season with salt and serve.'
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
              'zh': '配料：木耳、豆腐、猪肉丝、鸡蛋、醋、胡椒粉、酱油、淀粉、食用油\n做法：1. 木耳泡发切丝，豆腐切条，猪肉切丝腌制。2. 热锅加油，炒肉丝至变色，加入木耳和豆腐。3. 加水煮开，调入醋、胡椒粉和酱油。4. 淀粉加水勾芡，倒入蛋液成蛋花。5. 煮1分钟后出锅。',
              'en': 'Ingredients: Wood ear mushrooms, tofu, pork shreds, egg, vinegar, white pepper, soy sauce, cornstarch, cooking oil\nMethod: 1. Soak and shred wood ear mushrooms, cut tofu into strips, marinate pork shreds. 2. Heat oil in a pot, stir-fry pork until it changes color, add wood ear and tofu. 3. Add water and bring to a boil, season with vinegar, white pepper, and soy sauce. 4. Thicken with cornstarch slurry, pour in egg to form egg flowers. 5. Cook for 1 minute and serve.'
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
            rating: 70,
            notes: {
            },
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
            notes: {
            },
          ),
          Dish(
            id: 'pizza',
            name: {
              'zh': '披萨',
              'en': 'Pizza',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：面粉、酵母、番茄酱、奶酪、火腿、洋葱、青椒、橄榄油\n做法：1. 面粉加酵母和水揉成面团，发酵1小时。2. 擀成圆形饼底，涂上番茄酱。3. 撒上奶酪，铺上火腿、洋葱和青椒。4. 放入预热200度的烤箱，烤15-20分钟。5. 烤至奶酪融化后取出食用。',
              'en': 'Ingredients: Flour, yeast, tomato sauce, cheese, ham, onion, green pepper, olive oil\nMethod: 1. Mix flour with yeast and water to form a dough, let ferment for 1 hour. 2. Roll into a round base, spread with tomato sauce. 3. Sprinkle with cheese, top with ham, onion, and green pepper. 4. Bake in a preheated 200°C oven for 15-20 minutes. 5. Remove when cheese is melted and serve.'
            },
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
              'zh': '配料：牛排、酥皮、蘑菇、火腿、盐、黑胡椒、黄油、鸡蛋\n做法：1. 牛排用盐和黑胡椒腌制，煎至两面金黄。2. 蘑菇切碎炒干水分，加黄油调味。3. 酥皮铺平，放入火腿、蘑菇和牛排，包紧。4. 刷上蛋液，放入预热200度的烤箱烤30分钟。5. 烤至酥皮金黄后取出切片食用。',
              'en': 'Ingredients: Steak, puff pastry, mushrooms, ham, salt, black pepper, butter, egg\nMethod: 1. Season steak with salt and black pepper, sear until golden on both sides. 2. Chop mushrooms, sauté until dry, season with butter. 3. Lay out puff pastry, layer with ham, mushrooms, and steak, wrap tightly. 4. Brush with egg wash, bake in a preheated 200°C oven for 30 minutes. 5. Remove when pastry is golden, slice, and serve.'
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
            notes: {
            },
          ),
          Dish(
            id: 'bacon-mushroom-soup',
            name: {
              'zh': '培根蘑菇奶油浓汤',
              'en': 'Bacon and Mushroom Cream Soup',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：培根、蘑菇、洋葱、黄油、面粉、牛奶、盐、黑胡椒\n做法：1. 培根切小片，蘑菇和洋葱切碎。2. 热锅加黄油，炒培根至出油，加入洋葱和蘑菇炒软。3. 撒上面粉炒匀，倒入牛奶搅拌至浓稠。4. 加盐和黑胡椒调味，小火煮5分钟。5. 出锅后即可食用。',
              'en': 'Ingredients: Bacon, mushrooms, onion, butter, flour, milk, salt, black pepper\nMethod: 1. Cut bacon into small pieces, chop mushrooms and onion. 2. Heat butter in a pot, fry bacon until oil renders, add onion and mushrooms, sauté until soft. 3. Sprinkle flour, stir well, pour in milk, and stir until thickened. 4. Season with salt and black pepper, simmer for 5 minutes. 5. Serve immediately.'
            },
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
            notes: {
            },
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
            notes: {
            },
          ),
          Dish(
            id: 'tuscan-salmon',
            name: {
              'zh': '托斯卡纳三文鱼',
              'en': 'Tuscan Salmon',
            },
            status: 'unlocked',
            notes: {
              'zh': '配料：三文鱼、奶油、番茄、菠菜、大蒜、橄榄油、盐、黑胡椒、帕尔马干酪（可选）\n做法：1. 三文鱼用盐和黑胡椒腌制10分钟。2. 热锅加橄榄油，煎三文鱼每面2-3分钟至金黄，取出备用。3. 锅中加蒜末炒香，放入番茄炒软。4. 倒入奶油，加入菠菜煮至软化。5. 放回三文鱼，小火炖5分钟，撒上帕尔马干酪后出锅。',
              'en': 'Ingredients: Salmon, cream, tomatoes, spinach, garlic, olive oil, salt, black pepper, Parmesan cheese (optional)\nMethod: 1. Season salmon with salt and black pepper, marinate for 10 minutes. 2. Heat olive oil in a pan, sear salmon 2-3 minutes per side until golden, then set aside. 3. Sauté minced garlic in the pan until fragrant, add tomatoes and cook until soft. 4. Pour in cream, add spinach, and cook until wilted. 5. Return salmon to the pan, simmer for 5 minutes, sprinkle with Parmesan, and serve.'
            },
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
            },
          ),
          Dish(
            id: 'shakshuka',
            name: {
              'zh': '北非蛋/土耳其烩蛋',
              'en': 'Shakshuka/Turkish Eggs',
            },
            status: 'unlocked',
            notes: {
            },
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
            notes: {
            },
          ),
          Dish(
            id: 'spinach-mushroom-egg-pancake',
            name: {
              'zh': '菠菜口蘑胡萝卜火腿肠芝士蛋饼',
              'en': 'Spinach, Mushroom, Carrot, Ham and Cheese Egg Pancake',
            },
            status: 'unlocked',
            notes: {
            },
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
            notes: {
            },
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
            id: 'panna-cotta',
            name: {
              'zh': '奶冻',
              'en': 'Panna Cotta',
            },
            status: 'locked',
            notes: {
              'zh': '配料：淡奶油、牛奶、糖、吉利丁片、香草精（可选）、水果（装饰用）\n做法：1. 吉利丁片用冷水泡软。2. 淡奶油、牛奶和糖小火加热至糖溶解，不沸腾。3. 加入泡软的吉利丁片搅拌至融化，可加香草精提味。4. 倒入模具，冷藏4小时至凝固。5. 脱模后装饰水果食用。',
              'en': 'Ingredients: Heavy cream, milk, sugar, gelatin sheets, vanilla extract (optional), fruit (for garnish)\nMethod: 1. Soak gelatin sheets in cold water until soft. 2. Heat heavy cream, milk, and sugar over low heat until sugar dissolves, without boiling. 3. Add softened gelatin, stir until melted, optionally add vanilla extract for flavor. 4. Pour into molds, refrigerate for 4 hours until set. 5. Unmold and garnish with fruit before serving.'
            },
          ),
          Dish(
            id: 'tiramisu',
            name: {
              'zh': '提拉米苏',
              'en': 'Tiramisu',
            },
            status: 'locked',
            notes: {
              'zh': '配料：马斯卡彭奶酪、淡奶油、糖、咖啡、朗姆酒（可选）、手指饼干、可可粉\n做法：1. 咖啡冷却后加朗姆酒（可选）。2. 淡奶油加糖打发，马斯卡彭奶酪拌匀后加入打发奶油。3. 手指饼干蘸咖啡铺在模具底部，涂一层奶酪糊。4. 重复饼干和奶酪层，冷藏4小时。5. 出模后撒上可可粉食用。',
              'en': 'Ingredients: Mascarpone cheese, heavy cream, sugar, coffee, rum (optional), ladyfingers, cocoa powder\nMethod: 1. Cool coffee and mix with rum (optional). 2. Whip heavy cream with sugar, blend mascarpone, then fold into whipped cream. 3. Dip ladyfingers in coffee, layer in a mold, spread a layer of cheese mixture. 4. Repeat layers, refrigerate for 4 hours. 5. Unmold, dust with cocoa powder, and serve.'
            },
          ),
          Dish(
            id: 'chiffon-cake',
            name: {
              'zh': '戚风蛋糕',
              'en': 'Chiffon Cake',
            },
            status: 'locked',
            notes: {
              'zh': '配料：鸡蛋、低筋面粉、糖、牛奶、食用油、柠檬汁、香草精（可选）\n做法：1. 蛋黄加糖、牛奶和油拌匀，筛入面粉搅拌成糊。2. 蛋白加柠檬汁和糖打发至硬性发泡。3. 将蛋白分次拌入蛋黄糊，倒入模具。4. 放入预热160度的烤箱，烤40-50分钟。5. 烤好后倒扣冷却，脱模食用。',
              'en': 'Ingredients: Eggs, cake flour, sugar, milk, cooking oil, lemon juice, vanilla extract (optional)\nMethod: 1. Mix egg yolks with sugar, milk, and oil, sift in flour, and stir into a batter. 2. Beat egg whites with lemon juice and sugar until stiff peaks form. 3. Fold egg whites into yolk batter in batches, pour into a mold. 4. Bake in a preheated 160°C oven for 40-50 minutes. 5. Invert to cool after baking, then unmold and serve.'
            },
          ),
          Dish(
            id: 'custard-tart',
            name: {
              'zh': '蛋挞',
              'en': 'Custard Tart',
            },
            status: 'locked',
            notes: {
              'zh': '配料：挞皮、鸡蛋、牛奶、糖、香草精（可选）\n做法：1. 鸡蛋、牛奶和糖拌匀，加入香草精（可选），过滤成蛋液。2. 将蛋液倒入挞皮中，8分满。3. 放入预热180度的烤箱，烤20-25分钟。4. 烤至蛋液凝固且表面微焦。5. 冷却后食用。',
              'en': 'Ingredients: Tart shells, eggs, milk, sugar, vanilla extract (optional)\nMethod: 1. Mix eggs, milk, and sugar, add vanilla extract (optional), strain into a custard mixture. 2. Pour custard into tart shells, filling to 80%. 3. Bake in a preheated 180°C oven for 20-25 minutes. 4. Bake until custard sets and surface is slightly browned. 5. Cool and serve.'
            },
          ),
          Dish(
            id: 'mango-pudding',
            name: {
              'zh': '芒果布丁',
              'en': 'Mango Pudding',
            },
            status: 'locked',
            notes: {
              'zh': '配料：芒果、牛奶、糖、吉利丁片、淡奶油（可选）\n做法：1. 芒果去皮打成泥，吉利丁片用冷水泡软。2. 牛奶和糖小火加热至糖溶解，加入吉利丁搅拌融化。3. 倒入芒果泥拌匀，可加打发淡奶油提口感。4. 倒入模具，冷藏4小时至凝固。5. 脱模后食用。',
              'en': 'Ingredients: Mango, milk, sugar, gelatin sheets, heavy cream (optional)\nMethod: 1. Peel and puree mango, soak gelatin sheets in cold water until soft. 2. Heat milk and sugar over low heat until sugar dissolves, add gelatin and stir until melted. 3. Mix in mango puree, optionally fold in whipped heavy cream for texture. 4. Pour into molds, refrigerate for 4 hours until set. 5. Unmold and serve.'
            },
          ),
          Dish(
              id: 'pumpkin-pie',
              name: {
                'zh': '南瓜派',
                'en': 'Pumpkin Pie',
              },
              status: 'locked',
              notes: {
                'zh': '配料：派皮、南瓜、鸡蛋、淡奶油、糖、肉桂粉、姜粉\n做法：1. 南瓜蒸熟压成泥。2. 鸡蛋、淡奶油、糖、肉桂粉和姜粉拌匀，加入南瓜泥搅拌。3. 将混合物倒入派皮中。4. 放入预热180度的烤箱，烤40-50分钟。5. 烤至馅料凝固，冷却后食用。',
                'en': 'Ingredients: Pie crust, pumpkin, eggs, heavy cream, sugar, cinnamon powder, ginger powder\nMethod: 1. Steam pumpkin and mash into a puree. 2. Mix eggs, heavy cream, sugar, cinnamon, and ginger powder, then stir in pumpkin puree. 3. Pour mixture into pie crust. 4. Bake in a preheated 180°C oven for 40-50 minutes. 5. Bake until filling sets, cool, and serve.'
              },
            ),
        ],
      ),
    ],
  ),
    Category(
    id: 'drinks',
    name: {
      'zh': '饮品',
      'en': 'Drinks',
    },
    subcategories: [
      Subcategory(
        id: 'drinks-dishes',
        name: {
          'zh': '饮品',
          'en': 'drinks-dishes',
        },
        dishes: [
        Dish(
          id: 'lemon-tea',
          name: {
            'zh': '柠檬茶',
            'en': 'Lemon Tea',
          },
          status: 'locked',
          notes: {
            'zh': '配料：红茶、柠檬、蜂蜜或糖、水\n做法：1. 红茶用热水冲泡5分钟，冷却备用。2. 柠檬切片或挤汁。3. 将柠檬汁或片加入茶中，调入蜂蜜或糖搅拌。4. 加冰块（可选）后饮用。5. 可根据口味调整甜度。',
            'en': 'Ingredients: Black tea, lemon, honey or sugar, water\nMethod: 1. Brew black tea with hot water for 5 minutes, then cool. 2. Slice lemon or squeeze juice. 3. Add lemon juice or slices to tea, stir in honey or sugar. 4. Add ice (optional) and serve. 5. Adjust sweetness to taste.'
          },
        ),
        Dish(
          id: 'milk-tea',
          name: {
            'zh': '奶茶',
            'en': 'Milk Tea',
          },
          status: 'locked',
          notes: {
            'zh': '配料：红茶、牛奶、糖、水\n做法：1. 红茶用热水冲泡5分钟。2. 加入牛奶和糖，小火加热搅拌至糖溶解。3. 煮至微沸后关火。4. 过滤茶渣，倒入杯中。5. 可加冰块或热饮用。',
            'en': 'Ingredients: Black tea, milk, sugar, water\nMethod: 1. Brew black tea with hot water for 5 minutes. 2. Add milk and sugar, heat over low flame while stirring until sugar dissolves. 3. Turn off heat just before boiling. 4. Strain tea leaves, pour into a cup. 5. Serve hot or with ice.'
          },
        ),
        Dish(
          id: 'mango-smoothie',
          name: {
            'zh': '芒果冰沙',
            'en': 'Mango Smoothie',
          },
          status: 'locked',
          notes: {
            'zh': '配料：芒果、牛奶、冰块、蜂蜜或糖（可选）\n做法：1. 芒果去皮切块。2. 将芒果、牛奶和冰块放入搅拌机。3. 根据口味加入蜂蜜或糖。4. 搅拌至顺滑，倒入杯中。5. 立即饮用。',
            'en': 'Ingredients: Mango, milk, ice cubes, honey or sugar (optional)\nMethod: 1. Peel and cut mango into chunks. 2. Place mango, milk, and ice cubes in a blender. 3. Add honey or sugar to taste. 4. Blend until smooth, pour into a glass. 5. Serve immediately.'
          },
        ),
        Dish(
          id: 'matcha-latte',
          name: {
            'zh': '抹茶拿铁',
            'en': 'Matcha Latte',
            },
            status: 'locked',
            notes: {
              'zh': '配料：抹茶粉、牛奶、糖或蜂蜜、水\n做法：1. 抹茶粉用少量热水调成糊状。2. 牛奶加热至微热，加入糖或蜂蜜搅拌。3. 将抹茶糊倒入牛奶中，搅拌均匀。4. 可加奶泡装饰。5. 热饮或加冰饮用。',
              'en': 'Ingredients: Matcha powder, milk, sugar or honey, water\nMethod: 1. Mix matcha powder with a little hot water into a paste. 2. Heat milk until warm, stir in sugar or honey. 3. Pour matcha paste into milk, stir well. 4. Optionally top with foam. 5. Serve hot or over ice.'
            },
          ),
        ],
      ),
    ],
  ),
]; 