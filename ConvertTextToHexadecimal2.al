page 50200 "Convert Text To Hexadecimal"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(InputText; InputText)
                {
                    Caption = 'Input Text';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if InputText = '' then
                            Hexadecimal := '';
                        Hexadecimal := ConvertTextToHexadecimal(InputText);
                    end;
                }
            }
            group(Result)
            {
                field(Hexadecimal; Hexadecimal)
                {
                    Caption = 'Hexadecimal';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    var
        InputText: Text;
        Hexadecimal: Text;

    local procedure ConvertTextToHexadecimal(Input: Text) Output: Text
    var
        i: Integer;
        CharNo: Integer;
        TypeHelper: Codeunit "Type Helper";
        Str: Text;
    begin
        for i := 1 to StrLen(Input) do begin
            CharNo := Input[i];
            Str := TypeHelper.IntToHex(CharNo);
            Output += Str;
        end;
    end;
}
