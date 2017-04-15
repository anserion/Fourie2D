//Copyright 2017 Andrey S. Ionisyan (anserion@gmail.com)
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

unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls, ExtDlgs, FPCanvas, LCLintf, Grids,
  globals_unit, img_unit, arith_complex;

type
  { TForm1 }

  TForm1 = class(TForm)
    ButtonFilter: TButton;
    Edit_FilterZnam: TEdit;
    LabelMagnify: TLabel;
    LabelFIlterZnam: TLabel;
    LabelFilter: TLabel;
    LabelLayerCode: TLabel;
    LabelCollection: TLabel;
    MenuItemFourieMaskLayer0: TMenuItem;
    MenuItemFourieMaskLayer1: TMenuItem;
    MenuItemFourieMaskLayer2: TMenuItem;
    MenuItemFourieMaskLayer3: TMenuItem;
    MenuItemFourieMaskLayer4: TMenuItem;
    MenuItemImgToLayer0: TMenuItem;
    MenuItemImgToLayer1: TMenuItem;
    MenuItemImgToLayer2: TMenuItem;
    MenuItemImgToLayer3: TMenuItem;
    MenuItemImgToLayer4: TMenuItem;
    MenuItemFourieClear: TMenuItem;
    MenuItemClearLayers: TMenuItem;
    MenuItemFourieCompose: TMenuItem;
    MenuItemFourieBiasInc: TMenuItem;
    MenuItemFourieBiasDec: TMenuItem;
    MenuItemFourieIncrease: TMenuItem;
    MenuItemFourieDecrease: TMenuItem;
    MenuItemFourieToLayer3: TMenuItem;
    MenuItemFourieToLayer4: TMenuItem;
    MenuItemLayer3: TMenuItem;
    MenuItemLayer4: TMenuItem;
    MenuItemFourieNormalize: TMenuItem;
    MenuItemFourieLowPassInv: TMenuItem;
    MenuItemFourieHighPassInv: TMenuItem;
    MenuItemFourieMergeSum: TMenuItem;
    MenuItemFourieMergeSub: TMenuItem;
    MenuItemFourieLayerSqrt: TMenuItem;
    MenuItemFourieMergeMul: TMenuItem;
    MenuItemFourieMergeDiv: TMenuItem;
    MenuItemFourieToCollection: TMenuItem;
    MenuItemFourieNoise: TMenuItem;
    MenuItemFourieToLayer0: TMenuItem;
    MenuItemFourieToLayer2: TMenuItem;
    MenuItemFourieToLayer1: TMenuItem;
    MenuItemSummaryToCollection: TMenuItem;
    MenuItemFourieMergeArith: TMenuItem;
    MenuItemLayerFourieAnalysis: TMenuItem;
    MenuItemLayerTransparency0: TMenuItem;
    MenuItemLayerTransparency25: TMenuItem;
    MenuItemLayerTransparency50: TMenuItem;
    MenuItemLayerTransparency75: TMenuItem;
    MenuItemLayerTransparency100: TMenuItem;
    MenuItemLayers: TMenuItem;
    MenuItemClearLayer: TMenuItem;
    MenuItemLayer0: TMenuItem;
    MenuItemLayer1: TMenuItem;
    MenuItemLayer2: TMenuItem;
    MenuItemLayerToCollection: TMenuItem;
    MenuItemClearCollection: TMenuItem;
    MenuItemHighPassFourie: TMenuItem;
    MenuItemSaveCollection: TMenuItem;
    MenuItemLoadCollection: TMenuItem;
    MenuItemMagnify5: TMenuItem;
    MenuItemMagnify10: TMenuItem;
    MenuItemMagnify20: TMenuItem;
    MenuItemMagnify1: TMenuItem;
    MenuItemMagnify2: TMenuItem;
    MenuItemMagnify3: TMenuItem;
    ImageView: TPaintBox;
    PBoxCollection: TPaintBox;
    PanelCollection: TPanel;
    PBoxMagnify: TPaintBox;
    PanelColor: TPanel;
    LabelFileName: TLabel;
    LabelPBoxMainSize: TLabel;
    LabelMouseCoords: TLabel;
    MainMenu: TMainMenu;
    MenuItemFile: TMenuItem;
    MenuItemSummaryFourieAnalysis: TMenuItem;
    MenuItemFourieSynt: TMenuItem;
    MenuItemEdit: TMenuItem;
    MenuItemHelpUser: TMenuItem;
    MenuItemHelpProgrammer: TMenuItem;
    MenuItemHelpAbout: TMenuItem;
    MenuItemAnalysis: TMenuItem;
    MenuItemEditMagnifity: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItemHelpTeacher: TMenuItem;
    MenuItemLowPassFourie: TMenuItem;
    MenuItemFileOpen: TMenuItem;
    MenuItemFileSave: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    PanelStatus: TPanel;
    SavePictureDialog: TSavePictureDialog;
    ScrollBarCollection: TScrollBar;
    SelectDirectoryDialog: TSelectDirectoryDialog;
    SG_filter: TStringGrid;
    procedure ButtonFilterClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ImageViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImageViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageViewPaint(Sender: TObject);
    procedure MenuItemClearCollectionClick(Sender: TObject);
    procedure MenuItemClearLayerClick(Sender: TObject);
    procedure MenuItemClearLayersClick(Sender: TObject);
    procedure MenuItemFourieBiasDecClick(Sender: TObject);
    procedure MenuItemFourieBiasIncClick(Sender: TObject);
    procedure MenuItemFourieClearClick(Sender: TObject);
    procedure MenuItemFourieComposeClick(Sender: TObject);
    procedure MenuItemFourieDecreaseClick(Sender: TObject);
    procedure MenuItemFourieHighPassInvClick(Sender: TObject);
    procedure MenuItemFourieIncreaseClick(Sender: TObject);
    procedure MenuItemFourieLowPassInvClick(Sender: TObject);
    procedure MenuItemFourieMaskLayer0Click(Sender: TObject);
    procedure MenuItemFourieMaskLayer1Click(Sender: TObject);
    procedure MenuItemFourieMaskLayer2Click(Sender: TObject);
    procedure MenuItemFourieMaskLayer3Click(Sender: TObject);
    procedure MenuItemFourieMaskLayer4Click(Sender: TObject);
    procedure MenuItemFourieMergeDivClick(Sender: TObject);
    procedure MenuItemFourieLayerSqrtClick(Sender: TObject);
    procedure MenuItemFourieMergeMulClick(Sender: TObject);
    procedure MenuItemFourieMergeSubClick(Sender: TObject);
    procedure MenuItemFourieMergeSumClick(Sender: TObject);
    procedure MenuItemFourieNoiseClick(Sender: TObject);
    procedure MenuItemFourieNormalizeClick(Sender: TObject);
    procedure MenuItemFourieToCollectionClick(Sender: TObject);
    procedure MenuItemFourieToLayer0Click(Sender: TObject);
    procedure MenuItemFourieToLayer1Click(Sender: TObject);
    procedure MenuItemFourieToLayer2Click(Sender: TObject);
    procedure MenuItemFourieMergeArithClick(Sender: TObject);
    procedure MenuItemFourieToLayer3Click(Sender: TObject);
    procedure MenuItemFourieToLayer4Click(Sender: TObject);
    procedure MenuItemHighPassFourieClick(Sender: TObject);
    procedure MenuItemImgToLayer0Click(Sender: TObject);
    procedure MenuItemImgToLayer1Click(Sender: TObject);
    procedure MenuItemImgToLayer2Click(Sender: TObject);
    procedure MenuItemImgToLayer3Click(Sender: TObject);
    procedure MenuItemImgToLayer4Click(Sender: TObject);
    procedure MenuItemLayer0Click(Sender: TObject);
    procedure MenuItemLayer1Click(Sender: TObject);
    procedure MenuItemLayer2Click(Sender: TObject);
    procedure MenuItemLayer3Click(Sender: TObject);
    procedure MenuItemLayer4Click(Sender: TObject);
    procedure MenuItemLayerFourieAnalysisClick(Sender: TObject);
    procedure MenuItemLayerToCollectionClick(Sender: TObject);
    procedure MenuItemLayerTransparency0Click(Sender: TObject);
    procedure MenuItemLayerTransparency100Click(Sender: TObject);
    procedure MenuItemLayerTransparency25Click(Sender: TObject);
    procedure MenuItemLayerTransparency50Click(Sender: TObject);
    procedure MenuItemLayerTransparency75Click(Sender: TObject);
    procedure MenuItemLowPassFourieClick(Sender: TObject);
    procedure MenuItemSummaryFourieAnalysisClick(Sender: TObject);
    procedure MenuItemFourieSyntClick(Sender: TObject);
    procedure MenuItemHelpProgrammerClick(Sender: TObject);
    procedure MenuItemHelpTeacherClick(Sender: TObject);
    procedure MenuItemHelpUserClick(Sender: TObject);
    procedure MenuItemLoadCollectionClick(Sender: TObject);
    procedure MenuItemMagnify1Click(Sender: TObject);
    procedure MenuItemSaveCollectionClick(Sender: TObject);
    procedure MenuItemHelpAboutClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemFileOpenClick(Sender: TObject);
    procedure MenuItemFileSaveClick(Sender: TObject);
    procedure MenuItemSummaryToCollectionClick(Sender: TObject);
    procedure PBoxCollectionMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PBoxCollectionMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PBoxCollectionPaint(Sender: TObject);
    procedure ScrollBarCollectionChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    SummaryBitmap:TBitmap; //битмап рисования сводного изображения на PaintBox
    SummaryShiftFlag: boolean; //признак включения перемещения окна просмотра части холста
    MagnifyBitmap: TBitmap; //полотно рисования лупы для связи с PaintBox
    MagnifyIMG: TIMG; //полотно быстрого рисования лупы
    MagnifyScale: real; //коэффициент увеличения лупы
    FirstCollectionItem:integer; //номер первого отображаемого слева изображения коллекции
    procedure RefreshStatusBar; //обновить панель состояния программы
    procedure RefreshImageView; //быстрая перерисовка рабочей области программы
    procedure ComposeSummaryIMG; //вывести все слои в область вывода, с доп. информацией
    procedure DrawMagnifyBox(x,y:integer; scale_koeff:real; img:TIMG); //отрисовка пикселей лупы для заданного изображения
    procedure DrawCollectionBox; //рисование изображений коллекции
    procedure RecalcBuffers(new_width,new_height:integer); //пересоздание всех глобальных буферов под заданные размеры
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

