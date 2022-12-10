DELIMITER $$

CREATE TRIGGER insert_student
	AFTER INSERT ON enrolled_students FOR EACH ROW
	BEGIN
		UPDATE rooms SET number_of_students = number_of_students + 1
        WHERE room_id = new.room_id;
	END;
	

CREATE TRIGGER delete_student
	AFTER DELETE ON enrolled_students FOR EACH ROW
	BEGIN
		DECLARE new_number_of_students INT;
        	SET new_number_of_students = (SELECT number_of_students - 1
		FROM rooms WHERE room_id = old.room_id);
			IF(new_number_of_students > 0) THEN
				UPDATE rooms SET number_of_students = new_number_of_students
                		WHERE room_id = old.room_id;
            		ELSE
				DELETE FROM rooms WHERE room_id = old.room_id;
        		END IF;
	END;

$$

DELIMITER ;

