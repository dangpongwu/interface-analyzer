

function calculateInterfaceCurvature(verts, faces, meanCurvFile, gaussCurvFile)
    [filepath,~,~] = fileparts(mfilename('fullpath'));
    addpath(filepath+"/utils")
    calculate_curvature(verts, faces, meanCurvFile, gaussCurvFile);
end

