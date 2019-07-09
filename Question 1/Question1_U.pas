// 8172327250012

unit Question1_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, jpeg, DateUtils, Math;

type
  TfrmQ1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Image1: TImage;
    btnQ1_1: TButton;
    redQ1_1: TRichEdit;
    edtRadius: TEdit;
    edtBase: TEdit;
    edtHeight: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblInfo: TLabel;
    Label9: TLabel;
    edtQues1_2: TEdit;
    btnQ1_2: TButton;
    Image2: TImage;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    edtSentence: TEdit;
    Label10: TLabel;
    btnQ1_4: TButton;
    edtRemoveVowels: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtNum1: TEdit;
    edtNum2: TEdit;
    btnQ1_3: TButton;
    edtHCF: TEdit;
    redQues1_5: TRichEdit;
    btnQ1_5: TButton;
    procedure btnQ1_1Click(Sender: TObject);
    procedure btnQ1_2Click(Sender: TObject);
    procedure btnQ1_3Click(Sender: TObject);
    procedure btnQ1_5Click(Sender: TObject);
    procedure btnQ1_4Click(Sender: TObject);

  private


  public

  end;

var
  frmQ1: TfrmQ1;

implementation

{$R *.dfm}
// ============================================================================
// Question 1.1
// ============================================================================
procedure TfrmQ1.btnQ1_1Click(Sender: TObject);
var
  rRadius, rBase, rHeight, rCircleArea, rTriArea, rTotalArea : Real;
begin
  // Question 1.1
  rRadius := StrToFloat(edtRadius.Text);
  rBase := StrToFloat(edtBase.Text);
  rHeight := StrToFloat(edtHeight.Text);

  rCircleArea := 3.14159*Sqr(rRadius);
  rTriArea := 0.5*rBase*rHeight*8;
  rTotalArea := rCircleArea+rTriArea;

  redQ1_1.Lines.Clear;
  redQ1_1.Lines.Add('Area of circle = '+FloatToStr(rCircleArea));
  redQ1_1.Lines.Add('Total area of triangles = '+FloatToStrF(rTriArea,ffFixed,10,4));
  redQ1_1.Lines.Add('Total area = '+FloatToSTrF(rTotalArea,ffFixed,10,2));
end;

// ============================================================================
// Question 1.2
// ============================================================================
procedure TfrmQ1.btnQ1_2Click(Sender: TObject);
var
  iFirst, iPos, iYear, iDiff : Integer;
begin
  // Question 1.2
  iPos := Pos(':',lblInfo.Caption);
  iFirst := StrToInt(Copy(lblInfo.Caption,iPos+1, Length(lblInfo.Caption)-iPos));
  iYear := iFirst;
  while iYear < CurrentYear+1 do
  begin  
    Inc(iYear,3);
  end;

  edtQues1_2.Text := IntToStr(iYear);    
end;

// ============================================================================
// Question 1.3
// ============================================================================
procedure TfrmQ1.btnQ1_3Click(Sender: TObject);
var
  iNum1, iNum2, iHCF, iMin, k : Integer;
begin
  // Question 1.3
  iNum1 := StrToInt(edtNum1.Text);
  iNum2 := StrToInt(edtNum2.Text);
  iMin := min(iNum1,iNum2);
  iHCF := 0;
  k := 0;

  while k <= iMin do
  begin
    Inc(k);
    if (iNum1 mod k = 0) and (iNum2 mod k = 0) then
      if k > iHCF then
        iHCF := k;      
  end;

  edtHCF.Text := IntToStr(iHCF);
end;

// ============================================================================
// Question 1.4
// ============================================================================
procedure TfrmQ1.btnQ1_4Click(Sender: TObject);
var
  k : Integer;
  sSentence, sNew : string;
begin
  // Question 1.4
  sSentence := edtSentence.Text;
  sNew := sSentence[1];

  for k := 2 to Length(sSentence) do
    if (not(UpCase(sSentence[k]) in ['A','E','I','O','U'])) or (sSentence[k-1] = ' ') then
      sNew := sNew+sSentence[k]; 
  edtRemoveVowels.Text := sNew;
end;

// ============================================================================
// Question 1.5
// ============================================================================
procedure TfrmQ1.btnQ1_5Click(Sender: TObject);
Const
  iSeatsAvailable = 100;
var
  iGroup, iTotal, iNumGroups : Integer;
begin
  iTotal := 0;
  iNumGroups := 0;
  redQues1_5.Lines.Clear;
  redQues1_5.Paragraph.TabCount := 1;
  redQues1_5.Paragraph.Tab[0] := 100;
  
  redQues1_5.Lines.Add('Group number'+#9+'Number of people');
  
  while iTotal < 100 do
  begin  
    iGroup := StrToInt(InputBox('Number in the group','Enter below',''));
    if iTotal+iGroup <= 100 then
    begin
      Inc(iTotal, iGroup);
      Inc(iNumGroups);
      redQues1_5.Lines.Add(IntToStr(iNumGroups)+#9+IntToStr(iGroup));
    end
    else
      ShowMessage('Cannot accept a group of '+IntToStr(iGroup)+' people'+#13+
      'Number of seats available is '+IntToStr(100-iTotal));
  end;
end;


end.
