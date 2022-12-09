DELIMITER $$

CREATE TRIGGER before_insert_preference
	BEFORE INSERT ON preferences FOR EACH ROW
	BEGIN
		IF(new.greater_product_id = new.lesser_product_id) OR
            	EXISTS(SELECT * FROM preferences WHERE
		greater_product_id = new.lesser_product_id AND
		lesser_product_id = new.greater_product_id AND new.customer_id = customer_id) THEN 
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Circular preferences are not allowed';
		END IF;
	END;
    
CREATE TRIGGER after_insert_preference
	AFTER INSERT ON preferences FOR EACH ROW
	BEGIN
		IF EXISTS(SELECT * FROM preferences WHERE lesser_product_id = new.greater_product_id) THEN
			INSERT INTO computed_preferences(greater_product_id, lesser_product_id, customer_id)
            		SELECT greater_product_id, new.lesser_product_id, customer_id FROM preferences
           	        WHERE lesser_product_id = new.greater_product_id;
		END IF;
		IF EXISTS(SELECT * FROM computed_preferences WHERE lesser_product_id = new.greater_product_id) THEN
			INSERT INTO computed_preferences(greater_product_id, lesser_product_id, customer_id)
            		SELECT greater_product_id, new.lesser_product_id, customer_id FROM computed_preferences
           	 	WHERE lesser_product_id = new.greater_product_id;
		END IF;
	END;
$$

DELIMITER ;

