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
        HexLeft: Integer;
        HexRight: Integer;
    begin
        for i := 1 to StrLen(Input) do begin
            CharNo := Input[i];
            HexLeft := Round(CharNo / 16, 1, '<');
            HexRight := CharNo mod 16;
            Output += HexValue(HexLeft) + HexValue(HexRight);
        end;
    end;

    local procedure HexValue(Value: Integer): Text
    begin
        case Value of
            0 .. 9:
                exit(Format(Value));
            10:
                exit('A');
            11:
                exit('B');
            12:
                exit('C');
            13:
                exit('D');
            14:
                exit('E');
            15:
                exit('F');
        end;
    end;
}
