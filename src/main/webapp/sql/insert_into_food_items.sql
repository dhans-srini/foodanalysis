INSERT INTO `ingrido`.`food_item` (`Food_id`, `Name`, `Fats`, `Proteins`, `Carbohydrates`, `Vitamins`, `Sugar`, `Calorie`, `Benefits`, `Disadvantages`) VALUES (1, 'Apple', '0.2', '0.3', '14', '1%', '10g', '52', 'Apples are extremely rich in important antioxidants, flavanoids, and dietary fiber. ', 'High in Sugar, so Sugar patients avoid Apples');

INSERT INTO `ingrido`.`food_item` (`Food_id`, `Name`, `Fats`, `Proteins`, `Carbohydrates`, `Vitamins`, `Sugar`, `Calorie`, `Benefits`, `Disadvantages`) VALUES (2, 'Banana', '0.3g', '1.1g', '23g', '10%', '12g', '89', 'High in Fiber, viitamins and calcium and carbohydrates, considered as rich source of Energy', 'Bananas contain sugar  not recommended for diabetics or the sugar-addicted');

UPDATE `ingrido`.`food_item` SET `Fats`='0.2g', `Proteins`='0.3g', `Carbohydrates`='14g' WHERE `Food_id`='1';

