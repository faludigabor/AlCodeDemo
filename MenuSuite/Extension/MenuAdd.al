pageextension 50110 MenuItem    extends "Order Processor Role Center"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
        addafter(Sales)
        {
            group("Item Blocks"){
                Caption='Item Blocks';
                group(Masterdata){
                    Caption='Master Data';
                    
                    Action(ItemBlockReason){
                        Caption='Item Block Reason Codes';
                        RunObject=page BlockReasonList;

                        trigger OnAction();
                        begin
                            Page.RunModal(Page::BlockReasonList);
                        
                        end;
                    }
                    
                }
                
            }
        }
    }
    
    var
        myInt: Integer;
}