delimiter $$

CREATE DEFINER=`root`@`localhost` FUNCTION `fnHotColdWarm`(Tempc int) RETURNS varchar(5) 
    DETERMINISTIC
    COMMENT 'Converts Celcius to Fahrenheit and returns the forecase'
BEGIN
    DECLARE TempFResult int;
    DECLARE TheResult varchar(5);

    SET TempFResult = fnCelsiusToFahrenheit(TempC);

    
    IF TempFResult < 60 THEN SET TheResult = 'Cold';
    ELSEIF TempFResult >= 60 and empFResult < 76 THEN SET TheResult = 'Warm';
    ELSEIF TempFResult >= 76 THEN SET TheResult = 'Hot';
    END IF;

    RETURN TheResult;

END$$

