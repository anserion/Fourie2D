//Copyright 2015 Andrey S. Ionisyan
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

//=====================================================================
//глобальные переменные, такие как сводный холст, слои, мышиные координаты и т.д.
//=====================================================================
unit globals_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, Graphics, img_unit, arith_complex;

var
Collection: Array of TImg; //коллекция изображений
SummaryIMG: TImg; //буфер слияния всех слоев в одно изображение
Layers: array of TImg; //слои (холсты) рисования
LayersTransparency:array of real; //прозрачность слоев(0-непрозрачно, 1- полностью прозрачно)
LayerCode: integer; //номер активного слоя рисования
MouseCoords: array of TPoint; //стек координат точек нажатия мыши
MatrixFilter_znam, //коэффициенты матричной фильтрации
MatrixFilter_k11,MatrixFilter_k12,MatrixFilter_k13,
MatrixFilter_k21,MatrixFilter_k22,MatrixFilter_k23,
MatrixFilter_k31,MatrixFilter_k32,MatrixFilter_k33:real;

procedure AddNewImageToCollection(img:TIMG); //добавление нового изображения в конец коллекции (создается новая копия изображения)
procedure RemoveImageFromCollection(img_num:integer); //удаление изображения из коллекции
procedure AddDFTtoCollection(img:TIMG); //добавление изображений (визуализаций) коэффициентов Фурье в коллекцию

implementation

//визуализация действительной части, мнимой части и модуля
//двумерного массива с комплексными данными
//(память для IMG_re,IMG_im,IMG_amp должна быть выделена заранее)
procedure ComplexMatrixToIMG(var CMatrix:TComplexMatrix;
                             var IMG_re,IMG_im,IMG_amp:TIMG);
var C,x,y,matrix_width,matrix_height:integer;
    max_re,max_im:real;
    max_amp,min_amp,k_amp:real;
    min_re,k_re, min_im,k_im:real;
begin
  matrix_height:=length(CMatrix);
  matrix_width:=length(CMatrix[0]);

  min_re:=CMatrix[0,0].re; max_re:=min_re;
  min_im:=CMatrix[0,0].im; max_im:=min_im;
  min_amp:=c_amp(CMatrix[0,0]); max_amp:=c_amp(CMatrix[0,0]);
  for y:=0 to matrix_height-1 do
  for x:=0 to matrix_width-1 do
  begin
    if CMatrix[y,x].re<min_re then min_re:=CMatrix[y,x].re;
    if CMatrix[y,x].re>max_re then max_re:=CMatrix[y,x].re;
    if CMatrix[y,x].im<min_im then min_im:=CMatrix[y,x].im;
    if CMatrix[y,x].im>max_im then max_im:=CMatrix[y,x].im;
    if c_amp(CMatrix[y,x])<min_amp then min_amp:=c_amp(CMatrix[y,x]);
    if c_amp(CMatrix[y,x])>max_amp then max_amp:=c_amp(CMatrix[y,x]);
  end;

  if min_re<>max_re then k_re:=100*255/ln(max_re-min_re+1) else k_re:=0;
  if min_im<>max_im then k_im:=100*255/ln(max_im-min_im+1) else k_im:=0;
  if min_amp<>max_amp then k_amp:=10*255/ln(max_amp-min_amp+1) else k_amp:=0;

  for y:=0 to matrix_height-1 do
  for x:=0 to matrix_width-1 do
  begin
    C:=trunc(k_re*ln(CMatrix[y,x].re-min_re+1));
    if C>=0 then IMG_re.SetPixel(x,y,RGBtoColor(C,C,C)) else IMG_re.SetPixel(x,y,255);
    C:=trunc(k_im*ln(CMatrix[y,x].im-min_im+1));
    if C>=0 then IMG_im.SetPixel(x,y,RGBtoColor(C,C,C)) else IMG_im.SetPixel(x,y,255);
    C:=trunc(k_amp*ln(c_amp(CMatrix[y,x])-min_amp+1));
    if C>=0 then IMG_amp.SetPixel(x,y,RGBtoColor(C,C,C)) else IMG_amp.SetPixel(x,y,255);
  end;
end;

//добавление нового изображения в конец коллекции (создается новая копия изображения)
procedure AddNewImageToCollection(img:TIMG);
begin
  SetLength(Collection,length(Collection)+1);
  Collection[high(Collection)]:=TIMG.Create;
  Collection[high(Collection)].SetSize(img.width,img.height);
  Collection[high(Collection)].parent_x0:=img.parent_x0;
  Collection[high(Collection)].parent_y0:=img.parent_y0;
  Collection[high(Collection)].name:=img.name;
  img.CloneToImg(Collection[high(collection)]);
  img.CloneToDFT(Collection[high(collection)]);
end;

//удаление изображения из коллекции
procedure RemoveImageFromCollection(img_num:integer);
var i:integer;
begin
  Collection[img_num].done; Collection[img_num]:=nil;
  for i:=img_num to length(Collection)-2 do Collection[i]:=Collection[i+1];
  Collection[length(Collection)-1]:=nil;
  SetLength(Collection,length(Collection)-1);
end;

//добавление изображений (визуализаций) коэффициентов Фурье в коллекцию
procedure AddDFTtoCollection(img:TIMG);
var img_re,img_im,img_amp:TIMG;
begin
  img_re:=TIMG.create; img_re.SetSize(img.DFT_width,img.DFT_height);
  img_im:=TIMG.create; img_im.SetSize(img.DFT_width,img.DFT_height);
  img_amp:=TIMG.create; img_amp.SetSize(img.DFT_width,img.DFT_height);

  ComplexMatrixToIMG(img.red_DFT_f,img_re,img_im,img_amp);
  img_re.name:='R.re'; AddNewImageToCollection(img_re);
  img_im.name:='R.im'; AddNewImageToCollection(img_im);
  img_amp.name:='R.amp'; AddNewImageToCollection(img_amp);

  ComplexMatrixToIMG(img.green_DFT_f,img_re,img_im,img_amp);
  img_re.name:='G.re'; AddNewImageToCollection(img_re);
  img_im.name:='G.im'; AddNewImageToCollection(img_im);
  img_amp.name:='G.amp'; AddNewImageToCollection(img_amp);

  ComplexMatrixToIMG(img.blue_DFT_f,img_re,img_im,img_amp);
  img_re.name:='B.re'; AddNewImageToCollection(img_re);
  img_im.name:='B.im'; AddNewImageToCollection(img_im);
  img_amp.name:='B.amp'; AddNewImageToCollection(img_amp);

  img_re.done;
  img_im.done;
  img_amp.done;
end;

end.

