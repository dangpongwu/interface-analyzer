

function [meanCurv, stdCurv] = analyzeCurvature(verts, meanCurvFile, gaussCurvFile, rhoRgridInput)
    [filepath,~,~] = fileparts(mfilename('fullpath'));
    addpath(filepath+"/utils")
    [meanCurv, stdCurv] = average_mean_curvature(verts, meanCurvFile, gaussCurvFile, rhoRgridInput);
end
