DELIMITER $$

CREATE TRIGGER insert_preference
	BEFORE INSERT ON preferences FOR EACH ROW
	BEGIN
		IF(new.greater_product_id <> new.lesser_product_id) OR
            	NOT EXISTS(SELECT * FROM preferences WHERE
			greater_product_id = new.lesser_product_id AND
			lesser_product_id = new.greater_product_id AND new.customer_id = customer_id) THEN 
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Insert recursive logic here';
            	ELSE
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Circular preferences are not allowed';
		END IF;
	END;
    
$$

DELIMITER ;