//пересоздание всех глобальных буферов под заданные размеры
procedure TForm1.RecalcBuffers(new_width,new_height:integer);
var i:integer;
begin
  SummaryIMG.SetSize(new_width,new_height);
  for i:=0 to length(Layers)-1 do Layers[i].SetSize(new_width,new_height);
  SummaryBitmap.SetSize(new_width,new_height);
end;

//рисование изображений коллекции
procedure TForm1.DrawCollectionBox;
var i,k:integer; tmp_bitmap:TBitmap; tmp_img:TIMG;
begin
  PBoxCollection.Canvas.Clear;
  tmp_bitmap:=TBitmap.create;
  tmp_bitmap.SetSize(PBoxCollection.height,PBoxCollection.height);
  tmp_img:=TIMG.Create;
  tmp_img.SetSize(PBoxCollection.height,PBoxCollection.height);
  for i:=0 to (PBoxCollection.width div PBoxCollection.Height)-1 do
  begin
    k:=i+FirstCollectionItem;
    if k<length(Collection) then
    begin
      tmp_img.clrscr(-1);
      Collection[k].ScaleToImg(tmp_img);
      tmp_img.CloneImgToBitmap(tmp_bitmap);
      PBoxCollection.Canvas.Draw(i*PBoxCollection.height,0,tmp_bitmap);
      PBoxCollection.Canvas.TextOut(i*PBoxCollection.height,0,Collection[k].name);
    end;
  end;
  tmp_bitmap.free;
  ScrollBarCollection.Max:=length(Collection);
end;

//отрисовка пикселей лупы
procedure TForm1.DrawMagnifyBox(x,y:integer; scale_koeff:real; img:TIMG);
var src_width,src_height:integer;
    tmp_buffer:TIMG;
begin
  if scale_koeff<>0 then scale_koeff:=1/scale_koeff else scale_koeff:=0;
  src_width:=trunc(PBoxMagnify.width*scale_koeff);
  src_height:=trunc(PBoxMagnify.Height*scale_koeff);

  tmp_buffer:=TIMG.Create;
  tmp_buffer.SetSize(src_width,src_height);
  tmp_buffer.DrawFromImg(img,x-(src_width div 2),y-(src_height div 2));
  tmp_buffer.ScaleToIMG(MagnifyIMG);
  tmp_buffer.done;
  MagnifyIMG.CloneImgToBitmap(MagnifyBitmap);
  PBoxMagnify.Canvas.Draw(0,0,MagnifyBitmap);
  //выделение центрального пикселя оригинала
  //PBoxMagnify.Canvas.Pen.Color:=clBlue;
  //PBoxMagnify.Canvas.Frame((src_width div 2)-5,(src_height div 2)-5,
  //                         (src_width div 2)+5,(src_height div 2)+5);
end;

//быстрая перерисовка рабочей области программы
procedure TForm1.RefreshImageView;
begin
  ImageView.Canvas.Brush.Style:=bsSolid;
  ImageView.Canvas.Brush.Color:=clGray;
  ImageView.Canvas.FillRect(0,0,ImageView.width,SummaryIMG.parent_y0);
  ImageView.Canvas.FillRect(0,SummaryIMG.parent_y0+SummaryIMG.height,ImageView.width,ImageView.height);
  ImageView.Canvas.FillRect(0,SummaryIMG.parent_y0,SummaryIMG.parent_x0,SummaryIMG.parent_y0+SummaryIMG.height);
  ImageView.Canvas.FillRect(SummaryIMG.parent_x0+SummaryIMG.width,SummaryIMG.parent_y0,ImageView.Width,SummaryIMG.parent_y0+SummaryIMG.height);
  ImageView.Canvas.Draw(SummaryIMG.parent_x0,SummaryIMG.parent_y0,SummaryBitmap);
end;

//вывести все слои в область вывода, с доп. информацией
//например, обозначить область выделения
procedure TForm1.ComposeSummaryIMG;
begin
  FilterCompose(SummaryIMG,Layers,LayersTransparency);
  SummaryIMG.CloneImgToBitmap(SummaryBitmap);
  RefreshImageView;
end;

//обновление содержимого полей панели статуса
procedure TForm1.RefreshStatusBar;
begin
   LabelMouseCoords.caption:='Мышь: '+IntToStr(MouseCoords[0].X)+'x'+IntToStr(MouseCoords[0].Y);
   LabelPBoxMainSize.caption:='Полотно: '+IntToStr(SummaryIMG.width)+'x'+IntToStr(SummaryIMG.height);
   LabelFileName.caption:='Файл: '+Layers[LayerCode].name;
   LabelMagnify.Caption:='Лупа: x'+FloatToStr(MagnifyScale);
   LabelCollection.Caption:='Коллекция: '+IntToStr(length(Collection))+' образов';
   LabelLayerCode.caption:='Слой: '+IntToStr(LayerCode)+
       ' прозрачность: '+IntToStr(trunc(LayersTransparency[LayerCode]*100))+'%';
   MenuItemLayer0.Caption:='Слой 0 (прозр. '+IntToStr(trunc(LayersTransparency[0]*100))+'%)';
   MenuItemLayer1.Caption:='Слой 1 (прозр. '+IntToStr(trunc(LayersTransparency[1]*100))+'%)';
   MenuItemLayer2.Caption:='Слой 2 (прозр. '+IntToStr(trunc(LayersTransparency[2]*100))+'%)';
   MenuItemLayer3.Caption:='Слой 3 (прозр. '+IntToStr(trunc(LayersTransparency[3]*100))+'%)';
   MenuItemLayer4.Caption:='Слой 4 (прозр. '+IntToStr(trunc(LayersTransparency[4]*100))+'%)';
