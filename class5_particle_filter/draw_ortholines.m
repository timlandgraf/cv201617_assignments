function [  ] = draw_ortholines( Q )
plot( [Q.P1(:, 1) Q.P2(:, 1)]', [Q.P1(:, 2) Q.P2(:, 2)]')
