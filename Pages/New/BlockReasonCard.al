page 50104 BlockReasonCard
{
    PageType = Card;
    SourceTable = ItemBlockReason;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ID;ID)
                {
                    

                }
                field(ReasonText;ReasonText){
                    
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    var
        myInt : Integer;
}