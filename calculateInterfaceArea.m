function area = calculateInterfaceArea(verts, faces, rhoRgridInput)
    [filepath,~,~] = fileparts(mfilename('fullpath'));
    addpath(filepath+"/utils")
    area = interface_area(verts, faces, rhoRgridInput);
end
