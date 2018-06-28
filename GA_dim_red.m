function varargout = GA_dim_red(varargin)
% GA_DIM_RED MATLAB code for GA_dim_red.fig
%      GA_DIM_RED, by itself, creates bands new GA_DIM_RED or raises the existing
%      singleton*.
%
%      H = GA_DIM_RED returns the handle to bands new GA_DIM_RED or the handle to
%      the existing singleton*.
%
%      GA_DIM_RED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GA_DIM_RED.M with the given input arguments.
%
%      GA_DIM_RED('Property','Value',...) creates bands new GA_DIM_RED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GA_dim_red_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GA_dim_red_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GA_dim_red

% Last Modified by GUIDE v2.5 09-May-2018 18:19:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GA_dim_red_OpeningFcn, ...
                   'gui_OutputFcn',  @GA_dim_red_OutputFcn, ...
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


% --- Executes just before GA_dim_red is made visible.
function GA_dim_red_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GA_dim_red (see VARARGIN)

% Choose default command line output for GA_dim_red
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GA_dim_red wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GA_dim_red_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loading the file into system
global im  
global a Image
[filename path]=uigetfile({'*.mat'},'File Selector');
im=matfile(strcat(path,filename));
inf = whos(im);
Image=im.(inf.name);

% Displaying the Image details
a=size(Image);
set(handles.f_name,'string',filename);      % namew of the file
set(handles.row,'string',a(1));             % no of rows
set(handles.col,'string',a(2));             % no of columns
set(handles.band,'string',a(3));            % no of bands
set(handles.uipanel1,'visible','on')

%SHOWING THE FCC DISPLAY
r = mat2gray(Image(:,:,50));               
g = mat2gray(Image(:,:,27));
b = mat2gray(Image(:,:,17));
FCC = cat(3,r,g,b);
axes(handles.axes1);
imshow(FCC);
set(handles.uipanel2,'visible','on');
set(handles.uipanel3,'visible','on');




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as bands double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as bands double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as bands double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function selected_Callback(hObject, eventdata, handles)
% hObject    handle to selected (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of selected as text
%        str2double(get(hObject,'String')) returns contents of selected as bands double


% --- Executes during object creation, after setting all properties.
function selected_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selected (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pool_size_Callback(hObject, eventdata, handles)
% hObject    handle to pool_size (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pool_size as text
%        str2double(get(hObject,'String')) returns contents of pool_size as bands double


% --- Executes during object creation, after setting all properties.
function pool_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pool_size (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gen_Callback(hObject, eventdata, handles)
% hObject    handle to gen (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gen as text
%        str2double(get(hObject,'String')) returns contents of gen as bands double


% --- Executes during object creation, after setting all properties.
function gen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gen (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes when selected object is changed in Crossover.
function Crossover_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in Crossover 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cross_fact
switch (get(eventdata.NewValue,'Tag'));
    case 'radiobutton1'
        cross_fact = 0.3;
    case 'radiobutton2'
        cross_fact = 0.35;
    case 'radiobutton3'
        cross_fact = 0.4;
end


% --- Executes when selected object is changed in Mutation.
function Mutation_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in Mutation 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mut_fact
switch (get(eventdata.NewValue,'Tag'));
    case 'radiobutton4'
        mut_fact = 0.01;
    case 'radiobutton5'
        mut_fact = 0.02;
    case 'radiobutton6'
        mut_fact = 0.05;
end


% --- Executes when selected object is changed in fitness.
function fitness_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in fitness 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fit_fact
switch (get(eventdata.NewValue,'Tag'));
    case 'radiobutton7'
        fit_fact = 1;
    case 'radiobutton8'
        fit_fact = 2;
end

% --- Executes on button press in ga.
function ga_Callback(hObject, eventdata, handles)
% hObject    handle to ga (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a Image cross_fact mut_fact fit_fact bands ;

% GENERATING THE COVARIANCE MATRIX.
covar_mat = covariance(Image);


% TAKING GIPUT FROM USER
selected = str2num(get(handles.selected,'String'));
pool_size = str2num(get(handles.pool_size,'String'));
gen = str2num(get(handles.pool_size,'String'));
random1 = str2num(get(handles.rand,'String'));

pool = zeros(pool_size*2,a(3)+2);

%iNITIALISING THE POOL WITH DOUBLE NO OF CANDIDATES THAN MENTIONED BY USER
i=1;                                        
while i<=pool_size*2;
    pool(i,:) = initialisation( pool(i,:) , selected, covar_mat , fit_fact);
    i=i+1;
end

%SELECTING THE HALF OUT OF uSER DEFINED POOL SIZE
pool = selection(pool(:,:), pool_size , random1);

%ITERATING FOR THE GENERATIONS
igen=1;
while igen<=gen
    
    %Crossovering two candidates
    
     pool = crossover ( pool(:,:) , selected , pool_size, covar_mat , cross_fact , fit_fact);
    

    % Mutation of a candidate
  
    pool = mutation(pool(:,:),selected, pool_size, covar_mat , mut_fact , fit_fact);
 

    %Selection of the candidates for the new generation
    pool = selection(pool(:,:), pool_size , random1);

    igen=igen+1;
end

pool=sortrows(pool,-(size(pool,2)-1)); %one last time sorting before selecting the top band

% the Fittest candidate in the last generation
bands = zeros(1,selected);           % a band array of a candidate
i=1;
j=1;
while i<=length(pool(1,:))-2         % running till the candidate's last band
    if(pool(1,i)==1)
        bands( j ) = i;         % converting ones into band nos by noting down the index of ones.
        j=j+1;
    end
    i=i+1;
end
bands;

set(handles.bands,'visible','on','Data',bands);
set(handles.uipanel8,'visible','on');
set(handles.uipanel9,'visible','on');




function red_Callback(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of red as text
%        str2double(get(hObject,'String')) returns contents of red as bands double


% --- Executes during object creation, after setting all properties.
function red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blue_Callback(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blue as text
%        str2double(get(hObject,'String')) returns contents of blue as bands double


% --- Executes during object creation, after setting all properties.
function blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function green_Callback(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of green as text
%        str2double(get(hObject,'String')) returns contents of green as bands double


% --- Executes during object creation, after setting all properties.
function green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% DISPLAYING THE IMAGE WITH USER SPECIFIED BANDS. 

global Image
r = str2num(get(handles.red,'String'));
g = str2num(get(handles.green,'String'));
b = str2num(get(handles.blue,'String'));
r = mat2gray(Image(:,:,r));               
g = mat2gray(Image(:,:,g));
b = mat2gray(Image(:,:,b));
FCC = cat(3,r,g,b);
axes(handles.axes2);
imshow(FCC);
set(handles.save,'visible','on');



% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%SAVING THE IMAGE WITH SELECTED BANDS
global Image bands
new = Image(:,:,(bands));
save('Result.mat','new');
z=load('Result.mat');
p=z.new;
p=size(p)


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','off');
set(handles.uipanel3,'visible','off');
set(handles.uipanel8,'visible','off');
set(handles.uipanel9,'visible','off');
set(handles.save,'visible','off');
set(handles.reset,'visible','off');
clear;
clc;





function rand_Callback(hObject, eventdata, handles)
% hObject    handle to rand (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rand as text
%        str2double(get(hObject,'String')) returns contents of rand as bands double


% --- Executes during object creation, after setting all properties.
function rand_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rand (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have bands white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in bands future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes during object creation, after setting all properties.
function uipanel5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton2.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3





% --- Executes on button press in radiobutton5.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton20_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes when entered data in editable cell(s) in bands.
function bands_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to bands (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in bands.
function bands_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to bands (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
