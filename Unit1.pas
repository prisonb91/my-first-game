unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    LevelBar: TProgressBar;
    PersonHP: TProgressBar;
    BossBar: TProgressBar;
    BtnKill: TButton;
    Label1: TLabel;
    Label2: TLabel;
    BtnAtack: TButton;
    BtnTimeLection: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnAtackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnTimeLectionClick(Sender: TObject);
    procedure BtnKillClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TPersona= class
    private
    Name: String;
    HP: Integer;
    Kill: Integer;
    Level: Integer;
    Razum: Integer;
    constructor MyPerson(MyName: String; MyHP, MyRazum, MyLevel, MyKill: Integer);
  end;

  TBossMery = class
    BossName: String;
    BossHP: Integer;
    BossKill: Integer;
    constructor MyBossMery(MyBossName: String; MyBossHP, MyBossKill: Integer);
  end;

  TWork = class
    Que: Boolean;
    Crit: Boolean;
    Intelect: Boolean;
    constructor MyWork(MyQue, MyCrit, MyIntelect: Boolean);
  end;

var
  Form1: TForm1;
  Pers: TPersona;
  BossMery: TBossMery;
  Work: TWork;
  StrTime, Lvl: Integer;

implementation

{$R *.dfm}

procedure TForm1.BtnAtackClick(Sender: TObject);
begin
  Pers.HP:= 1000;
  PersonHP.Max:= Pers.HP;
  PersonHP.Position:= Pers.HP;
  Label1.Caption:= Pers.Name + ' ' + Pers.HP.ToString + ' hp';

  BossMery.BossHP:= 25000;
  BossBar.Max:= BossMery.BossHP;
  BossBar.Position:= BossMery.BossHP;
  BossMery.BossName:= 'Mery';
  BossMery.BossKill:= 25;
  Label2.Caption:= BossMery.BossName + ' ' + BossMery.BossHP.ToString + ' hp';
end;

procedure TForm1.BtnKillClick(Sender: TObject);
var
  ÑritKill: Integer;
begin
  Randomize;
  ÑritKill:= Random(100);
  if (ÑritKill < 10) or (ÑritKill > 90)  then
  begin
    BossMery.BossHP:= BossMery.BossHP - Pers.Kill;
    Label5.Visible:= True;
    Work.Crit:= True;
  end;

  BossMery.BossHP:= BossMery.BossHP - Pers.Kill;
  Label2.Caption:= BossMery.BossName + ' ' + BossMery.BossHP.ToString + ' hp';
  BossBar.Position:= BossMery.BossHP;
  Work.Que:= True;

  if BossBar.Position <= 0 then
  begin
    BtnAtack.Click;

    ShowMessage('First death');
    LevelBar.Position:= LevelBar.Position + Pers.Level;
    if LevelBar.Position = LevelBar.Max then
    begin
      Inc(Lvl);
      LevelBar.Position:= 0;
      Label3.Caption:= 'Óðîâåíü ' + Lvl.ToString;
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Pers.Destroy;
  BossMery.Destroy;
  Work.Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  BossMery:= TBossMery.Create;
  Pers:= TPersona.Create;
  Work:= TWork.Create;
  Pers.Name:= 'Dexter';
  Pers.HP:= 1000;
  Pers.Kill:= 100;
  Pers.Level:= 25;
  StrTime:= 60;
  Lvl:= 0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Work.Intelect then
  begin
    if StrTime = 0 then
    begin
      Pers.Kill:= Pers.Kill + 50;
      BtnKill.Caption:= Pers.Kill.ToString + ' HP';
      Work.Intelect:= False;
      StrTime:= 60;
    end
    else
    begin
      Dec(StrTime);
      Label4.Caption:= '+ 50 ê óðîíó ' + StrTime.ToString;
    end;
  end;

  if Work.Que then
  begin
    Pers.HP:= Pers.HP - BossMery.BossKill;
    Label1.Caption:= Pers.Name + ' ' + Pers.HP.ToString + ' hp';
    PersonHP.Position:= Pers.HP;
    Work.Que:= False;
  end;

  if Work.Crit then
  begin
    Label5.Visible:= False;
    Work.Crit:= False;
  end;

  if PersonHP.Position = 0 then
  begin
    BtnAtack.Click;
    ShowMessage('Defeat');
  end;
end;

procedure TForm1.BtnTimeLectionClick(Sender: TObject);
begin
  Work.Intelect:= True;
  Label4.Caption:= '+ 50 ê óðîíó';
end;

{ TPersona }

constructor TPersona.MyPerson(MyName: String; MyHP, MyRazum, MyLevel, MyKill: Integer);
begin
  MyName:= Name;
  MyHP:= HP;
  MyKill:= Kill;
  MyRazum:= Razum;
  MyLevel:= Level;
end;

{ TBossMery }

constructor TBossMery.MyBossMery(MyBossName: String; MyBossHP,
  MyBossKill: Integer);
begin
  MyBossName:= BossName;
  MyBossHP:= BossHP;
  MyBossKill:= BossKill;
end;

{ TWork }

constructor TWork.MyWork(MyQue, MyCrit, MyIntelect: Boolean);
begin
  MyQue:= Que;
  MyCrit:= Crit;
  MyIntelect:= Intelect;
end;

end.
