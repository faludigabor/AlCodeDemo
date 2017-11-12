tableextension 50100 ItemTableExtension extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50100 ;"EKAER Applicable";Boolean)
        {
            Caption = 'EKAER jelentésre kötelezett';
            
            
        }
        modify("Block Reason")
        {
            Caption = 'Reason for blocking';
            trigger OnBeforeValidate();
            begin
                if  Not rec."Block Reason".Contains('zárolva') 
                then
                begin
                   Message('Kérem add meg a zárolás okát');
                end;
                 
            end;
        }
    }
    
    var
        myInt: Integer;
}