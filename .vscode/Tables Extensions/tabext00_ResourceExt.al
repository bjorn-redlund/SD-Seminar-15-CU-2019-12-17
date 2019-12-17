tableextension 50100 "CSD ResourceExt" extends Resource
// CGI/001/XXX
{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                Rec.Testfield("Unit Cost")
            end;
        }

        modify(Type)
        {
            OptionCaption = 'Instructor Room';
        }

        field(50101; "CSD Resource Type"; Option)
        {
            DataClassification = AccountData;
            Caption = 'Resource Type';
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal","External';
        }

        field(50102; "CSD Maximum Patricipants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Maximum Patricipants';
        }

        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            DataClassification = CustomerContent;
            caption = 'CSD Quantity Per Day';
        }

    }

}


