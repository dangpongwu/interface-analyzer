function calculate_curvature(coordInput, faceInput, meanOutput, gaussOutput)

    vertices = coordInput;
    faces = faceInput;

    pp.vertices = vertices;
    pp.faces = faces;

    [Cmean, Cgaussian, ~, ~, ~, ~] = patchcurvature(pp, false);

    writeCurvatureToFile(gaussOutput, Cgaussian);
    writeCurvatureToFile(meanOutput, Cmean);
end

function writeCurvatureToFile(fileName, curvatureData)
    fileID = fopen(fileName, 'w');
    if fileID == -1
        error('Failed to open file: %s', fileName);
    end
    
    try
        fprintf(fileID, '%f\n', curvatureData');
    catch
        fclose(fileID);
        error('Failed to write curvature data to file: %s', fileName);
    end
    
    fclose(fileID);
end
