function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 05-Jun-2020 10:01:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename, filepath]=uigetfile( {'*.jpg';'*.jpeg';'*.gif';'*.png';'*.fig';'*.mp4';'*.avi';'*.webm';'*.mov'},'Parcourir');
set(handles.edit1, 'String', strcat(filepath, filename));
%imshow(selectedImage);
global x
x = 0; % 0 : no file; 1: image, 2: video
[fPath, fName, fExt] = fileparts(filename);
switch lower(fExt)
  case {'.jpg','.jpeg','.gif','.png','.fig'}
    selectedImage = imread(strcat(filepath, filename));
    x = 1;
  case {'.mp4','.avi','.webm'}
    x = 2;
  otherwise  % Under all circumstances SWITCH gets an OTHERWISE!
    error('Unexpected file extension: %s', fExt);
end

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)

% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
contents = get(handles.popupmenu2,'String'); 
a = contents{get(handles.popupmenu2,'Value')};
%disp(selectedItem);
global x
if(x==1) %Cas de l'image
    myImage = get(handles.edit1,'String');
    image = imread(myImage);
    I = rgb2gray(image);
    
    switch a
        case {'Roberts','Prewitt','Sobel','LoG','Zerocross','Canny','Approxcanny'}
            t = get(handles.edit2,'String');
            direction = get(handles.edit3,'String');
            if isempty(t)
                edges = edge(I,a);
            else
                thresh = str2num(t);
                if(thresh<=0)
                    f = errordlg("errooor")
                end
                edges = edge(I,a,thresh);
            end
            %edges = edge(I,a,thresh,direction);
            figure,imshowpair(image,edges,'montage');
        case 'Otsu'
            t = get(handles.edit2,'String');
            level = graythresh(I);
            if isempty(t)
                BW = imbinarize(I,level);
            else
                T = str2num(t);
                BW = imbinarize(I,T);
            end
            figure,imshowpair(image,BW,'montage');
        case 'superpixel'
            A = image;
            n = get(handles.edit4,'String');
            if isempty(n)
                nbreSp = 500;
            else
                nbreSp = str2num(n);
            end
            [L,N] = superpixels(A,nbreSp);
            BM = boundarymask(L);
            %imshow(imoverlay(A,BM,'cyan'),'InitialMagnification',67)
            outputImage = zeros(size(A),'like',A);
            idx = label2idx(L);
            numRows = size(A,1);
            numCols = size(A,2);
            for labelVal = 1:N
                redIdx = idx{labelVal};
                greenIdx = idx{labelVal}+numRows*numCols;
                blueIdx = idx{labelVal}+2*numRows*numCols;
                outputImage(redIdx) = mean(A(redIdx));
                outputImage(greenIdx) = mean(A(greenIdx));
                outputImage(blueIdx) = mean(A(blueIdx));
            end    
            figure,imshowpair(image,outputImage,'montage');
        case 'croissance de regions'
            A = im2double(image);
            J = regiongrowing(A,0.2);
            imshow(A+J);
    end
end
if(x==2) %Cas de la video
    myVideo = get(handles.edit1,'String');
    v=VideoReader(myVideo);
    video = VideoWriter('test.avi');
    switch a
        case {'Roberts','Prewitt','Sobel','LoG','Zerocross','Canny','Approxcanny'}
            figure;
            for img = 1:v.NumberOfFrames;
                frame = read(v,img);
                I = rgb2gray(frame);
                edges = edge(I,a);
                %imshow(edges_roberts);
                %imshowpair(frame,edges,'montage');
                imshowpair(frame,edges,'montage');
                %imwrite(edges,'1.png');
                %open(video);
                %for i=1:v.NumberOfFrames; 
                    %A = imread('1.png');
                    %img=im2double(A);
                    %writeVideo(video,img); 
                %end
                %close(video);
            end
        case 'Otsu'
            figure;
            for img = 1:v.NumberOfFrames;
                frame = read(v,img);
                
                I = rgb2gray(frame);
                level = graythresh(I);
                BW = imbinarize(I,level);
                imshowpair(frame,BW,'montage');
            end
        case 'superpixel'
            figure;
            for img = 1:v.NumberOfFrames;
                frame = read(v,img);
                A = frame;
                [L,N] = superpixels(A,500);
                BM = boundarymask(L);
                %imshow(imoverlay(A,BM,'cyan'),'InitialMagnification',67)
                outputImage = zeros(size(A),'like',A);
                idx = label2idx(L);
                numRows = size(A,1);
                numCols = size(A,2);
                for labelVal = 1:N
                    redIdx = idx{labelVal};
                    greenIdx = idx{labelVal}+numRows*numCols;
                    blueIdx = idx{labelVal}+2*numRows*numCols;
                    outputImage(redIdx) = mean(A(redIdx));
                    outputImage(greenIdx) = mean(A(greenIdx));
                    outputImage(blueIdx) = mean(A(blueIdx));
                end    
                imshowpair(frame,outputImage,'montage');
            end
    end
end
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
contents = get(handles.popupmenu2,'String');
a = contents{get(handles.popupmenu2,'Value')};
set(handles.edit2, 'enable', 'off');
set(handles.edit3, 'enable', 'off');
set(handles.edit4, 'enable', 'off');
switch a
    case {'Roberts','Prewitt','Sobel'}
        set(handles.edit2, 'enable', 'on');
        set(handles.edit3, 'enable', 'on');
        set(handles.edit4, 'enable', 'off');
    case 'superpixel'
        set(handles.edit2, 'enable', 'off');
        set(handles.edit3, 'enable', 'off');
        set(handles.edit4, 'enable', 'on');
    case {'LoG','Zerocross','Canny','Approxcanny'}
        set(handles.edit2, 'enable', 'on');
        set(handles.edit3, 'enable', 'off');
        set(handles.edit4, 'enable', 'off');
    case 'Otsu'
        set(handles.edit2, 'enable', 'on');
        set(handles.edit3, 'enable', 'off');
        set(handles.edit4, 'enable', 'off');
        
end
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
val = get(handles.radiobutton1,'value');
if(val==1)
    selections = get(handles.popupmenu2,'String');
    edgeM = [{'Roberts'};{'Prewitt'};{'Sobel'};{'LoG'};{'Zerocross'};{'Canny'};{'Approxcanny'}];
    selections = [edgeM];
    set(handles.popupmenu2,'String',selections);
end

% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
val = get(handles.radiobutton2,'value');
if(val==1)
    selections = get(handles.popupmenu2,'String');
    regionM = [{'Otsu'};{'superpixel'};{'croissance de regions'}];
    selections = [regionM];
    set(handles.popupmenu2,'String',selections);
end

% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
