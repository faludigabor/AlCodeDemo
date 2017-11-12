pageextension 50102 ItemCardExtension extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked){
            field("Block Reason Code";"Block Reason Code"){

            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter(Item){
            action(CheckBlockReasons){
                Caption ='Check Block reasons';
                trigger OnAction();
                begin
                    Message('check block reason');
                end;
            }
        }
    }
    
    var
        myInt : Integer;
}