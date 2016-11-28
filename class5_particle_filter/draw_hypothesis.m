function [  ] = draw_hypothesis( L, color)
if isfield(L, 'weight')
    thickness = max(1, .5*L.weight);
else
    thickness = 1;
end
plot( [ L.p1(1) L.p2(1) ], [ L.p1(2) L.p2(2) ], color, 'LineWidth', thickness)
end

