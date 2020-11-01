function varargout = HOME(varargin)
% HOME MATLAB code for HOME.fig
%      HOME, by itself, creates a new HOME or raises the existing
%      singleton*.
%
%      H = HOME returns the handle to a new HOME or the handle to
%      the existing singleton*.
%
%      HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME.M with the given input arguments.
%
%      HOME('Property','Value',...) creates a new HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HOME_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HOME_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HOME

% Last Modified by GUIDE v2.5 16-Sep-2020 00:39:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HOME_OpeningFcn, ...
                   'gui_OutputFcn',  @HOME_OutputFcn, ...
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


% --- Executes just before HOME is made visible.
function HOME_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HOME (see VARARGIN)

% Choose default command line output for HOME
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HOME wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear all;
global a;
a = arduino('COM5','UNO');

% --- Outputs from this function are returned to the command line.
function varargout = HOME_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ON01.
function ON01_Callback(hObject, eventdata, handles)
% hObject    handle to ON01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a,'D10',1);

% --- Executes on button press in ON02.
function ON02_Callback(hObject, eventdata, handles)
% hObject    handle to ON02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a,'D11',1);

% --- Executes on button press in DIM01.
function DIM01_Callback(hObject, eventdata, handles)
% hObject    handle to DIM01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writePWMVoltage(a,'D10',2);

% --- Executes on button press in DIM02.
function DIM02_Callback(hObject, eventdata, handles)
% hObject    handle to DIM02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writePWMVoltage(a,'D11',2);

% --- Executes on button press in OFF01.
function OFF01_Callback(hObject, eventdata, handles)
% hObject    handle to OFF01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a,'D10',0);

% --- Executes on button press in OFF02.
function OFF02_Callback(hObject, eventdata, handles)
% hObject    handle to OFF02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a,'D11',0);

% --- Executes on button press in MON.
function MON_Callback(hObject, eventdata, handles)
% hObject    handle to MON (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a,'D7',1);
writeDigitalPin(a,'D6',0);

% --- Executes on button press in MOFF.
function MOFF_Callback(hObject, eventdata, handles)
% hObject    handle to MOFF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a,'D7',0);
writeDigitalPin(a,'D6',0);


% --- Executes on button press in AON.
function AON_Callback(hObject, eventdata, handles)
% hObject    handle to AON (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a,'D10',1);
writeDigitalPin(a,'D11',1);
writeDigitalPin(a,'D7',1);
writeDigitalPin(a,'D6',0);

% --- Executes on button press in AOFF.
function AOFF_Callback(hObject, eventdata, handles)
% hObject    handle to AOFF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a,'D10',0);
writeDigitalPin(a,'D11',0);
writeDigitalPin(a,'D7',0);
writeDigitalPin(a,'D6',0);