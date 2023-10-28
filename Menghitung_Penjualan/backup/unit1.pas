unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnUlang: TButton;
    btnKeluar: TButton;
    cbKode: TComboBox;
    edtQTY: TEdit;
    edtNama: TEdit;
    edtHargaSatuan: TEdit;
    edtSubTotal: TEdit;
    edtDiskon: TEdit;
    edtTotal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure btnUlangClick(Sender: TObject);
    procedure cbKodeChange(Sender: TObject);
    procedure edtQTYChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnHitungClick(Sender: TObject);
var
  sub_total: Real;
begin
   sub_total:=StrToFloat(edtSubTotal.Text);
   if sub_total >= 100000 then
      begin
        edtDiskon.Text:='15';
        edtTotal.Text:=CurrToStr(0.15 * sub_total);
      end
    else
    if sub_total >= 50000 then
       begin
         edtDiskon.Text:='10';
         edtTotal.Text:=CurrToStr(0.10*sub_total);
       end
    else
    if sub_total >= 25000 then
       begin
         edtDiskon.Text:='5';
         edtTotal.Text:=CurrToStr(0.5 * sub_total);
       end
    else
    begin
      edtDiskon.Text:='0';
      edtTotal.Text:=CurrToStr(sub_total);
    end;
end;

procedure TForm1.btnUlangClick(Sender: TObject);
begin
     cbKode.Text:='Pilih Kode Barang';
     edtQTY.Text:='';
     edtQTY.TextHint:='0';
     edtNama.Text:='';
     edtHargaSatuan.Text:='0';
     edtSubTotal.Text:='0';
     edtDiskon.Text:='0';
     edtTotal.Text:='0';
end;

procedure TForm1.cbKodeChange(Sender: TObject);
var
  kode_barang: String;
begin
   kode_barang:=cbKode.Text;
   case kode_barang of
   'A01':
     begin
       edtNama.Text := 'Sunscreen';
       edtHargaSatuan.Text := '69000';
     end;
   'B02':
      begin
        edtNama.Text := 'Toner';
        edtHargaSatuan.Text := '78000';
      end;
   'C03':
       begin
         edtNama.Text := 'Bodymist';
         edtHargaSatuan.Text := '121000';
       end;
   'D04':
       begin
         edtNama.Text := 'Liptint';
         edtHargaSatuan.Text := '18000';
       end;
   else
   begin

   end;
end;
end;

procedure TForm1.edtQTYChange(Sender: TObject);
var
  kuantitas: Integer;
  sub_total, harga_satuan: Real;
begin
   try
   if edtQTY.Text='' then
   else
     kuantitas:=StrToInt(edtQTY.Text);

   if(kuantitas>10) or (kuantitas<1) then
   begin
     raise Exception.Create('Kuantitas Harus Sesuai Ketentuan');
   end;

   harga_satuan:=StrToFloat(edtHargaSatuan.Text);
   sub_total:=kuantitas*harga_satuan;
   edtSubTotal.Text:=CurrToStr(sub_total);
 except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
 end;
end;

end.

