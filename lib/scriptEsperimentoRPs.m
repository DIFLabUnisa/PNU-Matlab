function scriptEsperimentoRPs()

  %Canon EOS 400D (16 Foto)
  [referencePattern]=mediaReferencePattern2('/home/if/CONDIVISIONE/if/APPLICAZIONE/IMMAGINI_ENROLLMENT/Canon EOS 400D/', 16);

  save '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(16_Foto).mat';

  clear;



  %Canon EOS 400D (32 Foto)
  [referencePattern]=mediaReferencePattern2('/home/if/CONDIVISIONE/if/APPLICAZIONE/IMMAGINI_ENROLLMENT/Canon EOS 400D/', 32);

  save '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(32_Foto).mat';

 clear;



  %Canon EOS 400D (64 Foto)
  [referencePattern]=mediaReferencePattern2('/home/if/CONDIVISIONE/if/APPLICAZIONE/IMMAGINI_ENROLLMENT/Canon EOS 400D/', 64);

  save '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(64_Foto).mat';

 clear;


  %Canon EOS 400D (128 Foto)
  [referencePattern]=mediaReferencePattern2('/home/if/CONDIVISIONE/if/APPLICAZIONE/IMMAGINI_ENROLLMENT/Canon EOS 400D/', 128);

  save '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(128_Foto).mat';

 clear;


  %Canon EOS 400D (256 Foto)
  [referencePattern]=mediaReferencePattern2('/home/if/CONDIVISIONE/if/APPLICAZIONE/IMMAGINI_ENROLLMENT/Canon EOS 400D/', 256);

  save '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(256_Foto).mat';

 clear;


% ----- PARTE II -----

% 16
load '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(16_Foto).mat';
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 400D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 16', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 16 con Canon EOS 400D.txt', 'RP Canon EOS 400D 16 con Canon EOS 400D');
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 1000D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 16', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 16 con Canon EOS 1000D.txt', 'RP Canon EOS 400D 16 con Canon EOS 1000D');


% 32
load '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(32_Foto).mat';
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 400D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 32', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 32 con Canon EOS 400D.txt', 'RP Canon EOS 400D 32 con Canon EOS 400D');
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 1000D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 32', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 32 con Canon EOS 1000D.txt', 'RP Canon EOS 400D 32 con Canon EOS 1000D');

% 64
load '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(64_Foto).mat';
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 400D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 64', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 64 con Canon EOS 400D.txt', 'RP Canon EOS 400D 64 con Canon EOS 400D');
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 1000D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 64', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 64 con Canon EOS 1000D.txt', 'RP Canon EOS 400D 64 con Canon EOS 1000D');


% 128
load '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(128_Foto).mat';
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 400D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 128', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 128 con Canon EOS 400D.txt', 'RP Canon EOS 400D 128 con Canon EOS 400D');
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 1000D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 128', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 128 con Canon EOS 1000D.txt', 'RP Canon EOS 400D 128 con Canon EOS 1000D');


% 256
load '/home/if/CONDIVISIONE/if/APPLICAZIONE/RPs Canon EOS 400D (Esperimento)/REFERENCE_PATTERN_Canon_EOS_400D_(256_Foto).mat';
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 400D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 256', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 256 con Canon EOS 400D.txt', 'RP Canon EOS 400D 256 con Canon EOS 400D');
computeCorrelazioni('/home/if/CONDIVISIONE/if/APPLICAZIONE/Foto esperimento/Canon EOS 1000D/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D 256', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/Confronto differenti foto per RP/RP Canon EOS 400D 256 con Canon EOS 1000D.txt', 'RP Canon EOS 400D 256 con Canon EOS 1000D');


%----- PARTE III -----

load '/home/if2/CONDIVISIONE/if/APPLICAZIONE/REFERENCE PATTERN/1_REFERENCE_PATTERN_Canon_EOS_400D.mat';
computeCorrelazioni('/home/if2/CONDIVISIONE/if/APPLICAZIONE/Esperimento Compressione JPEG/Compressione JPEG 100 (on-board)/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/RP Canon EOS 400D con Canon EOS 400D 100.txt', 'RP Canon EOS 400D con Canon EOS 400D 100');
computeCorrelazioni('/home/if2/CONDIVISIONE/if/APPLICAZIONE/Esperimento Compressione JPEG/Compressione JPEG 90/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/RP Canon EOS 400D con Canon EOS 400D 90.txt', 'RP Canon EOS 400D con Canon EOS 400D 90');
computeCorrelazioni('/home/if2/CONDIVISIONE/if/APPLICAZIONE/Esperimento Compressione JPEG/Compressione JPEG 75/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/RP Canon EOS 400D con Canon EOS 400D 75.txt', 'RP Canon EOS 400D con Canon EOS 400D 75');
computeCorrelazioni('/home/if2/CONDIVISIONE/if/APPLICAZIONE/Esperimento Compressione JPEG/Compressione JPEG 50/', referencePattern, 'REFERENCE PATTERN CANON EOS 400D', '/home/if/CONDIVISIONE/if/APPLICAZIONE/Correlazioni/RP Canon EOS 400D con Canon EOS 400D 50.txt', 'RP Canon EOS 400D con Canon EOS 400D 50');
