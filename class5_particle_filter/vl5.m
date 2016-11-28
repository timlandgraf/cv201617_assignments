% the test image
clear all
I = imread('objects.png');
I(I>50) = 255;
imshow(I)
[height, width] = size(I);
hold on

%% line score
hold off
subplot(2,1,1)
imshow(I)
hold on
% make a random line segment 
L = random_hypothesis(height, width)
subplot(2,1,1)
[L, q] = score_hypothesis_line(I, L)
draw_hypothesis(L, 'w')

subplot(2,1,2)
plot(q)

%% ortho lines
hold off
imshow(I)
hold on
L = random_hypothesis(height, width)
Q = get_ortho_lines(L, 30, 10)
L = score_hypothesis_ortholines(I, L, 20, 10)
draw_hypothesis(L, 'y')
draw_ortholines(Q )
L.weight

%% diffusion 
hold off
imshow(I)
hold on
for i = 1 : 20
    LN = add_noise_to_hypothesis( L, 20 )
    draw_hypothesis(LN, 'y')
end

%% random distribution of hypotheses
hold off
imshow(I)
hold on 
clear P
N = 50;
for i = 1:N
    P{i} = random_hypothesis(height, width)
    draw_hypothesis(P{i}, 'y')
end


%% importance resampling
imshow(I)
hold on 
N = 50;
for i = 1 : N
    P{i} = score_hypothesis_ortholines(I, P{i}, 20, 10);
%     P{i} = score_hypothesis_line(I, P{i});

end

P = importance_resampling(P, 5)
for i = 1 : N
    draw_hypothesis(P{i}, 'b');
end


draw_hypothesis(get_mean_hypothesis(P), 'y')
hold off
