function Newmark_method_in_coastal_structures_GUI
    % Create GUI Figure
    fig = uifigure('Name', 'Newmark method in coastal structures', 'Position', [100, 100, 800, 600]);

    % Input Fields
    uilabel(fig, 'Text', 'Wave length (meters):', 'Position', [20, 550, 120, 20]);
    lEdit = uieditfield(fig, 'numeric', 'Position', [140, 550, 100, 20], 'Value', 156);

    uilabel(fig, 'Text', 'Wave height (meters):', 'Position', [20, 520, 120, 20]);
    hEdit = uieditfield(fig, 'numeric', 'Position', [140, 520, 100, 20], 'Value', 11.16);

    uilabel(fig, 'Text', 'Water depth (meters):', 'Position', [20, 490, 120, 20]);
    dEdit = uieditfield(fig, 'numeric', 'Position', [140, 490, 100, 20], 'Value', 100);

    uilabel(fig, 'Text', 'Added mass coefficient (dimensionless):', 'Position', [20, 460, 120, 20]);
    cmEdit = uieditfield(fig, 'numeric', 'Position', [140, 460, 100, 20], 'Value', 1.1);
    
    uilabel(fig, 'Text', 'Drag coefficient (dimensionless):', 'Position', [20, 420, 120, 20]);
    cdEdit = uieditfield(fig, 'numeric', 'Position', [140, 420, 100, 20], 'Value', 1.2);

    uilabel(fig, 'Text', 'Diameter of the body (meters):', 'Position', [20, 390, 120, 20]);
    D1Edit = uieditfield(fig, 'numeric', 'Position', [140, 390, 100, 20], 'Value', 1);

    uilabel(fig, 'Text', 'Wave period (seconds):', 'Position', [20, 360, 120, 20]);
    tEdit = uieditfield(fig, 'numeric', 'Position', [140, 360, 100, 20], 'Value', 8.21);

    uilabel(fig, 'Text', 'Number of time steps for the simulation (integer):', 'Position', [20, 330, 120, 20]);
    dddEdit = uieditfield(fig, 'numeric', 'Position', [140, 330, 100, 20], 'Value', 100);
    
    uilabel(fig, 'Text', 'Time step size (seconds):', 'Position', [20, 300, 120, 20]);
    hhEdit = uieditfield(fig, 'numeric', 'Position', [140, 300, 100, 20], 'Value', 0.5);

    uilabel(fig, 'Text', 'Spring stiffness (N/m):', 'Position', [20, 270, 120, 20]);
    KEdit = uieditfield(fig, 'numeric', 'Position', [140, 270, 100, 20], 'Value', 204.72*10^6);

    uilabel(fig, 'Text', 'Mass of the system (kg):', 'Position', [20, 240, 120, 20]);
    mEdit = uieditfield(fig, 'numeric', 'Position', [140, 240, 100, 20], 'Value', 5.82661*10^6);

    uilabel(fig, 'Text', 'Damping coefficient (N*s/m):', 'Position', [20, 210, 120, 20]);
    cEdit = uieditfield(fig, 'numeric', 'Position', [140, 210, 100, 20], 'Value', 2.07*10^6);
    
    % Axes for Plotting
    ax1 = uiaxes(fig, 'Position', [300, 300, 450, 250]);
    title(ax1, 'Displacement and Velocity');
    xlabel(ax1, 'Time');
    ylabel(ax1, 'Values');

     % Run Button
    runButton = uibutton(fig, 'Text', 'Run Simulation', 'Position', [20, 150, 120, 30]);
    runButton.ButtonPushedFcn = @(btn, event) runSimulation(lEdit, hEdit, dEdit, cmEdit, cdEdit, D1Edit, tEdit, dddEdit, hhEdit, KEdit, mEdit, cEdit, ax1);

end

