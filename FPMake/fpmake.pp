program fpmake;

uses fpmkunit;

var
    P: TPackage;
    T: TTarget;

begin
    With Installer do
    begin
      P := AddPackage('FastPascal');
      P.OSes := [win32,linux,win64];
      T := P.Targets.AddUnit('FastPascal');
      T.ResourceStrings := true;
      T := P.Targets.AddUnit('FastGraph');
      T.Dependencies.Add('FastPascal');
      Run;
    end;
  end.
