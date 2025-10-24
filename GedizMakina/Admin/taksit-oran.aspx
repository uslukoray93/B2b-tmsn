<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="taksit-oran.aspx.cs" Inherits="GedizMakina.Admin.taksit_oran" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxGridView ID="gvKartOran" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsKaretOran" KeyFieldName="KayitId">
                <SettingsPager PageSize="50">
                </SettingsPager>
                <SettingsEditing Mode="Batch">
                </SettingsEditing>
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="KayitId" ReadOnly="True" Visible="False" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KartAdi" Visible="False" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="1" FieldName="Ay1" VisibleIndex="3" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2" FieldName="Ay2" VisibleIndex="4" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="3" FieldName="Ay3" VisibleIndex="5" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="4" FieldName="Ay4" VisibleIndex="6" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="5" FieldName="Ay5" VisibleIndex="7" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="6" FieldName="Ay6" VisibleIndex="8" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="7" FieldName="Ay7" VisibleIndex="9" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="8" FieldName="Ay8" VisibleIndex="10" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="9" FieldName="Ay9" VisibleIndex="11" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="10" FieldName="Ay10" VisibleIndex="12" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="11" FieldName="Ay11" VisibleIndex="13" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="12" FieldName="Ay12" VisibleIndex="14" Width="6%">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn Caption=" " FieldName="Logo" VisibleIndex="2" Width="28%">
                    </dx:GridViewDataImageColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsKaretOran" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gediz %>" DeleteCommand="DELETE FROM [TaksitOran] WHERE [KayitId] = @original_KayitId AND (([KartAdi] = @original_KartAdi) OR ([KartAdi] IS NULL AND @original_KartAdi IS NULL)) AND (([Ay1] = @original_Ay1) OR ([Ay1] IS NULL AND @original_Ay1 IS NULL)) AND (([Ay2] = @original_Ay2) OR ([Ay2] IS NULL AND @original_Ay2 IS NULL)) AND (([Ay3] = @original_Ay3) OR ([Ay3] IS NULL AND @original_Ay3 IS NULL)) AND (([Ay4] = @original_Ay4) OR ([Ay4] IS NULL AND @original_Ay4 IS NULL)) AND (([Ay5] = @original_Ay5) OR ([Ay5] IS NULL AND @original_Ay5 IS NULL)) AND (([Ay6] = @original_Ay6) OR ([Ay6] IS NULL AND @original_Ay6 IS NULL)) AND (([Ay7] = @original_Ay7) OR ([Ay7] IS NULL AND @original_Ay7 IS NULL)) AND (([Ay8] = @original_Ay8) OR ([Ay8] IS NULL AND @original_Ay8 IS NULL)) AND (([Ay9] = @original_Ay9) OR ([Ay9] IS NULL AND @original_Ay9 IS NULL)) AND (([Ay10] = @original_Ay10) OR ([Ay10] IS NULL AND @original_Ay10 IS NULL)) AND (([Ay11] = @original_Ay11) OR ([Ay11] IS NULL AND @original_Ay11 IS NULL)) AND (([Ay12] = @original_Ay12) OR ([Ay12] IS NULL AND @original_Ay12 IS NULL)) AND (([Logo] = @original_Logo) OR ([Logo] IS NULL AND @original_Logo IS NULL))" InsertCommand="INSERT INTO [TaksitOran] ([KartAdi], [Ay1], [Ay2], [Ay3], [Ay4], [Ay5], [Ay6], [Ay7], [Ay8], [Ay9], [Ay10], [Ay11], [Ay12], [Logo]) VALUES (@KartAdi, @Ay1, @Ay2, @Ay3, @Ay4, @Ay5, @Ay6, @Ay7, @Ay8, @Ay9, @Ay10, @Ay11, @Ay12, @Logo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TaksitOran]" UpdateCommand="UPDATE [TaksitOran] SET [KartAdi] = @KartAdi, [Ay1] = @Ay1, [Ay2] = @Ay2, [Ay3] = @Ay3, [Ay4] = @Ay4, [Ay5] = @Ay5, [Ay6] = @Ay6, [Ay7] = @Ay7, [Ay8] = @Ay8, [Ay9] = @Ay9, [Ay10] = @Ay10, [Ay11] = @Ay11, [Ay12] = @Ay12, [Logo] = @Logo WHERE [KayitId] = @original_KayitId AND (([KartAdi] = @original_KartAdi) OR ([KartAdi] IS NULL AND @original_KartAdi IS NULL)) AND (([Ay1] = @original_Ay1) OR ([Ay1] IS NULL AND @original_Ay1 IS NULL)) AND (([Ay2] = @original_Ay2) OR ([Ay2] IS NULL AND @original_Ay2 IS NULL)) AND (([Ay3] = @original_Ay3) OR ([Ay3] IS NULL AND @original_Ay3 IS NULL)) AND (([Ay4] = @original_Ay4) OR ([Ay4] IS NULL AND @original_Ay4 IS NULL)) AND (([Ay5] = @original_Ay5) OR ([Ay5] IS NULL AND @original_Ay5 IS NULL)) AND (([Ay6] = @original_Ay6) OR ([Ay6] IS NULL AND @original_Ay6 IS NULL)) AND (([Ay7] = @original_Ay7) OR ([Ay7] IS NULL AND @original_Ay7 IS NULL)) AND (([Ay8] = @original_Ay8) OR ([Ay8] IS NULL AND @original_Ay8 IS NULL)) AND (([Ay9] = @original_Ay9) OR ([Ay9] IS NULL AND @original_Ay9 IS NULL)) AND (([Ay10] = @original_Ay10) OR ([Ay10] IS NULL AND @original_Ay10 IS NULL)) AND (([Ay11] = @original_Ay11) OR ([Ay11] IS NULL AND @original_Ay11 IS NULL)) AND (([Ay12] = @original_Ay12) OR ([Ay12] IS NULL AND @original_Ay12 IS NULL)) AND (([Logo] = @original_Logo) OR ([Logo] IS NULL AND @original_Logo IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_KayitId" Type="Int32" />
                    <asp:Parameter Name="original_KartAdi" Type="String" />
                    <asp:Parameter Name="original_Ay1" Type="Decimal" />
                    <asp:Parameter Name="original_Ay2" Type="Decimal" />
                    <asp:Parameter Name="original_Ay3" Type="Decimal" />
                    <asp:Parameter Name="original_Ay4" Type="Decimal" />
                    <asp:Parameter Name="original_Ay5" Type="Decimal" />
                    <asp:Parameter Name="original_Ay6" Type="Decimal" />
                    <asp:Parameter Name="original_Ay7" Type="Decimal" />
                    <asp:Parameter Name="original_Ay8" Type="Decimal" />
                    <asp:Parameter Name="original_Ay9" Type="Decimal" />
                    <asp:Parameter Name="original_Ay10" Type="Decimal" />
                    <asp:Parameter Name="original_Ay11" Type="Decimal" />
                    <asp:Parameter Name="original_Ay12" Type="Decimal" />
                    <asp:Parameter Name="original_Logo" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="KartAdi" Type="String" />
                    <asp:Parameter Name="Ay1" Type="Decimal" />
                    <asp:Parameter Name="Ay2" Type="Decimal" />
                    <asp:Parameter Name="Ay3" Type="Decimal" />
                    <asp:Parameter Name="Ay4" Type="Decimal" />
                    <asp:Parameter Name="Ay5" Type="Decimal" />
                    <asp:Parameter Name="Ay6" Type="Decimal" />
                    <asp:Parameter Name="Ay7" Type="Decimal" />
                    <asp:Parameter Name="Ay8" Type="Decimal" />
                    <asp:Parameter Name="Ay9" Type="Decimal" />
                    <asp:Parameter Name="Ay10" Type="Decimal" />
                    <asp:Parameter Name="Ay11" Type="Decimal" />
                    <asp:Parameter Name="Ay12" Type="Decimal" />
                    <asp:Parameter Name="Logo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="KartAdi" Type="String" />
                    <asp:Parameter Name="Ay1" Type="Decimal" />
                    <asp:Parameter Name="Ay2" Type="Decimal" />
                    <asp:Parameter Name="Ay3" Type="Decimal" />
                    <asp:Parameter Name="Ay4" Type="Decimal" />
                    <asp:Parameter Name="Ay5" Type="Decimal" />
                    <asp:Parameter Name="Ay6" Type="Decimal" />
                    <asp:Parameter Name="Ay7" Type="Decimal" />
                    <asp:Parameter Name="Ay8" Type="Decimal" />
                    <asp:Parameter Name="Ay9" Type="Decimal" />
                    <asp:Parameter Name="Ay10" Type="Decimal" />
                    <asp:Parameter Name="Ay11" Type="Decimal" />
                    <asp:Parameter Name="Ay12" Type="Decimal" />
                    <asp:Parameter Name="Logo" Type="String" />
                    <asp:Parameter Name="original_KayitId" Type="Int32" />
                    <asp:Parameter Name="original_KartAdi" Type="String" />
                    <asp:Parameter Name="original_Ay1" Type="Decimal" />
                    <asp:Parameter Name="original_Ay2" Type="Decimal" />
                    <asp:Parameter Name="original_Ay3" Type="Decimal" />
                    <asp:Parameter Name="original_Ay4" Type="Decimal" />
                    <asp:Parameter Name="original_Ay5" Type="Decimal" />
                    <asp:Parameter Name="original_Ay6" Type="Decimal" />
                    <asp:Parameter Name="original_Ay7" Type="Decimal" />
                    <asp:Parameter Name="original_Ay8" Type="Decimal" />
                    <asp:Parameter Name="original_Ay9" Type="Decimal" />
                    <asp:Parameter Name="original_Ay10" Type="Decimal" />
                    <asp:Parameter Name="original_Ay11" Type="Decimal" />
                    <asp:Parameter Name="original_Ay12" Type="Decimal" />
                    <asp:Parameter Name="original_Logo" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
