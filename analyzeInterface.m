function [meanCurvature, stdCurvature, area] = analyzeInterface(rhoRgridInput, faceFile, coordFile, meanCurvFile, gaussCurvFile)
    [verts, faces] = preprocessInterface(rhoRgridInput, faceFile, coordFile);
    calculateInterfaceCurvature(verts, faces, meanCurvFile, gaussCurvFile);
    [meanCurvature, stdCurvature] = analyzeCurvature(verts, meanCurvFile, gaussCurvFile, rhoRgridInput);
    area = calculateInterfaceArea(verts, faces, rhoRgridInput);
end

