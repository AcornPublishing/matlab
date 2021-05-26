for pos_x = 1:5
	for pos_y = 1:10 
		B(pos_x, pos_y) = 255;
	end
end
B		% To print the result from the loop method
clear B;
B(1:5, 1:10) = 255; 
B 		% To print the result from the indexing method 
