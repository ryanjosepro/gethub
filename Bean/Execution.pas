unit Execution;

interface

uses
  System.Variants, System.Types, System.SysUtils, System.Classes,
  Repository, MySets;

type
  TExecution = class
  private
    Repository: TRepository;
    Mode: TExecutionMode;
  public
    constructor Create(Repository: TRepository; Mode: TExecutionMode);
    function GetRepository: TRepository;
    function GetMode: TExecutionMode;
  end;

implementation

{ TExecution }

constructor TExecution.Create(Repository: TRepository; Mode: TExecutionMode);
begin
  self.Repository := Repository;
  self.Mode := Mode;
end;

function TExecution.GetRepository: TRepository;
begin
  Result := self.Repository;
end;

function TExecution.GetMode: TExecutionMode;
begin
  Result := self.Mode;
end;

end.
