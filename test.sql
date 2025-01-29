CREATE TABLE student_marks (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    marks NUMBER
);
-- Insert sample data into the student_marks table
INSERT INTO student_marks VALUES (1, 'Alice', 75);
INSERT INTO student_marks VALUES (2, 'Bob', 45);
INSERT INTO student_marks VALUES (3, 'Charlie', 85);
INSERT INTO student_marks VALUES (4, 'David', 55);
INSERT INTO student_marks VALUES (5, 'Eve', 65);
-- Commit the changes
COMMIT;
DECLARE
    -- Declare a cursor to select students with first class marks
    CURSOR student_cursor IS
        SELECT student_id, student_name, marks
        FROM student_marks
        WHERE marks >= 60;
    -- Record variable to hold data from the cursor
    student_rec student_cursor%ROWTYPE;
    -- Variable to check if any rows are fetched
    rows_fetched BOOLEAN := FALSE;
BEGIN
    -- Open the cursor
    OPEN student_cursor;
    LOOP
        -- Fetch each row into the record variable
        FETCH student_cursor INTO student_rec;
        -- Exit the loop when no more rows are fetched
        EXIT WHEN student_cursor%NOTFOUND;
        -- Mark that rows have been fetched
        rows_fetched := TRUE;
        -- Print the student details
        DBMS_OUTPUT.PUT_LINE('Student ID: ' || student_rec.student_id);
        DBMS_OUTPUT.PUT_LINE('Student Name: ' || student_rec.student_name);
        DBMS_OUTPUT.PUT_LINE('Marks: ' || student_rec.marks);
        DBMS_OUTPUT.PUT_LINE('---');
    END LOOP;
    -- Close the cursor
    CLOSE student_cursor;
    -- Handle case when no rows are found
    IF NOT rows_fetched THEN
        DBMS_OUTPUT.PUT_LINE('No students found with first class marks.');
    END IF;
EXCEPTION
    -- Handle any unexpected exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
