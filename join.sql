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
