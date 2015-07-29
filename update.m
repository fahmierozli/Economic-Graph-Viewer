function varargout = update(varargin)
% UPDATE MATLAB code for update.fig
%      UPDATE, by itself, creates a new UPDATE or raises the existing
%      singleton*.
%
%      H = UPDATE returns the handle to a new UPDATE or the handle to
%      the existing singleton*.
%
%      UPDATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UPDATE.M with the given input arguments.
%
%      UPDATE('Property','Value',...) creates a new UPDATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before update_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to update_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help update

% Last Modified by GUIDE v2.5 28-Jul-2015 22:23:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @update_OpeningFcn, ...
                   'gui_OutputFcn',  @update_OutputFcn, ...
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


% --- Executes just before update is made visible.
function update_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to update (see VARARGIN)

% Choose default command line output for update
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes update wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 

% --- Outputs from this function are returned to the command line.
function varargout = update_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in performance.
function performance_Callback(hObject, eventdata, handles)
% hObject    handle to performance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 %Day=xlsread(filename,'PARAMETERS INPUT','B6:B1048576');
filename = '2013.xlsx'; 

 Day=xlsread(filename,'PARAMETERS INPUT','B5:B122');
EGT=xlsread(filename,'PARAMETERS INPUT','JV5:JV122');
 EH=xlsread(filename,'PARAMETERS INPUT','JX5:JX122');
  EC=xlsread(filename,'PARAMETERS INPUT','JZ5:JZ122');
  
  EEGT=xlsread(filename,'PARAMETERS INPUT','KB5:KB122');
 EEH=xlsread(filename,'PARAMETERS INPUT','KD5:KD122');
  EES=xlsread(filename,'PARAMETERS INPUT','KE5:KE122');
  
  EDGT=xlsread(filename,'PARAMETERS INPUT','FT5:FT122');
 EDH=xlsread(filename,'PARAMETERS INPUT','FV5:FV122');
  EDS=xlsread(filename,'PARAMETERS INPUT','FX5:FX122');

%set(handles.listbox1,'String',A);
B=[Day EGT EH EC EEGT EEH EES EDGT EDH EDS]

%graph energy efficiency
MEGT=mean(EGT)
MEH=mean(EH)
MEC=mean(EC)
y = [MEGT MEH MEC];
s=figure('name','Graph Of Energy Efficiency','Visible','off');
for i=1:length(y)
    if i==1
        colorcode = 'b';
    elseif i==2
        colorcode = 'g';
    elseif i==3
        colorcode = 'r';
    end
    bar(i, y(i),0.6, colorcode);
    hold on;
end
set(gca,'Xtick',1:3,'XTickLabel',{'GT'; 'HRSG'; 'SAC'})
title('Graph Of Energy Efficiency')
saveas(s,'GOEE','fig')
%graph ex efficiency
MEEGT=mean(EEGT)
MEEH=mean(EEH)
MEES=mean(EES)
y = [MEEGT MEEH MEES];
k=figure('name','Graph Of Exergetic efficiency','Visible','off');
for i=1:length(y)
    if i==1
        colorcode = 'b';
    elseif i==2
        colorcode = 'g';
    elseif i==3
        colorcode = 'r';
    end
    bar(i, y(i),0.6, colorcode);
    hold on;
end
set(gca,'Xtick',1:3,'XTickLabel',{'GT'; 'HRSG'; 'SAC'})
title('Graph Of Exergetic efficiency')
saveas(k,'GOEEX','fig')
%graph Exergy Destruction
MEDGT=mean(EDGT)
MEDH=mean(EDH)
MEDS=mean(EDS)
y = [MEDGT MEDH MEDS];
ed=figure('name','Graph Of Exergy Destruction','Visible','off');
for i=1:length(y)
    if i==1
        colorcode = 'b';
    elseif i==2
        colorcode = 'g';
    elseif i==3
        colorcode = 'r';
    end
    bar(i, y(i),0.6, colorcode);
    hold on;
