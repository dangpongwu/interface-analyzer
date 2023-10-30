function [verts, faces] = preprocessInterface(rhoRgridInput, faceFile, coordFile)
    [filepath,~,~] = fileparts(mfilename('fullpath'));
    addpath(filepath+"/utils")
    IMDS_from_rgrid(rhoRgridInput, faceFile, coordFile);
    faces = importdata(faceFile);
    verts = importdata(coordFile);
end