function runSimulation(lEdit, hEdit, dEdit, cmEdit, cdEdit, D1Edit, tEdit, dddEdit, hhEdit, KEdit, mEdit, cEdit, ax1)

        l=lEdit.Value;
        h=hEdit.Value;
        d=dEdit.Value;
        cm=cmEdit.Value;
        cd=cdEdit.Value;
        D1=D1Edit.Value;   
        t=tEdit.Value;
        ddd=dddEdit.Value;
        kk=2*pi/l;
        w=2*pi/t;
        z(1)=-ddd;

        for i=2:d
            z(i)=z(i-1)+1;
        end
        tt(1)=0;
        for i=1:d+10
            x(i)=0;
        end
        for i=2:110
            tt(i)=tt(i-1)+0.5;
            for k=1:d
                teta(k)=(w*tt(i));
            end
            A1=pi*D1^2/4;
            AD1=D1;

            for j=1:d
                u(j)=(pi*h/t)*((cosh(kk*(z(j)+d)))/(sinh(kk*d)))*cos(teta(j)+kk*((z(j)+100)/7));
                u0(j)=(pi*h/t)*((cosh(kk*(z(j)+d)))/(sinh(kk*d)));
                a(j)=(h*2*pi^2/t^2)*((cosh(kk*(z(j)+d)))/(sinh(kk*d)))*sin(teta(j)+kk*((z(j)+100)/7));
                fi(j)=1000*cm*pi*A1*1*a(j);
                fd(j)=0.5*1000*cd*AD1*u(j)*0.849*u0(j);
                FX(j)=2*(fd(j)+fi(j));

                uu(j)=(pi*h/t)*((cosh(kk*(z(j)+d)))/(sinh(kk*d)))*cos(teta(j)+kk*(44.82-(z(j)+100)/7));
                uu0(j)=(pi*h/t)*((cosh(kk*(z(j)+d)))/(sinh(kk*d)));
                aa(j)=(h*2*pi^2/t^2)*((cosh(kk*(z(j)+d)))/(sinh(kk*d)))*sin(teta(j)+kk*(44.82-(z(j)+100)/7));
                fii(j)=1000*cm*pi*A1*1*aa(j);
                fdd(j)=0.5*1000*cd*AD1*uu(j)*0.849*uu0(j);
                FXX(j)=2*(fdd(j)+fii(j));
            end
            uB(j)=(pi*h/t)*((cosh(kk*(-10+d)))/(sinh(kk*d)))*cos(teta(j));
            uB0(j)=(pi*h/t)*((cosh(kk*(-10+d)))/(sinh(kk*d)));
            aB(j)=(h*2*pi^2/t^2)*((cosh(kk*(-10+d)))/(sinh(kk*d)))*sin(teta(j));
            fiB(j)=1000*cm*pi*A1*1*aB(j);
            fdB(j)=0.5*1000*cd*AD1*uB(j)*0.849*uB0(j);
            FXB(j)=(fdB(j)+fiB(j));
            P(i)=sum(FX)+sum(FXX)+sum(FXB);
        end

        for i=1:ddd
            ttt(1)=0;
            hh=hhEdit.Value;
            ttt(i+1)=i*hh;  
            K=KEdit.Value;
            m=mEdit.Value;
            c=cEdit.Value;
            v(1)=0;
            vv(1)=0;
            fS(i)=v(i)*K;
            fD(i)=c*vv(i);

            fI(i)=P(i)-fS(i)-fD(i);
            vvv(i)=fD(i)/m;
            dP(i)=P(i+1)-P(i);
            dPd(i)=dP(i)+m*((6*vv(i)/hh)+3*vvv(i))+c*(3*vv(i)+hh*vvv(i)/2);
            Kd(i)=K+3*c/hh+6*m/hh^2;
            dv(i)=dPd(i)/Kd(i);
            dvv(i)=3*dv(i)/hh-3*vv(i)-hh*vvv(i)/2;
            v(i+1)=dv(i)+v(i);
            vv(i+1)=dvv(i)+vv(i);

        end
        cla(ax1) % clear previous plot
        plot(ax1,ttt,v, 'DisplayName', 'displacement');
        xlabel(ax1,'time');
        ylabel(ax1,'displ');
        hold(ax1, 'on');
        plot(ax1,ttt,vv, 'DisplayName', 'velocity');
        xlabel(ax1,'time');
        ylabel(ax1,'vel');
        hold(ax1, 'off');

end