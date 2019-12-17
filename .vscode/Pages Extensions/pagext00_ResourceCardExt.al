pageextension 50101 "CSD ResourceCardExt" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {
                ApplicationArea = all;
            }

            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
            {
                ApplicationArea = all;
            }

        }
        addafter("Personal Data")
        {
            group("CSD Rooms")
            {
                Caption = 'Rooms';
                Visible = ShowMaxField;

                field("CSD Maximum Patricipants"; "CSD Maximum Patricipants")
                {
                    ApplicationArea = all;
                }

            }


        }
    }

    actions
    {
    }


    trigger OnAfterGetRecord();

    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;



}