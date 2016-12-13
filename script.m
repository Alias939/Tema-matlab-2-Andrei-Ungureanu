f0 = 1/40;
w0 = 2*pi*f0;
T = 1/f0;
n0 = T/10;
t = 0:10:4*T;
A = 1;
fi = 0;
N = 50;
x = fc( t,f0,fi,A,T );

%Complex

C = zeros(1,2*N+1);

for n=-N:N
    C(n+N+1) = (1/T)*integral(@(t)fc( t,f0,fi,A,T ).*exp(-1j*n*w0*t),0,T);
    re = real(C(n+N+1));
    im = imag(C(n+N+1));
    C(n+N+1) = re + 1j*im;
end

for n=-N:N
    complex = C(n+N+1)*exp(1).^(1j*n*w0*t);
end

figure(3);
stem((-N:N)*w0,abs(C));
xlabel('Freq');
ylabel('Amplitudes');
title('Amplitude spectrum (Complex)');
reconstruit = 0;

a0 = 2/T * integral(@(t)fc( t,f0,fi,A,T ),0,T);
re1 = real(C(n+N+1));
im1 = imag(C(n+N+1));

for i=1:N
reconstruit = reconstruit + real(C(n+N+1))*cos(n*w0*t) + imag(C(n+N+1))*sin(n*w0*t);
end

figure(1);
plot (t, x);

figure(2);
plot(t,reconstruit);

