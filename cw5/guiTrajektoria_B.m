function varargout = guiTrajektoria_B(varargin)
% GUITRAJEKTORIA_B MATLAB code for guiTrajektoria_B.fig
%      GUITRAJEKTORIA_B, by itself, creates a new GUITRAJEKTORIA_B or raises the existing
%      singleton*.
%
%      H = GUITRAJEKTORIA_B returns the handle to a new GUITRAJEKTORIA_B or the handle to
%      the existing singleton*.
%
%      GUITRAJEKTORIA_B('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITRAJEKTORIA_B.M with the given input arguments.
%
%      GUITRAJEKTORIA_B('Property','Value',...) creates a new GUITRAJEKTORIA_B or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiTrajektoria_B_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiTrajektoria_B_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiTrajektoria_B

% Last Modified by GUIDE v2.5 15-Dec-2019 20:50:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiTrajektoria_B_OpeningFcn, ...
                   'gui_OutputFcn',  @guiTrajektoria_B_OutputFcn, ...
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


% --- Executes just before guiTrajektoria_B is made visible.
function guiTrajektoria_B_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiTrajektoria_B (see VARARGIN)

% Choose default command line output for guiTrajektoria_B
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiTrajektoria_B wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axis([0,10,0,10])
xlabel('Dystans [m]')
ylabel('Wysokoœæ [m]')


% --- Outputs from this function are returned to the command line.
function varargout = guiTrajektoria_B_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function velocityBox_Callback(hObject, eventdata, handles)
% hObject    handle to velocityBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of velocityBox as text
%        str2double(get(hObject,'String')) returns contents of velocityBox as a double


% --- Executes during object creation, after setting all properties.
function velocityBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocityBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global velocityBox
velocityBox=hObject;

function angleBox_Callback(hObject, eventdata, handles)
% hObject    handle to angleBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angleBox as text
%        str2double(get(hObject,'String')) returns contents of angleBox as a double


% --- Executes during object creation, after setting all properties.
function angleBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angleBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global angleBox
angleBox=hObject;


% --- Executes on button press in thrawPush.
function thrawPush_Callback(hObject, eventdata, handles)
% hObject    handle to thrawPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global velocityBox angleBox
g=9.81;
v0=str2double(velocityBox.String);
theta=str2double(angleBox.String)*pi/180;
t1=2*v0*sin(theta)/g;
t=0:0.01:t1;
x=v0*cos(theta)*t;
y=v0*sin(theta)*t-g*t.^2/2;
hold on
comet(x,y)
