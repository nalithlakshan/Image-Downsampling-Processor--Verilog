clear all; close all;
program=fopen('data.txt','r');
B=fscanf(program,'%c',inf);
fclose(program);
C = strsplit(B,'\n');
No_of_lines=length(C);

out_file=fopen('instruction_memory.txt','w');
output=zeros(1,No_of_lines);
for i=1:No_of_lines
    D = strsplit(char(C(i)));
    size= length(D);
    switch char(D(1))
        case 'NOOP'
            output(i)=1024;
        case 'LDP1'
            output(i)=2048;
        case 'LDP2'
            output(i)=3072;
        case 'LDP3'
            output(i)=4096;
        case 'LDP4'
            output(i)=5120;
        %%-------edit for gaussian
        case 'LDP5'
            output(i)=25600;
        case 'LDP6'
            output(i)=26624;
        case 'LDP7'
            output(i)=27648;
        case 'LDP8'
            output(i)=28672;
        case 'LDP9'
            output(i)=29696;
        %%--------
        case 'CAL'
            output(i)=6144;
        case 'STR'
            output(i)=7168;
        case 'PP2H'
            output(i)=8192;
        case 'H2PP'
            output(i)=9216;
        case 'ADD'
            output(i)=10240+str2double(char(D(2)));
        case 'SUB'
            output(i)=11264+str2double(char(D(2)));
        case 'ING1'
            output(i)=12288;
        case 'G2MAR' 
            output(i)=13312;
        case 'CLH'
            output(i)=14336;
        case 'CLX'
            output(i)=15360;
        case 'CLY'
            output(i)=16384;
        case 'INX'
            output(i)=17408;
        case 'INY'
            output(i)=18432;
        case 'JUMPX'
            output(i)=19456+str2double(char(D(2)));
        case 'JUMPY'
            output(i)=20480+str2double(char(D(2)));
        case 'H2MAR'
            output(i)=21504;
        case 'PP2MAR'
            output(i)=22528;
        case 'SETX'
            output(i)=30720+str2double(char(D(2)));
        case 'SETY'
            output(i)=31744+str2double(char(D(2)));
        case 'STOP'
            output(i)=24576;
        otherwise
            output(i)=1024;
    end
    fprintf(out_file,'%d\n',output(i));
end

fclose(out_file);
disp('done!');
No_of_lines

%%create mif file
fid = fopen(('instructions.mif'),'w');
str = 'WIDTH=16;\nDEPTH=256;\n\nADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\n\n';
fprintf(fid,str);
str = 'CONTENT BEGIN';
fprintf(fid,'%s\n',str);
%n = 0;
for k=1:No_of_lines
    fprintf(fid,'%d : %d;\n',k-1,output(k));
   % n=n+1;
end
fprintf(fid,'END;\n');
fclose(fid);