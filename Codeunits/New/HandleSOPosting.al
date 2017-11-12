codeunit 50111 HandleSalesOderPosting
{
    trigger OnRun();
    begin
    end;
    [EventSubscriber(ObjectType::Codeunit,80,'OnBeforePostSalesDoc','',false,false)]
    procedure HandleSOPosting(var SalesHeader: Record "Sales Header");
    begin
        ///Message('%1 is being posted' ,SalesHeader."No.");
    end;
    
    [EventSubscriber(ObjectType::Codeunit,80,'OnAfterCheckMandatoryFields','',false,false)]
    procedure ValidateSalesHeader(var SalesHeader: Record "Sales Header")
    var SL: Record "Sales Line";
        Item: Record Item;
    begin
        SL.reset;
        SL.SetRange("Document No.",SalesHeader."No.");
        SL.SetRange("Document Type",SalesHeader."Document Type");
        if SL.FindSet(false) then
            repeat
                if sl.Type = Sl.Type::Item then 
                    if item.Get(sl."No.") then  
                        if item."Block Reason Code" <> '' then  
                            error('Nem lehet könyvelni mert van olyan tétel ami egyedi blokoláson van');
            until sl.Next = 0;
    end;
    var
        myInt: Integer;
}