codeunit 50111 HandleEvents
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
                            Error('Nem lehet könyvelni mert van olyan tétel ami egyedi blokoláson van');
            until sl.Next = 0;
    end;
    
    //OnAfterAssignItemValues(Rec,Item);
    [EventSubscriber(ObjectType::Table,37,'OnAfterAssignItemValues','',false,false)]
    procedure ManageItemSelectionOnSL(var SalesLine: Record "Sales Line";  Item: Record Item)
    var reasoncode : Record ItemBlockReason;
    begin
        if item."Block Reason Code" <> '' then  
        begin
            if reasoncode.get(item."Block Reason Code") then ;
            error('This item has a block code %1',reasoncode.ReasonText);
        end;
            
    end;
    
    var
        myInt: Integer;
}