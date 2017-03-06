CREATE  TABLE `ingrido`.`Food_Item` (

  `Food_id` INT NOT NULL ,

  `Name` VARCHAR(45) NOT NULL ,

  `Fats` VARCHAR(45) NULL ,

  `Proteins` VARCHAR(45) NULL ,

  `Carbohydrates` VARCHAR(45) NULL ,

  `Vitamins` VARCHAR(45) NULL ,

  `Sugar` VARCHAR(45) NULL ,

  `Calorie` VARCHAR(45) NULL ,

  `Benefits` VARCHAR(150) NULL ,

  `Disadvantages` VARCHAR(100) NULL ,

  PRIMARY KEY (`Food_id`) ,

  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) ,

  INDEX `User_id` (`Food_id` ASC) ,

  CONSTRAINT `User_id`

    FOREIGN KEY (`Food_id` )

    REFERENCES `ingrido`.`user` (`User_id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION);

    
ALTER TABLE `ingrido`.`food_item` DROP FOREIGN KEY `User_id` ;


ALTER TABLE `ingrido`.`food_item` CHANGE COLUMN `Food_id` `Food_id` INT(11) NOT NULL AUTO_INCREMENT  , CHANGE COLUMN `Benefits` `Benefits` VARCHAR(250) NULL DEFAULT NULL  , CHANGE COLUMN `Disadvantages` `Disadvantages` VARCHAR(150) NULL DEFAULT NULL  ;

