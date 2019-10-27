g = 1.4;
Mach_range = 1:0.5:4.0; 

for Mi = Mach_range 
    Mj_array = [];
    pj_pi_array = [];
    rhoj_rhoi_array = [];
    tj_ti_array = [];
    thetaj_array = [];
    
    phi_range = asind(1/Mi):1:90;
    for phij = phi_range
        [Mj, pj_pi, rhoj_rhoi, tj_ti, thetaj] = Shockfun(Mi,phij,g);
        Mj_array = [Mj_array Mj];
        pj_pi_array = [pj_pi_array pj_pi];
        rhoj_rhoi_array = [rhoj_rhoi_array rhoj_rhoi];
        tj_ti_array = [tj_ti_array tj_ti];
        thetaj_array = [thetaj_array thetaj];
    end
    figure(1);
    plot(thetaj_array, Mj_array,'DisplayName',['M = ' num2str(Mi)]);
    hold on;
    
    figure(2);
    plot(thetaj_array,pj_pi_array,'DisplayName',['M = ' num2str(Mi)]);
    hold on;
        
    figure(3);
    plot(thetaj_array,rhoj_rhoi_array,'DisplayName',['M = ' num2str(Mi)]);
    hold on;

    figure(4);
    plot(thetaj_array,tj_ti_array,'DisplayName',['M = ' num2str(Mi)]);
    hold on;
end
figure(1);
title('Plot of Downstream Mach Number vs Deflection');
xlabel('Flow Deflection, \theta');
ylabel('Downstream Mach Number, M_i');
legend();

figure(2);
title('Plot of Pressure Ratio vs Deflection');
xlabel('Flow Deflection, \theta');
ylabel('Pressure Ratio, P_j/P_i');
legend();

figure(3);
title('Plot of Density Ratio vs Deflection');
xlabel('Flow Deflection, \theta');
ylabel('Density Ratio, \rho_j/\rho_i');
legend();

figure(4);
title('Plot of Temperature Ratio vs Deflection');
xlabel('Flow Deflection, \theta');
ylabel('Temperature Ratio, T_j/T_i');
legend();
