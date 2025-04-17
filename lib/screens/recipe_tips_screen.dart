import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';

class RecipeTipsScreen extends StatelessWidget {
  const RecipeTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isZh = languageProvider.currentLanguage == 'zh';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isZh ? '食材选择' : 'Ingredient Selection',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...buildIngredientTips(context, isZh),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                isZh ? '绝密🤐调料配比' : 'Secret🤐Sauce Ratios',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(' 🤫'),
            ],
          ),
          const SizedBox(height: 16),
          ...buildSauceRecipes(context, isZh),
        ],
      ),
    );
  }

  List<Widget> buildIngredientTips(BuildContext context, bool isZh) {
    final ingredients = [
      {
        'name': isZh ? 'Carbonara专用食材' : 'Carbonara Special Ingredients',
        'description': isZh 
          ? '正宗Carbonara用Pancetta（Guanciale猪颊肉）和Pecorino芝士（吃的时候可以撒些Parmigiano Reggiano帕玛森芝士）'
          : 'Authentic Carbonara uses Pancetta (Guanciale) and Pecorino cheese (can sprinkle some Parmigiano Reggiano when serving)'
      },
      {
        'name': isZh ? '面筋粉' : 'Wheat Gluten',
        'description': isZh 
          ? '面筋粉英文 Vital Wheat Gluten'
          : 'Vital Wheat Gluten'
      }
      // 在这里可以轻松添加更多信息
    ];

    return ingredients.map((ingredient) {
      return Card(
        margin: const EdgeInsets.only(bottom: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ingredient['name']!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                ingredient['description']!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

List<Widget> buildSauceRecipes(BuildContext context, bool isZh) {
  final recipes = [
    {
      'name': isZh ? '宫保汁' : 'Kung Pao Sauce',
      'recipe': isZh 
        ? '3勺白糖，3勺香醋或米醋，1勺清水，1勺生抽，1勺淀粉，一点食用盐'
        : '3 spoons sugar, 3 spoons vinegar, 1 spoon water, 1 spoon soy sauce, 1 spoon starch, pinch of salt'
    },
    {
      'name': isZh ? '鱼香汁' : 'Yu Xiang Sauce',
      'recipe': isZh
        ? '5勺清水，4勺香醋或米醋，3勺白糖，2勺生抽，1勺干淀粉，葱姜蒜，豆瓣酱'
        : '5 spoons water, 4 spoons vinegar, 3 spoons sugar, 2 spoons soy sauce, 1 spoon starch, scallion, ginger, garlic, doubanjiang'
    },
    {
      'name': isZh ? '糖醋汁' : 'Sweet and Sour Sauce',
      'recipe': isZh
        ? '5勺清水，4勺香醋或米醋，3勺白糖（或者3勺番茄酱1勺糖），2勺生抽，1勺料酒'
        : '5 spoons water, 4 spoons vinegar, 3 spoons sugar (or 3 spoons ketchup + 1 spoon sugar), 2 spoons soy sauce, 1 spoon cooking wine'
    },
    {
      'name': isZh ? '京酱' : 'Beijing Sauce',
      'recipe': isZh
        ? '2勺甜面酱，1勺黄酒或料酒，2勺清水，1勺生抽，1勺老抽，1勺蚝油，加入适合自己口味的白糖'
        : '2 spoons sweet bean paste, 1 spoon yellow wine, 2 spoons water, 1 spoon light soy sauce, 1 spoon dark soy sauce, 1 spoon oyster sauce, sugar to taste'
    },
    {
      'name': isZh ? '蒜蓉酱' : 'Garlic Sauce',
      'recipe': isZh
        ? '3勺生抽，1勺蚝油，1勺糖，适量盐'
        : '3 spoons soy sauce, 1 spoon oyster sauce, 1 spoon sugar, salt to taste'
    },
    {
      'name': isZh ? '照烧汁' : 'Teriyaki Sauce',
      'recipe': isZh
        ? '2勺白糖，2勺蜂蜜，3勺料酒，2勺生抽，1勺蚝油，加入适量清水，水没过食材，一点老抽调色，水淀粉'
        : '2 spoons sugar, 2 spoons honey, 3 spoons cooking wine, 2 spoons soy sauce, 1 spoon oyster sauce, water to cover ingredients, dark soy sauce for color, water starch'
    },
    {
      'name': isZh ? '炸酱' : 'Fried Sauce',
      'recipe': isZh
        ? '2勺生抽，1勺老抽，1勺蚝油，1勺白糖，1勺甜面酱，1勺黄豆酱，水淀粉，肉沫'
        : '2 spoons light soy sauce, 1 spoon dark soy sauce, 1 spoon oyster sauce, 1 spoon sugar, 1 spoon sweet bean paste, 1 spoon yellow bean paste, water starch, minced meat'
    },
    {
      'name': isZh ? '油焖大虾酱汁' : 'Braised Shrimp Sauce',
      'recipe': isZh
        ? '生抽2勺，蚝油1勺，蕃茄酱2勺，白糖1勺，水半碗'
        : '2 spoons soy sauce, 1 spoon oyster sauce, 2 spoons ketchup, 1 spoon sugar, half bowl of water'
    },
    {
      'name': isZh ? '广式牛腩煲酱汁' : 'Cantonese Beef Brisket Sauce',
      'recipe': isZh
        ? '南乳2块+花生酱1勺+柱侯酱1勺+南乳汁1勺+老抽+酱油勺+白胡椒粉'
        : '2 pieces fermented red bean curd + 1 spoon peanut butter + 1 spoon chu hou paste + 1 spoon red bean curd liquid + dark soy sauce + soy sauce + white pepper powder'
    },
    {
      'name': isZh ? '凉拌酱汁' : 'Cold Dish Sauce',
      'recipe': isZh
        ? '1勺蒜末，1勺白芝麻，1勺辣椒面，浇上3勺热油，2勺生抽，2勺醋，1勺蚝油，1勺糖，少许盐'
        : '1 spoon minced garlic, 1 spoon white sesame, 1 spoon chili powder, pour 3 spoons hot oil, 2 spoons soy sauce, 2 spoons vinegar, 1 spoon oyster sauce, 1 spoon sugar, pinch of salt'
    },
    {
      'name': isZh ? '肉蟹煲酱汁' : 'Braised Crab Pot Sauce',
      'recipe': isZh
        ? '豆瓣酱1勺，黄豆酱1勺，蕃茄酱1勺，蚝油，生抽2勺，白糖1勺，陈醋1勺，白胡椒粉'
        : '1 spoon doubanjiang, 1 spoon yellow bean paste, 1 spoon ketchup, oyster sauce, 2 spoons soy sauce, 1 spoon sugar, 1 spoon aged vinegar, white pepper powder'
    },
    {
      'name': isZh ? '烤冷面酱汁' : 'Grilled Cold Noodle Sauce',
      'recipe': isZh
        ? '1勺蒜末，1勺白芝麻，1勺辣椒面，浇上3勺热油，生抽3勺，醋1勺，蚝油1勺，蕃茄酱1勺，豆瓣酱1勺，糖少许'
        : '1 spoon minced garlic, 1 spoon white sesame, 1 spoon chili powder, pour 3 spoons hot oil, 3 spoons soy sauce, 1 spoon vinegar, 1 spoon oyster sauce, 1 spoon ketchup, 1 spoon doubanjiang, a bit of sugar'
    },
    {
      'name': isZh ? '三汁焖锅酱汁' : 'Three-Sauce Braised Pot',
      'recipe': isZh
        ? '3勺黄豆酱，3勺甜面酱，1勺蚝油，半块腐乳，1勺花生酱，3勺生抽，盐，糖，三倍清水，一点老抽，淀粉'
        : '3 spoons yellow bean paste, 3 spoons sweet bean paste, 1 spoon oyster sauce, 1/2 block fermented tofu, 1 spoon peanut butter, 3 spoons soy sauce, salt, sugar, 3 times water, dark soy sauce, starch'
    },
    {
      'name': isZh ? '南乳炸鸡腌料' : 'Red Fermented Bean Curd Fried Chicken Marinade',
      'recipe': isZh
        ? '葱姜水，酱油，白糖，南乳汁，蒜粉'
        : 'Scallion and ginger water, soy sauce, sugar, red fermented bean curd liquid, garlic powder'
    },
    {
      'name': isZh ? '火锅麻酱蘸料' : 'Hotpot Sesame Dipping Sauce',
      'recipe': isZh
        ? '芝麻花生酱，1勺酱油，一勺糖，1勺尖盐，2勺韭花酱，2勺腐乳汁，花生碎，（辣椒油，香菜碎）'
        : 'Sesame peanut paste, 1 spoon soy sauce, 1 spoon sugar, 1 spoon fine salt, 2 spoons leek flower paste, 2 spoons fermented tofu juice, crushed peanuts, (chili oil, chopped coriander)'
    },
    {
      'name': isZh ? '韩式烤肉酱' : 'Korean BBQ Sauce',
      'recipe': isZh
        ? '韩式辣酱两勺，白芝麻一勺，生抽一勺，雪碧两勺，香油一勺，蜂蜜半勺'
        : '2 spoons Korean chili paste, 1 spoon white sesame, 1 spoon soy sauce, 2 spoons Sprite, 1 spoon sesame oil, 1/2 spoon honey'
    },
    {
      'name': isZh ? '煲仔饭酱汁' : 'Claypot Rice Sauce',
      'recipe': isZh
        ? '生抽三勺，老抽一勺，蚝油一勺，盐一小勺，糖三勺，白胡椒粉半勺，香油半勺，水四勺'
        : '3 spoons light soy sauce, 1 tbsp dark soy sauce, 1 tbsp oyster sauce, 1 tsp salt, 3 tsp sugar, ½ tsp white pepper, ½ tsp sesame oil, and 4 tbsp water'
    },
    {
      'name': isZh ? '风味菜品酱汁' : 'Flavorful Dish Sauce',
      'recipe': isZh
        ? '生抽两勺，陈醋两勺，糖两勺，耗油一勺，半碗清水'
        : '2 spoons light soy sauce, 2 spoons aged vinegar, 2 spoons sugar, 1 spoon oyster sauce, half bowl of water'
    }
    // 在这里可以轻松添加更多信息
  ];

  return recipes.map((recipe) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe['name']!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              recipe['recipe']!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }).toList();
}
} 