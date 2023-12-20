# b)

-- vou receber um valor decimal como salario
delimiter //

create procedure calc_IR (IN p_salario decimal(7,2))
begin

	declare imposto decimal(7,2);

	case 
		when p_salario < 1983.98 then
			set imposto = 0;
		when p_salario >= 1903.99 and p_salario <= 2826.65 then
			set imposto = p_salario * 0.075;
		when p_salario >= 2826.66 and p_salario <= 3751.05 then
			set imposto = p_salario * 0.15;
		when p_salario >= 3751.06 and p_salario <= 4664.60 then
			set imposto = p_salario * 0.225;
		else 
			set imposto = p_salario * 0.275;  
    end case;
    
    select concat('O imposto a ser pago é de R$' , imposto) AS IR; 
end //

delimiter ; 

call calc_IR(2050.98);
