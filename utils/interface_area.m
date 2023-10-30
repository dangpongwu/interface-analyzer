function total_area =interface_area(coord_input,face_input,rgrid_input)

x_coord = coord_input(:,1); y_coord = coord_input(:,2); z_coord = coord_input(:,3);


index_1 = face_input(:,1); index_2 = face_input(:,2); index_3 = face_input(:,3);

C = textread(rgrid_input, '%s','delimiter', '\n');
d = str2num(C{9});
clear C;

S = 0;
count = 0;
for i = 1:length(index_1)
    % if (x_coord(index_1(i))+x_coord(index_2(i))+x_coord(index_2(i)))/3 >= 0.5*d && (x_coord(index_1(i))+x_coord(index_2(i))+x_coord(index_2(i)))/3 < 1.5*d ...
    %     && (y_coord(index_1(i))+y_coord(index_2(i))+y_coord(index_3(i)))/3 >= 0.5*d && (y_coord(index_1(i))+y_coord(index_2(i))+y_coord(index_2(i)))/3 < 1.5*d ...
    %     && (z_coord(index_1(i))+z_coord(index_2(i))+z_coord(index_2(i)))/3 >=  0.5*d && (z_coord(index_1(i))+z_coord(index_2(i))+z_coord(index_2(i)))/3 < 1.5*d
        count = count+1;
        P1 = [x_coord(index_1(i)),y_coord(index_1(i)),z_coord(index_1(i))];
        P2 = [x_coord(index_2(i)),y_coord(index_2(i)),z_coord(index_2(i))];
        P3 = [x_coord(index_3(i)),y_coord(index_3(i)),z_coord(index_3(i))];
        S = S + 1/2*norm(cross(P2-P1,P3-P1));
    % end
end
total_area = S/d^3;
end