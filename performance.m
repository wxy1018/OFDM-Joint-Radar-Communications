function [] = performance ()

SNRdB = 0 : 2 : 10;
SNRin = 10 .^ (SNRdB ./ 10);

initSNR = zeros(100, length(SNRin));
SNRraddB = zeros(100, length(SNRin));
initErr = zeros(100, length(SNRin));
ErrorP = zeros(100, length(SNRin));

for idx = 1 : length(SNRin)
    for jdx = 1 : 100
        [initSNR(jdx, idx), SNRraddB(jdx, idx), initErr(jdx, idx), ErrorP(jdx, idx)] = cyclic2 (SNRin(idx));
    end
end

initSNRplot = mean(initSNR);
SNRradplot = mean(SNRraddB);
initErrplot = mean(initErr);
ErrorPplot = mean(ErrorP);

figure
plot(SNRdB, initSNRplot, '-*', SNRdB, SNRradplot, '-*', 'LineWidth', 1.5);
xlabel('input SNR (dB)');
ylabel('Radar SNR (dB)');
legend('Random Initialization', 'Proposed Algorithm');
title('Radar SNR Performance');
grid on;

figure
semilogy(SNRdB, initErrplot, '-*', SNRdB, ErrorPplot, '-*', 'LineWidth', 1.5);
xlabel('input SNR (dB)');
ylabel('BER');
legend('Random Initialization', 'Proposed Algorithm');
title('Communication BER Performance');
grid on;

end