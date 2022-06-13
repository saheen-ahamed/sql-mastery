create or alter function getText(@amount numeric(8,2)) returns numeric(8,2) as
begin
	return @amount * 0.1
end 