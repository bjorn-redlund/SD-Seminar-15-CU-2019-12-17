codeunit 50139 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var
        c: Codeunit "Res. Jnl.-Post Line";
    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;

    // Lab 8.2 >>
    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateFindRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateFindRecords(var DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text);
    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        PostedSeminarReqHeader: Record "CSD Posted Seminar Reg. Header";
        DocNoOfRecords: Integer;
        NextEntryNo: Integer;

    begin

        if PostedSeminarReqHeader.ReadPermission then begin
            PostedSeminarReqHeader.Reset();
            PostedSeminarReqHeader.Reset();
            PostedSeminarReqHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarReqHeader.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := PostedSeminarReqHeader.Count;

            with DocumentEntry do begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast() then
                    NextEntryNo += 1
                else
                    NextEntryNo := 1;
                init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"CSD Posted Seminar Reg. Header";
                "Document Type" := 0;
                "Table Name" := CopyStr(PostedSeminarReqHeader.TableCaption, 1, MaxStrLen("Table Name"));
                "No. of Records" := DocNoOfRecords;
                insert;
            end;
        end;

        if SeminarLedgerEntry.ReadPermission then begin
            SeminarLedgerEntry.Reset();
            SeminarLedgerEntry.Reset();
            SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
            SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
            SeminarLedgerEntry.SetCurrentKey("Document No.");
            DocNoOfRecords := SeminarLedgerEntry.Count;

            with DocumentEntry do begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast() then
                    NextEntryNo += 1
                else
                    NextEntryNo := 1;
                init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"CSD Seminar Ledger Entry";
                "Document Type" := 0;
                "Table Name" := CopyStr(SeminarLedgerEntry.TableCaption, 1, MaxStrLen("Table Name"));
                "No. of Records" := DocNoOfRecords;
                insert;
            end;
        end;
    end;
    // Lab 8.2 <<
}


