page 50105 BlockReasonList
{
    PageType = List;
    SourceTable = ItemBlockReason;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID;ID)
                {
                
                
                }
                field(ReasonText;ReasonText)
                {
                
                }
            }
        }
        area(factboxes)
        {
        }
    }
    
    // actions
    // {
    //     area(processing)
    //     {
    //         Action(ActionName)
    //         {
    //             trigger OnAction();
    //             begin
    //             end;
    //         }
    //     }
    // }
}