codeunit 50112 NotificationMgmt
{
    trigger OnRun();
    begin
    end;
    
    procedure ShowListPageForReasonCodes(notificaton : Notification)
    begin
        Page.RunModal(Page::BlockReasonList);
    end;
    var
        myInt : Integer;
}