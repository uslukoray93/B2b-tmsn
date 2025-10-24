<%@ Page Title="" Language="C#" MasterPageFile="~/Mt/mt.Master" AutoEventWireup="true" CodeBehind="takvim.aspx.cs" Inherits="GedizMakina.Mt.takvim" %>


<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v22.2.Core.Desktop, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-9">
            <div class="row">
                <div class="col-md-12">
                    <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" AppointmentDataSourceID="dsAjanda" ClientIDMode="AutoID" Theme="MaterialCompact" Width="100%">
                        <Views>
                            <DayView ViewSelectorItemAdaptivePriority="2" ShortDisplayName="Günlük">
                                <TimeRulers>
                                    <cc1:TimeRuler></cc1:TimeRuler>
                                </TimeRulers>

                                <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                            </DayView>

                            <WorkWeekView ViewSelectorItemAdaptivePriority="6" ShortDisplayName="Hafta">
                                <TimeRulers>
                                    <cc1:TimeRuler></cc1:TimeRuler>
                                </TimeRulers>

                                <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                            </WorkWeekView>

                            <WeekView Enabled="false">
                            </WeekView>

                            <MonthView ViewSelectorItemAdaptivePriority="5" ShortDisplayName="Aylık"></MonthView>

                            <TimelineView ViewSelectorItemAdaptivePriority="3" ShortDisplayName="Zaman Çizelgesi"></TimelineView>

                            <FullWeekView Enabled="true" ShortDisplayName="Tüm Hafta">
                                <TimeRulers>
                                    <cc1:TimeRuler></cc1:TimeRuler>
                                </TimeRulers>

                                <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                            </FullWeekView>

                            <AgendaView ViewSelectorItemAdaptivePriority="1" ShortDisplayName="Ajanda"></AgendaView>
                        </Views>
                        <Storage>
                            <Appointments AutoRetrieveId="True">
                                <Mappings AllDay="AllDay" AppointmentId="UniqueID" Description="Description" End="EndDate" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartDate" Status="Status" Subject="Subject" Type="Type" />
                            </Appointments>
                        </Storage>
                    </dxwschs:ASPxScheduler>
                    <asp:SqlDataSource ID="dsAjanda" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" DeleteCommand="DELETE FROM [Appointments] WHERE [UniqueID] = @original_UniqueID AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([AllDay] = @original_AllDay) OR ([AllDay] IS NULL AND @original_AllDay IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL)) AND (([Label] = @original_Label) OR ([Label] IS NULL AND @original_Label IS NULL)) AND (([ResourceID] = @original_ResourceID) OR ([ResourceID] IS NULL AND @original_ResourceID IS NULL)) AND (([ResourceIDs] = @original_ResourceIDs) OR ([ResourceIDs] IS NULL AND @original_ResourceIDs IS NULL)) AND (([ReminderInfo] = @original_ReminderInfo) OR ([ReminderInfo] IS NULL AND @original_ReminderInfo IS NULL)) AND (([RecurrenceInfo] = @original_RecurrenceInfo) OR ([RecurrenceInfo] IS NULL AND @original_RecurrenceInfo IS NULL)) AND (([PersonelId] = @original_PersonelId) OR ([PersonelId] IS NULL AND @original_PersonelId IS NULL)) AND (([BasvuruId] = @original_BasvuruId) OR ([BasvuruId] IS NULL AND @original_BasvuruId IS NULL))" InsertCommand="INSERT INTO [Appointments] ([Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [PersonelId], [BasvuruId]) VALUES (@Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label, @ResourceID, @ResourceIDs, @ReminderInfo, @RecurrenceInfo, @PersonelId, @BasvuruId)" SelectCommand="SELECT * FROM [Appointments] WHERE ([PersonelId] = @PersonelId)" UpdateCommand="UPDATE [Appointments] SET [Type] = @Type, [StartDate] = @StartDate, [EndDate] = @EndDate, [AllDay] = @AllDay, [Subject] = @Subject, [Location] = @Location, [Description] = @Description, [Status] = @Status, [Label] = @Label, [ResourceID] = @ResourceID, [ResourceIDs] = @ResourceIDs, [ReminderInfo] = @ReminderInfo, [RecurrenceInfo] = @RecurrenceInfo, [PersonelId] = @PersonelId, [BasvuruId] = @BasvuruId WHERE [UniqueID] = @original_UniqueID AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([AllDay] = @original_AllDay) OR ([AllDay] IS NULL AND @original_AllDay IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL)) AND (([Label] = @original_Label) OR ([Label] IS NULL AND @original_Label IS NULL)) AND (([ResourceID] = @original_ResourceID) OR ([ResourceID] IS NULL AND @original_ResourceID IS NULL)) AND (([ResourceIDs] = @original_ResourceIDs) OR ([ResourceIDs] IS NULL AND @original_ResourceIDs IS NULL)) AND (([ReminderInfo] = @original_ReminderInfo) OR ([ReminderInfo] IS NULL AND @original_ReminderInfo IS NULL)) AND (([RecurrenceInfo] = @original_RecurrenceInfo) OR ([RecurrenceInfo] IS NULL AND @original_RecurrenceInfo IS NULL)) AND (([PersonelId] = @original_PersonelId) OR ([PersonelId] IS NULL AND @original_PersonelId IS NULL)) AND (([BasvuruId] = @original_BasvuruId) OR ([BasvuruId] IS NULL AND @original_BasvuruId IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
                        <DeleteParameters>
                            <asp:Parameter Name="original_UniqueID" Type="Int32" />
                            <asp:Parameter Name="original_Type" Type="Int32" />
                            <asp:Parameter Name="original_StartDate" Type="DateTime" />
                            <asp:Parameter Name="original_EndDate" Type="DateTime" />
                            <asp:Parameter Name="original_AllDay" Type="Boolean" />
                            <asp:Parameter Name="original_Subject" Type="String" />
                            <asp:Parameter Name="original_Location" Type="String" />
                            <asp:Parameter Name="original_Description" Type="String" />
                            <asp:Parameter Name="original_Status" Type="Int32" />
                            <asp:Parameter Name="original_Label" Type="Int32" />
                            <asp:Parameter Name="original_ResourceID" Type="Int32" />
                            <asp:Parameter Name="original_ResourceIDs" Type="String" />
                            <asp:Parameter Name="original_ReminderInfo" Type="String" />
                            <asp:Parameter Name="original_RecurrenceInfo" Type="String" />
                            <asp:Parameter Name="original_PersonelId" Type="Int32" />
                            <asp:Parameter Name="original_BasvuruId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Type" Type="Int32" />
                            <asp:Parameter Name="StartDate" Type="DateTime" />
                            <asp:Parameter Name="EndDate" Type="DateTime" />
                            <asp:Parameter Name="AllDay" Type="Boolean" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="Location" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Status" Type="Int32" />
                            <asp:Parameter Name="Label" Type="Int32" />
                            <asp:Parameter Name="ResourceID" Type="Int32" />
                            <asp:Parameter Name="ResourceIDs" Type="String" />
                            <asp:Parameter Name="ReminderInfo" Type="String" />
                            <asp:Parameter Name="RecurrenceInfo" Type="String" />
                            <asp:Parameter Name="PersonelId" Type="Int32" />
                            <asp:Parameter Name="BasvuruId" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="PersonelId" SessionField="sMtId" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Type" Type="Int32" />
                            <asp:Parameter Name="StartDate" Type="DateTime" />
                            <asp:Parameter Name="EndDate" Type="DateTime" />
                            <asp:Parameter Name="AllDay" Type="Boolean" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="Location" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Status" Type="Int32" />
                            <asp:Parameter Name="Label" Type="Int32" />
                            <asp:Parameter Name="ResourceID" Type="Int32" />
                            <asp:Parameter Name="ResourceIDs" Type="String" />
                            <asp:Parameter Name="ReminderInfo" Type="String" />
                            <asp:Parameter Name="RecurrenceInfo" Type="String" />
                            <asp:Parameter Name="PersonelId" Type="Int32" />
                            <asp:Parameter Name="BasvuruId" Type="Int32" />
                            <asp:Parameter Name="original_UniqueID" Type="Int32" />
                            <asp:Parameter Name="original_Type" Type="Int32" />
                            <asp:Parameter Name="original_StartDate" Type="DateTime" />
                            <asp:Parameter Name="original_EndDate" Type="DateTime" />
                            <asp:Parameter Name="original_AllDay" Type="Boolean" />
                            <asp:Parameter Name="original_Subject" Type="String" />
                            <asp:Parameter Name="original_Location" Type="String" />
                            <asp:Parameter Name="original_Description" Type="String" />
                            <asp:Parameter Name="original_Status" Type="Int32" />
                            <asp:Parameter Name="original_Label" Type="Int32" />
                            <asp:Parameter Name="original_ResourceID" Type="Int32" />
                            <asp:Parameter Name="original_ResourceIDs" Type="String" />
                            <asp:Parameter Name="original_ReminderInfo" Type="String" />
                            <asp:Parameter Name="original_RecurrenceInfo" Type="String" />
                            <asp:Parameter Name="original_PersonelId" Type="Int32" />
                            <asp:Parameter Name="original_BasvuruId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-12">
                    <dxwschs:ASPxDateNavigator ID="ASPxDateNavigator1" runat="server" ClientIDMode="AutoID" MasterControlID="ASPxScheduler1" Theme="MaterialCompact" Width="100%">
                        <Properties Rows="3">
                        </Properties>
                    </dxwschs:ASPxDateNavigator>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
