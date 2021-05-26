for pos_x = 1:5
	for pos_y = 1:10 
		B(pos_x, pos_y) = 255;
	end
end

clear B;
B(1:5, 1:10) = 255; 

for pos_x = 2:2+2
	for pos_y = 2:2+4 
		B(pos_x, pos_y) = 0;
	end
end
B				% print the result of the loop method
clear B;  		% Erase matrix B from the workspace
B(1:5, 1:10) = 255; 	% Re-create matrix B
B(2:2+2, 2:2+4) = 0;
B				% print the result of the indexing method
