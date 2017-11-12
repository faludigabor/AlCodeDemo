codeunit 50110 DemoHttpOperations
{
    trigger OnRun();
    begin
        PopulateDefaultData();
    end;
    
    procedure PopulateDefaultData();
    var webclient : HttpClient;
        defaultUrl : Text;
        res : HttpResponseMessage;
        jsonText : Text;
    begin
        defaultUrl := 'http://spablockreasons.azurewebsites.net/setupdata';
        webclient.Get(defaultUrl,res);
        if not res.IsSuccessStatusCode then
            Error('Error while downloading default setup data');
        res.Content.ReadAs(jsonText);
        
        ParseJsonText(jsonText);
        
    end;
    
    procedure ParseJsonText(var json : Text);
    var
        Reasons: Record ItemBlockReason;
        defaultItemasJSONObject: JsonObject;
        defaultsArray: JsonArray;
        defaultItemAsJSON: JsonToken;
        valueToken: JsonToken;
        i: Integer;
    begin
        if not defaultsArray.ReadFrom(json) then
            Error('cannot parse the json array');
            
        for i := 0 to defaultsArray.Count -1 do
        begin
            defaultsArray.Get(i,defaultItemAsJSON);
            defaultItemasJSONObject := defaultItemAsJSON.AsObject;
            
            Reasons.init;
            
            if defaultItemasJSONObject.Get('code',valueToken) then
                Reasons.ID := valueToken.AsValue.AsCode;
                
            if defaultItemasJSONObject.Get('value',valueToken) then
                Reasons.ReasonText := valueToken.AsValue.AsText;
                
            Reasons.Insert;
            // Commit;
        end;
        
    end;
    
    
    var
        myInt: Integer;
}