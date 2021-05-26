function EdgeDetectChunks(inputFn,outputFn,chunkSz)

% Function for edge detection of frames
% Inputs:
%        inputFn – Input video filename
%        outputFn- Output video filename
% 	      chunkSz – Size of chunks	 
% Output:   
%        No output needed!!

vIn = VideoReader(inputFn);    % Open input file
numF = get(vIn, 'NumberOfFrames'); % Get size in frames
vOut = VideoWriter(outputFn);  % Create output file
vOut.FrameRate = vIn.FrameRate;% Equal framerates
open(vOut);                    % Open output

start = 1;      % Start frame
stop = chunkSz; % Stop frame

while (stop <= numF) % As long as we don't exceed the frame limit
    frames = read(vIn,[start stop]); % Read a chunk of frames
    for i = 1:size(frames,4)    % For all frames in chunk
        temp = frames(:,:,:,i); % Read a frame
        temp = rgb2gray(temp);  % Convert it to grayscale
        outF = edge(temp);      % Perform edge detection
        outF = single(outF);    % Convert to single
        writeVideo(vOut,outF);  % Write result
    end
    start = start + chunkSz;    % Next chunk start
    stop = stop + chunkSz;      % Next chunk end
end

close(vOut); % Close output file



