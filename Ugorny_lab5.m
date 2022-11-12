close all
t0=0;
u0=0;
du=1;
x0=0;
Wn = 2;
KsiList = [5,-2.5,0,3/20,-0.3]; 

for i = 1:1:length(KsiList)
    figure
    grid on
    hold on
    xlabel('Re(lambda)')
    ylabel('Im(lambda)')
    
    Ksi = KsiList(i);
    title(['Ksi = ', num2str(Ksi)]);
    lambda1 = Wn*((-1)*Ksi + sqrt(Ksi^2 - 1));
    lambda2 = Wn*((-1)*Ksi - sqrt(Ksi^2 - 1));
    
    lambdaRe = [real(lambda1), real(lambda2)];
    lambdaIm = [imag(lambda1), imag(lambda2)];
   
    plot(lambdaRe,lambdaIm,'*', 'MarkerSize', 10);
    
    sim('Ugorny_lab5s');
    figure
    grid on
    hold on
    xlabel('t[s]')
    ylabel('x')
    title(['Ksi = ', num2str(Ksi)]);
    plot(ans.tout,ans.simout,'LineWidth',2);
end

KsiList = [0.3 0.3 0.3 0.3; 0.2 0.4 0.6 0.8; 0.2000    0.4000    0.6000    0.8000];
WnList = [0.5 1 1.5 2; 1 1 1 1; 2.5   1.25   (0.5 + 1/3)   0.625];
for j = 1:1:3
figure
grid on
hold on
xlabel('Re(lambda)')
ylabel('Im(lambda)')
for i = 1:1:4
    Ksi = KsiList(j,i);
    Wn = WnList(j,i);
    lambda1 = Wn*((-1)*Ksi + sqrt(Ksi^2 - 1));
    lambda2 = Wn*((-1)*Ksi - sqrt(Ksi^2 - 1));
    
    lambdaRe = [real(lambda1), real(lambda2)];
    lambdaIm = [imag(lambda1), imag(lambda2)];
   
    plot(lambdaRe,lambdaIm,'*','MarkerSize',10);   
end

figure
grid on
hold on
xlabel('t[s]')
ylabel('x')
for i = 1:1:4
    Ksi = KsiList(j,i);
    Wn = WnList(j,i);
    sim('Ugorny_lab5s');
    plot(ans.tout,ans.simout,'LineWidth',2); 
end
end