end
set(gca,'Xtick',1:3,'XTickLabel',{'GT'; 'HRSG'; 'SAC'})
title('Graph Of Exergy Destruction')
saveas(ed,'GOED','fig')



% Create the column and row names in cell arrays 
cnames = {'Days','Efficiency of GT','Efficiency of HRSG','COP of SAC','Exergetic efficiency of GT','Exergetic efficiency of HRSG','Exergetic efficiency of SAC','Exergy Destruction of GT','Exergy Destruction of HRSG','Exergy Destruction of SAC'};
set(handles.uitable5,'visible','on');
set(handles.uitable6,'visible','off');
set(handles.pushbutton3,'visible','off');
set(handles.pushbutton7,'visible','off');
set(handles.pushbutton8,'visible','off');

set(handles.pushbutton6,'visible','on');
set(handles.pushbutton4,'visible','on');
set(handles.pushbutton5,'visible','on');

set(handles.uitable5,'data',B,'ColumnName',cnames);

% Set width and height
t.Position(30.8) = t.Extent(30.8);
t.Position(5) = t.Extent(5);

% --- Executes on button press in cost.
function cost_Callback(hObject, eventdata, handles)
% hObject    handle to cost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable5,'visible','off');
set(handles.uitable6,'visible','on');
filename = '2013.xlsx'; 
set(handles.pushbutton3,'visible','on');
set(handles.pushbutton7,'visible','on');
set(handles.pushbutton8,'visible','on');

set(handles.pushbutton6,'visible','off');
set(handles.pushbutton4,'visible','off');
set(handles.pushbutton5,'visible','off');

 Day=xlsread(filename,'PARAMETERS INPUT','B5:B122');
 ICGT=xlsread(filename,'PARAMETERS INPUT','GV5:GV122');
 ICH=xlsread(filename,'PARAMETERS INPUT','GZ5:GZ122');
 ICS=xlsread(filename,'PARAMETERS INPUT','HD5:HD122');
  
 TCOP=xlsread(filename,'PARAMETERS INPUT','GL5:GL122');
 TCCW=xlsread(filename,'PARAMETERS INPUT','GR5:GR122');
 B=[Day ICGT ICH ICS TCOP TCCW]



% Create the column and row names in cell arrays 
cnames = {'Days','Inefficiencies cost of GT','Inefficiencies cost of HRSG','Inefficiencies cost of SAC','True cost of power','True cost of chilled water'};
set(handles.uitable6,'data',B,'ColumnName',cnames);
 
%graph inefficiency cost
MICGT=mean(ICGT)
MICH=mean(ICH)
MICS=mean(ICS)
y = [MICGT MICH MICS];
f=figure('name','Graph Of Inefficiencies Cost','Visible','off');
for i=1:length(y)
    if i==1
        colorcode = 'b';
    elseif i==2
        colorcode = 'g';
    elseif i==3
        colorcode = 'r';
    end
    bar(i, y(i),0.7, colorcode);
    hold on;
end
set(gca,'Xtick',1:3,'XTickLabel',{'GT'; 'HRSG'; 'SAC'})
ylabel('aaaa')
title('Graph Of Inefficiencies Cost')
saveas(f,'GOIC','fig')

aa=figure('name','Graph Of True Cost of Power','Visible','off')
plot(Day,TCOP)
xlabel('Days')
ylabel('aaaa')
title('Graph Of True Cost of Power')
saveas(aa,'TCOP','fig')

ab=figure('name','Graph Of True Cost Chilled Water','Visible','off')
plot(Day,TCCW)
xlabel('Days')
ylabel('aaaa')
title('Graph Of True Cost Chilled Water')
saveas(ab,'TCCW','fig')

% --- Executes during object creation, after setting all properties.
function uitable5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uitable6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openfig('GOIC.fig','new','visible')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openfig('GOEE.fig','new','visible')


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openfig('GOEEX.fig','new','visible')


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openfig('GOED.fig','new','visible')


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openfig('TCOP.fig','new','visible')


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openfig('TCCW.fig','new','visible')
