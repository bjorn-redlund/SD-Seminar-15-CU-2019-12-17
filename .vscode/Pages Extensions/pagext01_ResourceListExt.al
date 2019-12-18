pageextension 50102 "CSD ReourceListExt" extends "Resource List"
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }

        addafter("Type")
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {
                ApplicationArea = All;
            }

            field("CSD Maximum Patricipants"; "CSD Maximum Patricipants")
            {
                Visible = ShowMaxField;
                ApplicationArea = All;
            }

        }

    }


    trigger OnopenPage()

    begin
        Showtype := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
    end;


    var
        [InDataSet]
        ShowMaxField: Boolean;

        [InDataSet]
        ShowType: Boolean;



}