end;

//иницализация программы
procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  //активируем матрицу и знаменатель фильтра
  MatrixFilter_znam:=4;
  MatrixFilter_k11:=0/MatrixFilter_znam;
  MatrixFilter_k12:=1/MatrixFilter_znam;
  MatrixFilter_k13:=0/MatrixFilter_znam;
  MatrixFilter_k21:=1/MatrixFilter_znam;
  MatrixFilter_k22:=0/MatrixFilter_znam;
  MatrixFilter_k23:=1/MatrixFilter_znam;
  MatrixFilter_k31:=0/MatrixFilter_znam;
  MatrixFilter_k32:=1/MatrixFilter_znam;
  MatrixFilter_k33:=0/MatrixFilter_znam;

  EDIT_filterZnam.text:=IntToStr(trunc(MatrixFilter_znam));
  SG_filter.Cells[0,0]:=IntToStr(trunc(MatrixFilter_k11*MatrixFilter_znam));
  SG_filter.Cells[1,0]:=IntToStr(trunc(MatrixFilter_k12*MatrixFilter_znam));
  SG_filter.Cells[2,0]:=IntToStr(trunc(MatrixFilter_k13*MatrixFilter_znam));
  SG_filter.Cells[0,1]:=IntToStr(trunc(MatrixFilter_k21*MatrixFilter_znam));
  SG_filter.Cells[1,1]:=IntToStr(trunc(MatrixFilter_k22*MatrixFilter_znam));
  SG_filter.Cells[2,1]:=IntToStr(trunc(MatrixFilter_k23*MatrixFilter_znam));
  SG_filter.Cells[0,2]:=IntToStr(trunc(MatrixFilter_k31*MatrixFilter_znam));
  SG_filter.Cells[1,2]:=IntToStr(trunc(MatrixFilter_k32*MatrixFilter_znam));
  SG_filter.Cells[2,2]:=IntToStr(trunc(MatrixFilter_k33*MatrixFilter_znam));

  //активный слой рисования - нулевой
  LayerCode:=0;
  //создаем хранилище мышиных координат
  SetLength(MouseCoords,10);
  //инициализация коллекции образов
  SetLength(Collection,0);
  //создаем полотно лупы
  MagnifyIMG:=TIMG.create;
  MagnifyIMG.SetSize(PBoxMagnify.width,PBoxMagnify.height);
  MagnifyBitmap:=TBitmap.Create;
  MagnifyBitmap.SetSize(PBoxMagnify.width,PBoxMagnify.height);
  MagnifyScale:=1;
  //создаем холст сводного изображения
  SummaryIMG:=TImg.Create;
  SummaryIMG.SetSize(512,512);
  //создаем слои рисования и сразу их очищаем
  SetLength(Layers,5);
  for i:=0 to length(Layers)-1 do
  begin
    Layers[i]:=TImg.Create;
    Layers[i].SetSize(SummaryIMG.Width,SummaryIMG.Height);
    Layers[i].clrscr(0);
  end;
  //установка прозрачностей слоев рисования
  SetLength(LayersTransparency,length(Layers));
  //нулевой слой - непрозрачный, остальные - полностью прозрачные
  LayersTransparency[0]:=0;
  for i:=1 to length(Layers)-1 do LayersTransparency[i]:=1;
  //Создаем пустой рабочий битмап как передаточный узел между TIMG и TCanvas
  SummaryBitmap:=TBitmap.Create;
  SummaryBitmap.SetSize(SummaryIMG.width,SummaryIMG.height);
  //Загружем и прорисовываем первое изображение
  Layers[0].LoadFromFile('lenna.jpg');
  ComposeSummaryIMG;
  //обновляем содержимое панели статуса
  RefreshStatusBar;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var i:integer;
begin
  //корректно высвобождаем занятую память
  SummaryIMG.done;
  for i:=0 to length(Layers)-1 do Layers[i].done; SetLength(Layers,0);
  for i:=0 to length(Collection)-1 do Collection[i].done; SetLength(Collection,0);
  MagnifyBitmap.free;
  MagnifyIMG.done;
  SetLength(MouseCoords,0);
  SetLength(LayersTransparency,0);
  SummaryBitmap.free;
end;

procedure TForm1.ButtonFilterClick(Sender: TObject);
begin
  MatrixFilter_znam:=StrToFloat(Edit_FilterZnam.text);
  MatrixFilter_k11:=StrToFloat(SG_filter.Cells[0,0]);
  MatrixFilter_k12:=StrToFloat(SG_filter.Cells[1,0]);
  MatrixFilter_k13:=StrToFloat(SG_filter.Cells[2,0]);
  MatrixFilter_k21:=StrToFloat(SG_filter.Cells[0,1]);
  MatrixFilter_k22:=StrToFloat(SG_filter.Cells[1,1]);
  MatrixFilter_k23:=StrToFloat(SG_filter.Cells[2,1]);
  MatrixFilter_k31:=StrToFloat(SG_filter.Cells[0,2]);
  MatrixFilter_k32:=StrToFloat(SG_filter.Cells[1,2]);
  MatrixFilter_k33:=StrToFloat(SG_filter.Cells[2,2]);

  if MatrixFilter_znam<>0 then
  begin
    MatrixFilter_k11:=MatrixFilter_k11/MatrixFilter_znam;
    MatrixFilter_k12:=MatrixFilter_k12/MatrixFilter_znam;
    MatrixFilter_k13:=MatrixFilter_k13/MatrixFilter_znam;
    MatrixFilter_k21:=MatrixFilter_k21/MatrixFilter_znam;
    MatrixFilter_k22:=MatrixFilter_k22/MatrixFilter_znam;
    MatrixFilter_k23:=MatrixFilter_k23/MatrixFilter_znam;
    MatrixFilter_k31:=MatrixFilter_k31/MatrixFilter_znam;
    MatrixFilter_k32:=MatrixFilter_k32/MatrixFilter_znam;
    MatrixFilter_k33:=MatrixFilter_k33/MatrixFilter_znam;
  end;

  Layers[LayerCode].MatrixFilter(Layers[LayerCode],
    MatrixFilter_k11,MatrixFilter_k12,MatrixFilter_k13,
    MatrixFilter_k21,MatrixFilter_k22,MatrixFilter_k23,
    MatrixFilter_k31,MatrixFilter_k32,MatrixFilter_k33);

  Layers[LayerCode].name:='matrix';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

//первичное действие пользователя над окном просмотра части изображения
//нажата какая-то кнопка мыши, возможно с добавчной клавишей CTRL, ALT или SHIFT
procedure TForm1.ImageViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
begin
  SummaryShiftFlag:=false;
  //перемещаем стек координат мышиного курсора
  for i:=length(MouseCoords)-1 downto 1 do MouseCoords[i]:=MouseCoords[i-1];
  MouseCoords[0].X:=X-SummaryIMG.parent_x0;
  MouseCoords[0].Y:=Y-SummaryIMG.parent_y0;
  //ПКМ - сдвиг окна просмотра части изображения
  if (Button=mbRight)and(not(ssShift in Shift))and(not(ssCtrl in Shift)) then
      begin SummaryShiftFlag:=true; end;
end;

