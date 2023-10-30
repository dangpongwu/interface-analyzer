function IMDS_from_rgrid(rgrid_input, output_face_filename, output_coord_filename)
    % Read data from the input file
    C = textread(rgrid_input, '%s', 'delimiter', '\n');
    dim = str2num(C{3});                    % Read dimension
    cell_params = str2num(C{9});            % Read cell parameter
    grid = str2num(C{15});                  % Read grid
    
    % Define new cell parameters based on the input data
    if length(cell_params) == 1
        new_cell = ones(1, 3) * cell_params;   % Cubic crystals 
    elseif length(cell_params) == 2
        new_cell(1:2) = cell_params(1);        % Tetragonal crystals
        new_cell(3) = cell_params(2);
    else
        new_cell = cell_params;                % Orthorhombic crystals
    end
    
    % Define 3D grid for different crystal types
    if length(grid) == 1
        grid = repmat(grid, 1, 3);             % 3D grid for 1D crystals
    elseif length(grid) == 2
        grid(3) = grid(1);                     % 3D grid for 2D crystals
    end
    
    % Parse the remaining data from the input file
    A = zeros(length(C) - 15, 2);
    for i = 16:length(C)    
        A(i - 15, :) = str2num(C{i});
    end
    v1 = A(:, 1);
    v2 = A(:, 2);
    
    
    % Populate the arrays with data
    for A = 0:0 % Duplicate the unit cell by changing 0:0 to 0:1
        for B = 0:0
            for C = 0:0
                counter = 0;
                for iz = 1 + C * grid(3):(1 + C) * grid(3)
                    for iy = 1 + B * grid(2):(B + 1) * grid(2)
                        for ix = 1 + A * grid(1):(A + 1) * grid(1)
                            counter = counter + 1;
                            x(ix, iy, iz) = new_cell(1) * (ix - 1) / grid(1);
                            y(ix, iy, iz) = new_cell(2) * (iy - 1) / grid(2);
                            z(ix, iy, iz) = new_cell(3) * (iz - 1) / grid(3);
                            a(ix, iy, iz) = v1(counter);
                            b(ix, iy, iz) = v2(counter);
                        end
                        
                        if dim == 1
                            counter = 0;
                        end
                    end
                    
                    if dim == 2
                        counter = 0;
                    end
                end
            end
        end
    end
   

    
    % Generate and save isosurface
    isovalue = 0.5;
    [faces, verts] = isosurface(x, y, z, a, isovalue);
    
    % Save faces to output file
    formatSpec = '%i %i %i\n';
    fileID = fopen(output_face_filename, 'w');
    fprintf(fileID, formatSpec, faces');
    fclose(fileID);
    
    % Save vertices to output file
    formatSpec = '%f %f %f\n';
    fileID = fopen(output_coord_filename, 'w');
    fprintf(fileID, formatSpec, verts');
    fclose(fileID);
end
