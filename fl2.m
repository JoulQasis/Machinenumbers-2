function [ele,mInf,E0,E1] = fl2(T,K1,K2)
%please enter appropiate inputs (t,k1,k2)
% Checking if the inputs are integers and K2 is bigger than K1
if floor(T) == T && floor(K2) == K2 && floor(K1) == K1 && (K2 > K1)
    % adding 0 to the beggining of the T length mantissa
    %  Number of elements in the set
    Ele = 2*(2^(T-1))*(K2 - K1 + 1);
    % Minf = M Infinity
    mInf =  [0,ones(1,T),K2];
    Minf =fl1(mInf);
    % Epsilon 0
    E0 =  [0,1,zeros(1,T),K1];
    Epsilon0 = fl1(E0);
    %Epsilon 1
    E1 = [0,zeros(1,T-1),1,1];
    Epsilon1 = fl1(E1);

    % If the input parameters arent appropriate
else
    disp("Please Enter other integers!!")
end

    m=zeros(1,T);
    v=[];
    while m(1)~=1
        while max(m)>=2
            [mv, mi]=max(m);
            m(mi)=m(mi)-2;
            m(mi-1)=m(mi-1)+1;
        end
        for k=K1:K2
            v=[m, k];
            r=fl1(v);
            plot([-r, r], [0, 0], 'o');
            grid on;
            hold on;
        end
        m(T)=m(T)+1;
    end

disp("The number of elemnts in the set is : "+Ele);
disp("M infinity is : "+Minf);
disp("Epsilon zero is : "+Epsilon0);
disp("Epsilon one is : "+Epsilon1);

ele = Ele;
mInf  = Minf;
E0 = Epsilon0;
E1 = Epsilon1;

end

