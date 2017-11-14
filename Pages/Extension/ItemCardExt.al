pageextension 50102 ItemCardExtension extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked){
            field("Block Reason Code";"Block Reason Code"){
            
            }
        }
        
        addafter("Block Reason Code"){
            field(BlockReasonText;BlockReasonText){
            
            }
        }
        // modify(Blocked){
        //     Visible = false;
        // }
    }
    
    actions
    {
        // Add changes to page actions here
        addafter(Item){
            Action(CheckBlockReasons){
                Caption ='Check Block reasons';
                trigger OnAction();
                begin
                    Message('check block reason');
                end;
            }
        }
    }
    trigger OnOpenPage();
    var mynotification : Notification;
        reasoncodes : Record ItemBlockReason;
    begin
        if reasoncodes.Count() < 1 then
            begin
                mynotification.Scope := NotificationScope::LocalScope;
                mynotification.Message := 'You may need to setup Default reason codes';
                mynotification.AddAction('Show  me what to do.. :)',50112,'ShowListPageForReasonCodes');
                mynotification.Send();

            end;
    end;
    
    var
        myInt: Integer;
}