function varargout = interfata(varargin)
% INTERFATA MATLAB code for interfata.fig
%      INTERFATA, by itself, creates a new INTERFATA or raises the existing
%      singleton*.
%
%      H = INTERFATA returns the handle to a new INTERFATA or the handle to
%      the existing singleton*.
%
%      INTERFATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFATA.M with the given input arguments.
%
%      INTERFATA('Property','Value',...) creates a new INTERFATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfata_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfata_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfata

% Last Modified by GUIDE v2.5 28-Apr-2023 21:01:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfata_OpeningFcn, ...
                   'gui_OutputFcn',  @interfata_OutputFcn, ...
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


% --- Executes just before interfata is made visible.
function interfata_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfata (see VARARGIN)

% Choose default command line output for interfata
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfata wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfata_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Incarca.
function Incarca_Callback(hObject, eventdata, handles)
set(handles.TitluE, 'String', 'CT Scan')

cale='C:\Users\Petruca Bianca Ioana\Desktop\UTCN\anul 4\semestrul 2\Analiza și Prelucrarea Imaginilor Biomedicale\Proiect\ct\';
b=imread([cale '1 (27).png']);
axes(handles.Axa);
imshow(b); axis off

save([tempdir 'b'],'b')
% hObject    handle to Incarca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1



function TitluE_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
if(a==0)
    set(handles.TitluE, 'Visible', 'Off')
else 
    set(handles.TitluE, 'Visible', 'On')
end



% hObject    handle to TitluE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TitluE as text
%        str2double(get(hObject,'String')) returns contents of TitluE as a double


% --- Executes during object creation, after setting all properties.
function TitluE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TitluE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Operatii.
function Operatii_Callback(hObject, eventdata, handles)

cale='C:\Users\Petruca Bianca Ioana\Desktop\UTCN\anul 4\semestrul 2\Analiza și Prelucrarea Imaginilor Biomedicale\Proiect\ct\';
b=imread([cale '1 (27).png']); 

 operatia_selectata = get (hObject, 'Value');

 switch operatia_selectata
     case 1 % oglindire pe axa X 
         b = flipud(b);
     case 2 % oglindire pe axa Y 
         b= fliplr(b);
     case 3 % umplerea golurilor 
         b = imfill(b, 'holes');
     case 4 % erodarea 
         ES= strel('arbitrary',eye(8));
         b=imerode(b,ES);
     case 5 % dilatarea 
         ES= strel('arbitrary',eye(8));
         b=imdilate(b,ES);
     case 6 % gradientul interior 
         ES= strel('arbitrary',eye(8));
         erod = imerode(b, ES);
         b = b - erod; 
     case 7 % gradientul exterior 
         ES= strel('arbitrary',eye(8));
         dil = imdilate(b, ES);
         b = dil - b;
     case 8 % laplacian 
         ES= strel('arbitrary',eye(8));
         erod = imerode(b, ES);
         dil = imdilate(b, ES);
        b  = b - erod; 
        b = dil - b;
         GI = b-erod;
         GE = dil - b;
         b = GE + GI; 
 end 

axes(handles.Axa);
imshow(b); axis off


cale='C:\Users\Petruca Bianca Ioana\Desktop\UTCN\anul 4\semestrul 2\Analiza și Prelucrarea Imaginilor Biomedicale\Proiect\ct\';
p=imread([cale '1 (37).png']); 
save([tempdir 'p'],'p')

if(strcmp(p, 'Laplacianul_morfologic'))
    ES= strel('arbitrary',eye(8));
    erod = imerode(p, ES);
    p = p - erod; 
    dil = imdilate(p, ES);
    p = dil - p;
    GI = p-erod;
    GE = dil - p;
    p = GE + GI; 
end 




butoane = get(handles.prelucrare,'SelectedObject');
selectare = get(butoane,'tag');
switch selectare
    case 'original'
        val = 1;
    case 'pre'
        val = 2;
end 
if (val ==1)
    axes(handles.Axa)
    imshow(b); axis off;
elseif (val == 2)
    axes(handles.Axa)
    imshow(p); axis off;
end



    % hObject    handle to Operatii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Operatii contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Operatii


% --- Executes during object creation, after setting all properties.
function Operatii_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Operatii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in original.
function original_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
if(a==1)
 load([tempdir 'b']);
 axes(handles.Axa);
 imshow(b); axis off;
end


% hObject    handle to original (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of original


% --- Executes on button press in pre.
function pre_Callback(hObject, eventdata, handles)


a=get(hObject,'Value');
if(a==1)
 load([tempdir 'p']);
 axes(handles.Axa);
 imshow(p); axis off;
end


% hObject    handle to pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pre