//отработка перемещения мышиного курсора над окном просмотра части изображения
procedure TForm1.ImageViewMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
  //заносим координаты мышиного курсора в стек координат мышиного курсора
  MouseCoords[0].X:=X-SummaryIMG.parent_x0;
  MouseCoords[0].Y:=Y-SummaryIMG.parent_y0;
  if MouseCoords[0].X<0 then MouseCoords[0].X:=0;
  if MouseCoords[0].X>=SummaryIMG.width then MouseCoords[0].X:=SummaryIMG.width-1;
  if MouseCoords[0].Y<0 then MouseCoords[0].Y:=0;
  if MouseCoords[0].Y>=SummaryIMG.height then MouseCoords[0].Y:=SummaryIMG.height-1;
  //формируем изображение лупы
  DrawMagnifyBox(X-SummaryIMG.parent_x0,Y-SummaryIMG.parent_y0,MagnifyScale,SummaryIMG);
  //если активирована функция перемещения окна просмотра, то двигаем окошком
  if SummaryShiftFlag=true then
  begin
    SummaryIMG.parent_x0:=SummaryIMG.parent_x0+MouseCoords[0].X-MouseCoords[1].X;
    SummaryIMG.parent_y0:=SummaryIMG.parent_y0+MouseCoords[0].Y-MouseCoords[1].Y;
    RefreshImageView;
  end;
  //обновляем строку статуса
  RefreshStatusBar;
end;

//завершающая фаза процесса рисования в окне просмотра части изображения
procedure TForm1.ImageViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ComposeSummaryIMG;
  RefreshStatusBar;
  SummaryShiftFlag:=false;
end;

//процедура обновления содержимого полотна рисования
procedure TForm1.ImageViewPaint(Sender: TObject);
begin ComposeSummaryIMG; end;

//очистка коллекции
procedure TForm1.MenuItemClearCollectionClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to length(Collection)-1 do
  begin
    if Collection[i]<>nil then Collection[i].done;
    collection[i]:=nil;
  end;
  SetLength(Collection,0);
  DrawCollectionBox;
end;

procedure TForm1.MenuItemClearLayerClick(Sender: TObject);
begin
  Layers[LayerCode].clrscr(0);
  Layers[LayerCode].name:='';
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemClearLayersClick(Sender: TObject);
var i,x,y:integer;
begin
  for i:=0 to length(Layers)-1 do
  begin
    Layers[i].clrscr(0);
    Layers[i].name:='';
    Layers[i].clrDFT(c_zero);
  end;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieClearClick(Sender: TObject);
begin Layers[LayerCode].clrDFT(c_zero); end;

procedure TForm1.MenuItemFourieBiasDecClick(Sender: TObject);
var x,y:integer; B:TComplex;
begin
  B.re:=StrToFloat(InputBox('Уменьшение коэффициентов на B','B.re=','0'));
  B.im:=StrToFloat(InputBox('Уменьшение коэффициентов на B','B.im=','0'));
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      Layers[LayerCode].red_DFT_f[y,x]:=c_sub(Layers[LayerCode].red_DFT_f[y,x],B);
      Layers[LayerCode].green_DFT_f[y,x]:=c_sub(Layers[LayerCode].green_DFT_f[y,x],B);
      Layers[LayerCode].blue_DFT_f[y,x]:=c_sub(Layers[LayerCode].blue_DFT_f[y,x],B);
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='shift';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieBiasIncClick(Sender: TObject);
var x,y:integer; B:TComplex;
begin
  B.re:=StrToFloat(InputBox('Увеличение коэффициентов на B','B.re=','0'));
  B.im:=StrToFloat(InputBox('Увеличение коэффициентов на B','B.im=','0'));
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      Layers[LayerCode].red_DFT_f[y,x]:=c_add(Layers[LayerCode].red_DFT_f[y,x],B);
      Layers[LayerCode].green_DFT_f[y,x]:=c_add(Layers[LayerCode].green_DFT_f[y,x],B);
      Layers[LayerCode].blue_DFT_f[y,x]:=c_add(Layers[LayerCode].blue_DFT_f[y,x],B);
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='shift';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieDecreaseClick(Sender: TObject);
var x,y:integer; k:real;
begin
  k:=StrToFloat(InputBox('Ослабление коэффициентов в k раз','k=','1'));
  if k<>0 then
  begin
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      Layers[LayerCode].red_DFT_f[y,x].re:=Layers[LayerCode].red_DFT_f[y,x].re/k;
      Layers[LayerCode].red_DFT_f[y,x].im:=Layers[LayerCode].red_DFT_f[y,x].im/k;
      Layers[LayerCode].green_DFT_f[y,x].re:=Layers[LayerCode].green_DFT_f[y,x].re/k;
      Layers[LayerCode].green_DFT_f[y,x].im:=Layers[LayerCode].green_DFT_f[y,x].im/k;
      Layers[LayerCode].blue_DFT_f[y,x].re:=Layers[LayerCode].blue_DFT_f[y,x].re/k;
      Layers[LayerCode].blue_DFT_f[y,x].im:=Layers[LayerCode].blue_DFT_f[y,x].im/k;
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='amp/'+FloatToStr(k);
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
  end;
end;

