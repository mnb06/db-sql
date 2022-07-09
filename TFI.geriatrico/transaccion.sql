-- Borra toda la informacion asociada a un paciente
BEGIN;
DELETE FROM historia_clinica WHERE idpaciente = 5;
DELETE FROM personacargo WHERE idpaciente = 5;
DELETE FROM pacientes WHERE idpaciente = 5;
DELETE FROM proyectos_pacientes WHERE idpaciente = 5;
END;
COMMIT;
