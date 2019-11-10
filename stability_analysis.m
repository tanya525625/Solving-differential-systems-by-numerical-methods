function y = stability_analysis(q, a, b)
    % q - порядок порядок метода
    % a, b - коэффициенты
    h = 0.1;
    timespan = 0:h:2*pi;
    i = sqrt(-1);
    y = zeros(length(timespan));
    for Q=1:length(timespan)
        y(Q) = -exp(i*q*Q);
        % val = timespan(Q);
        for k=1:q
            y(Q) = y(Q) + a(k)*exp(i*Q*(q-k));
        end
        y(Q) = -y(Q)/(b*exp(i*Q));
    end
end
