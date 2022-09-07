-----------QUERY CON JOIN-----------
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

    SELECT `students`.`name`, `students`.`surname`, `degrees`.`name`
    FROM `students`
    JOIN `degrees`
    ON `students`.`degree_id` = `degrees`.`id`
    WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

    SELECT `degrees`.`name`, `degrees`.`level`, `departments`.`id`, `departments`.`name`
    FROM `degrees`
    JOIN `departments`
    ON `degrees`.`department_id` = `departments`.`id`
    WHERE `degrees`.`level` = "Magistrale"
    AND `departments`.`name` = "Dipartimento di Neuroscienze"

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

    SELECT `courses`.`id`, `courses`.`name`, `teachers`.`name`, `teachers`.`surname`
    FROM `courses`
    JOIN `course_teacher`
    ON `course_teacher`.`course_id` = `courses`.`id`
    JOIN `teachers`
    ON `course_teacher`.`teacher_id` = `teachers`.`id`
    WHERE `teachers`.`id` = 44;


-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
    
    SELECT `students`.`name`, `students`.`surname`, `degrees`.`name`, `departments`.`name`
    FROM `students`
    JOIN `degrees`
    ON `students`.`degree_id` = `degrees`.`id`
    JOIN `departments`
    ON `degrees`.`department_id` = `departments`.`id`  
    ORDER BY `students`.`name`, `students`.`surname`  ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

    SELECT `degrees`.`name` AS `name_degree`, `courses`.`name` AS `name_course`, `teachers`.`name`, `teachers`.`surname`
    FROM `degrees`
    JOIN `courses`
    ON `courses`.`degree_id` = `degrees`.`id`
    JOIN `course_teacher` 
    ON `course_teacher`.`course_id` = `courses`.`id`
    JOIN `teachers`
    ON `course_teacher`.`teacher_id` = `teachers`.`id`
    ORDER BY `degrees`.`name` ASC;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

    SELECT DISTINCT(`teachers`.`id`), `teachers`.`name`, `teachers`.`surname`, `departments`.`name`
    FROM `teachers`
    JOIN `course_teacher`
    ON `teachers`.`id` = `course_teacher`.`teacher_id`
    JOIN `courses`
    ON `courses`.`id` = `course_teacher`.`course_id`
    JOIN `degrees`
    ON `degrees`.`id` = `courses`.`degree_id`
    JOIN `departments`
    ON `departments`.`id` = `degrees`.`department_id`
    WHERE `departments`.`name` = "Dipartimento di Matematica"
    ORDER BY `teachers`.`name` ASC;