procedure TForm1.MenuItemFourieIncreaseClick(Sender: TObject);
var x,y:integer; k:real;
begin
  k:=StrToFloat(InputBox('усиление коэффициентов в k раз','k=','1'));
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      Layers[LayerCode].red_DFT_f[y,x].re:=Layers[LayerCode].red_DFT_f[y,x].re*k;
      Layers[LayerCode].red_DFT_f[y,x].im:=Layers[LayerCode].red_DFT_f[y,x].im*k;
      Layers[LayerCode].green_DFT_f[y,x].re:=Layers[LayerCode].green_DFT_f[y,x].re*k;
      Layers[LayerCode].green_DFT_f[y,x].im:=Layers[LayerCode].green_DFT_f[y,x].im*k;
      Layers[LayerCode].blue_DFT_f[y,x].re:=Layers[LayerCode].blue_DFT_f[y,x].re*k;
      Layers[LayerCode].blue_DFT_f[y,x].im:=Layers[LayerCode].blue_DFT_f[y,x].im*k;
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='amp*'+FloatToStr(k);
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMergeArithClick(Sender: TObject);
var x,y:integer;
begin
  for y:=0 to Layers[0].DFT_height-1 do
    for x:=0 to Layers[0].DFT_width-1 do
    begin
      Layers[0].red_DFT_f[y,x].re:=(Layers[1].red_DFT_f[y,x].re+Layers[2].red_DFT_f[y,x].re)/2;
      Layers[0].red_DFT_f[y,x].im:=(Layers[1].red_DFT_f[y,x].im+Layers[2].red_DFT_f[y,x].im)/2;
      Layers[0].green_DFT_f[y,x].re:=(Layers[1].green_DFT_f[y,x].re+Layers[2].green_DFT_f[y,x].re)/2;
      Layers[0].green_DFT_f[y,x].im:=(Layers[1].green_DFT_f[y,x].im+Layers[2].green_DFT_f[y,x].im)/2;
      Layers[0].blue_DFT_f[y,x].re:=(Layers[1].blue_DFT_f[y,x].re+Layers[2].blue_DFT_f[y,x].re)/2;
      Layers[0].blue_DFT_f[y,x].im:=(Layers[1].blue_DFT_f[y,x].im+Layers[2].blue_DFT_f[y,x].im)/2;
    end;
  Layers[0].ImgFromDFT;
  Layers[0].name:='M_arith';
  AddNewImageToCollection(Layers[0]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieComposeClick(Sender: TObject);
var x,y:integer; tmp_img:TIMG;
begin
  tmp_IMG:=TIMG.create;
  tmp_img.SetSize(Layers[0].width*2,Layers[0].height*2);
  tmp_img.clrDFT(c_zero);
  Layers[0].clrDFT(c_zero);

  for y:=0 to Layers[0].dft_height-1 do
    for x:=0 to Layers[0].dft_width-1 do
    begin
      tmp_img.red_DFT_f[y,x]:=Layers[1].red_DFT_f[y,x];
      tmp_img.green_DFT_f[y,x]:=Layers[1].green_DFT_f[y,x];
      tmp_img.blue_DFT_f[y,x]:=Layers[1].blue_DFT_f[y,x];

      tmp_img.red_DFT_f[y,x+Layers[0].dft_width]:=Layers[2].red_DFT_f[y,x];
      tmp_img.green_DFT_f[y,x+Layers[0].dft_width]:=Layers[2].green_DFT_f[y,x];
      tmp_img.blue_DFT_f[y,x+Layers[0].dft_width]:=Layers[2].blue_DFT_f[y,x];

      tmp_img.red_DFT_f[y+Layers[0].dft_height,x]:=Layers[3].red_DFT_f[y,x];
      tmp_img.green_DFT_f[y+Layers[0].dft_height,x]:=Layers[3].green_DFT_f[y,x];
      tmp_img.blue_DFT_f[y+Layers[0].dft_height,x]:=Layers[3].blue_DFT_f[y,x];

      tmp_img.red_DFT_f[y+Layers[0].dft_height,x+Layers[0].dft_width]:=Layers[4].red_DFT_f[y,x];
      tmp_img.green_DFT_f[y+Layers[0].dft_height,x+Layers[0].dft_width]:=Layers[4].green_DFT_f[y,x];
      tmp_img.blue_DFT_f[y+Layers[0].dft_height,x+Layers[0].dft_width]:=Layers[4].blue_DFT_f[y,x];
    end;

  for y:=0 to tmp_img.dft_height-1 do
    for x:=0 to tmp_img.dft_width-1 do
    begin
      tmp_img.red_DFT_f[y,x].re:=tmp_img.red_DFT_f[y,x].re*0.25;
      tmp_img.red_DFT_f[y,x].im:=tmp_img.red_DFT_f[y,x].im*0.25;
      tmp_img.green_DFT_f[y,x].re:=tmp_img.green_DFT_f[y,x].re*0.25;
      tmp_img.green_DFT_f[y,x].im:=tmp_img.green_DFT_f[y,x].im*0.25;
      tmp_img.blue_DFT_f[y,x].re:=tmp_img.blue_DFT_f[y,x].re*0.25;
      tmp_img.blue_DFT_f[y,x].im:=tmp_img.blue_DFT_f[y,x].im*0.25;
    end;

  tmp_img.ImgFromDFT;

  Layers[0].DrawFromImg(tmp_img,0,0);
  Layers[0].name:='big_LT';
  AddNewImageToCollection(Layers[0]);

  Layers[0].DrawFromImg(tmp_img,Layers[0].width,0);
  Layers[0].name:='big_RT';
  AddNewImageToCollection(Layers[0]);

  Layers[0].DrawFromImg(tmp_img,0,Layers[0].height);
  Layers[0].name:='big_LD';
  AddNewImageToCollection(Layers[0]);

  Layers[0].DrawFromImg(tmp_img,Layers[0].width,Layers[0].height);
  Layers[0].name:='big_RD';
  AddNewImageToCollection(Layers[0]);

  tmp_img.ScaleToImg(Layers[0]);
  tmp_IMG.done;

  Layers[0].name:='restore';
  AddNewImageToCollection(Layers[0]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieHighPassInvClick(Sender: TObject);
var y,x,HP_DFT_r:integer;
begin
  HP_DFT_r:=StrToInt(InputBox('инверсный ВЧ-фильтр','Радиус круга ВЧ-коэффициентов Фурье',
                     IntToStr(Layers[LayerCode].DFT_width div 2)));

  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
        if sqr(x-(Layers[LayerCode].DFT_width div 2))+
           sqr(y-(Layers[LayerCode].DFT_height div 2)) <= sqr(HP_DFT_r) then
        begin
          Layers[LayerCode].red_dft_f[y,x]:=c_zero;
          Layers[LayerCode].green_dft_f[y,x]:=c_zero;
          Layers[LayerCode].blue_dft_f[y,x]:=c_zero;
        end;

  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='IHP_filter';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

//Высокочастотный фильтр (оставить высокочастотные коэффициенты ДПФ-матрицы)
procedure TForm1.MenuItemHighPassFourieClick(Sender: TObject);
var y,x,HP_DFT_r:integer;
begin
  HP_DFT_r:=StrToInt(InputBox('ВЧ-фильтр','Радиус круга ВЧ-коэффициентов Фурье',
                     IntToStr(Layers[LayerCode].DFT_width div 2)));

  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
        if sqr(x-(Layers[LayerCode].DFT_width div 2))+
           sqr(y-(Layers[LayerCode].DFT_height div 2)) >= sqr(HP_DFT_r) then
        begin
          Layers[LayerCode].red_dft_f[y,x]:=c_zero;
          Layers[LayerCode].green_dft_f[y,x]:=c_zero;
          Layers[LayerCode].blue_dft_f[y,x]:=c_zero;
        end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='HP_filter';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieLowPassInvClick(Sender: TObject);
var y,x,LP_DFT_r:integer;
begin
  LP_DFT_r:=StrToInt(InputBox('инверсный НЧ-фильтр','Радиус круга НЧ-коэффициентов Фурье',
                     IntToStr(Layers[LayerCode].DFT_width div 2)));

  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
        if (sqr(x)+sqr(y) <= sqr(LP_DFT_r)) or
           (sqr(x)+sqr(Layers[LayerCode].DFT_height-1-y) <= sqr(LP_DFT_r)) or
           (sqr(Layers[LayerCode].DFT_width-1-x)+sqr(y) <= sqr(LP_DFT_r)) or
           (sqr(Layers[LayerCode].DFT_width-1-x)+
            sqr(Layers[LayerCode].DFT_height-1-y) <= sqr(LP_DFT_r)) then
        begin
          Layers[LayerCode].red_dft_f[y,x]:=c_zero;
          Layers[LayerCode].green_dft_f[y,x]:=c_zero;
          Layers[LayerCode].blue_dft_f[y,x]:=c_zero;
        end;
    end;

  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='ILP_filter';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

//Низкочастотный фильтр (оставить низкочастотные коэффициенты ДПФ-матрицы)
procedure TForm1.MenuItemLowPassFourieClick(Sender: TObject);
var y,x,LP_DFT_r:integer;
begin
  LP_DFT_r:=StrToInt(InputBox('НЧ-фильтр','Радиус круга НЧ-коэффициентов Фурье',
                     IntToStr(Layers[LayerCode].DFT_width div 2)));

  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
        if (sqr(x)+sqr(y) >= sqr(LP_DFT_r)) and
           (sqr(x)+sqr(Layers[LayerCode].DFT_height-1-y) >= sqr(LP_DFT_r)) and
           (sqr(Layers[LayerCode].DFT_width-1-x)+sqr(y) >= sqr(LP_DFT_r)) and
           (sqr(Layers[LayerCode].DFT_width-1-x)+
            sqr(Layers[LayerCode].DFT_height-1-y) >= sqr(LP_DFT_r)) then
        begin
          Layers[LayerCode].red_dft_f[y,x]:=c_zero;
          Layers[LayerCode].green_dft_f[y,x]:=c_zero;
          Layers[LayerCode].blue_dft_f[y,x]:=c_zero;
        end;
    end;

  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='LP_filter';
  AddNewImageToCollection(Layers[LayerCode]);
  ComposeSummaryIMG;
  DrawCollectionBox;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMaskLayer0Click(Sender: TObject);
var x,y:integer; C:INT32; k:real;
begin
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      C:=Layers[0].GetPixel(x,y);
      k:=red(C)/255.0;
      Layers[LayerCode].red_DFT_f[y,x].re:=Layers[LayerCode].red_DFT_f[y,x].re*k;
      Layers[LayerCode].red_DFT_f[y,x].im:=Layers[LayerCode].red_DFT_f[y,x].im*k;
      k:=green(C)/255.0;
      Layers[LayerCode].green_DFT_f[y,x].re:=Layers[LayerCode].green_DFT_f[y,x].re*k;
      Layers[LayerCode].green_DFT_f[y,x].im:=Layers[LayerCode].green_DFT_f[y,x].im*k;
      k:=blue(C)/255.0;
      Layers[LayerCode].blue_DFT_f[y,x].re:=Layers[LayerCode].blue_DFT_f[y,x].re*k;
      Layers[LayerCode].blue_DFT_f[y,x].im:=Layers[LayerCode].blue_DFT_f[y,x].im*k;
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='mask_0';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMaskLayer1Click(Sender: TObject);
var x,y:integer; C:INT32; k:real;
begin
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      C:=Layers[1].GetPixel(x,y);
      k:=red(C)/255.0;
      Layers[LayerCode].red_DFT_f[y,x].re:=Layers[LayerCode].red_DFT_f[y,x].re*k;
      Layers[LayerCode].red_DFT_f[y,x].im:=Layers[LayerCode].red_DFT_f[y,x].im*k;
      k:=green(C)/255.0;
      Layers[LayerCode].green_DFT_f[y,x].re:=Layers[LayerCode].green_DFT_f[y,x].re*k;
      Layers[LayerCode].green_DFT_f[y,x].im:=Layers[LayerCode].green_DFT_f[y,x].im*k;
      k:=blue(C)/255.0;
      Layers[LayerCode].blue_DFT_f[y,x].re:=Layers[LayerCode].blue_DFT_f[y,x].re*k;
      Layers[LayerCode].blue_DFT_f[y,x].im:=Layers[LayerCode].blue_DFT_f[y,x].im*k;
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='mask_0';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMaskLayer2Click(Sender: TObject);
var x,y:integer; C:INT32; k:real;
begin
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      C:=Layers[2].GetPixel(x,y);
      k:=red(C)/255.0;
      Layers[LayerCode].red_DFT_f[y,x].re:=Layers[LayerCode].red_DFT_f[y,x].re*k;
      Layers[LayerCode].red_DFT_f[y,x].im:=Layers[LayerCode].red_DFT_f[y,x].im*k;
      k:=green(C)/255.0;
      Layers[LayerCode].green_DFT_f[y,x].re:=Layers[LayerCode].green_DFT_f[y,x].re*k;
      Layers[LayerCode].green_DFT_f[y,x].im:=Layers[LayerCode].green_DFT_f[y,x].im*k;
      k:=blue(C)/255.0;
      Layers[LayerCode].blue_DFT_f[y,x].re:=Layers[LayerCode].blue_DFT_f[y,x].re*k;
      Layers[LayerCode].blue_DFT_f[y,x].im:=Layers[LayerCode].blue_DFT_f[y,x].im*k;
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='mask_0';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMaskLayer3Click(Sender: TObject);
var x,y:integer; C:INT32; k:real;
begin
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      C:=Layers[3].GetPixel(x,y);
      k:=red(C)/255.0;
      Layers[LayerCode].red_DFT_f[y,x].re:=Layers[LayerCode].red_DFT_f[y,x].re*k;
      Layers[LayerCode].red_DFT_f[y,x].im:=Layers[LayerCode].red_DFT_f[y,x].im*k;
      k:=green(C)/255.0;
      Layers[LayerCode].green_DFT_f[y,x].re:=Layers[LayerCode].green_DFT_f[y,x].re*k;
      Layers[LayerCode].green_DFT_f[y,x].im:=Layers[LayerCode].green_DFT_f[y,x].im*k;
      k:=blue(C)/255.0;
      Layers[LayerCode].blue_DFT_f[y,x].re:=Layers[LayerCode].blue_DFT_f[y,x].re*k;
      Layers[LayerCode].blue_DFT_f[y,x].im:=Layers[LayerCode].blue_DFT_f[y,x].im*k;
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='mask_0';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMaskLayer4Click(Sender: TObject);
var x,y:integer; C:INT32; k:real;
begin
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
      C:=Layers[4].GetPixel(x,y);
      k:=red(C)/255.0;
      Layers[LayerCode].red_DFT_f[y,x].re:=Layers[LayerCode].red_DFT_f[y,x].re*k;
      Layers[LayerCode].red_DFT_f[y,x].im:=Layers[LayerCode].red_DFT_f[y,x].im*k;
      k:=green(C)/255.0;
      Layers[LayerCode].green_DFT_f[y,x].re:=Layers[LayerCode].green_DFT_f[y,x].re*k;
      Layers[LayerCode].green_DFT_f[y,x].im:=Layers[LayerCode].green_DFT_f[y,x].im*k;
      k:=blue(C)/255.0;
      Layers[LayerCode].blue_DFT_f[y,x].re:=Layers[LayerCode].blue_DFT_f[y,x].re*k;
      Layers[LayerCode].blue_DFT_f[y,x].im:=Layers[LayerCode].blue_DFT_f[y,x].im*k;
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='mask_0';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMergeDivClick(Sender: TObject);
var x,y:integer;
begin
  for y:=0 to Layers[0].DFT_height-1 do
    for x:=0 to Layers[0].DFT_width-1 do
    begin
      if c_amp(Layers[2].red_DFT_f[y,x])<>0 then
         Layers[0].red_DFT_f[y,x]:=c_div(Layers[1].red_DFT_f[y,x],Layers[2].red_DFT_f[y,x])
         else Layers[0].red_DFT_f[y,x]:=c_zero;
      if c_amp(Layers[2].green_DFT_f[y,x])<>0 then
         Layers[0].green_DFT_f[y,x]:=c_div(Layers[1].green_DFT_f[y,x],Layers[2].green_DFT_f[y,x])
         else Layers[0].green_DFT_f[y,x]:=c_zero;
      if c_amp(Layers[2].blue_DFT_f[y,x])<>0 then
         Layers[0].blue_DFT_f[y,x]:=c_div(Layers[1].blue_DFT_f[y,x],Layers[2].blue_DFT_f[y,x])
         else Layers[0].blue_DFT_f[y,x]:=c_zero;
    end;
  Layers[0].ImgFromDFT;
  Layers[0].name:='M_div';
  AddNewImageToCollection(Layers[0]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieLayerSqrtClick(Sender: TObject);
var x,y:integer;
begin
  for y:=0 to Layers[0].DFT_height-1 do
    for x:=0 to Layers[0].DFT_width-1 do
    begin
      c_sqrt(Layers[0].red_DFT_f[y,x],Layers[1].red_DFT_f[y,x],Layers[2].red_DFT_f[y,x]);
      c_sqrt(Layers[0].green_DFT_f[y,x],Layers[1].green_DFT_f[y,x],Layers[2].green_DFT_f[y,x]);
      c_sqrt(Layers[0].blue_DFT_f[y,x],Layers[1].blue_DFT_f[y,x],Layers[2].blue_DFT_f[y,x]);
    end;
  Layers[1].ImgFromDFT;
  Layers[1].name:='sqrt_1';
  AddNewImageToCollection(Layers[1]);
  Layers[2].ImgFromDFT;
  Layers[2].name:='sqrt_2';
  AddNewImageToCollection(Layers[2]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMergeMulClick(Sender: TObject);
var x,y:integer;
begin
  for y:=0 to Layers[0].DFT_height-1 do
    for x:=0 to Layers[0].DFT_width-1 do
    begin
      Layers[0].red_DFT_f[y,x]:=c_mul(Layers[1].red_DFT_f[y,x],Layers[2].red_DFT_f[y,x]);
      Layers[0].green_DFT_f[y,x]:=c_mul(Layers[1].green_DFT_f[y,x],Layers[2].green_DFT_f[y,x]);
      Layers[0].blue_DFT_f[y,x]:=c_mul(Layers[1].blue_DFT_f[y,x],Layers[2].blue_DFT_f[y,x]);
    end;
  Layers[0].ImgFromDFT;
  Layers[0].name:='M_mul';
  AddNewImageToCollection(Layers[0]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMergeSubClick(Sender: TObject);
var x,y:integer;
begin
  for y:=0 to Layers[0].DFT_height-1 do
    for x:=0 to Layers[0].DFT_width-1 do
    begin
      Layers[0].red_DFT_f[y,x]:=c_sub(Layers[1].red_DFT_f[y,x],Layers[2].red_DFT_f[y,x]);
      Layers[0].green_DFT_f[y,x]:=c_sub(Layers[1].green_DFT_f[y,x],Layers[2].green_DFT_f[y,x]);
      Layers[0].blue_DFT_f[y,x]:=c_sub(Layers[1].blue_DFT_f[y,x],Layers[2].blue_DFT_f[y,x]);
    end;
  Layers[0].ImgFromDFT;
  Layers[0].name:='M_sub';
  AddNewImageToCollection(Layers[0]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieMergeSumClick(Sender: TObject);
var x,y:integer;
begin
  for y:=0 to Layers[0].DFT_height-1 do
    for x:=0 to Layers[0].DFT_width-1 do
    begin
      Layers[0].red_DFT_f[y,x]:=c_add(Layers[1].red_DFT_f[y,x],Layers[2].red_DFT_f[y,x]);
      Layers[0].green_DFT_f[y,x]:=c_add(Layers[1].green_DFT_f[y,x],Layers[2].green_DFT_f[y,x]);
      Layers[0].blue_DFT_f[y,x]:=c_add(Layers[1].blue_DFT_f[y,x],Layers[2].blue_DFT_f[y,x]);
    end;
  Layers[0].ImgFromDFT;
  Layers[0].name:='M_add';
  AddNewImageToCollection(Layers[0]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieNoiseClick(Sender: TObject);
var i,x,y,percent_of_noise,n:integer;
begin
  percent_of_noise:=StrToInt(InputBox('зашумление','Процент/1000 зашумления ДПФ-матрицы','1'));
  n:=trunc(Layers[LayerCode].DFT_width*Layers[LayerCode].DFT_height*(percent_of_noise/100000));
  for i:=1 to n do
  begin
    x:=random(Layers[LayerCode].DFT_width);
    y:=random(Layers[LayerCode].DFT_height);
    Layers[LayerCode].red_DFT_f[y,x].re:=random;
    Layers[LayerCode].red_DFT_f[y,x].im:=random;
    Layers[LayerCode].green_DFT_f[y,x].re:=random;
    Layers[LayerCode].green_DFT_f[y,x].im:=random;
    Layers[LayerCode].blue_DFT_f[y,x].re:=random;
    Layers[LayerCode].blue_DFT_f[y,x].im:=random;
  end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='Fog'+IntToStr(percent_of_noise);
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieNormalizeClick(Sender: TObject);
var x,y:integer; red_amp,green_amp,blue_amp:real;
begin
  for y:=0 to Layers[LayerCode].DFT_height-1 do
    for x:=0 to Layers[LayerCode].DFT_width-1 do
    begin
         red_amp:=c_amp(Layers[LayerCode].red_DFT_f[y,x]);
         if red_amp<>0 then
         begin
           Layers[LayerCode].red_DFT_f[y,x].re:=Layers[LayerCode].red_DFT_f[y,x].re/red_amp;
           Layers[LayerCode].red_DFT_f[y,x].im:=Layers[LayerCode].red_DFT_f[y,x].im/red_amp;
         end;
         green_amp:=c_amp(Layers[LayerCode].green_DFT_f[y,x]);
         if green_amp<>0 then
         begin
           Layers[LayerCode].green_DFT_f[y,x].re:=Layers[LayerCode].green_DFT_f[y,x].re/green_amp;
           Layers[LayerCode].green_DFT_f[y,x].im:=Layers[LayerCode].green_DFT_f[y,x].im/green_amp;
         end;
         blue_amp:=c_amp(Layers[LayerCode].blue_DFT_f[y,x]);
         if blue_amp<>0 then
         begin
           Layers[LayerCode].blue_DFT_f[y,x].re:=Layers[LayerCode].blue_DFT_f[y,x].re/blue_amp;
           Layers[LayerCode].blue_DFT_f[y,x].im:=Layers[LayerCode].blue_DFT_f[y,x].im/blue_amp;
         end;
    end;
  Layers[LayerCode].ImgFromDFT;
  Layers[LayerCode].name:='Norm';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemFourieToCollectionClick(Sender: TObject);
begin
  AddDFTtoCollection(Layers[LayerCode]);
  DrawCollectionBox;
end;

procedure TForm1.MenuItemFourieToLayer0Click(Sender: TObject);
begin Layers[LayerCode].CloneToDFT(Layers[0]); end;

procedure TForm1.MenuItemFourieToLayer1Click(Sender: TObject);
begin Layers[LayerCode].CloneToDFT(Layers[1]); end;

procedure TForm1.MenuItemFourieToLayer2Click(Sender: TObject);
begin Layers[LayerCode].CloneToDFT(Layers[2]); end;

procedure TForm1.MenuItemFourieToLayer3Click(Sender: TObject);
begin Layers[LayerCode].CloneToDFT(Layers[3]); end;

procedure TForm1.MenuItemFourieToLayer4Click(Sender: TObject);
begin Layers[LayerCode].CloneToDFT(Layers[4]); end;

procedure TForm1.MenuItemImgToLayer0Click(Sender: TObject);
begin
  Layers[LayerCode].CloneToImg(Layers[0]);
  Layers[0].name:=Layers[LayerCode].name;
  ComposeSummaryIMG;
end;

procedure TForm1.MenuItemImgToLayer1Click(Sender: TObject);
begin
  Layers[LayerCode].CloneToImg(Layers[1]);
  Layers[1].name:=Layers[LayerCode].name;
  ComposeSummaryIMG;
end;

procedure TForm1.MenuItemImgToLayer2Click(Sender: TObject);
begin
  Layers[LayerCode].CloneToImg(Layers[2]);
  Layers[2].name:=Layers[LayerCode].name;
  ComposeSummaryIMG;
end;

procedure TForm1.MenuItemImgToLayer3Click(Sender: TObject);
begin
  Layers[LayerCode].CloneToImg(Layers[3]);
  Layers[3].name:=Layers[LayerCode].name;
  ComposeSummaryIMG;
end;

procedure TForm1.MenuItemImgToLayer4Click(Sender: TObject);
begin
  Layers[LayerCode].CloneToImg(Layers[4]);
  Layers[4].name:=Layers[LayerCode].name;
  ComposeSummaryIMG;
end;

procedure TForm1.MenuItemLayer0Click(Sender: TObject);
begin LayerCode:=0; RefreshStatusBar; end;

procedure TForm1.MenuItemLayer1Click(Sender: TObject);
begin LayerCode:=1; RefreshStatusBar; end;

procedure TForm1.MenuItemLayer2Click(Sender: TObject);
begin LayerCode:=2; RefreshStatusBar; end;

procedure TForm1.MenuItemLayer3Click(Sender: TObject);
begin LayerCode:=3; RefreshStatusBar; end;

procedure TForm1.MenuItemLayer4Click(Sender: TObject);
begin LayerCode:=4; RefreshStatusBar; end;

procedure TForm1.MenuItemLayerFourieAnalysisClick(Sender: TObject);
begin
  Layers[LayerCode].IMGToDFT;
  Layers[LayerCode].Name:='Fourie';
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemLayerToCollectionClick(Sender: TObject);
begin
  AddNewImageToCollection(Layers[LayerCode]);
  DrawCollectionBox;
end;

procedure TForm1.MenuItemLayerTransparency0Click(Sender: TObject);
begin
  LayersTransparency[LayerCode]:=0;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemLayerTransparency25Click(Sender: TObject);
begin
  LayersTransparency[LayerCode]:=0.25;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemLayerTransparency50Click(Sender: TObject);
begin
  LayersTransparency[LayerCode]:=0.5;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemLayerTransparency75Click(Sender: TObject);
begin
  LayersTransparency[LayerCode]:=0.75;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

procedure TForm1.MenuItemLayerTransparency100Click(Sender: TObject);
begin
  LayersTransparency[LayerCode]:=1;
  ComposeSummaryIMG;
  RefreshStatusBar;
end;

//выбор типа лупы
procedure TForm1.MenuItemMagnify1Click(Sender: TObject);
begin
  MagnifyScale:=(sender as TMenuItem).tag;
end;

//фурье-анализ сводного изображения
procedure TForm1.MenuItemSummaryFourieAnalysisClick(Sender: TObject);
begin
  SummaryIMG.IMGToDFT;
  SummaryIMG.Name:='Fourie';
  AddNewImageToCollection(SummaryIMG);
  DrawCollectionBox;
  RefreshStatusBar;
end;

//фурье-синтез по коэффициентам теущего слоя
procedure TForm1.MenuItemFourieSyntClick(Sender: TObject);
begin
    Layers[LayerCode].ImgFromDFT;
    Layers[LayerCode].name:='Syntes';
    AddNewImageToCollection(Layers[LayerCode]);
    ComposeSummaryIMG;
    DrawCollectionBox;
    RefreshStatusBar;
end;

//руководство программиста
procedure TForm1.MenuItemHelpProgrammerClick(Sender: TObject);
begin
MessageBox(0,'Руководство программиста в разработке','Руководство программиста',0);
end;

//методические рекомендации
procedure TForm1.MenuItemHelpTeacherClick(Sender: TObject);
begin
MessageBox(0,'Методические рекомендации в разработке','Методические рекомендации',0);
end;

//Руководство пользователя
procedure TForm1.MenuItemHelpUserClick(Sender: TObject);
begin
MessageBox(0,'Руководство пользователя в разработке','Руководство пользователя',0);
end;

//подпрограмма вывода окна сведений о программе
procedure TForm1.MenuItemHelpAboutClick(Sender: TObject);
begin
  MessageBox(0,
             'Исследование двумерного преобразования Фурье'+chr(13)+
             ' '+chr(13)+
             'Условия распространения и использования:'+chr(13)+
             'свободное программное обеспечение'+chr(13)+
             '(Apache-2.0 лицензия)'+chr(13)+
             ' '+chr(13)+
             'автор: к.ф.-м.н. Ионисян А.С.'
             ,'О программе',0);
end;

//загрузить "много" изображений в коллекцию
procedure TForm1.MenuItemLoadCollectionClick(Sender: TObject);
var i:integer; img:TIMG;
begin
  If OpenPictureDialog.execute then
  begin
    img:=TImg.Create;
    for i:=0 to OpenPictureDialog.Files.Count-1 do
    begin
       img.LoadFromFile(OpenPictureDialog.Files.Strings[i]);
       img.name:=ExtractFileName(OpenPictureDialog.Files.Strings[i]);
       img.parent_x0:=0; img.parent_y0:=0;
       AddNewImageToCollection(img);
    end;
    img.done;
    DrawCollectionBox;
    RefreshStatusBar;
  end;
end;

//сохранение коллекции
procedure TForm1.MenuItemSaveCollectionClick(Sender: TObject);
var i:integer;
begin
  if SelectDirectoryDialog.execute then
  for i:=0 to length(Collection)-1 do
    Collection[i].SaveToFile(SelectDirectoryDialog.FileName+PathDelim+Collection[i].name+'.jpg');
end;

//подпрограмма выбора и загрузки внешнего графического файла в активный слой рисования
procedure TForm1.MenuItemFileOpenClick(Sender: TObject);
var x,y:integer; tmp_IMG:TIMG;
begin
  if OpenPictureDialog.Execute then
  begin
       tmp_IMG:=TIMG.Create;
       tmp_IMG.LoadFromFile(OpenPictureDialog.filename);
       //RecalcBuffers(tmp_IMG.width,tmp_IMG.height);
       //tmp_IMG.DrawToIMG(Layers[LayerCode],0,0);
       tmp_IMG.ScaleToImg(Layers[LayerCode]);
       for y:=0 to Layers[LayerCode].DFT_height-1 do
         for x:=0 to Layers[LayerCode].DFT_width-1 do
         begin
           Layers[LayerCode].red_dft_f[y,x]:=c_zero;
           Layers[LayerCode].green_dft_f[y,x]:=c_zero;
           Layers[LayerCode].blue_dft_f[y,x]:=c_zero;
         end;
       tmp_IMG.done;
       Layers[LayerCode].name:=ExtractFileName(OpenPictureDialog.FileName);
       AddNewImageToCollection(Layers[LayerCode]);
       DrawCollectionBox;
       ComposeSummaryIMG;
       RefreshStatusBar;
  end;
end;

//подпрограмма сохранения сводного изображения во внешний файл
procedure TForm1.MenuItemFileSaveClick(Sender: TObject);
begin
  if SavePictureDialog.Execute then
     SummaryIMG.SaveToFile(SavePictureDialog.filename);
end;

//копирование сводного изображения в коллекцию
procedure TForm1.MenuItemSummaryToCollectionClick(Sender: TObject);
begin
  AddNewImageToCollection(SummaryIMG);
  DrawCollectionBox;
end;

//реакция на движение мыши поверх коллекции изображений
procedure TForm1.PBoxCollectionMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var img_num:integer;
begin
  //определить номер изображения
  img_num:=(x div PBoxCollection.height)+FirstCollectionItem;

  if img_num<length(Collection) then
  begin
     //отрисовать его в окне лупы
    Collection[img_num].ScaleToIMG(MagnifyIMG);
    MagnifyIMG.CloneImgToBitmap(MagnifyBitmap);
    PBoxMagnify.Canvas.Draw(0,0,MagnifyBitmap);
  end;
end;

//перенести изображение из коллекции на слой рисования
procedure TForm1.PBoxCollectionMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var img_num:integer;
begin
  //определить номер изображения
  img_num:=(x div PBoxCollection.height)+FirstCollectionItem;
  if img_num<length(Collection) then
  begin
    //если была нажата ЛКМ, то отрисовать образ
    if Button=mbLeft then
    begin
      Collection[img_num].ScaleToImg(Layers[LayerCode]);
      //копирование Фурье-коэффициентов будет только если матрицы одинаковые!
      Collection[img_num].CloneToDFT(Layers[LayerCode]);
      Layers[LayerCode].name:=Collection[img_num].name;
      ComposeSummaryIMG;
      RefreshStatusBar;
    end;
    //если была нажата ПКМ, то удалить образ из коллекции
    if Button=mbRight then
    begin
      RemoveImageFromCollection(img_num);
      DrawCollectionBox;
      RefreshStatusBar;
    end;
  end;
end;

//перерисовка коллекции изображений
procedure TForm1.PBoxCollectionPaint(Sender: TObject);
begin
  DrawCollectionBox;
end;

//прокрутка изображений коллекции
procedure TForm1.ScrollBarCollectionChange(Sender: TObject);
begin
  ScrollBarCollection.max:=high(Collection);
  FirstCollectionItem:=ScrollBarCollection.position;
  DrawCollectionBox;
end;

//точка выхода из программы
procedure TForm1.MenuItemExitClick(Sender: TObject);
begin
  close;
end;

end.

