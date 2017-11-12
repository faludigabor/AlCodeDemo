table 50100 ItemBlockReason
{

    fields
    {
        field(50100;ID;Code[20])
        {
            Caption='Ok Kód';
        }

        field(50101;ReasonText;Text[100]){
            Caption='Zárolás oka';
        }

    }

    keys
    {
        key(PK;ID)
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}