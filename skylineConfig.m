function conf = skylineConfig()
% SKYLINECONFIG return the default config parameters
%   CONF = SKYLINECONFIG returns a CONF structure containing the paths, and
%   other paramters. You can change the settings here and all the functions
%   will reflect this change as they internally call this function. 
%
% Author: Subhransu Maji

% Path variables
conf.path.dataset = '../data';  % Set this to the path where you have downloaded the data
conf.path.cache = '../cache'; % Set this to where to cache intermediate results
conf.path.anno = fullfile(conf.path.cache, 'anno.mat');
conf.path.image = fullfile(conf.path.dataset, 'images');
conf.path.labels = fullfile(conf.path.dataset, 'labels');
conf.path.regions = fullfile(conf.path.dataset, 'regions');
conf.path.seeds = fullfile(conf.path.dataset, 'seeds');
conf.path.imageSet = fullfile(conf.path.dataset, 'imageSets');
conf.path.texton = fullfile(conf.path.dataset, 'textons');

% Display
conf.display = true;
conf.gif = false;

% Unary potentials
conf.keepUnary = false;

% Image parameters
conf.param.image.maxDim = 2000; % Set the maximum dimension to this for speed
                                % Note: the parameters are optimized for
                                % this setting. So, if you change this then
                                % you might have to change the parameters
                                % for segmentation and MRF by cross
                                % validation.

% SLIC segmentation params (see VLFEAT)
conf.param.slic.regionSize = 30;
conf.param.slic.regularizer = 0.001;
conf.param.slic.autoRegionSize = 100;   
conf.param.slic.autoRegularizer = 0.001;

% Graph based segmentation parameters (not used in this code)
conf.param.graph = [0.8,900,100];

% Texton library parameters
conf.param.texton.no = 6;      %
conf.param.texton.ss = 1;      %
conf.param.texton.ns = 2;      %
conf.param.texton.sc = sqrt(2);%
conf.param.texton.el = 2;      %
conf.param.texton.k  = 32;     % number of textons in the library
conf.param.texton.radius = 20; % radius of region for histogram computation

% Unary potential terms
conf.param.color.numGMMClusters = 3;
conf.param.texture.numGMMClusters = 3;
conf.param.alpha = 0.35;
conf.param.beta = 0.20;

% Pairwise potential terms
conf.param.pairwise.gamma = 1;      % Affinity scores
conf.param.pairwise.lambda = 0.001; % Unary and pairwise term tradeoff

% Paramters for buildings
conf.param.building.maxWidth = 50;
conf.param.building.minWidth = 15;

% Search parameters for rectangle search
conf.param.building.search.step = 1;    % Step size for search of rectangles (increase this for speed)
conf.param.building.search.deltay = 25; % Allow upper boundary of the rectangle to go higher
conf.param.building.search.tau = 1e-2;  % Cost of making shifts

% Automatic seeds computation parameters (not used in this code)
conf.param.autoseeds.K = 20;
conf.param.autoseeds.NS = 20000;
conf.param.autoseeds.segPerPart = 2;
conf.param.autoseeds.wfactor = 4;