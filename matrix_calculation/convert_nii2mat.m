% Step 1.  Define filepath and filename of the data I want to read into the Matlab workspace
datadir = pwd;
fname = 'TPJ_Mask.nii';
Data2Read = fullfile(datadir,fname);

% Step 2.  Now pass Data2Read into the function spm_vol in order to read in the header information for the file.
HeaderInfo = spm_vol(Data2Read);

% Step 3.  Now use spm_read_vols to read in the data
Data = spm_read_vols(HeaderInfo);

%pick one variable and save it as *.mat file
save('nii2mat_result','Data')