% print results

disp("Results:")
y = solution(1:length(solution)/2);
rec = solution(length(solution)/2 + 1 : end);

disp(["Redundancies: ", y])
disp(["Corrective maintenance resources (% of all available resources): ", rec])
disp(["Optimal value: ", fval])
disp(["Design cost: ", sum(designCost.*y)])
disp(["Weight: ", sum(weight.*y)])
disp(["Volume: ", sum(volume.*y)])
disp(["Maintenance cost: ", sum(rec.*crec)+sum(q.*y.*cm)])
disp(output)