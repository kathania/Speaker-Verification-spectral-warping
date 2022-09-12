    % Load a speech waveform
    [d,sr] = audioread('sm1_cln.wav');
    [a,g,e] = lpcfit(d,20);
    alpha = 0.1;
    [bhat, ahat]  = warppoles(a, alpha);

    dw = filter(bhat(1,:), 1, lpcsynth(ahat, g, e));

    soundsc(d,sr);
    soundsc(dw, sr);
    audiowrite('ww.wav',dw,sr)