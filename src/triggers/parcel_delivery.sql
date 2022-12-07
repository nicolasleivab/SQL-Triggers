DELIMITER $$

CREATE TRIGGER update_parcel_before_insert_or_repositioning
	BEFORE UPDATE ON parcels FOR EACH ROW
	BEGIN
		IF (old.cell_id IS NULL AND new.cell_id IS NOT NULL) OR old.cell_id <> new.cell_id THEN
			IF NOT EXISTS(SELECT * FROM cells WHERE cell_id = new.cell_id) OR
			(SELECT total_small FROM cells WHERE cell_id = new.cell_id) = 4 OR 
			(SELECT total_large FROM cells WHERE cell_id = new.cell_id) = 1 OR 
			new.size = 'large' AND (SELECT total_small FROM cells WHERE cell_id = new.cell_id) > 0
			THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Cell does not exist or there is no space left.';
			END IF;
		END IF;
	END;
	
CREATE TRIGGER update_parcel_after_insert_or_repositioning
	AFTER UPDATE ON parcels FOR EACH ROW
	BEGIN
		IF (old.cell_id IS NULL AND new.cell_id IS NOT NULL) OR old.cell_id <> new.cell_id THEN
			IF new.size = 'large' THEN
				UPDATE cells SET total_large = total_large + 1 WHERE cell_id = new.cell_id;
					IF old.cell_id IS NOT NULL THEN
						UPDATE cells SET total_large = total_large - 1 WHERE cell_id = old.cell_id;
					END IF;
            ELSE
				UPDATE cells SET total_small = total_small + 1 WHERE cell_id = new.cell_id;
					IF old.cell_id IS NOT NULL THEN
						UPDATE cells SET total_small = total_small- 1 WHERE cell_id = old.cell_id;
					END IF;
			END IF;
		END IF;
	END;
        
CREATE TRIGGER delete_parcel_after_pickup
	AFTER DELETE on parcels FOR EACH ROW
	BEGIN
		IF old.cell_id IS NOT NULL AND old.size = 'small' THEN
			UPDATE cells SET total_small = total_small - 1 WHERE cell_id = old.cell_id;
		ELSE
			UPDATE cells SET total_large = total_large - 1 WHERE cell_id = old.cell_id;
		END IF;
	END;

$$

DELIMITER ;
