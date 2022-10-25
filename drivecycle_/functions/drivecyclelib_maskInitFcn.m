function [S_CYCLE, T_CYCLE, T_MAX, W_SCALE, Disp, Vel, Acc, t, v] = ...
    drivecyclelib_maskInitFcn(CycleName, CycleRepeatsForever)
%drivecyclelib_maskInitFcn Block InitFcn for drivecyclelib.
%   [...] = drivecyclelib(CycleName, CycleRepeatsForever) is
%   called by the mask initialization function of the
%   drivecycle blocks. For further details, please inspect
%   the function body.

%   Copyright 2013-2017 Cranfield University.

[t,v] = selectCycle(CycleName);
[a,s] = interpDriveCycle(t, v);

S_CYCLE = max(s);
T_CYCLE = max(t);
if CycleRepeatsForever
    T_MAX = inf;
else
    T_MAX = 2*T_CYCLE;
end
W_SCALE = 1/(T_CYCLE);

t = t(1:end-1); 
v = v(1:end-1);
a = a(1:end-1);
s = s(1:end-1);

Disp.time = [];
Disp.signals.dimensions = 1;
Disp.signals.values = s(:);

Vel.time = [];
Vel.signals.dimensions = 1;
Vel.signals.values = v(:);

Acc.time = [];
Acc.signals.dimensions = 1;
Acc.signals.values = a(:);


end



function [a,s] = interpDriveCycle(t, v)
%interpDriveCycle  Produce accelerations that go with drive cycles.
%   a = interpDriveCycle(t, v) produces a constant acceleration to go with
%   the drive cycle data described by (t, v). A constant acceleration is
%   assumed between each point in the cycle.

%   Copyright 2013 Cranfield University

% Check input parameters:
assert(isvector(t), 'interpDriveCycle:inputsNotVectors', ...
    'Inputs not vectors: t and v must be row or column vectors.');
sizeT = size(t);
sizeV = size(v);
sizesAreEqual = isequal(sizeT, sizeV);
assert(sizesAreEqual, 'interpDriveCycle:inputSizesNotEqual', ...
    'Input sizes not equal: t and v must have the same dimensions.');

% Convert to column vector form:
t = t(:);
v = v(:);


% Calculate the accerations:
deltaT = [t(2:end) - t(1:end-1); 1];
deltaV = [v(2:end) - v(1:end-1); 0];
a = deltaV ./ deltaT;

% Calculate the displacements.
s = zeros(size(t));
for iPoint = 1:numel(s)-1
    thisS = s(iPoint);
    thisV = v(iPoint);
    thisA = a(iPoint);
    deltaT = t(iPoint+1)-t(iPoint);
    nextS = thisS + thisV * deltaT +0.5*thisA*deltaT*deltaT;
    s(iPoint+1)= nextS;
    
end

a = reshape(a, sizeT);

s = reshape(s, sizeT);


end



function [t,v] = selectCycle(name)
%selectCycle Select cycle data from a name.
%   [t,v] = selectCycle(name) returns the time and velocity signals
%   relating to a given cycle.

%   Copyright 2013 Cranfield University

persistent NedCycles ArtemisCycles WltpCycles EpaCycles;
if isempty(NedCycles)
    NedCycles = load('cycles_nedc.mat');
    ArtemisCycles = load('cycles_artemis.mat');
    WltpCycles = load('cycles_wltp.mat');
    EpaCycles = load('cycles_epa.mat');
end
    
switch lower(name)    
    case 'nedc'
        data = NedCycles.NEDC;
    case 'eudc'
        data = NedCycles.EUDC;
    case 'ece r15'
        data = NedCycles.ECE_R15;
    case 'arturban'
        data = ArtemisCycles.ArtUrban;
    case 'artroad'
        data = ArtemisCycles.ArtRoad;
    case 'artmw130'
        data = ArtemisCycles.ArtMw130;
    case 'artmw150'
        data = ArtemisCycles.ArtMw150;        
    case 'wltp class 3'
        data = WltpCycles.WLTP_class_3;    
    case 'udds'
        data = EpaCycles.UDDS;
    case 'ftp'
        data = EpaCycles.FTP;
    case 'hwfet'
        data = EpaCycles.HWFET;
    otherwise
        error('Cycle not known: %s.', name);
end

t1 = data.Time;
v1 = data.Data;

t = 0:round(max(t1));
v = interp1(t1, v1, t);

t = t(:);
v = v(:)/3.6;

end

