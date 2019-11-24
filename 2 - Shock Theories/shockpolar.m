%Initial Conditions
gamma = 1.4;
M1 = 2.84;
theta_w = 19.17;

%First Shock Polar
phi = linspace(asind(1/M1),90,100);
p_po = 1 + 2*gamma/(gamma + 1) * ( (M1*sind(phi)).^2 -1);
theta = atand(2*cotd(phi).*((M1*sind(phi)).^2 - 1)./(2 + M1^2*(gamma+cosd(2*phi))));
x1 = [-1*flip(theta(2:length(theta))) theta];
y1 = [flip(p_po(2:length(p_po))) p_po];

phi_1 = phifromtheta(M1,theta_w, gamma);
theta_1 = atand(2*cotd(phi_1).*((M1*sind(phi_1)).^2 - 1)./(2 + M1^2*(gamma+cosd(2*phi_1))));
p_po_1 = 1 + 2*gamma/(gamma + 1) * ( (M1*sind(phi_1)).^2 -1);
M2 = sqrt( (1+(((gamma-1)*(M1*sind((phi_1)))^2)/2)) / ((gamma*(M1*sind((phi_1)))^2) - (gamma-1)/2)) /sind((phi_1 - theta_1));

% M2 = round(M2,3);
%Second Shock Polar
phi2 = linspace(asind(1/M2),90,1000);
theta2 = atand(2*cotd(phi2).*((M2*sind(phi2)).^2 - 1)./(2 + M2^2*(gamma+cosd(2*phi2))));
p_po2 = (1 + 2*gamma/(gamma + 1) * ( (M2.*sind(phi2)).^2 -1));
p_po2 = p_po2*p_po_1;
x2 = [-1*flip(theta2(2:length(theta2))) theta2];
y2 = [flip(p_po2(2:length(p_po2))) p_po2];

figure(1);
plot(x1,y1);
hold on;

plot(x2 + theta_1,y2, x2 - theta_1,y2);

y = [0 p_po(end)*1.92];
plot([0 0],y,'k');

title(['Shock Polar for M_0 = ' num2str(M1) ' and \theta_{wedge} = ' num2str(theta_w) '^o']);
xlabel('Flow Deflection, \theta');
ylabel('P_j/P_o');

[x_rr, y_rr] = intersections(x2 + theta_1,y2,[0 0],y, 0);

if isempty(x_rr)
    [x_mr, y_mr] =  intersections(x2 + theta_1,y2,x1,y1);
    [~, n] = max(y_mr);
%     for n = 1:length(y_mr)
%         if p_po_1 < y_mr(n)
            plot(x_mr(n), y_mr(n),'o');
            plot(-x_mr(n), y_mr(n),'o');
            text(x_mr(n), y_mr(n)*1.1,['(' num2str(x_mr(n)) ',' num2str(y_mr(n)) ')']);
            
%         end
%     end
else  
    plot(x_rr, y_rr,'o');
end
