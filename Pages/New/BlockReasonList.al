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
    
    actions
    {
    
        area(Processing){
            Action(GetDefaultData)
            {
                Image = GetBinContent;
                
                trigger OnAction();
                var cu : Codeunit DemoHttpOperations;
                begin
                    cu.PopulateDefaultData();
                   
                end;
            }
            
        }
        
    }
}