pageextension 50110 MenuItem    extends "Business Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
        addafter("Account Schedules"){
            Action(ItemBlockReason){
                Caption='Item Block Reason Codes';
                trigger OnAction();
                begin
                    Page.Run(Page::BlockReasonList);
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}