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