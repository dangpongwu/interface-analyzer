function [averageCurvature, stdDevCurvature] = average_mean_curvature(coordFile, curvFile, gaussFile, rgridFile)
    % Importing data from input files
    coordinates = coordFile;
    curvatures = curvFile;
    gaussianCurvatures = gaussFile;
    % 
    % % Reading grid dimensions from the rgrid file
    % fileContents = fileread(rgridFile);
    % gridDimension = sscanf(fileContents, '%*s %f', 1);
    % 
    % % Extracting coordinates
    % x = coordinates(:,1);
    % y = coordinates(:,2);
    % z = coordinates(:,3);
    
    % % Defining the bounding box limits
    % lowerLimit = 0.5 * gridDimension;
    % upperLimit = 1.5 * gridDimension;
    % 
    % % Identifying points inside the bounding box
    % isInBoundingBox = x >= lowerLimit & x < upperLimit & ...
    %                   y >= lowerLimit & y < upperLimit & ...
    %                   z >= lowerLimit & z < upperLimit;
    % 
    % % Extracting curvatures for points inside the bounding box
    % curvaturesInBoundingBox = curvatures(isInBoundingBox);
    % 
    % % Calculating average and standard deviation of the curvature
    % averageCurvature = mean(curvaturesInBoundingBox);
    % stdDevCurvature = std(curvaturesInBoundingBox);
    % Calculating average and standard deviation of the curvature
    averageCurvature = mean(curvatures);
    stdDevCurvature = std(curvatures);
end
