function varargout = Application(varargin)
% APPLICATION MATLAB code for Application.fig
%      APPLICATION, by itself, creates a new APPLICATION or raises the existing
%      singleton*.
%
%      H = APPLICATION returns the handle to a new APPLICATION or the handle to
%      the existing singleton*.
%
%      APPLICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLICATION.M with the given input arguments.
%
%      APPLICATION('Property','Value',...) creates a new APPLICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Application_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Application_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Application

% Last Modified by GUIDE v2.5 11-Jun-2020 12:22:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Application_OpeningFcn, ...
                   'gui_OutputFcn',  @Application_OutputFcn, ...
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


% --- Executes just before Application is made visible.
function Application_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Application (see VARARGIN)

% Choose default command line output for Application
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Application wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Application_OutputFcn(hObject, eventdata, handles) 
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
[fPath, fName, fExt] = fileparts(filename);
global x
x = 0; % 0 : no file; 1: image, 2: video
switch lower(fExt)
  case {'.jpg','.jpeg','.gif','.png','.fig'}
    selectedImage = imread(strcat(filepath, filename));
    x = 1;
  case {'.mp4','.avi','.webm'}
    x = 2;
  otherwise  % Under all circumstances SWITCH gets an OTHERWISE!
    error('Unexpected file extension: %s', fExt);
end
%selectedImage = imread(strcat(filepath, filename));
%montage({selectedImage,selectedImage,selectedImage});
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox2.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox6.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox4.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox4.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox6.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox5.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global x
position = [20,20];
if(x==1)
    myImage = get(handles.edit1,'String');
    image = imread(myImage);
    I = rgb2gray(image);
    Arr = [];
    if(get(handles.checkbox1, 'Value')== 1)
        im1 = edge(I,'Roberts');
        r1 = im2double(im1);
        roberts = insertText(r1,position,'Roberts','FontSize',20);
        Arr = cat(4,Arr,roberts);
    end

    if(get(handles.checkbox2, 'Value')== 1)
        im2 = edge(I,'Prewitt');
        r2 = im2double(im2);
        prewitt = insertText(r2,position,'Prewitt','FontSize',20);
        Arr = cat(4,Arr,prewitt);
    end

    if(get(handles.checkbox3, 'Value')== 1)
        im3 = edge(I,'Sobel');
        r3 = im2double(im3);
        sobel = insertText(r3,position,'Sobel','FontSize',20);
        Arr = cat(4,Arr,sobel);
    end

    if(get(handles.checkbox4, 'Value')== 1)
        im4 = edge(I,'LoG');
        r4 = im2double(im4);
        log = insertText(r4,position,'LoG','FontSize',20);
        Arr = cat(4,Arr,log);
    end

    if(get(handles.checkbox5, 'Value')== 1)
        im5 = edge(I,'Zerocross');
        r5 = im2double(im5);
        zerocross = insertText(r5,position,'Zerocross','FontSize',20);
        Arr = cat(4,Arr,zerocross);
    end

    if(get(handles.checkbox6, 'Value')== 1)
        im6 = edge(I,'Canny');
        r6 = im2double(im6);
        canny = insertText(r6,position,'Canny','FontSize',20);
        Arr = cat(4,Arr,canny);
    end
    if(get(handles.checkbox7, 'Value')== 1)
        level = graythresh(I);
        BW = imbinarize(I,level);
        r7 = im2double(BW);
        otsu = insertText(r7,position,'Otsu','FontSize',20);
        Arr = cat(4,Arr,otsu);
    end
    if(get(handles.checkbox8, 'Value')== 1)
        A = image;
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
                %figure
        r8 = im2double(outputImage);
        SP = insertText(r8,position,'SuperPixel','FontSize',20);
        Arr = cat(4,Arr,SP);
    end
    imMontage = createImMontage(Arr,2);
    h = figure(1);
    if ishandle(h)
        close(h)
    end
    figure('Name','Résultat de la segmentation'),imshow(imMontage);
end
if(x==2)
    myVideo = get(handles.edit1,'String');
    v=VideoReader(myVideo);
    video = VideoWriter('test.avi');
    h = figure(1);
    if ishandle(h)
        close(h)
    end
    figure('Name','Résultat de la segmentation'),
    for img = 1:v.NumberOfFrames;
        Arr = [];
        frame = read(v,img);
        I = rgb2gray(frame);
        f = im2double(frame);
        Arr = cat(4,Arr,f);
        if(get(handles.checkbox1, 'Value')== 1)
            im1 = edge(I,'Roberts');
            r1 = im2double(im1);
            roberts = insertText(r1,position,'Roberts','FontSize',20);
            Arr = cat(4,Arr,roberts);
        end
        if(get(handles.checkbox2, 'Value')== 1)
            im2 = edge(I,'Prewitt');
            r2 = im2double(im2);
            prewitt = insertText(r2,position,'Prewitt','FontSize',20);
            Arr = cat(4,Arr,prewitt);
        end
        if(get(handles.checkbox3, 'Value')== 1)
        im3 = edge(I,'Sobel');
        r3 = im2double(im3);
        sobel = insertText(r3,position,'Sobel','FontSize',20);
        Arr = cat(4,Arr,sobel);
    end

    if(get(handles.checkbox4, 'Value')== 1)
        im4 = edge(I,'LoG');
        r4 = im2double(im4);
        log = insertText(r4,position,'LoG','FontSize',20);
        Arr = cat(4,Arr,log);
    end

    if(get(handles.checkbox5, 'Value')== 1)
        im5 = edge(I,'Zerocross');
        r5 = im2double(im5);
        zerocross = insertText(r5,position,'Zerocross','FontSize',20);
        Arr = cat(4,Arr,zerocross);
    end

    if(get(handles.checkbox6, 'Value')== 1)
        im6 = edge(I,'Canny');
        r6 = im2double(im6);
        canny = insertText(r6,position,'Canny','FontSize',20);
        Arr = cat(4,Arr,canny);
    end
    if(get(handles.checkbox7, 'Value')== 1)
        level = graythresh(I);
        BW = imbinarize(I,level);
        r7 = im2double(BW);
        otsu = insertText(r7,position,'Otsu','FontSize',20);
        Arr = cat(4,Arr,otsu);
    end
    if(get(handles.checkbox8, 'Value')== 1)
        A = image;
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
                %figure
        r8 = im2double(outputImage);
        SP = insertText(r8,position,'SuperPixel','FontSize',20);
        Arr = cat(4,Arr,SP);
    end
        imMontage = createImMontage(Arr,2);
        imshow(imMontage);
    end
end
    
    
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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
