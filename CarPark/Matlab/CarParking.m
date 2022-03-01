
function varargout = CarParking(varargin)
% CARPARKING MATLAB code for CarParking.fig
%      CARPARKING, by itself, creates a new CARPARKING or raises the existing
%      singleton*.
%
%      H = CARPARKING returns the handle to a new CARPARKING or the handle to
%      the existing singleton*.
%
%      CARPARKING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CARPARKING.M with the given input arguments.
%
%      CARPARKING('Property','Value',...) creates a new CARPARKING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CarParking_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CarParking_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CarParking

% Last Modified by GUIDE v2.5 05-Jan-2020 21:17:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CarParking_OpeningFcn, ...
                   'gui_OutputFcn',  @CarParking_OutputFcn, ...
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


% --- Executes just before CarParking is made visible.
function CarParking_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CarParking (see VARARGIN)

% Choose default command line output for CarParking
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes CarParking wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = CarParking_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in togglebutton_connect.
function togglebutton_connect_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_connect
global arduino 

         try
            arduino = serial('COM1','BaudRate',115200);
            fopen(arduino);

         catch e

             arduino = serial('COM1','BaudRate',115200);
            fopen(arduino);       
         end

while get(hObject, 'Value')
    data=fscanf(arduino);
    %disp(isempty(data));
    if isempty(data)
    else
    text=data(1:5);
    
    if text=="open1"
        set(handles.text_AS1, 'BackgroundColor', [0 1 0] );
        set(handles.text_OS1, 'BackgroundColor', [1 0 0] );
    
    elseif text=="open2" 
        set(handles.text_AS2, 'BackgroundColor', [0 1 0] );
        set(handles.text_OS2, 'BackgroundColor', [1 0 0] );
    elseif text=="open3"
        set(handles.text_AS3, 'BackgroundColor', [0 1 0] );
        set(handles.text_OS3, 'BackgroundColor', [1 0 0] );
    elseif text=="open4"
        set(handles.text_AS4, 'BackgroundColor', [0 1 0] );
        set(handles.text_OS4, 'BackgroundColor', [1 0 0] );
    elseif text=="clos1"
        set(handles.text_AS1, 'BackgroundColor', [1 0 0] );
        set(handles.text_OS1, 'BackgroundColor', [0 1 0] );
    elseif text=="clos2"
        set(handles.text_AS2, 'BackgroundColor', [1 0 0] );
        set(handles.text_OS2, 'BackgroundColor', [0 1 0] );
    elseif text=="clos3"
        set(handles.text_AS3, 'BackgroundColor', [1 0 0] );
        set(handles.text_OS3, 'BackgroundColor', [0 1 0] );
    elseif text=="clos4"
        set(handles.text_AS4, 'BackgroundColor', [1 0 0] );
        set(handles.text_OS4, 'BackgroundColor', [0 1 0] );
    end
    end
    pause(0.5);
end

 fclose(arduino);
 delete(arduino);
 

