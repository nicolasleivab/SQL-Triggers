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

CREATE TRIGGER merge_rooms
	AFTER UPDATE ON rooms FOR EACH ROW
	BEGIN
	DECLARE students_sum INT;
        DECLARE room_to_merge_id INT;
		IF(new.number_of_students > 0 AND new.number_of_students < old.number_of_students) THEN
			SELECT room_id, number_of_students + new.number_of_students INTO room_to_merge_id, students_sum FROM rooms
            		WHERE number_of_students + new.number_of_students <= 25 LIMIT 1;
				IF(students_sum <= 25) THEN
					UPDATE rooms SET number_of_students = students_sum WHERE room_id = room_to_merge_id;
                    			UPDATE enrolled_students SET room_id = room_to_merge_id WHERE room_id = new.room_id;
                    			DELETE FROM rooms WHERE room_id = new.room_id;
                		END IF;
        	END IF;
	END;

$$

DELIMITER ;

