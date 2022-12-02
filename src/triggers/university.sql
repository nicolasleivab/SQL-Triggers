DELIMITER $$

CREATE TRIGGER insert_schedule
	BEFORE INSERT ON schedules FOR EACH ROW
	BEGIN
		IF EXISTS(SELECT * FROM registrations
		WHERE new.professor_id = student_id AND
		new.course_id = course_id)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Teacher cannot be Student of the course at the same time';
		END IF;
	END;
    
CREATE TRIGGER insert_registration
	BEFORE INSERT ON registrations FOR EACH ROW
	BEGIN
		IF EXISTS(SELECT * FROM schedules
		WHERE new.student_id = professor_id AND
		new.course_id = course_id)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Student cannot be Teacher of the course at the same time';
		END IF;
	END;
    
CREATE TRIGGER insert_course
	BEFORE INSERT ON courses FOR EACH ROW
	BEGIN
		IF new.credits > 10 AND new.dept = 'CS'
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'A CS course cannot have more than 10 credits';
		END IF;
	END;
    
CREATE TRIGGER update_course_one
	BEFORE UPDATE ON courses FOR EACH ROW
	BEGIN
		IF new.credits > 10 AND new.dept = 'CS'
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'A CS course cannot have more than 10 credits';
		END IF;
	END;
	
CREATE TRIGGER update_course_two
	BEFORE UPDATE ON courses FOR EACH ROW
	BEGIN
		IF old.dept = 'CS' AND new.dept <> 'CS'
        AND NOT EXISTS (SELECT 1 FROM registrations registration JOIN courses course ON registration.course_id = course.Cid
			WHERE course.dept = 'CS' AND registration.course_id <>  old.Cid GROUP BY registration.course_id HAVING COUNT(*) >= 5)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'There has to be at least one CS course with minimum 5 students';
		END IF;
	END;
	
CREATE TRIGGER delete_registration
	BEFORE DELETE ON registrations FOR EACH ROW
	BEGIN
		IF (SELECT dept from courses WHERE old.course_id = Cid) = 'CS'
        AND (SELECT COUNT(*) from registrations WHERE old.course_id = course_id) = 5
        AND NOT EXISTS (SELECT 1 FROM registrations registration JOIN courses course ON registration.course_id = course.Cid
			WHERE course.dept = 'CS' AND registration.course_id <>  old.course_id GROUP BY registration.course_id HAVING COUNT(*) >= 5)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'There has to be at least one CS course with minimum 5 students';
		END IF;
	END;
    
$$

DELIMITER ;

