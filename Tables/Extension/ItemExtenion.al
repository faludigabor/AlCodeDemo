tableextension 50100 ItemTableExtension extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50100 ;"EKAER Applicable";Boolean)
        {
            Caption = 'EKAER jelentésre kötelezett';
            
            
        }
        field(50101;"Block Reason Code";Code[20])
        {
            TableRelation=ItemBlockReason.ID;
            ValidateTableRelation = true;
            trigger OnValidate();
            begin
                rec.CalcFields(BlockReasonText);
            end;
            
            
        }
        field(50102;BlockReasonText;Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(ItemBlockReason.ReasonText Where(ID = field("Block Reason Code"))) ;
            Editable = false;
            // Enabled = false;
        }
        
        Modify("Block Reason")
        {
            Caption = 'Reason for blocking';
            trigger OnBeforeValidate();
            begin
                if not rec."Block Reason".Contains('zárolva')
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