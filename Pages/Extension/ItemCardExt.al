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
    
    var
        myInt: Integer;
}