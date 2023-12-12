clear all
clc

x= 0.1:1/22:1;
d = (1 + 0.6*sin(2*pi*x/0.7)) + (0.3*sin(2*pi*x))/2;
plot(x,d,'b');

%pirmas sluoksnis
w11_1 = rand(1); b1_1 = rand(1);
w21_1 = rand(1); b2_1 = rand(1);
w31_1 = rand(1); b3_1 = rand(1);
w41_1 = rand(1); b4_1 = rand(1);
%isejimo sluoksnis
w11_2 = rand(1); b1_2 = rand(1);
w12_2 = rand(1);
w13_2 = rand(1);
w14_2 = rand(1);

eta = 0.01;

for iter=1:500000 
    for i=1:length(x)  
        %pirmas sluoksnis
        v1_1 = w11_1*x(i)+b1_1;
        v2_1 = w21_1*x(i)+b2_1;
        v3_1 = w31_1*x(i)+b3_1;
        v4_1 = w41_1*x(i)+b4_1;
        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        %pasleptas sluosnkis
        v1_2 = w11_2*y1_1+w12_2*y2_1+w13_2*y3_1+w14_2*y4_1+b1_2;
        y1_2 = v1_2;
        %Isejimas
        Y=y1_2;
        % skaičiuojame klaida
        e=d(i)-Y;
        %skaičiuojame klaidos gradientą
        delta1_2=e;
        %paslėptajame sluoksnyje
        delta1_1=(1-(tanh(y1_1))^2)*delta1_2*w11_2;
        delta2_1=(1-(tanh(y2_1))^2)*delta1_2*w12_2;
        delta3_1=(1-(tanh(y3_1))^2)*delta1_2*w13_2;
        delta4_1=(1-(tanh(y4_1))^2)*delta1_2*w14_2;
        %svorių atnaujinimas
        %isėjimo sluoksnis
        w11_2 = w11_2+eta*delta1_2*y1_1;
        w12_2 = w12_2+eta*delta1_2*y2_1;
        w13_2 = w13_2+eta*delta1_2*y3_1;
        w14_2 = w14_2+eta*delta1_2*y4_1;
        b1_2=b1_2*eta*delta1_2;
        %Paslėptasis sluoksnis
        w11_1 = w11_1+eta*delta1_1*x(i);
        w21_1 = w21_1+eta*delta2_1*x(i);
        w31_1 = w31_1+eta*delta3_1*x(i);
        w41_1 = w41_1+eta*delta4_1*x(i);
        b1_1=b1_1+eta*delta1_1;
        b2_1=b2_1+eta*delta2_1;
        b3_1=b3_1+eta*delta3_1;
        b4_1=b4_1+eta*delta4_1;
    end
end   
X= 0.1:1/220:1;
for i=1:length(X)  
        %pirmas sluoksnis
        v1_1 = w11_1*X(i)+b1_1;
        v2_1 = w21_1*X(i)+b2_1;
        v3_1 = w31_1*X(i)+b3_1;
        v4_1 = w41_1*X(i)+b4_1;
        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        %pasleptas sluosnkis
        v1_2 = w11_2*y1_1+w12_2*y2_1+w13_2*y3_1+w14_2*y4_1+b1_2;
        y1_2 = v1_2;
        %Isejimas
        Y(i)=y1_2;
end
hold on 
plot(X,Y,'g')