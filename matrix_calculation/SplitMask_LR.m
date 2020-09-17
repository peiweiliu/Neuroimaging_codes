%% convert nii to mat
% Step 1.  Define filepath and filename of the data I want to read into the Matlab workspace
datadir = pwd;
fname = 'TPJ_Mask.nii';
Data2Read = fullfile(datadir,fname);

% Step 2.  Now pass Data2Read into the function spm_vol in order to read in the header information for the file.
HeaderInfo = spm_vol(Data2Read);

% Step 3.  Now use spm_read_vols to read in the data
Data = spm_read_vols(HeaderInfo);

%% split masks
% right side
rightside_Data = Data
rightside_Data(46:91,:,:) = 0
Data = rightside_Data %now the orginal Data is overwirtten
% likewise, left side
% leftside_Data = Data
% leftside_Data(0:46,:,:) = 0
% Data = leftside_Data 
%% convert mat to nii
HeaderInfo.fname = 'TPJ_right.nii';
HeaderInfo.private.dat.fname = HeaderInfo.fname;
spm_write_vol(HeaderInfo,Data);

